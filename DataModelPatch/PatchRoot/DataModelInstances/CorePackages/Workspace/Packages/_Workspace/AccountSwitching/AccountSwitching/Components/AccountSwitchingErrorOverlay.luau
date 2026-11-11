local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UseEffectFunction = React.useEffect
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local CloseCentralOverlayFunction = DependenciesModule.CentralOverlay.Thunks.CloseCentralOverlay
local UIBlox = DependenciesModule.UIBlox
local InteractiveAlert = UIBlox.App.Dialog.Alert.InteractiveAlert
local WithStyleFunction = UIBlox.Style.withStyle
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local Constants = UIBlox.App.Style.Constants
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)
local Foundation = DependenciesModule.Foundation
local Dialog = Foundation.Dialog
local DialogSize = Foundation.Enums.DialogSize
local ButtonVariant = Foundation.Enums.ButtonVariant
local Orientation = Foundation.Enums.Orientation
local GetFFlagEnableAccountSwitcherFoundationDesignFunction = require(Parent1.SharedFlags).GetFFlagEnableAccountSwitcherFoundationDesign
local UiModeStyleProvider = require(Parent1.Style).UiModeStyleProvider
local RoactAppExperimentModule = require(Parent1.RoactAppExperiment)
local AppBtidLayers = require(Parent1.ExperimentLayers).AppBtidLayers
local GetFFlagEnableAccountSwitcherRedesignIXPFunction = require(Parent1.SharedFlags).GetFFlagEnableAccountSwitcherRedesignIXP
local GetFFlagFixAccountSwitcherOverlayBackgroundTapFunction = require(Parent1.SharedFlags).GetFFlagFixAccountSwitcherOverlayBackgroundTap

