local editProfile = script:FindFirstAncestor("EditProfile")
local parent = editProfile.Parent
local reactModule = require(parent.React)
local view = require(parent.Foundation).View
local editProfileHeaderBarModule = require(editProfile.BaseComponents.EditProfileHeaderBar)
local useProfileCardWidth = require(parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local useLocalization = require(parent.Localization).Hooks.useLocalization
local fFlagAXEnableProfileTab = require(parent.SharedFlags).FFlagAXEnableProfileTab

return function(p1)
	-- upvalues: useProfileCardWidth (ref), useLocalization (ref), fFlagAXEnableProfileTab (ref), reactModule (ref), view (ref), editProfileHeaderBarModule (ref)
	local var1 = fFlagAXEnableProfileTab and p1.fullBleed == true
	
	return reactModule.createElement(view, {
		tag = if fFlagAXEnableProfileTab then {
			["col items-start bg-surface-0"] = true,
			["position-top-right anchor-top-right"] = not var1,
			["size-full-full"] = var1
		} else "col bg-surface-0 anchor-top-right position-top-right items-start",
		Size = if var1 then nil else UDim2.new(0, useProfileCardWidth(), 1, 0)
	}, {
		TopBar = reactModule.createElement(editProfileHeaderBarModule, {
			onClose = p1.onClose,
			headerText = useLocalization({ title = p1.titleKey }).title,
			onSave = p1.onSave,
			isLoading = p1.isLoading,
			isDisabled = p1.isDisabled
		}),
		Content = reactModule.createElement(view, {
			tag = "col padding-xlarge gap-xxlarge size-full-0 auto-y"
		}, p1.component)
	})
end