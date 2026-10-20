local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local Logger = require(Parent.Loggers).Logger
local PlaceIdContainer1 = Logger.new(Logger, "PlaceIdContainer")
local ApiFetchPlaceInfosFunction = require(Parent.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local GameCardGroupableModule = require(script.Parent.GameCardGroupable)
local GameCardContainerModule = require(script.Parent.GameCardContainer)
local GameCardErrorModule = require(script.Parent.GameCardError)
local GameAssetCardModule = require(script.Parent.GameAssetCard)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local FFlagAppChatInvalidGameLinkCardModule = require(AppChat.Flags.FFlagAppChatInvalidGameLinkCard)
local HttpRequestModule = require(Parent.HttpRequest)
local config = {
	networkImpl = HttpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: PlaceIdContainer1 (copy), HttpRequestModule (copy)
			PlaceIdContainer1:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return HttpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = if require(Parent.SharedFlags).FFlagLuaAppDefaultHttpRetry then game:DefineFastInt("PlaceIdContainerHttpRetryCount", 4) else nil
	})
}

local function _(p1, p2)
	return p1.ChatAppReducer.PlaceInfos[p2] or {}
end

function PlaceIdContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), UseDispatchFunction (copy), UseCallbackFunction (copy), ApiFetchPlaceInfosFunction (copy), UseSelectorFunction (copy), FFlagAppChatInvalidGameLinkCardModule (copy), ReactModule (copy), UseEffectFunction (copy), GameAssetCardModule (copy), GameCardErrorModule (copy), GameCardGroupableModule (copy), GameCardContainerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(p2, p3)
		-- upvalues: UseDispatchResult (copy), ApiFetchPlaceInfosFunction (upval)
		return UseDispatchResult(ApiFetchPlaceInfosFunction(p2, { p3 }))
	end, { UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: JoinResult (copy)
		local UniverseId = (p2.ChatAppReducer.PlaceInfos[JoinResult.placeId] or {}).universeId
		
		return UniverseId and tostring(UniverseId) or nil
	end)
	local UseRefResult = if FFlagAppChatInvalidGameLinkCardModule then ReactModule.useRef(nil) else { current = nil }
	local v1 = nil
	local Callback = nil
	
	if FFlagAppChatInvalidGameLinkCardModule then
		v1, Callback = ReactModule.useState(false)
	end
	UseEffectFunction(function()
		-- upvalues: JoinResult (copy), UseCallbackResult (copy), FFlagAppChatInvalidGameLinkCardModule (upval), CryoModule (upval), UseSelectorResult (copy), UseRefResult (copy), Callback (ref)
		local Inverted = false
		UseCallbackResult(JoinResult.networkImpl, JoinResult.placeId):andThen(function(Result)
			-- upvalues: FFlagAppChatInvalidGameLinkCardModule (upval), Inverted (ref), CryoModule (upval)
			if FFlagAppChatInvalidGameLinkCardModule then
				Inverted = not CryoModule.isEmpty(Result)
			end
		end)
		
		if not FFlagAppChatInvalidGameLinkCardModule then return end
		if not UseSelectorResult then
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
			end
			UseRefResult.current = task.delay(1, function()
				-- upvalues: Inverted (ref), Callback (upval), UseRefResult (upval)
				if not Inverted then
					Callback(true)
				end
				UseRefResult.current = nil
			end)
		end
		return function()
			-- upvalues: UseRefResult (upval)
			if UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end
	end, {})
	
	if FFlagAppChatInvalidGameLinkCardModule then
		UseEffectFunction(function()
			-- upvalues: UseSelectorResult (copy), UseRefResult (copy)
			if UseSelectorResult and UseRefResult.current then
				task.cancel(UseRefResult.current)
				UseRefResult.current = nil
			end
		end, { UseSelectorResult })
	end
	return if UseSelectorResult or not JoinResult.groupShape then if UseSelectorResult then ReactModule.createElement(GameCardContainerModule, CryoModule.Dictionary.join(JoinResult, { universeId = UseSelectorResult })) elseif FFlagAppChatInvalidGameLinkCardModule and v1 then ReactModule.createElement(GameCardErrorModule, {}) else ReactModule.createElement(GameCardGroupableModule, { isLoading = true, gameName = "", gameThumbnail = "" }) else ReactModule.createElement(GameAssetCardModule, {
		isLoading = true,
		isError = FFlagAppChatInvalidGameLinkCardModule and v1,
		groupShape = JoinResult.groupShape,
		mediaRef = JoinResult.mediaRef
	})
end

return MemoFunction(PlaceIdContainer)