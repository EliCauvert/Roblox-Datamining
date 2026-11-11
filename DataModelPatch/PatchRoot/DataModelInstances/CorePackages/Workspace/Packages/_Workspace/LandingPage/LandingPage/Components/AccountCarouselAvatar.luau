local LandingPage = script:FindFirstAncestor("LandingPage")
local Parent = LandingPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UserLibModule = require(Parent.UserLib)
local GetRbxthumbWithTypeSizeAndOptionsFunction = UserLibModule.Utils.getRbxthumbWithTypeSizeAndOptions
local Constants = UserLibModule.Utils.Constants
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local GetFFlagEnableAccountCarouselEventsFunction = require(Parent.SharedFlags).GetFFlagEnableAccountCarouselEvents
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local AccountCarouselAvatarScaleFactor = require(LandingPage.Constants.LandingPageConstants).Common.AccountCarouselAvatarScaleFactor

return (ReactModule.forwardRef(function(p1, Ref)
	-- upvalues: UseLocalizationFunction (copy), ReactModule (copy), FoundationModule (copy), GetFFlagEnableAccountCarouselEventsFunction (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), AccountCarouselAvatarScaleFactor (copy), GetRbxthumbWithTypeSizeAndOptionsFunction (copy), Constants (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		signedOut = "Authentication.AccountPicker.Label.SignedOut"
	})
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col align-x-center padding-bottom-large",
		ref = Ref,
		onActivated = function()
			-- upvalues: GetFFlagEnableAccountCarouselEventsFunction (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), p1 (copy)
			if GetFFlagEnableAccountCarouselEventsFunction() then
				AuthButtonClickFunction(EventStreamConstants.Context.AccountPickerLandingScreen, EventStreamConstants.Button.AccountPickerAccountSelected, p1.accountInfo.user_id, nil)
			end
			p1.onActivated()
		end,
		Size = UDim2.new(0, p1.avatarSize.X.Offset * AccountCarouselAvatarScaleFactor, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		onAbsoluteSizeChanged = function(_)
			-- upvalues: p1 (copy), AccountCarouselAvatarScaleFactor (upval)
			p1.setAvatarElementHeightForParent(p1.avatarSize.Y.Offset * AccountCarouselAvatarScaleFactor + 40 + 40)
		end,
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		AvatarImage = ReactModule.createElement(FoundationModule.Image, {
			LayoutOrder = 1,
			Size = p1.avatarSize,
			ImageRect = p1.avatarSize,
			Image = GetRbxthumbWithTypeSizeAndOptionsFunction(tostring(p1.accountInfo.user_id), Constants.RbxthumbTypes.Avatar, 352),
			ScaleType = Enum.ScaleType.Crop,
			scale = if p1.isHighlighted then AccountCarouselAvatarScaleFactor else 1,
			imageStyle = if p1.isHighlighted then {} else { Transparency = 0.5 }
		}),
		DisplayName = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 3,
			tag = "auto-xy text-align-x-center text-heading-medium content-emphasis",
			Text = p1.accountInfo.display_name,
			textStyle = { Transparency = if p1.isHighlighted then 0 else 1 }
		}),
		Username = ReactModule.createElement(FoundationModule.Text, {
			LayoutOrder = 4,
			tag = "auto-xy text-align-x-center text-body-medium content-muted padding-bottom-large",
			Text = if p1.accountInfo.has_valid_session then "@" .. p1.accountInfo.username else "@" .. p1.accountInfo.username .. " • " .. UseLocalizationResult.signedOut,
			textStyle = { Transparency = if p1.isHighlighted then 0 else 1 }
		})
	})
end))