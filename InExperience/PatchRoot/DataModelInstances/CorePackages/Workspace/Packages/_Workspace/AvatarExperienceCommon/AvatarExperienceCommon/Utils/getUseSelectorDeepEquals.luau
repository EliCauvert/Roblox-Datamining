local tutilsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.tutils)

return function()
	-- upvalues: tutilsModule (ref)
	return tutilsModule.deepEqual
end