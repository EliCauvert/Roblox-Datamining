local ReactOtterModule = require(script:FindFirstAncestor("AvatarExperienceUIKit").Parent.ReactOtter)
local GetUserSettingsModule = require(script.Parent.getUserSettings)

return function(p1, p2) --[[ Line: 8 | Named "makeOtterSpringValue" ]]
	-- upvalues: GetUserSettingsModule (copy), ReactOtterModule (copy)
	return if GetUserSettingsModule().ReducedMotion then ReactOtterModule.instant(p1) else ReactOtterModule.spring(p1, p2)
end