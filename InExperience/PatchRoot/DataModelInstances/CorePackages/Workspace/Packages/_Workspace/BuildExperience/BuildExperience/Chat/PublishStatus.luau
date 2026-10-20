local Parent = script:FindFirstAncestor("BuildExperience").Parent
local CreatorAgentChatModule = require(Parent.DataHydration.CreatorAgentChat)
local UniverseConfigurationModule = require(Parent.DataHydration.UniverseConfiguration)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local UseSessionSummaryModule = require(script.Parent.useSessionSummary)

return {
	isPublishLatest = function(p1, p2)
		return p1 or p2
	end,
	usePublishStatus = function(p1)
		-- upvalues: ReactModule (copy), UniverseConfigurationModule (copy), SignalsReactModule (copy), CreatorAgentChatModule (copy), UseSessionSummaryModule (copy)
		local UseSignalStateResult = SignalsReactModule.useSignalState(ReactModule.useMemo(function()
			-- upvalues: UniverseConfigurationModule (upval), p1 (copy)
			return UniverseConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId)
		end, { p1.universeId }).data)
		local HasPublishedTurn = UseSessionSummaryModule((ReactModule.useMemo(function()
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