local UserActivationFramework = script:FindFirstAncestor("UserActivationFramework")
local Parent = UserActivationFramework.Parent
local ReactModule = require(Parent.React)
local UIBloxModule = require(Parent.UIBlox)
local ButtonStack = UIBloxModule.App.Button.ButtonStack
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local _ = require(UserActivationFramework.Types)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local FullPageActivationFrameworkContextModule = require(UserActivationFramework.Context.FullPageActivationFrameworkContext)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local UseAttemptNextNavigationModule = require(UserActivationFramework.Hooks.useAttemptNextNavigation)
local Button = UIBloxModule.App.Button.Button
local Images = UIBloxModule.App.ImageSet.Images
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: ReactModule (copy), FullPageActivationFrameworkContextModule (copy), UseStyleFunction (copy), UseDesignTokensFunction (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), UseAttemptNextNavigationModule (copy), ButtonType (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), Button (copy), Images (copy), View (copy), StyledTextLabel (copy), ButtonStack (copy)
	local UseContextResult = ReactModule.useContext(FullPageActivationFrameworkContextModule)
	local PrimaryButton = p1.primaryButton
	local SecondaryButton = p1.secondaryButton
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = UseTokensFunction()
	local ActivationFramework = UseDesignTokensResult.LuaApps.ActivationFramework
	local config = { orText = "Authentication.SignUp.Description.Or" }
	
	if PrimaryButton then
		config.primaryText = PrimaryButton.buttonTextKey
	end
	if SecondaryButton then
		config.secondaryText = SecondaryButton.buttonTextKey
	end
	local UseLocalizationResult = UseLocalizationFunction(config)
	local UseAttemptNextNavigationModuleResult = UseAttemptNextNavigationModule(p1.navigation)
	local List = {}
	
	if SecondaryButton and SecondaryButton.shouldShowButton then
		table.insert(List, {
			buttonType = ButtonType.Secondary,
			props = {
				text = UseLocalizationResult.secondaryText,
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), UseContextResult (copy), EventStreamConstants (upval), UseAttemptNextNavigationModuleResult (copy), SecondaryButton (ref)
					AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.SecondaryButton, UseContextResult.activationFrameworkState.currentState)
					UseAttemptNextNavigationModuleResult(SecondaryButton)
				end,
				isDisabled = not SecondaryButton.isButtonEnabled
			}
		})
	end
	if PrimaryButton and PrimaryButton.shouldShowButton then
		table.insert(List, {
			buttonType = ButtonType.PrimaryContextual,
			props = {
				text = UseLocalizationResult.primaryText,
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), UseContextResult (copy), EventStreamConstants (upval), UseAttemptNextNavigationModuleResult (copy), PrimaryButton (ref)
					AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.PrimaryButton, UseContextResult.activationFrameworkState.currentState)
					UseAttemptNextNavigationModuleResult(PrimaryButton)
				end,
				isDisabled = not PrimaryButton.isButtonEnabled
			}
		})
	end
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		ButtonStack = if p1.shouldShowButtonDivider then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalFlex = Enum.UIFlexAlignment.Fill,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, ActivationFramework.footerButtonMarginBetweenPx)
			}),
			PrimaryButton = PrimaryButton and (PrimaryButton.shouldShowButton and ReactModule.createElement(Button, {
				layoutOrder = 1,
				text = UseLocalizationResult.primaryText,
				icon = if PrimaryButton.icon then Images[PrimaryButton.icon] else nil,
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), UseContextResult (copy), EventStreamConstants (upval), UseAttemptNextNavigationModuleResult (copy), PrimaryButton (ref)
					AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.PrimaryButton, UseContextResult.activationFrameworkState.currentState)
					UseAttemptNextNavigationModuleResult(PrimaryButton)
				end,
				size = UDim2.new(1, 0, 0, ActivationFramework.footerButtonHeightPx),
				buttonType = ButtonType.PrimaryContextual,
				isDisabled = not PrimaryButton.isButtonEnabled
			})),
			Divider = p1.shouldShowButtonDivider and ReactModule.createElement(View, {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, ActivationFramework.footerButtonHeightPx)
			}, {
				DividerLine = ReactModule.createElement(View, {
					tag = "stroke-default size-full-0 auto-y position-center-center anchor-center-center",
					ZIndex = 1
				}),
				DividerText = ReactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					ZIndex = 2,
					Size = UDim2.new(0, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.XY,
					BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
					Position = UDim2.new(0.5, 0, 0.5, 0),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}, {
					UIPadding = ReactModule.createElement("UIPadding", {
						PaddingRight = UDim.new(0, UseTokensResult.Padding.Small),
						PaddingLeft = UDim.new(0, UseTokensResult.Padding.Small)
					}),
					DividerTextLabel = ReactModule.createElement(StyledTextLabel, {
						BackgroundTransparency = 1,
						text = UseLocalizationResult.orText,
						fontStyle = UseTokensResult.Typography.LabelMedium,
						colorStyle = UseStyleResult.Theme.TextDefault,
						textXAlignment = Enum.TextXAlignment.Center,
						textYAlignment = Enum.TextYAlignment.Center,
						automaticSize = Enum.AutomaticSize.XY
					})
				})
			}),
			SecondaryButton = SecondaryButton and (SecondaryButton.shouldShowButton and ReactModule.createElement(Button, {
				layoutOrder = 3,
				text = UseLocalizationResult.secondaryText,
				icon = if SecondaryButton.icon then Images[SecondaryButton.icon] else nil,
				size = UDim2.new(1, 0, 0, ActivationFramework.footerButtonHeightPx),
				onActivated = function()
					-- upvalues: AuthButtonClickFunction (upval), UseContextResult (copy), EventStreamConstants (upval), UseAttemptNextNavigationModuleResult (copy), SecondaryButton (ref)
					AuthButtonClickFunction(UseContextResult.activationFrameworkState.namespace, EventStreamConstants.Button.SecondaryButton, UseContextResult.activationFrameworkState.currentState)
					UseAttemptNextNavigationModuleResult(SecondaryButton)
				end,
				buttonType = ButtonType.Secondary,
				isDisabled = not SecondaryButton.isButtonEnabled
			}))
		}) else ReactModule.createElement(ButtonStack, {
			buttons = List,
			buttonHeight = ActivationFramework.footerButtonHeightPx,
			marginBetween = ActivationFramework.footerButtonMarginBetweenPx,
			forcedFillDirection = Enum.FillDirection.Vertical
		})
	})
end