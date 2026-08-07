local tutilsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.tutils)

return function() --[[ line: 6 ]]
	-- upvalues: tutilsModule (ref)
	return tutilsModule.deepEqual
end