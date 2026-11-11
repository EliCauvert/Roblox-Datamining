local RolloutByApplicationIdFunction = require(script:FindFirstAncestor("SocialTab").Parent.AppCommonLib).rolloutByApplicationId
game:DefineFastInt("SocialTabUserProfileApiRollout", 0)
game:DefineFastFlag("SocialTabUserProfileApiEnabledForAll", false)

local function _()
	return game:GetFastFlag("SocialTabUserProfileApiEnabledForAll")
end

local RolloutByApplicationIdResult = RolloutByApplicationIdFunction(function()
	return game:GetFastInt("SocialTabUserProfileApiRollout")
end)

return function()
	-- upvalues: RolloutByApplicationIdResult (copy)
	return game:GetFastFlag("SocialTabUserProfileApiEnabledForAll") or RolloutByApplicationIdResult()
end