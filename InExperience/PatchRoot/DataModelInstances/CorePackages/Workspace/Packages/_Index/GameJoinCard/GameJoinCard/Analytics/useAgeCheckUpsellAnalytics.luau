local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
local gameJoinCardButtonAction = require(script.Parent.AnalyticsConstants).GameJoinCardButtonAction
local useGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)

return {
	useAgeCheckCompletionLogger = function(p1)
		-- upvalues: reactModule (ref), useGameJoinCardAnalyticsModule (ref)
		local var1 = if p1 ~= "" then nil else p1
		
		return reactModule.useCallback(function(p2)
			-- upvalues: useGameJoinCardAnalyticsModule (copy), var1 (ref)
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckVerificationOutcome({ universeId = var1, outcome = p2 })
		end, { var1 })
	end,
	useAgeCheckPressLogger = function(p1)
		-- upvalues: reactModule (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), dependencyArray (ref)
		local userId = p1.userId
		local absolutePosition = p1.absolutePosition
		local joinAgeCheckUpsellFlow = p1.joinAgeCheckUpsellFlow
		local var1 = if p1.universeId ~= "" then nil else p1.universeId
		
		return reactModule.useCallback(function()
			-- upvalues: useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), userId (ref), var1 (ref), absolutePosition (ref), joinAgeCheckUpsellFlow (ref)
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.AgeCheckUnlock, {
				friendId = userId,
				universeId = var1,
				absolutePosition = absolutePosition
			})
			joinAgeCheckUpsellFlow()
		end, dependencyArray(userId, var1, absolutePosition, joinAgeCheckUpsellFlow))
	end
}