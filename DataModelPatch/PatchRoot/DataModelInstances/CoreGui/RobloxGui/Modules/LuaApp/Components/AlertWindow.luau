local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(Modules.Common.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TextModule = require(Modules.Common.Text)
local WithLocalizationModule = require(Modules.LuaApp.withLocalization)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local FitTextLabelModule = require(Modules.LuaApp.Components.FitTextLabel)
local FoundationModule = require(CorePackages.Packages.Foundation)
local Button = FoundationModule.Button
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local ButtonSize = FoundationModule.Enums.ButtonSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagUseStandardFoundationButtonVariantModule = require(Modules.LuaApp.Flags.FFlagUseStandardFoundationButtonVariant)
local AlertWindow = RoactModule.PureComponent:extend("AlertWindow")
AlertWindow.defaultProps = {
	titleTextSize = 25,
	messageTextAlignment = Enum.TextXAlignment.Center
}

function AlertWindow.render(p1)
	-- upvalues: TextModule (copy), RoactModule (copy), FitChildrenModule (copy), FitTextLabelModule (copy), Button (copy), FFlagUseStandardFoundationButtonVariantModule (copy), ButtonVariant (copy), ButtonSize (copy), WithLocalizationModule (copy)
	local Tokens = p1.props.tokens
	local TitleText = p1.props.titleText
	local TitleTextSize = p1.props.titleTextSize
	local TitleFont = p1.props.titleFont
	local MessageText = p1.props.messageText
	local MessageFont = p1.props.messageFont
	local ConfirmButtonText = p1.props.confirmButtonText
	local CancelButtonText = p1.props.cancelButtonText
	local OnConfirm = p1.props.onConfirm
	local IsConfirming = p1.props.isConfirming
	local HasCancelButton = p1.props.hasCancelButton
	local OnCancel = p1.props.onCancel
	local MessageTextAlignment = p1.props.messageTextAlignment
	local Smallest = math.min(p1.props.containerWidth - 20 - 20, 400)
	local SmallestDelta = Smallest - 20 - 20
	local Offset = HasCancelButton and (SmallestDelta - 10) / 2 or SmallestDelta
	local TextHeight = TextModule.GetTextHeight(MessageText, MessageFont, 20, SmallestDelta)
	
	local function v30(p2)
		-- upvalues: RoactModule (upval), FitChildrenModule (upval), Smallest (copy), Tokens (copy), FitTextLabelModule (upval), TitleText (copy), TitleFont (copy), TitleTextSize (copy), TextHeight (copy), MessageText (copy), MessageFont (copy), MessageTextAlignment (copy), HasCancelButton (copy), Button (upval), FFlagUseStandardFoundationButtonVariantModule (upval), ButtonVariant (upval), ButtonSize (upval), Offset (copy), OnCancel (copy), IsConfirming (copy), ConfirmButtonText (copy), OnConfirm (copy)
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			BorderSizePixel = 0,
			Active = true,
			Size = UDim2.new(0, Smallest, 0, 0),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			AnchorPoint = Vector2.new(0.5, 0.5),
			BackgroundColor3 = Tokens.Color.Surface.Surface_300.Color3,
			fitAxis = FitChildrenModule.FitAxis.Height
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Padding = RoactModule.createElement("UIPadding", {
				PaddingLeft = UDim.new(0, 20),
				PaddingRight = UDim.new(0, 20),
				PaddingBottom = UDim.new(0, 20)
			}),
			Title = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center
				}),
				PaddingTop = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, 11)
				}),
				Title = RoactModule.createElement(FitTextLabelModule, {
					BackgroundTransparency = 1,
					TextWrapped = true,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 28),
					Position = UDim2.new(0, 0, 0, 11),
					Text = TitleText,
					Font = TitleFont,
					TextSize = TitleTextSize,
					TextColor3 = Tokens.Color.Content.Emphasis.Color3,
					TextXAlignment = Enum.TextXAlignment.Center,
					fitAxis = FitChildrenModule.FitAxis.Height
				}),
				PaddingBottom = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 11)
				})
			}),
			Divider = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = Tokens.Color.Stroke.Default.Color3
			}),
			Message = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.new(1, 0, 0, 86 + TextHeight)
			}, {
				Message = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					TextSize = 20,
					TextWrapped = true,
					Size = UDim2.new(1, 0, 0, TextHeight),
					Position = UDim2.new(0, 0, 0, 40),
					Text = MessageText,
					Font = MessageFont,
					TextColor3 = Tokens.Color.Content.Default.Color3,
					TextXAlignment = MessageTextAlignment
				})
			}),
			Buttons = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 36)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 10)
				}),
				CancelButton = HasCancelButton and RoactModule.createElement(Button, {
					LayoutOrder = 1,
					variant = if FFlagUseStandardFoundationButtonVariantModule then ButtonVariant.Standard else ButtonVariant.Subtle,
					size = ButtonSize.Medium,
					width = UDim.new(0, Offset),
					text = p2.cancelText,
					onActivated = OnCancel
				}),
				ConfirmButton = RoactModule.createElement(Button, {
					LayoutOrder = 2,
					variant = ButtonVariant.SubEmphasis,
					size = ButtonSize.Medium,
					width = UDim.new(0, Offset),
					text = if IsConfirming then "" else ConfirmButtonText,
					onActivated = if IsConfirming then function() end else OnConfirm,
					isLoading = IsConfirming
				})
			})
		})
	end
	
	return if CancelButtonText then v30({ cancelText = CancelButtonText }) else WithLocalizationModule({ cancelText = "Feature.GamePage.LabelCancelField" })(v30)
end

return function(Tbl)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), AlertWindow (copy)
	local Copy = table.clone(Tbl)
	Copy.tokens = UseTokensFunction()
	
	return ReactModule.createElement(AlertWindow, Copy)
end