return (DependenciesModule.RoactRodux.connect(nil, function(Callback)
	-- upvalues: CloseCentralOverlayFunction (copy)
	return {
		closeCentralOverlay = function()
			-- upvalues: Callback (copy), CloseCentralOverlayFunction (upval)
			return Callback(CloseCentralOverlayFunction())
		end
	}
end)(function(p1)
	-- upvalues: GetFFlagEnableAccountSwitcherRedesignIXPFunction (copy), RoactAppExperimentModule (copy), AppBtidLayers (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), GetFFlagFixAccountSwitcherOverlayBackgroundTapFunction (copy), UseLocalizationFunction (copy), ButtonType (copy), UseEffectFunction (copy), GetFFlagEnableAccountSwitcherFoundationDesignFunction (copy), React (copy), Dialog (copy), DialogSize (copy), Foundation (copy), Orientation (copy), ButtonVariant (copy), WithStyleFunction (copy), InteractiveAlert (copy), UiModeStyleProvider (copy), Constants (copy)
	local Inverted = not GetFFlagEnableAccountSwitcherRedesignIXPFunction() or RoactAppExperimentModule.useBrowserTrackerExperiment({ AppBtidLayers.AccountSwitcherLayer }, function(p2): boolean
		-- upvalues: AppBtidLayers (upval)
		return (p2[AppBtidLayers.AccountSwitcherLayer] or {}).enableAccountSwitcherFoundationDesign == true
	end)
	local HasPrimaryButtonCallback: boolean = p1.primaryButtonTextKey ~= nil and (p1.primaryButtonTextKey ~= "" and p1.primaryButtonCallback ~= nil)
	local OnActivated = if HasPrimaryButtonCallback then function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.accountSwitcherConfirmation, EventConstantsModule.btn.primaryButton, p1.errorType)
		p1.primaryButtonCallback()
	end else nil
	local HasSecondaryButtonCallback: boolean = p1.secondaryButtonTextKey ~= nil and (p1.secondaryButtonTextKey ~= "" and p1.secondaryButtonCallback ~= nil)
	local Callback = if HasSecondaryButtonCallback then function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy)
		AnalyticsEventsModule.sendButtonClickEvent(EventConstantsModule.ctx.accountSwitcherConfirmation, EventConstantsModule.btn.secondaryButton, p1.errorType)
		p1.secondaryButtonCallback()
	end else nil
	
	local function OnClose()
		-- upvalues: GetFFlagFixAccountSwitcherOverlayBackgroundTapFunction (upval), Callback (ref), p1 (copy)
		if GetFFlagFixAccountSwitcherOverlayBackgroundTapFunction() and Callback then
			Callback()
			
			return
		else
			p1.closeCentralOverlay()
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({
		titleText = p1.titleTextKey,
		bodyTextKey = p1.bodyTextKey,
		primaryButtonTextKey = p1.primaryButtonTextKey,
		secondaryButtonTextKey = p1.secondaryButtonTextKey
	})
	local BodyTextKey = UseLocalizationResult.bodyTextKey
	
	if p1.bodyUsername then
		BodyTextKey = string.gsub(BodyTextKey, "{username}", p1.bodyUsername)
	end
	local List = {}
	
	if HasSecondaryButtonCallback then
		table.insert(List, {
			buttonType = ButtonType.Secondary,
			props = {
				text = UseLocalizationResult.secondaryButtonTextKey,
				onActivated = Callback
			}
		})
	end
	if HasPrimaryButtonCallback then
		table.insert(List, {
			buttonType = ButtonType.PrimarySystem,
			props = {
				text = UseLocalizationResult.primaryButtonTextKey,
				onActivated = OnActivated
			}
		})
	end
	UseEffectFunction(function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy)
		AnalyticsEventsModule.sendModalShownEvent(EventConstantsModule.ctx.accountSwitcherConfirmation, p1.errorType)
	end, {})
	local Element = if GetFFlagEnableAccountSwitcherFoundationDesignFunction() and Inverted then React.createElement(Dialog.Root, {
		hasBackdrop = true,
		closeOnClickOutside = true,
		size = DialogSize.Small,
		onClose = OnClose
	}, {
		DialogTitle = React.createElement(Dialog.Title, { text = UseLocalizationResult.titleText }),
		DialogContent = React.createElement(Dialog.Content, nil, {
			DialogView = React.createElement(Foundation.View, { tag = "col fill auto-xy items-start" }, {
				DialogText = React.createElement(Dialog.Text, { LayoutOrder = 1, Text = BodyTextKey })
			})
		}),
		DialogActions = React.createElement(Dialog.Actions, {
			orientation = Orientation.Vertical,
			actions = {
				HasPrimaryButtonCallback and {
					text = UseLocalizationResult.primaryButtonTextKey,
					variant = ButtonVariant.Alert,
					onActivated = OnActivated
				} or nil,
				HasSecondaryButtonCallback and {
					text = UseLocalizationResult.secondaryButtonTextKey,
					variant = ButtonVariant.Standard,
					onActivated = Callback
				} or nil
			}
		})
	}) else WithStyleFunction(function(p2)
		-- upvalues: React (upval), OnClose (copy), InteractiveAlert (upval), UseLocalizationResult (copy), List (copy)
		return React.createElement("TextButton", {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			BackgroundColor3 = p2.Theme.Overlay.Color,
			AutoButtonColor = false,
			BackgroundTransparency = p2.Theme.Overlay.Transparency,
			Visible = true,
			[React.Event.Activated] = OnClose
		}, {
			Alert = React.createElement(InteractiveAlert, {
				title = UseLocalizationResult.titleText,
				bodyText = UseLocalizationResult.bodyTextKey,
				buttonStackInfo = { buttons = List },
				position = UDim2.fromScale(0.5, 0.5),
				screenSize = Vector2.new(400, nil)
			})
		})
	end)
	
	return if p1.forceDarkTheme then React.createElement(UiModeStyleProvider, {
		style = {
			themeName = Constants.ThemeName.Dark,
			fontName = Constants.FontName.Gotham
		}
	}, { Child = Element }) else Element
end))