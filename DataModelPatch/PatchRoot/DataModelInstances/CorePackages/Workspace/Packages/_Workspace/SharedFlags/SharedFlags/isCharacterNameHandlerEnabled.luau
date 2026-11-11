local RolloutByApplicationIdFunction = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).rolloutByApplicationId
game:DefineFastInt("CharacterNameHandlerUserProfileApiRollout", 0)
game:DefineFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll", false)

local function _()
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll")
end

local RolloutByApplicationIdResult = RolloutByApplicationIdFunction(function()
	return game:GetFastInt("CharacterNameHandlerUserProfileApiRollout")
end)

return function()
	-- upvalues: RolloutByApplicationIdResult (copy)
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll") or RolloutByApplicationIdResult()
end