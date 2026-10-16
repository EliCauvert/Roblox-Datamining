local ReactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local AvatarActionBarModule = require(script.Parent.AvatarActionBar)
local UseAvatarActionBarViewModelModule = require(script.Parent.useAvatarActionBarViewModel)

return ReactModule.memo(function(p1) --[[ Line: 16 | Named "AvatarActionBarContainer" ]]
	-- upvalues: UseAvatarActionBarViewModelModule (copy), ReactModule (copy), AvatarActionBarModule (copy)
	return ReactModule.createElement(AvatarActionBarModule, (UseAvatarActionBarViewModelModule(p1)))
end)