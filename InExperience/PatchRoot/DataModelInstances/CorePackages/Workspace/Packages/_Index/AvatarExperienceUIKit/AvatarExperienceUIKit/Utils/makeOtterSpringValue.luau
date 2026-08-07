local reactOtterModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.ReactOtter)
local getUserSettingsModule = require(script.Parent.getUserSettings)

return function(p0, p1) --[[ line: 8 | named "makeOtterSpringValue" ]]
	-- upvalues: getUserSettingsModule (ref), reactOtterModule (ref)
	return if getUserSettingsModule().ReducedMotion then reactOtterModule.instant(p0) else reactOtterModule.spring(p0, p1)
end