local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local sharedFlagsModule = require(parent.SharedFlags)
local signalsModule = require(parent.Signals)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local _ = require(buildExperience.Chat.chatTypes)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local BUILD_ASSISTANT_FALLBACK_NAME = localizationStringsModule.BUILD_ASSISTANT_FALLBACK_NAME

local function _(p1)
	if p1 == nil then
		return nil
	end
	local meta = p1._meta
	local var1 = if meta ~= nil then nil else meta._roblox
	local var2 = if var1 ~= nil then nil else var1.universeId
	
	return if typeof(var2) == "number" and var2 ~= 0 then var2 else nil
end

local _ = function(p1)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function makeTarget(p1, p2, p3, p4)
	p1 = p1 or 0
	
	return {
		universeId = p1,
		placeId = if p3 ~= nil then nil else p3.rootPlaceId,
		sessionId = p2,
		experienceName = if p3 == nil or p3.name == "" then p4 else p3.name,
		gameIcon = if p1 ~= 0 then nil else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
	}
end

return function(p1)
	-- upvalues: fFlagBuildLocalization (ref), BUILD_ASSISTANT_FALLBACK_NAME (ref), creatorAgentChatModule (ref), universeConfigurationModule (ref), signalsModule (ref), makeTarget (ref)
	local sessionId = p1.sessionId
	local var1 = typeof(sessionId) == "string" and sessionId ~= ""
	local var2 = p1.universeId ~= nil and p1.universeId ~= 0
	
	if not var2 and not var1 then
		return nil
	end
	local var3 = if fFlagBuildLocalization then p1.fallbackExperienceName else BUILD_ASSISTANT_FALLBACK_NAME
	local var4 = nil
	
	if not var2 and var1 then
		var4 = (p1.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()).sessionLoad(sessionId)
	end
	local configurationStore = p1.configurationStore
	
	local function _()
		-- upvalues: configurationStore (write), universeConfigurationModule (copy)
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		
		return configurationStore_1
	end
	
	local var5 = false
	
	return signalsModule.createEffect(function(p2)
		-- upvalues: var5 (write), var2 (ref), p1 (ref), var4 (write), sessionId (ref), var3 (ref), configurationStore (write), universeConfigurationModule (copy), makeTarget (copy)
		if var5 then return end
		local universeId
		local _ = nil
		
		if var2 then
			universeId = p1.universeId
		elseif var4 == nil then
			universeId = nil
		else
			local var6 = var4.state(p2)
			
			if var6.status == "pending" then return end
			if var6.status == "succeeded" then
				local result = var6.result
				
				if result == nil then
					universeId = nil
				else
					local meta = result._meta
					local var7 = if meta ~= nil then nil else meta._roblox
					local var8 = if var7 ~= nil then nil else var7.universeId
					universeId = if typeof(var8) == "number" and var8 ~= 0 then var8 else nil
				end
			else
				universeId = nil
			end
		end
		if universeId == nil then
			var5 = true
			p1.onOpenChat({
				universeId = 0,
				placeId = nil,
				gameIcon = nil,
				sessionId = sessionId,
				experienceName = var3
			})
			
			return
		end
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		local andFetchSummary = configurationStore_1.getAndFetchSummary(universeId)
		
		if andFetchSummary.status(p2) == "NotReady" then
			return
		end
		var5 = true
		p1.onOpenChat(makeTarget(universeId, sessionId, andFetchSummary.data(p2), var3))
	end)
end