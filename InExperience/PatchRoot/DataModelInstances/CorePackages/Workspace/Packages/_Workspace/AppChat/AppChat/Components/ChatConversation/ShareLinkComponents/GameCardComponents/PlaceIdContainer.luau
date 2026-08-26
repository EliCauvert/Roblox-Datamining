local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local fFlagLuaAppDefaultHttpRetry = require(parent.SharedFlags).FFlagLuaAppDefaultHttpRetry
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local placeIdContainer = require(parent.Loggers).Logger:new("PlaceIdContainer")
local apiFetchPlaceInfos = require(parent.PlaceInfoRodux).Thunks.ApiFetchPlaceInfos
local gameCardGroupableModule = require(script.Parent.GameCardGroupable)
local gameCardContainerModule = require(script.Parent.GameCardContainer)
local gameCardErrorModule = require(script.Parent.GameCardError)
local fFlagAppChatInvalidGameLinkCardModule = require(appChat.Flags.FFlagAppChatInvalidGameLinkCard)
local httpRequestModule = require(parent.HttpRequest)
local t = {
	networkImpl = httpRequestModule.config({
		requestFunction = function(p1, p2, p3)
			-- upvalues: placeIdContainer (ref), httpRequestModule (ref)
			placeIdContainer:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p2, p1))
			
			return httpRequestModule.requestFunctions.HttpRbxApi(p1, p2, p3)
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("PlaceIdContainerHttpRetryCount", 4) else nil
	})
}

local function _(p1, p2)
	return p1.ChatAppReducer.PlaceInfos[p2] or {}
end

function PlaceIdContainer(p1)
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useCallback (ref), apiFetchPlaceInfos (ref), useSelector (ref), fFlagAppChatInvalidGameLinkCardModule (ref), reactModule (ref), useEffect (ref), gameCardErrorModule (ref), gameCardGroupableModule (ref), gameCardContainerModule (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local var2 = useDispatch()
	local var3 = useCallback(function(p2, p3)
		-- upvalues: var2 (ref), apiFetchPlaceInfos (copy)
		return var2(apiFetchPlaceInfos(p2, { p3 }))
	end, { var2 })
	local var4 = useSelector(function(p2)
		-- upvalues: var1 (ref)
		local universeId = (p2.ChatAppReducer.PlaceInfos[var1.placeId] or {}).universeId
		
		return universeId and tostring(universeId) or nil
	end)
	local var5 = if fFlagAppChatInvalidGameLinkCardModule then reactModule.useRef(nil) else { current = nil }
	local var6 = nil
	local var7 = nil
	
	if fFlagAppChatInvalidGameLinkCardModule then
		local var8, var9 = reactModule.useState(false)
		var6 = var8
		var7 = var9
	end
	useEffect(function()
		-- upvalues: var1 (ref), var3 (ref), fFlagAppChatInvalidGameLinkCardModule (copy), cryoModule (copy), var4 (ref), var5 (ref), var7 (write)
		local var10 = false
		var3(var1.networkImpl, var1.placeId):andThen(function(p2)
			-- upvalues: fFlagAppChatInvalidGameLinkCardModule (copy), var10 (write), cryoModule (copy)
			if fFlagAppChatInvalidGameLinkCardModule then
				var10 = not cryoModule.isEmpty(p2)
			end
		end)
		
		if not fFlagAppChatInvalidGameLinkCardModule then return end
		if not var4 then
			if var5.current then
				task.cancel(var5.current)
			end
			var5.current = task.delay(1, function()
				-- upvalues: var10 (write), var7 (copy), var5 (copy)
				if not var10 then
					var7(true)
				end
				var5.current = nil
			end)
		end
		return function()
			-- upvalues: var5 (copy)
			if var5.current then
				task.cancel(var5.current)
				var5.current = nil
			end
		end
	end, {})
	
	if fFlagAppChatInvalidGameLinkCardModule then
		useEffect(function()
			-- upvalues: var4 (ref), var5 (ref)
			if var4 and var5.current then
				task.cancel(var5.current)
				var5.current = nil
			end
		end, { var4 })
	end
	return if var4 then reactModule.createElement(gameCardContainerModule, cryoModule.Dictionary.join(var1, { universeId = var4 })) elseif fFlagAppChatInvalidGameLinkCardModule and var6 then reactModule.createElement(gameCardErrorModule, {}) else reactModule.createElement(gameCardGroupableModule, { isLoading = true, gameName = "", gameThumbnail = "" })
end

return memo(PlaceIdContainer)