local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local _ = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Common.Types)
local GetUseSelectorDeepEqualsFunction = require(CorePackages.Workspace.Packages.AvatarExperienceCommon).Utils.getUseSelectorDeepEquals
local list = {
	"default", "sm", "md", "lg", "xl", "xxl"
}
local config = {
	default = 0,
	sm = 576,
	md = 768,
	lg = 992,
	xl = 1200,
	xxl = 1400
}

return function(p1)
	-- upvalues: UseSelectorFunction (copy), GetUseSelectorDeepEqualsFunction (copy), ReactModule (copy), list (copy), config (copy)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		return p2.ScreenSize
	end, GetUseSelectorDeepEqualsFunction())
	local X = if UseSelectorResult then UseSelectorResult.X else 0
	
	return ReactModule.useMemo(function()
		-- upvalues: list (upval), p1 (copy), config (upval), X (copy)
		local v1 = nil
		
		for _, value in list do
			if p1[value] then
				if X < config[value] then break end
				v1 = p1[value]
			end
		end
		return v1
	end, { X, p1 })
end