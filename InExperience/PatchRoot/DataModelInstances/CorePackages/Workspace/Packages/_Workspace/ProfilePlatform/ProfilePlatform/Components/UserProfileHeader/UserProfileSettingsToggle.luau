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

return function(value) --[[ line: 27 | named "UserProfileSettingsToggle" ]]
	-- upvalues: useProfileWrapperContextModule (ref), useStyle (ref), useDispatch (ref), reactModule (ref), userProfileSettingsNetworkingModule (ref), refreshProfilePlatformUserProfileHeaderModule (ref), horizontalPageMargin (ref), styledTextLabel (ref), toggle (ref), toggleSize (ref)
	local var7 = useProfileWrapperContextModule()
	local var8 = useStyle()
	local var9 = useDispatch()
	
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
			fontStyle = var8.Font.CaptionHeader,
			colorStyle = var8.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.XY
		}),
		Toggle = reactModule.createElement(toggle, {
			label = "",
			size = toggleSize.Medium,
			isChecked = value.isInExperienceNameEnabled,
			onActivated = reactModule.useCallback(function(p0) --[[ line: 32 ]]
				-- upvalues: var9 (ref), userProfileSettingsNetworkingModule (copy), refreshProfilePlatformUserProfileHeaderModule (copy), var7 (ref)
				var9(userProfileSettingsNetworkingModule.SetUserProfileSettings.API({ isInExperienceNameEnabled = p0 })):andThen(function(p1) --[[ line: 35 ]]
					-- upvalues: var9 (copy), refreshProfilePlatformUserProfileHeaderModule (copy), var7 (copy)
					if p1.responseBody.successfullyUpdated then
						var9(refreshProfilePlatformUserProfileHeaderModule(var7.profileId))
					end
				end)
			end)
		})
	})
end