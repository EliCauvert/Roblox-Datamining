local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local MemoFunction = ReactModule.memo
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseSelectorFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useSelector
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local GetPlaceDetailsStoreFunction = require(Parent.DataHydration.PlaceDetails).getPlaceDetailsStore
local DataStatus = require(Parent.DataHydration).DataStatus
local Logger = require(Parent.Loggers).Logger
local PlaceIdContainer1 = Logger.new(Logger, "PlaceIdContainer")
local ApiFetchPlaceInfosFunction = require(Parent.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local GameCardGroupableModule = require(script.Parent.GameCardGroupable)
local GameCardContainerModule = require(script.Parent.GameCardContainer)
local GameCardErrorModule = require(script.Parent.GameCardError)
local GameAssetCardModule = require(script.Parent.GameAssetCard)
local _ = require(AppChat.Components.ChatConversation.Grouping.MessageGroupShape)
local FFlagAppChatInvalidGameLinkCardModule = require(AppChat.Flags.FFlagAppChatInvalidGameLinkCard)
local FFlagAppChatUseDataHydrationForPlaceInfosModule = require(AppChat.Flags.FFlagAppChatUseDataHydrationForPlaceInfos)
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

local function useDataHydrationUniverseId(p1, _)
	-- upvalues: GetPlaceDetailsStoreFunction (copy), ReactModule (copy), UseSignalStateFunction (copy), DataStatus (copy)
	local PlaceDetailsStore = GetPlaceDetailsStoreFunction(false)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PlaceDetailsStore (copy), p1 (copy)
		return PlaceDetailsStore.getAndFetchPlaceDetails(p1)
	end, { PlaceDetailsStore, p1 })
	local UseSignalStateResult = UseSignalStateFunction(UseMemoResult.data)
	local UseSignalStateResult1 = UseSignalStateFunction(UseMemoResult.status)
	local UniverseId = if UseSignalStateResult then UseSignalStateResult.universeId else nil
	
	return UniverseId, UseSignalStateResult1 == DataStatus.Failed or UseSignalStateResult1 == DataStatus.Ready and UniverseId == nil
end

local function useRoduxUniverseId(p1, p2)
	-- upvalues: UseDispatchFunction (copy), UseCallbackFunction (copy), ApiFetchPlaceInfosFunction (copy), UseSelectorFunction (copy), FFlagAppChatInvalidGameLinkCardModule (copy), ReactModule (copy), UseEffectFunction (copy), CryoModule (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseCallbackResult = UseCallbackFunction(function(p3, p4)
		-- upvalues: UseDispatchResult (copy), ApiFetchPlaceInfosFunction (upval)
		return UseDispatchResult(ApiFetchPlaceInfosFunction(p3, { p4 }))
	end, { UseDispatchResult })
	local UseSelectorResult = UseSelectorFunction(function(p3)
		-- upvalues: p1 (copy)
		local UniverseId = (p3.ChatAppReducer.PlaceInfos[p1] or {}).universeId
		
		return UniverseId and tostring(UniverseId) or nil
	end)
	local UseRefResult = if FFlagAppChatInvalidGameLinkCardModule then ReactModule.useRef(nil) else { current = nil }
	local v1 = nil
	local Callback = nil
	
	if FFlagAppChatInvalidGameLinkCardModule then
		v1, Callback = ReactModule.useState(false)
	end
	UseEffectFunction(function()
		-- upvalues: UseCallbackResult (copy), p2 (copy), p1 (copy), FFlagAppChatInvalidGameLinkCardModule (upval), CryoModule (upval), UseSelectorResult (copy), UseRefResult (copy), Callback (ref)
		local Inverted = false
		UseCallbackResult(p2, p1):andThen(function(Result)
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
	return UseSelectorResult, v1
end

local Callback = if FFlagAppChatUseDataHydrationForPlaceInfosModule then useDataHydrationUniverseId else useRoduxUniverseId

function PlaceIdContainer(p1)
	-- upvalues: CryoModule (copy), config (copy), Callback (copy), ReactModule (copy), GameAssetCardModule (copy), FFlagAppChatInvalidGameLinkCardModule (copy), GameCardErrorModule (copy), GameCardGroupableModule (copy), GameCardContainerModule (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local CallbackResult, CallbackResult2 = Callback(JoinResult.placeId, JoinResult.networkImpl)
	
	return if CallbackResult or not JoinResult.groupShape then if CallbackResult then ReactModule.createElement(GameCardContainerModule, CryoModule.Dictionary.join(JoinResult, { universeId = CallbackResult })) elseif FFlagAppChatInvalidGameLinkCardModule and CallbackResult2 then ReactModule.createElement(GameCardErrorModule, {}) else ReactModule.createElement(GameCardGroupableModule, { isLoading = true, gameName = "", gameThumbnail = "" }) else ReactModule.createElement(GameAssetCardModule, {
		isLoading = true,
		isError = FFlagAppChatInvalidGameLinkCardModule and CallbackResult2,
		groupShape = JoinResult.groupShape,
		mediaRef = JoinResult.mediaRef
	})
end

return MemoFunction(PlaceIdContainer)