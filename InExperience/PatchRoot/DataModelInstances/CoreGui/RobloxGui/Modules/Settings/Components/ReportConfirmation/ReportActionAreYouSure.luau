local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local tModule = require(corePackagesService.Packages.t)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local textButton = UIBloxModule.App.Button.TextButton
local reportActionSelection = roactModule.PureComponent:extend("ReportActionSelection")

local var5 = function() --[[ line: 22 ]] end

reportActionSelection.defaultProps = {
	isMuted = true,
	isBlocked = true,
	ZIndex = 1,
	uiScale = 1.3,
	onCancelActivated = var5,
	onConfirmActivated = var5
}
reportActionSelection.validateProps = tModule.strictInterface({
	mutedTitleText = tModule.string,
	blockedTitleText = tModule.string,
	mutedAndBlockedTitleText = tModule.string,
	mutedSubtitleText = tModule.string,
	blockedSubtitleText = tModule.string,
	mutedAndBlockedSubtitleText = tModule.string,
	cancelText = tModule.string,
	confirmText = tModule.string,
	isMuted = tModule.boolean,
	isBlocked = tModule.boolean,
	onCancelActivated = tModule.callback,
	onConfirmActivated = tModule.callback,
	ZIndex = tModule.optional(tModule.number),
	uiScale = tModule.optional(tModule.number)
})

function reportActionSelection.init(p0) --[[ line: 50 ]]
	function p0.onCancelActivated() --[[ line: 51 ]]
		-- upvalues: p0 (ref)
		p0.props.onCancelActivated()
	end
	
	function p0.onConfirmActivated() --[[ line: 55 ]]
		-- upvalues: p0 (ref)
		p0.props.onConfirmActivated()
	end
	
	local blockedTitleText = nil
	local blockedSubtitleText = nil
	
	if p0.props.isMuted and p0.props.isBlocked then
		blockedTitleText = p0.props.mutedAndBlockedTitleText
		blockedSubtitleText = p0.props.mutedAndBlockedSubtitleText
	elseif p0.props.isMuted then
		blockedTitleText = p0.props.mutedTitleText
		blockedSubtitleText = p0.props.mutedSubtitleText
	elseif p0.props.isBlocked then
		blockedTitleText = p0.props.blockedTitleText
		blockedSubtitleText = p0.props.blockedSubtitleText
	end
	p0:setState({
		titleText = blockedTitleText,
		subtitleText = blockedSubtitleText
	})
end

function reportActionSelection.render(p1) --[[ line: 79 ]]
	-- upvalues: withStyle (ref), roactModule (ref), textButton (ref), UIBloxModule (ref)
	return withStyle(function(p2) --[[ line: 80 ]]
		-- upvalues: roactModule (copy), p1 (ref), textButton (copy), UIBloxModule (copy)
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
				Text = p1.state.titleText,
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
				Text = p1.state.subtitleText,
				TextColor3 = p2.Theme.TextEmphasis.Color,
				TextTransparency = p2.Theme.TextEmphasis.Transparency,
				TextSize = p2.Font.CaptionHeader.RelativeSize * baseSize,
				Font = p2.Font.CaptionHeader.Font,
				AutomaticSize = Enum.AutomaticSize.Y
			}),
			spacer = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				Size = UDim2.fromOffset(0, 62)
			}),
			actions = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.fromOffset(584, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				layout = roactModule.createElement("UIListLayout", {
					VerticalAlignment = Enum.VerticalAlignment.Center,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					Padding = UDim.new(0, 70),
					FillDirection = Enum.FillDirection.Horizontal,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				cancelContainer = roactModule.createElement("Frame", {
					BorderSizePixel = 0,
					LayoutOrder = 1,
					BackgroundColor3 = p2.Theme.SystemPrimaryContent.Color,
					BackgroundTransparency = p2.Theme.SystemPrimaryContent.Transparency,
					Size = UDim2.fromOffset(234, 44)
				}, {
					uiCorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					cancelButton = roactModule.createElement(textButton, {
						size = UDim2.fromScale(1, 1),
						text = p1.props.cancelText,
						onActivated = p1.onCancelActivated
					})
				}),
				confirmContainer = roactModule.createElement("Frame", {
					BackgroundTransparency = 0,
					BorderSizePixel = 0,
					LayoutOrder = 2,
					BackgroundColor3 = UIBloxModule.App.Style.Colors.Blue,
					Size = UDim2.fromOffset(234, 44)
				}, {
					uiCorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 4) }),
					confirmButton = roactModule.createElement(textButton, {
						size = UDim2.fromScale(1, 1),
						text = p1.props.confirmText,
						onActivated = p1.onConfirmActivated
					})
				})
			})
		})
	end)
end

return reportActionSelection