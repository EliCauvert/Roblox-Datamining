local RolloutByApplicationIdFunction = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).rolloutByApplicationId
game:DefineFastInt("CharacterNameHandlerUserProfileApiRollout", 0)
game:DefineFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll", false)

local function _() --[[ Line: 12 ]]
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll")
end

local RolloutByApplicationIdResult = RolloutByApplicationIdFunction(function() --[[ Line: 8 ]]
	return game:GetFastInt("CharacterNameHandlerUserProfileApiRollout")
end)

return function() --[[ Line: 18 ]]
	-- upvalues: RolloutByApplicationIdResult (copy)
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll") or RolloutByApplicationIdResult()
end