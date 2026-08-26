local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local toggle = foundationModule.Toggle
local toggleSize = foundationModule.Enums.ToggleSize
local UIBloxModule = require(parent.UIBlox)
local useStyle = UIBloxModule.Core.Style.useStyle
local horizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local userProfileSettingsNetworkingModule = require(profilePlatform.Networking.UserProfileSettingsNetworking)
local refreshProfilePlatformUserProfileHeaderModule = require(profilePlatform.Networking.refreshProfilePlatformUserProfileHeader)

return function(value)
	-- upvalues: useProfileWrapperContextModule (ref), useStyle (ref), useDispatch (ref), reactModule (ref), userProfileSettingsNetworkingModule (ref), refreshProfilePlatformUserProfileHeaderModule (ref), horizontalPageMargin (ref), styledTextLabel (ref), toggle (ref), toggleSize (ref)
	local var1 = useProfileWrapperContextModule()
	local var2 = useStyle()
	local var3 = useDispatch()
	
	return reactModule.createElement(horizontalPageMargin, {
		backgroundTransparency = 1,
		size = value.size,
		layoutOrder = value.layoutOrder
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 8)
		}),
		Label = reactModule.createElement(styledTextLabel, {
			text = "In-experience name:",
			fontStyle = var2.Font.CaptionHeader,
			colorStyle = var2.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.XY
		}),
		Toggle = reactModule.createElement(toggle, {
			label = "",
			size = toggleSize.Medium,
			isChecked = value.isInExperienceNameEnabled,
			onActivated = reactModule.useCallback(function(p1)
				-- upvalues: var3 (ref), userProfileSettingsNetworkingModule (copy), refreshProfilePlatformUserProfileHeaderModule (copy), var1 (ref)
				var3(userProfileSettingsNetworkingModule.SetUserProfileSettings.API({ isInExperienceNameEnabled = p1 })):andThen(function(p2)
					-- upvalues: var3 (copy), refreshProfilePlatformUserProfileHeaderModule (copy), var1 (copy)
					if p2.responseBody.successfullyUpdated then
						var3(refreshProfilePlatformUserProfileHeaderModule(var1.profileId))
					end
				end)
			end)
		})
	})
end