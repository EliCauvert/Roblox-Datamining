local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local _ = require(buildExperience.Chat.chatTypes)
local BUILD_ASSISTANT_FALLBACK_NAME = require(buildExperience.LocalizationStrings).BUILD_ASSISTANT_FALLBACK_NAME

local function _(p0) --[[ line: 37 | named "resolveUniverseIdFromSessionLoad" ]]
	if p0 == nil then
		return nil
	end
	local meta = p0._meta
	local var5 = if meta ~= nil then nil else meta._roblox
	local var6 = if var5 ~= nil then nil else var5.universeId
	
	return if typeof(var6) == "number" and var6 ~= 0 then var6 else nil
end

local _ = function(p1) --[[ line: 50 | named "gameIconForUniverseId" ]]
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function makeTarget(p2, p3, p4) --[[ line: 54 ]]
	-- upvalues: BUILD_ASSISTANT_FALLBACK_NAME (ref)
	p2 = p2 or 0
	
	return {
		universeId = p2,
		placeId = if p4 ~= nil then nil else p4.rootPlaceId,
		sessionId = p3,
		experienceName = if p4 == nil or p4.name == "" then BUILD_ASSISTANT_FALLBACK_NAME else p4.name,
		gameIcon = if p2 ~= 0 then nil else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p2)
	}
end

return function(p5) --[[ line: 65 | named "resumeBuildChat" ]]
	-- upvalues: creatorAgentChatModule (ref), universeConfigurationModule (ref), signalsModule (ref), BUILD_ASSISTANT_FALLBACK_NAME (ref), makeTarget (ref)
	local sessionId = p5.sessionId
	local var8 = typeof(sessionId) == "string" and sessionId ~= ""
	local var9 = p5.universeId ~= nil and p5.universeId ~= 0
	
	if not var9 and not var8 then
		return nil
	end
	local var10 = nil
	
	if not var9 and var8 then
		var10 = (p5.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()).sessionLoad(sessionId)
	end
	local configurationStore = p5.configurationStore
	
	local function _() --[[ line: 81 | named "getConfigurationStore" ]]
		-- upvalues: configurationStore (write), universeConfigurationModule (copy)
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		
		return configurationStore_1
	end
	
	local var11 = false
	
	return signalsModule.createEffect(function(p6) --[[ line: 89 ]]
		-- upvalues: var11 (write), var9 (ref), p5 (ref), var10 (write), sessionId (ref), BUILD_ASSISTANT_FALLBACK_NAME (copy), configurationStore (write), universeConfigurationModule (copy), makeTarget (copy)
		if var11 then return end
		local universeId
		local _ = nil
		
		if var9 then
			universeId = p5.universeId
		elseif var10 == nil then
			universeId = nil
		else
			local var13 = var10.state(p6)
			
			if var13.status == "pending" then return end
			if var13.status == "succeeded" then
				local result = var13.result
				
				if result == nil then
					universeId = nil
				else
					local meta = result._meta
					local var14 = if meta ~= nil then nil else meta._roblox
					local var15 = if var14 ~= nil then nil else var14.universeId
					universeId = if typeof(var15) == "number" and var15 ~= 0 then var15 else nil
				end
			else
				universeId = nil
			end
		end
		if universeId == nil then
			var11 = true
			p5.onOpenChat({
				universeId = 0,
				placeId = nil,
				gameIcon = nil,
				sessionId = sessionId,
				experienceName = BUILD_ASSISTANT_FALLBACK_NAME
			})
			
			return
		end
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		local andFetchSummary = configurationStore_1.getAndFetchSummary(universeId)
		
		if andFetchSummary.status(p6) == "NotReady" then
			return
		end
		var11 = true
		p5.onOpenChat(makeTarget(universeId, sessionId, andFetchSummary.data(p6)))
	end)
end