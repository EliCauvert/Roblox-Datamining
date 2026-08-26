local reactOtterModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.ReactOtter)
local getUserSettingsModule = require(script.Parent.getUserSettings)

return function(p1, p2)
	-- upvalues: getUserSettingsModule (ref), reactOtterModule (ref)
	return if getUserSettingsModule().ReducedMotion then reactOtterModule.instant(p1) else reactOtterModule.spring(p1, p2)
end