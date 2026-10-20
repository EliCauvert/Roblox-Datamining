local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Toggle = FoundationModule.Toggle
local ToggleSize = FoundationModule.Enums.ToggleSize
local UIBloxModule = require(Parent.UIBlox)
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local HorizontalPageMargin = UIBloxModule.App.Container.HorizontalPageMargin
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local UserProfileSettingsNetworkingModule = require(ProfilePlatform.Networking.UserProfileSettingsNetworking)
local RefreshProfilePlatformUserProfileHeaderModule = require(ProfilePlatform.Networking.refreshProfilePlatformUserProfileHeader)

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), ReactModule (copy), UserProfileSettingsNetworkingModule (copy), RefreshProfilePlatformUserProfileHeaderModule (copy), HorizontalPageMargin (copy), StyledTextLabel (copy), Toggle (copy), ToggleSize (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	
	return ReactModule.createElement(HorizontalPageMargin, {
		backgroundTransparency = 1,
		size = p1.size,
		layoutOrder = p1.layoutOrder
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			Padding = UDim.new(0, 8)
		}),
		Label = ReactModule.createElement(StyledTextLabel, {
			text = "In-experience name:",
			fontStyle = UseStyleResult.Font.CaptionHeader,
			colorStyle = UseStyleResult.Theme.TextEmphasis,
			automaticSize = Enum.AutomaticSize.XY
		}),
		Toggle = ReactModule.createElement(Toggle, {
			label = "",
			size = ToggleSize.Medium,
			isChecked = p1.isInExperienceNameEnabled,
			onActivated = ReactModule.useCallback(function(IsInExperienceNameEnabled)
				-- upvalues: UseDispatchResult (copy), UserProfileSettingsNetworkingModule (upval), RefreshProfilePlatformUserProfileHeaderModule (upval), UseProfileWrapperContextModuleResult (copy)
				UseDispatchResult(UserProfileSettingsNetworkingModule.SetUserProfileSettings.API({ isInExperienceNameEnabled = IsInExperienceNameEnabled })):andThen(function(Result)
					-- upvalues: UseDispatchResult (upval), RefreshProfilePlatformUserProfileHeaderModule (upval), UseProfileWrapperContextModuleResult (upval)
					if Result.responseBody.successfullyUpdated then
						UseDispatchResult(RefreshProfilePlatformUserProfileHeaderModule(UseProfileWrapperContextModuleResult.profileId))
					end
				end)
			end)
		})
	})
end