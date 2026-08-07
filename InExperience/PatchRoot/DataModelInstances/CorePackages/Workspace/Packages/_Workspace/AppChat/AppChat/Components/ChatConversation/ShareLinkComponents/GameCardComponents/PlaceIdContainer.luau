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
		requestFunction = function(p0, p1, p2) --[[ line: 32 ]]
			-- upvalues: placeIdContainer (ref), httpRequestModule (ref)
			placeIdContainer:info("Fetching: {}", string.format("[ requestMethod = %q, url = %q ]", p1, p0))
			
			return httpRequestModule.requestFunctions.HttpRbxApi(p0, p1, p2)
		end,
		maxRetryCount = if fFlagLuaAppDefaultHttpRetry then game:DefineFastInt("PlaceIdContainerHttpRetryCount", 4) else nil
	})
}

local function _(p3, p4) --[[ line: 52 | named "getPlaceInfo" ]]
	return p3.ChatAppReducer.PlaceInfos[p4] or {}
end

function PlaceIdContainer(p5) --[[ line: 56 ]]
	-- upvalues: cryoModule (ref), t (ref), useDispatch (ref), useCallback (ref), apiFetchPlaceInfos (ref), useSelector (ref), fFlagAppChatInvalidGameLinkCardModule (ref), reactModule (ref), useEffect (ref), gameCardErrorModule (ref), gameCardGroupableModule (ref), gameCardContainerModule (ref)
	local var10 = cryoModule.Dictionary.join(t, p5)
	local var11 = useDispatch()
	local var12 = useCallback(function(p6, p7) --[[ line: 60 ]]
		-- upvalues: var11 (ref), apiFetchPlaceInfos (copy)
		return var11(apiFetchPlaceInfos(p6, { p7 }))
	end, { var11 })
	local var13 = useSelector(function(p8) --[[ line: 64 ]]
		-- upvalues: var10 (ref)
		local universeId = (p8.ChatAppReducer.PlaceInfos[var10.placeId] or {}).universeId
		
		return universeId and tostring(universeId) or nil
	end)
	local var14 = if fFlagAppChatInvalidGameLinkCardModule then reactModule.useRef(nil) else { current = nil }
	local var15 = nil
	local var16 = nil
	
	if fFlagAppChatInvalidGameLinkCardModule then
		local var17, var18 = reactModule.useState(false)
		var15 = var17
		var16 = var18
	end
	useEffect(function() --[[ line: 78 ]]
		-- upvalues: var10 (ref), var12 (ref), fFlagAppChatInvalidGameLinkCardModule (copy), cryoModule (copy), var13 (ref), var14 (ref), var16 (write)
		local var19 = false
		var12(var10.networkImpl, var10.placeId):andThen(function(p9) --[[ line: 82 ]]
			-- upvalues: fFlagAppChatInvalidGameLinkCardModule (copy), var19 (write), cryoModule (copy)
			if fFlagAppChatInvalidGameLinkCardModule then
				var19 = not cryoModule.isEmpty(p9)
			end
		end)
		
		if not fFlagAppChatInvalidGameLinkCardModule then return end
		if not var13 then
			if var14.current then
				task.cancel(var14.current)
			end
			var14.current = task.delay(1, function() --[[ line: 94 ]]
				-- upvalues: var19 (write), var16 (copy), var14 (copy)
				if not var19 then
					var16(true)
				end
				var14.current = nil
			end)
		end
		return function() --[[ line: 102 ]]
			-- upvalues: var14 (copy)
			if var14.current then
				task.cancel(var14.current)
				var14.current = nil
			end
		end
	end, {})
	
	if fFlagAppChatInvalidGameLinkCardModule then
		useEffect(function() --[[ line: 114 ]]
			-- upvalues: var13 (ref), var14 (ref)
			if var13 and var14.current then
				task.cancel(var14.current)
				var14.current = nil
			end
		end, { var13 })
	end
	return if var13 then reactModule.createElement(gameCardContainerModule, cryoModule.Dictionary.join(var10, { universeId = var13 })) elseif fFlagAppChatInvalidGameLinkCardModule and var15 then reactModule.createElement(gameCardErrorModule, {}) else reactModule.createElement(gameCardGroupableModule, { isLoading = true, gameName = "", gameThumbnail = "" })
end

return memo(PlaceIdContainer)