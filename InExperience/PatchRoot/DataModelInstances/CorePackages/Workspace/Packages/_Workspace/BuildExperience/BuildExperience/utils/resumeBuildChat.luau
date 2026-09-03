local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local signalsModule = require(parent.Signals)
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local _ = require(buildExperience.Chat.chatTypes)

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
	-- upvalues: creatorAgentChatModule (ref), universeConfigurationModule (ref), signalsModule (ref), makeTarget (ref)
	local sessionId = p1.sessionId
	local var1 = typeof(sessionId) == "string" and sessionId ~= ""
	local var2 = p1.universeId ~= nil and p1.universeId ~= 0
	
	if not var2 and not var1 then
		return nil
	end
	local fallbackExperienceName = p1.fallbackExperienceName
	local var3 = nil
	
	if not var2 and var1 then
		var3 = (p1.creatorAgentChatStore or creatorAgentChatModule.getCreatorAgentChatStore()).sessionLoad(sessionId)
	end
	local configurationStore = p1.configurationStore
	
	local function _()
		-- upvalues: configurationStore (write), universeConfigurationModule (copy)
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		
		return configurationStore_1
	end
	
	local var4 = false
	
	return signalsModule.createEffect(function(p2)
		-- upvalues: var4 (write), var2 (ref), p1 (ref), var3 (write), sessionId (ref), fallbackExperienceName (ref), configurationStore (write), universeConfigurationModule (copy), makeTarget (copy)
		if var4 then return end
		local universeId
		local _ = nil
		
		if var2 then
			universeId = p1.universeId
		elseif var3 == nil then
			universeId = nil
		else
			local var5 = var3.state(p2)
			
			if var5.status == "pending" then return end
			if var5.status == "succeeded" then
				local result = var5.result
				
				if result == nil then
					universeId = nil
				else
					local meta = result._meta
					local var6 = if meta ~= nil then nil else meta._roblox
					local var7 = if var6 ~= nil then nil else var6.universeId
					universeId = if typeof(var7) == "number" and var7 ~= 0 then var7 else nil
				end
			else
				universeId = nil
			end
		end
		if universeId == nil then
			var4 = true
			p1.onOpenChat({
				universeId = 0,
				placeId = nil,
				gameIcon = nil,
				sessionId = sessionId,
				experienceName = fallbackExperienceName
			})
			
			return
		end
		local configurationStore_1 = configurationStore or universeConfigurationModule.getUniverseConfigurationStore()
		configurationStore = configurationStore_1
		local andFetchSummary = configurationStore_1.getAndFetchSummary(universeId)
		
		if andFetchSummary.status(p2) == "NotReady" then
			return
		end
		var4 = true
		p1.onOpenChat(makeTarget(universeId, sessionId, andFetchSummary.data(p2), fallbackExperienceName))
	end)
end