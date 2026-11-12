local EditProfile = script:FindFirstAncestor("EditProfile")
local Parent = EditProfile.Parent
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View
local EditProfileHeaderBarModule = require(EditProfile.BaseComponents.EditProfileHeaderBar)
local UseProfileCardWidthFunction = require(Parent.ProfilePlatformCommon).Hooks.useProfileCardWidth
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FFlagAXEnableProfileTab = require(Parent.SharedFlags).FFlagAXEnableProfileTab
local FFlagSplitPaneFullBleedEditProfile = require(Parent.SharedFlags).FFlagSplitPaneFullBleedEditProfile

return function(p1)
	-- upvalues: UseProfileCardWidthFunction (copy), UseLocalizationFunction (copy), FFlagAXEnableProfileTab (copy), FFlagSplitPaneFullBleedEditProfile (copy), ReactModule (copy), View (copy), EditProfileHeaderBarModule (copy)
	local UseProfileCardWidthResult = UseProfileCardWidthFunction()
	local IsFullBleed: boolean = if FFlagAXEnableProfileTab then p1.fullBleed == true else FFlagSplitPaneFullBleedEditProfile and p1.fullBleed == true
	
	return ReactModule.createElement(View, {
		tag = if FFlagAXEnableProfileTab or FFlagSplitPaneFullBleedEditProfile then {
			["col items-start bg-surface-0"] = true,
			["position-top-right anchor-top-right"] = not IsFullBleed,
			["size-full-full"] = IsFullBleed
		} else "col bg-surface-0 anchor-top-right position-top-right items-start",
		Size = if IsFullBleed then nil else UDim2.new(0, UseProfileCardWidthResult, 1, 0)
	}, {
		TopBar = ReactModule.createElement(EditProfileHeaderBarModule, {
			onClose = p1.onClose,
			headerText = UseLocalizationFunction({ title = p1.titleKey }).title,
			onSave = p1.onSave,
			isLoading = p1.isLoading,
			isDisabled = p1.isDisabled
		}),
		Content = ReactModule.createElement(View, {
			tag = "col padding-xlarge gap-xxlarge size-full-0 auto-y"
		}, p1.component)
	})
end