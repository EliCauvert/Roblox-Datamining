local ReactModule = require(script:FindFirstAncestor("AvatarExperienceGifting").Parent.React)
local AvatarItemGiftEntryPointViewModule = require(script.Parent.AvatarItemGiftEntryPointView)
local UseAvatarItemGiftEntryPointViewModelModule = require(script.Parent.useAvatarItemGiftEntryPointViewModel)

return function(p1)
	-- upvalues: UseAvatarItemGiftEntryPointViewModelModule (copy), ReactModule (copy), AvatarItemGiftEntryPointViewModule (copy)
	return ReactModule.createElement(AvatarItemGiftEntryPointViewModule, (UseAvatarItemGiftEntryPointViewModelModule(p1)))
end