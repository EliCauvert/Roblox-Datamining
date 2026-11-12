local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local TModule = require(CorePackages.Packages.t)
local FoundationModule = require(CorePackages.Packages.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local TextButton = require(CorePackages.Packages.UIBlox).App.Button.TextButton
local CheckboxRowModule = require(script.Parent.CheckboxRow)
local ReportActionSelection = RoactModule.PureComponent:extend("ReportActionSelection")

local function OnBlockCheckboxActivated() end

ReportActionSelection.defaultProps = {
	titleText = "Thanks for your report!",
	subtitleText = "We've received your report and will take action soon if needed. Your feedback helps keep our community safe.",
	instructionText = "Other steps you can take:",
	muteText = "Mute {DISPLAYNAME}(@username)",
	blockText = "Block {DISPLAYNAME}(@username)",
	doneText = "Done",
	showVoiceMuting = true,
	isVoiceMuted = false,
	isBlocked = false,
	ZIndex = 1,
	uiScale = 1.3,
	onMuteCheckboxActivated = OnBlockCheckboxActivated,
	onBlockCheckboxActivated = OnBlockCheckboxActivated,
	onDoneActivated = OnBlockCheckboxActivated
}
ReportActionSelection.validateProps = TModule.interface({
	titleText = TModule.string,
	subtitleText = TModule.string,
	instructionText = TModule.string,
	muteText = TModule.string,
	blockText = TModule.string,
	doneText = TModule.string,
	showVoiceMuting = TModule.boolean,
	isVoiceMuted = TModule.optional(TModule.boolean),
	isBlocked = TModule.optional(TModule.boolean),
	onMuteCheckboxActivated = TModule.optional(TModule.callback),
	onBlockCheckboxActivated = TModule.optional(TModule.callback),
	onDoneActivated = TModule.callback,
	ZIndex = TModule.number
})

function ReportActionSelection.init(DefaultProps)
	function DefaultProps.onMuteCheckboxActivated(IsVoiceMuted)
		-- upvalues: DefaultProps (copy)
		DefaultProps:setState({ isVoiceMuted = IsVoiceMuted })
		DefaultProps.props.onMuteCheckboxActivated(IsVoiceMuted)
	end
	
	function DefaultProps.onBlockCheckboxActivated(IsBlocked)
		-- upvalues: DefaultProps (copy)
		DefaultProps:setState({ isBlocked = IsBlocked })
		DefaultProps.props.onBlockCheckboxActivated(IsBlocked)
	end
	
	function DefaultProps.onDoneActivated()
		-- upvalues: DefaultProps (copy)
		DefaultProps.props.onDoneActivated(DefaultProps.state.isBlocked, DefaultProps.state.isVoiceMuted)
	end
	
	DefaultProps:setState({
		isVoiceMuted = DefaultProps.props.isVoiceMuted,
		isBlocked = DefaultProps.props.isBlocked
	})
end

function ReportActionSelection.render(DefaultProps)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), FoundationFontFaceMigration (copy), RoactModule (copy), NormalizeFontFaceFunction (copy), CheckboxRowModule (copy), TextButton (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p1)
		-- upvalues: FoundationFontFaceMigration (upval)
		return {
			Tokens = if FoundationFontFaceMigration then p1 else nil,
			Theme = {
				Divider = {
					Color = p1.Color.Stroke.Emphasis.Color3,
					Transparency = p1.Color.Stroke.Emphasis.Transparency
				},
				SystemPrimaryContent = {
					Color = p1.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p1.Color.ActionSubEmphasis.Foreground.Transparency
				},
				TextDefault = {
					Color = p1.Color.Content.Default.Color3,
					Transparency = p1.Color.Content.Default.Transparency
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
		-- upvalues: RoactModule (upval), DefaultProps (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), CheckboxRowModule (upval), TextButton (upval)
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
				Text = DefaultProps.props.titleText,
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
				Text = DefaultProps.props.subtitleText,
				TextColor3 = p1.Theme.TextEmphasis.Color,
				TextTransparency = p1.Theme.TextEmphasis.Transparency,
				TextSize = p1.Font.CaptionHeader.RelativeSize * BaseSize,
				Font = if FoundationFontFaceMigration then nil else p1.Font.CaptionHeader.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.CaptionLarge.Font) else nil,
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			actions = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(584, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				layout = RoactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 18),
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				instruction = RoactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					Text = DefaultProps.props.instructionText,
					TextColor3 = p1.Theme.TextDefault.Color,
					TextTransparency = p1.Theme.TextDefault.Transparency,
					TextSize = p1.Font.CaptionHeader.RelativeSize * BaseSize,
					Font = if FoundationFontFaceMigration then nil else p1.Font.CaptionHeader.Font,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p1.Tokens.Typography.CaptionLarge.Font) else nil,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				muteCheckbox = DefaultProps.props.showVoiceMuting and RoactModule.createElement(CheckboxRowModule, {
					height = 28,
					image = "icons/controls/microphone",
					LayoutOrder = 2,
					descriptionText = DefaultProps.props.muteText,
					actionDisabled = DefaultProps.state.isBlocked,
					checkboxSelected = DefaultProps.state.isBlocked or DefaultProps.state.isVoiceMuted,
					onCheckboxActivated = DefaultProps.onMuteCheckboxActivated
				}),
				div = DefaultProps.props.showVoiceMuting and RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = p1.Theme.Divider.Color,
					BackgroundTransparency = p1.Theme.Divider.Transparency
				}),
				blockCheckbox = RoactModule.createElement(CheckboxRowModule, {
					height = 28,
					image = "icons/actions/block",
					LayoutOrder = 4,
					descriptionText = DefaultProps.props.blockText,
					checkboxSelected = DefaultProps.state.isBlocked,
					onCheckboxActivated = DefaultProps.onBlockCheckboxActivated
				}),
				doneContainer = RoactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 5,
					BackgroundColor3 = p1.Theme.SystemPrimaryContent.Color,
					BackgroundTransparency = p1.Theme.SystemPrimaryContent.Transparency,
					Size = UDim2.new(1, 0, 0, 44)
				}, {
					uiCorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					doneButton = RoactModule.createElement(TextButton, {
						size = UDim2.fromScale(1, 1),
						text = DefaultProps.props.doneText,
						onActivated = DefaultProps.onDoneActivated
					})
				})
			})
		})
	end)
end

return ReportActionSelection