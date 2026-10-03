local reactModule = require(script:FindFirstAncestor("Moments").Parent.React)
local avatarActionBarModule = require(script.Parent.AvatarActionBar)
local useAvatarActionBarViewModelModule = require(script.Parent.useAvatarActionBarViewModel)

return reactModule.memo(function(p1)
	-- upvalues: useAvatarActionBarViewModelModule (ref), reactModule (ref), avatarActionBarModule (ref)
	local var1 = useAvatarActionBarViewModelModule(p1)
	
	return if var1 == nil then nil else reactModule.createElement(avatarActionBarModule, var1)
end)