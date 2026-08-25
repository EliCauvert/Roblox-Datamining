local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local textButton = require(corePackagesService.Packages.UIBlox).App.Button.TextButton
local checkboxRowModule = require(script.Parent.CheckboxRow)
local reportActionSelection = roactModule.PureComponent:extend("ReportActionSelection")

local var5 = function() end

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
	onMuteCheckboxActivated = var5,
	onBlockCheckboxActivated = var5,
	onDoneActivated = var5
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

function reportActionSelection.init(p0)
	function p0.onMuteCheckboxActivated(p1)
		-- upvalues: p0 (ref)
		p0:setState({ isVoiceMuted = p1 })
		p0.props.onMuteCheckboxActivated(p1)
	end
	
	function p0.onBlockCheckboxActivated(p2)
		-- upvalues: p0 (ref)
		p0:setState({ isBlocked = p2 })
		p0.props.onBlockCheckboxActivated(p2)
	end
	
	function p0.onDoneActivated()
		-- upvalues: p0 (ref)
		p0.props.onDoneActivated(p0.state.isBlocked, p0.state.isVoiceMuted)
	end
	
	p0:setState({
		isVoiceMuted = p0.props.isVoiceMuted,
		isBlocked = p0.props.isBlocked
	})
end

function reportActionSelection.render(p3)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roactModule (ref), checkboxRowModule (ref), textButton (ref)
	return withFoundationOrUIBloxStyle(function(p4)
		return {
			Theme = {
				Divider = {
					Color = p4.Color.Stroke.Emphasis.Color3,
					Transparency = p4.Color.Stroke.Emphasis.Transparency
				},
				SystemPrimaryContent = {
					Color = p4.Color.ActionSubEmphasis.Foreground.Color3,
					Transparency = p4.Color.ActionSubEmphasis.Foreground.Transparency
				},
				TextDefault = {
					Color = p4.Color.Content.Default.Color3,
					Transparency = p4.Color.Content.Default.Transparency
				},
				TextEmphasis = {
					Color = p4.Color.Content.Emphasis.Color3,
					Transparency = p4.Color.Content.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				CaptionHeader = {
					Font = p4.Typography.CaptionLarge.Font,
					RelativeSize = p4.Typography.CaptionLarge.FontSize
				},
				Header1 = {
					Font = p4.Typography.HeadingSmall.Font,
					RelativeSize = p4.Typography.HeadingSmall.FontSize
				}
			}
		}
	end, function(p5)
		-- upvalues: roactModule (copy), p3 (ref), checkboxRowModule (copy), textButton (copy)
		local baseSize = p5.Font.BaseSize
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5),
			ZIndex = p3.props.ZIndex
		}, {
			uiScale = roactModule.createElement("UIScale", { Scale = p3.props.uiScale }),
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
				Text = p3.props.titleText,
				TextColor3 = p5.Theme.TextEmphasis.Color,
				TextTransparency = p5.Theme.TextEmphasis.Transparency,
				TextSize = p5.Font.Header1.RelativeSize * baseSize,
				Font = p5.Font.Header1.Font,
				AutomaticSize = Enum.AutomaticSize.XY
			}),
			subtitle = roactModule.createElement("TextLabel", {
				TextWrapped = true,
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.fromOffset(612, 0),
				Text = p3.props.subtitleText,
				TextColor3 = p5.Theme.TextEmphasis.Color,
				TextTransparency = p5.Theme.TextEmphasis.Transparency,
				TextSize = p5.Font.CaptionHeader.RelativeSize * baseSize,
				Font = p5.Font.CaptionHeader.Font,
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
					Text = p3.props.instructionText,
					TextColor3 = p5.Theme.TextDefault.Color,
					TextTransparency = p5.Theme.TextDefault.Transparency,
					TextSize = p5.Font.CaptionHeader.RelativeSize * baseSize,
					Font = p5.Font.CaptionHeader.Font,
					TextXAlignment = Enum.TextXAlignment.Left,
					AutomaticSize = Enum.AutomaticSize.Y
				}),
				muteCheckbox = p3.props.showVoiceMuting and roactModule.createElement(checkboxRowModule, {
					height = 28,
					image = "icons/controls/microphone",
					LayoutOrder = 2,
					descriptionText = p3.props.muteText,
					actionDisabled = p3.state.isBlocked,
					checkboxSelected = p3.state.isBlocked or p3.state.isVoiceMuted,
					onCheckboxActivated = p3.onMuteCheckboxActivated
				}),
				div = p3.props.showVoiceMuting and roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 3,
					Size = UDim2.new(1, 0, 0, 1),
					BackgroundColor3 = p5.Theme.Divider.Color,
					BackgroundTransparency = p5.Theme.Divider.Transparency
				}),
				blockCheckbox = roactModule.createElement(checkboxRowModule, {
					height = 28,
					image = "icons/actions/block",
					LayoutOrder = 4,
					descriptionText = p3.props.blockText,
					checkboxSelected = p3.state.isBlocked,
					onCheckboxActivated = p3.onBlockCheckboxActivated
				}),
				doneContainer = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 5,
					BackgroundColor3 = p5.Theme.SystemPrimaryContent.Color,
					BackgroundTransparency = p5.Theme.SystemPrimaryContent.Transparency,
					Size = UDim2.new(1, 0, 0, 44)
				}, {
					uiCorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					doneButton = roactModule.createElement(textButton, {
						size = UDim2.fromScale(1, 1),
						text = p3.props.doneText,
						onActivated = p3.onDoneActivated
					})
				})
			})
		})
	end)
end

return reportActionSelection