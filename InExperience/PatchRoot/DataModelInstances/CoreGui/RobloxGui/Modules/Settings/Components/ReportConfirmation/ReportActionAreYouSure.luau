local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local TextButton = UIBloxModule.App.Button.TextButton
local ReportActionSelection = RoactModule.PureComponent:extend("ReportActionSelection")

local function OnCancelActivated() end

ReportActionSelection.defaultProps = {
	isMuted = true,
	isBlocked = true,
	ZIndex = 1,
	uiScale = 1.3,
	onCancelActivated = OnCancelActivated,
	onConfirmActivated = OnCancelActivated
}
ReportActionSelection.validateProps = TModule.strictInterface({
	mutedTitleText = TModule.string,
	blockedTitleText = TModule.string,
	mutedAndBlockedTitleText = TModule.string,
	mutedSubtitleText = TModule.string,
	blockedSubtitleText = TModule.string,
	mutedAndBlockedSubtitleText = TModule.string,
	cancelText = TModule.string,
	confirmText = TModule.string,
	isMuted = TModule.boolean,
	isBlocked = TModule.boolean,
	onCancelActivated = TModule.callback,
	onConfirmActivated = TModule.callback,
	ZIndex = TModule.optional(TModule.number),
	uiScale = TModule.optional(TModule.number)
})

function ReportActionSelection.init(DefaultProps)
	function DefaultProps.onCancelActivated()
		-- upvalues: DefaultProps (copy)
		DefaultProps.props.onCancelActivated()
	end
	
	function DefaultProps.onConfirmActivated()
		-- upvalues: DefaultProps (copy)
		DefaultProps.props.onConfirmActivated()
	end
	
	local BlockedTitleText = nil
	local BlockedSubtitleText = nil
	
	if DefaultProps.props.isMuted and DefaultProps.props.isBlocked then
		BlockedTitleText = DefaultProps.props.mutedAndBlockedTitleText
		BlockedSubtitleText = DefaultProps.props.mutedAndBlockedSubtitleText
	elseif DefaultProps.props.isMuted then
		BlockedTitleText = DefaultProps.props.mutedTitleText
		BlockedSubtitleText = DefaultProps.props.mutedSubtitleText
	elseif DefaultProps.props.isBlocked then
		BlockedTitleText = DefaultProps.props.blockedTitleText
		BlockedSubtitleText = DefaultProps.props.blockedSubtitleText
	end
	DefaultProps:setState({
		titleText = BlockedTitleText,
		subtitleText = BlockedSubtitleText
	})
end

function ReportActionSelection.render(DefaultProps)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), RoactModule (copy), NormalizeFontFaceFunction (copy), TextButton (copy), UIBloxModule (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p1)
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p1 else nil,
			Theme = {
				SystemPrimaryContent = {
					Color = p1.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p1.Color.ActionSubEmphasis.Foreground.Transparency
				},
				TextEmphasis = {
					Color = p1.Color.Content.Emphasis.Color3,
					Transparency = p1.Color.Content.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				CaptionHeader = {
					Font = p1.Typography.CaptionLarge.Font,
					RelativeSize = p1.Typography.CaptionLarge.FontSize
				},
				Header1 = {
					Font = p1.Typography.HeadingSmall.Font,
					RelativeSize = p1.Typography.HeadingSmall.FontSize
				}
			}
		}
	end, function(p1)
		-- upvalues: RoactModule (upval), DefaultProps (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), TextButton (upval), UIBloxModule (upval)
		local BaseSize = p1.Font.BaseSize
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = DefaultProps.props.ZIndex
		}, {
			uiScale = RoactModule.createElement("UIScale", { Scale = DefaultProps.props.uiScale }),
			layout = RoactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 22),
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			title = RoactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Text = DefaultProps.state.titleText,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				TextTransparency = p1.Theme.TextEmphasis.Transparency,
				TextSize = p1.Font.Header1.RelativeSize * BaseSize,
				Font = if FoundationFontFaceMigration then nil else p1.Font.Header1.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.HeadingSmall.Font) else nil,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			subtitle = RoactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.fromOffset(612, 0),
				Text = DefaultProps.state.subtitleText,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				TextTransparency = p1.Theme.TextEmphasis.Transparency,
				TextSize = p1.Font.CaptionHeader.RelativeSize * BaseSize,
				Font = if FoundationFontFaceMigration then nil else p1.Font.CaptionHeader.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.CaptionLarge.Font) else nil,
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			spacer = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(0, 62)
			}),
			actions = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.fromOffset(584, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 70),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				cancelContainer = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					BackgroundColor3 = p1.Theme.SystemPrimaryContent.Color,
					BackgroundTransparency = p1.Theme.SystemPrimaryContent.Transparency,
					Size = UDim2.fromOffset(234, 44)
				}, {
					uiCorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					cancelButton = RoactModule.createElement(TextButton, {
						size = UDim2.fromScale(1, 1),
						text = DefaultProps.props.cancelText,
						onActivated = DefaultProps.onCancelActivated
					})
				}),
				confirmContainer = RoactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = UIBloxModule.App.Style.Colors.Blue,
					Size = UDim2.fromOffset(234, 44)
				}, {
					uiCorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					confirmButton = RoactModule.createElement(TextButton, {
						size = UDim2.fromScale(1, 1),
						text = DefaultProps.props.confirmText,
						onActivated = DefaultProps.onConfirmActivated
					})
				})
			})
		})
	end)
end

return ReportActionSelection