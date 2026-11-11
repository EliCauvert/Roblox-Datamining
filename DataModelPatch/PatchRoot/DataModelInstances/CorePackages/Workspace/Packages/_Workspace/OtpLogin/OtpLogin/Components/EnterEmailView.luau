local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UIBlox = DependenciesModule.UIBlox
local UseStyleFunction = UIBlox.Core.Style.useStyle
local UseDesignTokensFunction = DependenciesModule.Style.useDesignTokens
local PartialPageModal = UIBlox.App.Dialog.Modal.PartialPageModal
local GetPartialPageModalMiddleContentWidthFunction = UIBlox.App.Dialog.Modal.getPartialPageModalMiddleContentWidth
local ButtonType = UIBlox.App.Button.Enum.ButtonType
local UseLocalizationFunction = DependenciesModule.Localization.Hooks.useLocalization
local InputFieldModule = require(script.Parent.InputField)
local AnalyticsEventsModule = require(Parent.Analytics.AnalyticsEvents)
local EventConstantsModule = require(Parent.Analytics.EventConstants)

local function getButtonStackProps(Text, OnActivated, IsDisabled, ButtonHeight)
	-- upvalues: ButtonType (copy)
	return {
		buttonHeight = ButtonHeight,
		forcedFillDirection = Enum.FillDirection.Vertical,
		buttons = {
			{
				buttonType = ButtonType.PrimarySystem,
				props = {
					onActivated = OnActivated,
					text = Text,
					isDisabled = IsDisabled
				}
			}
		}
	}
end

return function(p1)
	-- upvalues: UseStyleFunction (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), GetPartialPageModalMiddleContentWidthFunction (copy), React (copy), AnalyticsEventsModule (copy), EventConstantsModule (copy), PartialPageModal (copy), getButtonStackProps (copy), InputFieldModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		emailPlaceholder = "Authentication.Login.Label.Email",
		continueButton = "Authentication.OneTimePasscode.Action.Continue"
	})
	local PartialPageModalMiddleContentWidth = GetPartialPageModalMiddleContentWidthFunction(p1.screenSize.X)
	local UseResult = React.useCallback(function()
		-- upvalues: p1 (copy)
		return p1.isDisabled or (string.len(p1.errorMessage) > 0 or string.len(p1.email) == 0)
	end, { p1.isDisabled, p1.errorMessage, p1.email })
	React.useEffect(function()
		-- upvalues: AnalyticsEventsModule (upval), EventConstantsModule (upval), p1 (copy)
		AnalyticsEventsModule.sendPageLoadEvent(EventConstantsModule.ctx.sendOtp, p1.origin)
	end, {})
	
	return React.createElement(PartialPageModal, {
		title = p1.enterEmailTitle,
		screenSize = p1.screenSize,
		buttonStackProps = getButtonStackProps(UseLocalizationResult.continueButton, p1.handleContinue, UseResult(), UseDesignTokensResult.Size.Size_1200),
		onCloseClicked = p1.onClose,
		position = p1.isKeyboardShowing and UDim2.new(0.5, 0, 1, -p1.keyboardHeight) or nil,
		anchorPoint = p1.isKeyboardShowing and Vector2.new(0.5, 1) or nil
	}, {
		Middle = React.createElement("Frame", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			ContentPadding = React.createElement("UIPadding", {
				PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_600),
				PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_600)
			}),
			ListLayout = React.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Left,
				Padding = UDim.new(0, UseDesignTokensResult.Size.Size_300)
			}),
			BodyText = React.createElement("TextLabel", {
				BackgroundTransparency = 1,
				TextWrapped = true,
				LayoutOrder = 1,
				Text = p1.enterEmailDescription,
				TextSize = UseStyleResult.Font.BaseSize,
				TextColor3 = UseStyleResult.Theme.TextDefault.Color,
				TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
				Font = UseStyleResult.Font.Body.Font,
				TextXAlignment = Enum.TextXAlignment.Left,
				AutomaticSize = Enum.AutomaticSize.Y,
				Size = UDim2.new(0, PartialPageModalMiddleContentWidth, 0, 0)
			}),
			EmailInput = React.createElement(InputFieldModule, {
				LayoutOrder = 2,
				text = p1.email,
				disabled = p1.isDisabled,
				onChange = p1.onEmailTextChange,
				errorMessage = p1.errorMessage,
				placeholder = UseLocalizationResult.emailPlaceholder
			})
		})
	})
end