local Parent = script:FindFirstAncestor("BuildExperience").Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSessionSummaryModule = require(script.Parent.useSessionSummary)

return {
	isPublishLatest = function(p1, p2) --[[ Line: 25 ]]
		return p1 or p2
	end,
	usePublishStatus = function(p1) --[[ Line: 29 ]]
		-- upvalues: ReactModule (copy), UniverseConfigurationModule (copy), SignalsReactModule (copy), CreatorAgentChatModule (copy), UseSessionSummaryModule (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function() --[[ Line: 30 ]]
			-- upvalues: UniverseConfigurationModule (upval), p1 (copy)
			return UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId)
		end, { p1.universeId }).data)
		local HasPublishedTurn = UseSessionSummaryModule((ReactModule.useMemo(function() --[[ Line: 34 ]]
			-- upvalues: CreatorAgentChatModule (upval), p1 (copy)
			return CreatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p1.universeId, p1.placeId, p1.sessionId)
		end, { p1.universeId, p1.placeId, p1.sessionId }))).hasPublishedTurn
		local IsActive = UseSignalStateResult ~= nil and UseSignalStateResult.isActive
		
		return {
			hasPublishedTurn = HasPublishedTurn,
			hasPublishedVersion = IsActive,
			isPublishLatest = IsActive or HasPublishedTurn
		}
	end
}