local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local SignalsModule = require(Parent.Signals)
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local _ = require(BuildExperience.Chat.chatTypes)

local function _(p1)
	if p1 == nil then
		return nil
	else
		local Meta = p1._meta
		local Roblox = if Meta == nil then nil else Meta._roblox
		local UniverseId = if Roblox == nil then nil else Roblox.universeId
		
		return if typeof(UniverseId) == "number" and UniverseId ~= 0 then UniverseId else nil
	end
end

local _ = function(p1): string
	return string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", p1)
end

local function makeTarget(UniverseId, SessionId, DataResult, FallbackExperienceName)
	local UniverseId1 = UniverseId or 0
	
	return {
		universeId = UniverseId1,
		placeId = if DataResult == nil then nil else DataResult.rootPlaceId,
		sessionId = SessionId,
		experienceName = if DataResult == nil or DataResult.name == "" then FallbackExperienceName else DataResult.name,
		gameIcon = if UniverseId1 == 0 then nil else string.format("rbxthumb://type=GameIcon&id=%d&w=150&h=150", UniverseId1)
	}
end

return function(p1)
	-- upvalues: CreatorAgentChatModule (copy), UniverseConfigurationModule (copy), SignalsModule (copy), makeTarget (copy)
	local SessionId = p1.sessionId
	local IsNotSessionIdMatch: boolean = typeof(SessionId) == "string" and SessionId ~= ""
	local IsNotUniverseIdMatch: boolean = p1.universeId ~= nil and p1.universeId ~= 0
	
	if IsNotUniverseIdMatch or IsNotSessionIdMatch then
		local FallbackExperienceName = p1.fallbackExperienceName
		local SessionLoadResult = if IsNotUniverseIdMatch or not IsNotSessionIdMatch then nil else (p1.creatorAgentChatStore or CreatorAgentChatModule.getCreatorAgentChatStore()).sessionLoad(SessionId)
		local ConfigurationStore = p1.configurationStore
		
		local function _()
			-- upvalues: ConfigurationStore (ref), UniverseConfigurationModule (upval)
			local ConfigurationStore1 = ConfigurationStore or UniverseConfigurationModule.getUniverseConfigurationStore()
			ConfigurationStore = ConfigurationStore1
			
			return ConfigurationStore1
		end
		
		local Flag = false
		
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Flag (ref), IsNotUniverseIdMatch (copy), p1 (copy), SessionLoadResult (ref), SessionId (copy), FallbackExperienceName (copy), ConfigurationStore (ref), UniverseConfigurationModule (upval), makeTarget (upval)
			if Flag then return end
			local UniverseId = nil
			if IsNotUniverseIdMatch then
				UniverseId = p1.universeId
			elseif SessionLoadResult == nil then
				UniverseId = nil
			else
				local StateResult = SessionLoadResult.state(p2)
				
				if StateResult.status == "pending" then return end
				if StateResult.status == "succeeded" then
					local Result = StateResult.result
					
					if Result == nil then
						UniverseId = nil
					else
						local Meta = Result._meta
						local Roblox = if Meta == nil then nil else Meta._roblox
						local UniverseId1 = if Roblox == nil then nil else Roblox.universeId
						UniverseId = if typeof(UniverseId1) == "number" and UniverseId1 ~= 0 then UniverseId1 else nil
					end
				else
					UniverseId = nil
				end
			end
			if UniverseId == nil then
				Flag = true
				p1.onOpenChat({
					universeId = 0,
					placeId = nil,
					gameIcon = nil,
					sessionId = SessionId,
					experienceName = FallbackExperienceName
				})
				
				return
			end
			local ConfigurationStore1 = ConfigurationStore or UniverseConfigurationModule.getUniverseConfigurationStore()
			ConfigurationStore = ConfigurationStore1
			local AndFetchSummary = ConfigurationStore1.getAndFetchSummary(UniverseId)
			
			if AndFetchSummary.status(p2) ~= "NotReady" then
				Flag = true
				p1.onOpenChat((makeTarget(UniverseId, SessionId, AndFetchSummary.data(p2), FallbackExperienceName)))
				
				return
			end
		end)
	else
		return nil
	end
end