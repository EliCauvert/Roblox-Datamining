local rolloutByApplicationId = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).rolloutByApplicationId
game:DefineFastInt("CharacterNameHandlerUserProfileApiRollout", 0)
game:DefineFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll", false)

local _ = function()
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll")
end

local var1 = rolloutByApplicationId(function()
	return game:GetFastInt("CharacterNameHandlerUserProfileApiRollout")
end)

return function()
	-- upvalues: var1 (ref)
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll") or var1()
end