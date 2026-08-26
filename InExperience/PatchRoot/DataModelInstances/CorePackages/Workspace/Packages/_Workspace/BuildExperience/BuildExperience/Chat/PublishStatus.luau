local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useSessionSummaryModule = require(script.Parent.useSessionSummary)

return {
	isPublishLatest = function(p1, p2)
		return p1 or p2
	end,
	usePublishStatus = function(p1)
		-- upvalues: reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), creatorAgentChatModule (ref), useSessionSummaryModule (ref)
		local var1 = signalsReactModule.useSignalState(reactModule.useMemo(function()
			-- upvalues: universeConfigurationModule (copy), p1 (ref)
			return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p1.universeId)
		end, { p1.universeId }).data)
		local hasPublishedTurn = useSessionSummaryModule(reactModule.useMemo(function()
			-- upvalues: creatorAgentChatModule (copy), p1 (ref)
			return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p1.universeId, p1.placeId, p1.sessionId)
		end, { p1.universeId, p1.placeId, p1.sessionId })).hasPublishedTurn
		local var2 = var1 ~= nil and var1.isActive
		
		return {
			hasPublishedTurn = hasPublishedTurn,
			hasPublishedVersion = var2,
			isPublishLatest = var2 or hasPublishedTurn
		}
	end
}