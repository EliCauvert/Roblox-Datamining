local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useUserProfileInfoModule = require(buildExperience.Components.UserPicker.useUserProfileInfo)
local text = foundationModule.Text

return function(p1)
	-- upvalues: useUserProfileInfoModule (ref), reactModule (ref), text (ref)
	local var1 = useUserProfileInfoModule(p1.userId)
	
	return reactModule.createElement(text, {
		tag = "size-full-0 auto-y text-body-medium text-align-x-left content-default",
		LayoutOrder = p1.layoutOrder,
		Text = if var1.displayName ~= "" then p1.unknownText else var1.displayName
	})
end