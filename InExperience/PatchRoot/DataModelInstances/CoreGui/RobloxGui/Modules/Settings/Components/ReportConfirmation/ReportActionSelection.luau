local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local textButton = require(corePackagesService.Packages.UIBlox).App.Button.TextButton
local checkboxRowModule = require(script.Parent.CheckboxRow)
local reportActionSelection = roactModule.PureComponent:extend("ReportActionSelection")

local var1 = function() end

reportActionSelection.defaultProps = {
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
	onMuteCheckboxActivated = var1,
	onBlockCheckboxActivated = var1,
	onDoneActivated = var1
}
reportActionSelection.validateProps = tModule.interface({
	titleText = tModule.string,
	subtitleText = tModule.string,
	instructionText = tModule.string,
	muteText = tModule.string,
	blockText = tModule.string,
	doneText = tModule.string,
	showVoiceMuting = tModule.boolean,
	isVoiceMuted = tModule.optional(tModule.boolean),
	isBlocked = tModule.optional(tModule.boolean),
	onMuteCheckboxActivated = tModule.optional(tModule.callback),
	onBlockCheckboxActivated = tModule.optional(tModule.callback),
	onDoneActivated = tModule.callback,
	ZIndex = tModule.number
})

function reportActionSelection.init(p1)
	function p0.onMuteCheckboxActivated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ isVoiceMuted = p2 })
		p1.props.onMuteCheckboxActivated(p2)
	end
	
	function p0.onBlockCheckboxActivated(p2)
		-- upvalues: p1 (ref)
		p1:setState({ isBlocked = p2 })
		p1.props.onBlockCheckboxActivated(p2)
	end
	
	function p0.onDoneActivated()
		-- upvalues: p1 (ref)
		p1.props.onDoneActivated(p1.state.isBlocked, p1.state.isVoiceMuted)
	end
	
	p1:setState({
		isVoiceMuted = p1.props.isVoiceMuted,
		isBlocked = p1.props.isBlocked
	})
end

function reportActionSelection.render(p1)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roactModule (ref), checkboxRowModule (ref), textButton (ref)
	return withFoundationOrUIBloxStyle(function(p2)
		return {
			Theme = {
				Divider = {
					Color = p2.Color.Stroke.Emphasis.Color3,
					Transparency = p2.Color.Stroke.Emphasis.Transparency
				},
				SystemPrimaryContent = {
					Color = p2.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p2.Color.ActionSubEmphasis.Foreground.Transparency
				},
				TextDefault = {
					Color = p2.Color.Content.Default.Color3,
					Transparency = p2.Color.Content.Default.Transparency
				},
				TextEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				CaptionHeader = {
					Font = p2.Typography.CaptionLarge.Font,
					RelativeSize = p2.Typography.CaptionLarge.FontSize
				},
				Header1 = {
					Font = p2.Typography.HeadingSmall.Font,
					RelativeSize = p2.Typography.HeadingSmall.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: roactModule (copy), p1 (ref), checkboxRowModule (copy), textButton (copy)
		local baseSize = p2.Font.BaseSize
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = p1.props.ZIndex
		}, {
			uiScale = roactModule.createElement("UIScale", { Scale = p1.props.uiScale }),
			layout = roactModule.createElement("UIListLayout", {
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 22),
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			title = roactModule.createElement("TextLabel", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Text = p1.props.titleText,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextSize = p2.Font.Header1.RelativeSize * baseSize,
				Font = p2.Font.Header1.Font,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			subtitle = roactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.fromOffset(612, 0),
				Text = p1.props.subtitleText,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextSize = p2.Font.CaptionHeader.RelativeSize * baseSize,
				Font = p2.Font.CaptionHeader.Font,
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			actions = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(584, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				layout = roactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Top,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 18),
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				instruction = roactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.fromScale(1, 0),
					Text = p1.props.instructionText,
					TextColor3 = p2.Theme.TextDefault.Color,
					TextTransparency = p2.Theme.TextDefault.Transparency,
					TextSize = p2.Font.CaptionHeader.RelativeSize * baseSize,
					Font = p2.Font.CaptionHeader.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				muteCheckbox = p1.props.showVoiceMuting and roactModule.createElement(checkboxRowModule, {
					height = 28,
					image = "icons/controls/microphone",
					LayoutOrder = 2,
					descriptionText = p1.props.muteText,
					actionDisabled = p1.state.isBlocked,
					checkboxSelected = p1.state.isBlocked or p1.state.isVoiceMuted,
					onCheckboxActivated = p1.onMuteCheckboxActivated
				}),
				div = p1.props.showVoiceMuting and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = p2.Theme.Divider.Color,
					BackgroundTransparency = p2.Theme.Divider.Transparency
				}),
				blockCheckbox = roactModule.createElement(checkboxRowModule, {
					height = 28,
					image = "icons/actions/block",
					LayoutOrder = 4,
					descriptionText = p1.props.blockText,
					checkboxSelected = p1.state.isBlocked,
					onCheckboxActivated = p1.onBlockCheckboxActivated
				}),
				doneContainer = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 5,
					BackgroundColor3 = p2.Theme.SystemPrimaryContent.Color,
					BackgroundTransparency = p2.Theme.SystemPrimaryContent.Transparency,
					Size = UDim2.new(1, 0, 0, 44)
				}, {
					uiCorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					doneButton = roactModule.createElement(textButton, {
						size = UDim2.fromScale(1, 1),
						text = p1.props.doneText,
						onActivated = p1.onDoneActivated
					})
				})
			})
		})
	end)
end

return reportActionSelection