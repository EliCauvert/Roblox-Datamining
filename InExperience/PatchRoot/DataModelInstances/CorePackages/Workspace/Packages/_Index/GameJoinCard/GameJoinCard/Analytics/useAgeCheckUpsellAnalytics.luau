local parent = script:FindFirstAncestor("GameJoinCard").Parent
local reactModule = require(parent.React)
local dependencyArray = require(parent.RoactUtils).Hooks.dependencyArray
local gameJoinCardButtonAction = require(script.Parent.AnalyticsConstants).GameJoinCardButtonAction
local useGameJoinCardAnalyticsModule = require(script.Parent.useGameJoinCardAnalytics)

return {
	useAgeCheckCompletionLogger = function(p0)
		-- upvalues: reactModule (ref), useGameJoinCardAnalyticsModule (ref)
		local var2 = if p0 ~= "" then nil else p0
		
		return reactModule.useCallback(function(p1)
			-- upvalues: useGameJoinCardAnalyticsModule (copy), var2 (ref)
			useGameJoinCardAnalyticsModule.logJoinCardAgeCheckVerificationOutcome({ universeId = var2, outcome = p1 })
		end, { var2 })
	end,
	useAgeCheckPressLogger = function(p2)
		-- upvalues: reactModule (ref), useGameJoinCardAnalyticsModule (ref), gameJoinCardButtonAction (ref), dependencyArray (ref)
		local userId = p2.userId
		local absolutePosition = p2.absolutePosition
		local joinAgeCheckUpsellFlow = p2.joinAgeCheckUpsellFlow
		local var3 = if p2.universeId ~= "" then nil else p2.universeId
		
		return reactModule.useCallback(function()
			-- upvalues: useGameJoinCardAnalyticsModule (copy), gameJoinCardButtonAction (copy), userId (ref), var3 (ref), absolutePosition (ref), joinAgeCheckUpsellFlow (ref)
			useGameJoinCardAnalyticsModule.logGameJoinCardButtonEvent(gameJoinCardButtonAction.AgeCheckUnlock, {
				friendId = userId,
				universeId = var3,
				absolutePosition = absolutePosition
			})
			joinAgeCheckUpsellFlow()
		end, dependencyArray(userId, var3, absolutePosition, joinAgeCheckUpsellFlow))
	end
}