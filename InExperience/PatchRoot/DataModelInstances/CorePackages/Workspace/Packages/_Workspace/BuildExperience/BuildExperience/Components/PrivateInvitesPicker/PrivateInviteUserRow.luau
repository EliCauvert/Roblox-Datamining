local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local UseUserProfileInfoModule = require(BuildExperience.Components.UserPicker.useUserProfileInfo)
local Text = require(Parent.Foundation).Text

return function(p1)
	-- upvalues: UseUserProfileInfoModule (copy), ReactModule (copy), Text (copy)
	local UseUserProfileInfoModuleResult = UseUserProfileInfoModule(p1.userId)
	
	return ReactModule.createElement(Text, {
		tag = "size-full-0 auto-y text-body-medium text-align-x-left content-default",
		LayoutOrder = p1.layoutOrder,
		Text = if UseUserProfileInfoModuleResult.displayName == "" then p1.unknownText else UseUserProfileInfoModuleResult.displayName
	})
end