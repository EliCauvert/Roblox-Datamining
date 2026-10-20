local TutilsModule = require(script:FindFirstAncestor("AvatarExperienceCommon").Parent.tutils)

return function()
	-- upvalues: TutilsModule (copy)
	return TutilsModule.deepEqual
end