local rolloutByApplicationId = require(script:FindFirstAncestor("SharedFlags").Parent.AppCommonLib).rolloutByApplicationId
game:DefineFastInt("CharacterNameHandlerUserProfileApiRollout", 0)
game:DefineFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll", false)

local _ = function() --[[ line: 12 ]]
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll")
end

local var0 = rolloutByApplicationId(function() --[[ line: 8 ]]
	return game:GetFastInt("CharacterNameHandlerUserProfileApiRollout")
end)

return function() --[[ line: 18 ]]
	-- upvalues: var0 (ref)
	return game:GetFastFlag("CharacterNameHandlerUserProfileApiEnabledForAll") or var0()
end