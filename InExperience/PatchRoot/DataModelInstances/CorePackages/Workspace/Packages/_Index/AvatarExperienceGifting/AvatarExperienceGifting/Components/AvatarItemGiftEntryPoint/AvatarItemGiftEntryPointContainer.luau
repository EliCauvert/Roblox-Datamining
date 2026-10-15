local reactModule = require(script:FindFirstAncestor("AvatarExperienceGifting").Parent.React)
local avatarItemGiftEntryPointViewModule = require(script.Parent.AvatarItemGiftEntryPointView)
local useAvatarItemGiftEntryPointViewModelModule = require(script.Parent.useAvatarItemGiftEntryPointViewModel)

return function(p1)
	-- upvalues: useAvatarItemGiftEntryPointViewModelModule (ref), reactModule (ref), avatarItemGiftEntryPointViewModule (ref)
	return reactModule.createElement(avatarItemGiftEntryPointViewModule, useAvatarItemGiftEntryPointViewModelModule(p1))
end