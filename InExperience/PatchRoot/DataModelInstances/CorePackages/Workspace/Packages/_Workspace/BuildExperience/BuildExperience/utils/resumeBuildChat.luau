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

local function _(p0)
	if p0 == nil then
		return nil
	end
	local meta = p0._meta
	local var7 = if meta ~= nil then nil else meta._roblox
	local var8 = if var7 ~= nil then nil else var7.universeId
	
	return if typeof(var8) == "number" and var8 ~= 0 then var8 else nil
end

local _ = function(p1)
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function makeTarget(p2, p3, p4, p5)
	p2 = p2 or 0
	
	return {
		universeId = p2,
		placeId = if p4 ~= nil then nil else p4.rootPlaceId,
		sessionId = p3,
		experienceName = if p4 == nil or p4.name == "" then p5 else p4.name,
		gameIcon = if p2 ~= 0 then nil else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p2)
	}
end

return function(p6)
	-- upvalues: fFlagBuildLocalization (ref), BUILD_ASSISTANT_FALLBACK_NAME (ref), creatorAgentChatModule (ref), universeConfigurationModule (ref), signalsModule (ref), makeTarget (ref)
	local sessionId = p6.sessionId
	local var10 = typeof(sessionId) == "string" and sessionId ~= ""
	local var11 = p6.universeId ~= nil and p6.universeId ~= 0
	
	if not var11 and not var10 then
		return nil
	end
	local var12 = if fFlagBuildLocalization then p6.fallbackExperienceName else BUILD_ASSISTANT_FALLBACK_NAME
	local var13 = nil
	
	if not var11 and var10 then
		var13 = (p6.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()).sessionLoad(sessionId)
	end
	local configurationStore = p6.configurationStore
	
	local function _()
		-- upvalues: configurationStore (write), universeConfigurationModule (copy)
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		
		return configurationStore_1
	end
	
	local var14 = false
	
	return signalsModule.createEffect(function(p7)
		-- upvalues: var14 (write), var11 (ref), p6 (ref), var13 (write), sessionId (ref), var12 (ref), configurationStore (write), universeConfigurationModule (copy), makeTarget (copy)
		if var14 then return end
		local universeId
		local _ = nil
		
		if var11 then
			universeId = p6.universeId
		elseif var13 == nil then
			universeId = nil
		else
			local var16 = var13.state(p7)
			
			if var16.status == "pending" then return end
			if var16.status == "succeeded" then
				local result = var16.result
				
				if result == nil then
					universeId = nil
				else
					local meta = result._meta
					local var17 = if meta ~= nil then nil else meta._roblox
					local var18 = if var17 ~= nil then nil else var17.universeId
					universeId = if typeof(var18) == "number" and var18 ~= 0 then var18 else nil
				end
			else
				universeId = nil
			end
		end
		if universeId == nil then
			var14 = true
			p6.onOpenChat({
				universeId = 0,
				placeId = nil,
				gameIcon = nil,
				sessionId = sessionId,
				experienceName = var12
			})
			
			return
		end
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		local andFetchSummary = configurationStore_1.getAndFetchSummary(universeId)
		
		if andFetchSummary.status(p7) == "NotReady" then
			return
		end
		var14 = true
		p6.onOpenChat(makeTarget(universeId, sessionId, andFetchSummary.data(p7), var12))
	end)
end