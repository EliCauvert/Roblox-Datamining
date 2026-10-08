local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local avatarActionBarModule = require(script.Parent.AvatarActionBar)
local useAvatarActionBarViewModelModule = require(script.Parent.useAvatarActionBarViewModel)

return reactModule.memo(function(p1)
	-- upvalues: useAvatarActionBarViewModelModule (ref), reactModule (ref), avatarActionBarModule (ref)
	return reactModule.createElement(avatarActionBarModule, useAvatarActionBarViewModelModule(p1))
end)