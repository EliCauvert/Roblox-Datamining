local Parent = script:FindFirstAncestor("GameJoinCard").Parent
local ReactModule = require(Parent.React)
local DependencyArrayFunction = require(Parent.RoactUtils).Hooks.dependencyArray
local GameJoinCardButtonAction = require(script.Parent.AnalyticsConstants).GameJoinCardButtonAction
local UseGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)

return {
	useAgeCheckCompletionLogger = function(p1)
		-- upvalues: ReactModule (copy), UseGameJoinCardAnalyticsModule (copy)
		local UniverseId = if p1 == "" then nil else p1
		
		return ReactModule.useCallback(function(Outcome)
			-- upvalues: UseGameJoinCardAnalyticsModule (upval), UniverseId (copy)
			UseGameJoinCardAnalyticsModule.logJoinCardAgeCheckVerificationOutcome({ universeId = UniverseId, outcome = Outcome })
		end, { UniverseId })
	end,
	useAgeCheckPressLogger = function(p1)
		-- upvalues: ReactModule (copy), UseGameJoinCardAnalyticsModule (copy), GameJoinCardButtonAction (copy), DependencyArrayFunction (copy)
		local UserId = p1.userId
		local AbsolutePosition = p1.absolutePosition
		local JoinAgeCheckUpsellFlowFunction = p1.joinAgeCheckUpsellFlow
		local UniverseId = if p1.universeId == "" then nil else p1.universeId
		
		return ReactModule.useCallback(function()
			-- upvalues: UseGameJoinCardAnalyticsModule (upval), GameJoinCardButtonAction (upval), UserId (copy), UniverseId (copy), AbsolutePosition (copy), JoinAgeCheckUpsellFlowFunction (copy)
			UseGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(GameJoinCardButtonAction.AgeCheckUnlock, {
				friendId = UserId,
				universeId = UniverseId,
				absolutePosition = AbsolutePosition
			})
			JoinAgeCheckUpsellFlowFunction()
		end, DependencyArrayFunction(UserId, UniverseId, AbsolutePosition, JoinAgeCheckUpsellFlowFunction))
	end
}