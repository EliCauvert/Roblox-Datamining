local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorAgentChatModule = require(parent.DataHydration.CreatorAgentChat)
local universeConfigurationModule = require(parent.DataHydration.UniverseConfiguration)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local useSessionSummaryModule = require(script.Parent.useSessionSummary)

return {
	isPublishLatest = function(p0, p1) --[[ line: 25 ]]
		return p0 or p1
	end,
	usePublishStatus = function(p2) --[[ line: 29 ]]
		-- upvalues: reactModule (ref), universeConfigurationModule (ref), signalsReactModule (ref), creatorAgentChatModule (ref), useSessionSummaryModule (ref)
		local var5 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 30 ]]
			-- upvalues: universeConfigurationModule (copy), p2 (ref)
			return universeConfigurationModule.getUniverseConfigurationStore().getAndFetchSummary(p2.universeId)
		end, { p2.universeId }).data)
		local hasPublishedTurn = useSessionSummaryModule(reactModule.useMemo(function() --[[ line: 34 ]]
			-- upvalues: creatorAgentChatModule (copy), p2 (ref)
			return creatorAgentChatModule.getCreatorAgentChatStore().getSessionForProject(p2.universeId, p2.placeId, p2.sessionId)
		end, { p2.universeId, p2.placeId, p2.sessionId })).hasPublishedTurn
		local var6 = var5 ~= nil and var5.isActive
		
		return {
			hasPublishedTurn = hasPublishedTurn,
			hasPublishedVersion = var6,
			isPublishLatest = var6 or hasPublishedTurn
		}
	end
}