local parent = script.Parent
local parent_1 = parent.Parent.Parent
local parent_2 = parent_1.Parent
local parent_3 = parent_2.Parent
local roactModule = require(parent_3.Roact)
local tModule = require(parent_3.t)
local otterModule = require(parent_3.Otter)
local withStyleModule = require(parent_2.Core.Style.withStyle)
local imagesModule = require(parent_1.ImageSet.Images)
local label = require(parent_2.Core.ImageSet.ImageSetComponent).Label
local genericTextLabelModule = require(parent_2.Core.Text.GenericTextLabel.GenericTextLabel)
local getTextSizeModule = require(parent_2.Core.Text.GetTextSize)
local getTextHeightModule = require(parent_2.Core.Text.GetTextHeight)
local divideTransparencyModule = require(parent_2.Utility.divideTransparency)
local lerpModule = require(parent_2.Utility.lerp)
local tooltipOrientationModule = require(parent.Enum.TooltipOrientation)
local getPositionInfoModule = require(parent.getPositionInfo)
local t = {
	[tooltipOrientationModule.Bottom] = imagesModule["component_assets/triangleUp_16"],
	[tooltipOrientationModule.Top] = imagesModule["component_assets/triangleDown_16"],
	[tooltipOrientationModule.Right] = imagesModule["component_assets/triangleLeft_16"],
	[tooltipOrientationModule.Left] = imagesModule["component_assets/triangleRight_16"]
}
local t_1 = { frequency = 50, dampingRatio = 1 }
local tooltipContainer = roactModule.PureComponent:extend("TooltipContainer")
tooltipContainer.validateProps = tModule.strictInterface({
	triggerPosition = tModule.Vector2,
	triggerSize = tModule.Vector2,
	bodyText = tModule.string,
	headerText = tModule.optional(tModule.string),
	screenSize = tModule.optional(tModule.Vector2),
	position = tModule.optional(tModule.UDim2),
	orientation = tModule.optional(tooltipOrientationModule.isEnumValue),
	isDirectChild = tModule.optional(tModule.boolean)
})
tooltipContainer.defaultProps = {
	isDirectChild = false,
	screenSize = Vector2.new(10000, 10000),
	orientation = tooltipOrientationModule.Bottom
}

function tooltipContainer.init(p0)
	-- upvalues: roactModule (ref), otterModule (ref), t_1 (ref)
	p0.visible = true
	local _ = nil
	local var15, var16 = roactModule.createBinding(0)
	p0.progress = var15
	p0.progressMotor = otterModule.createSingleMotor(0)
	p0.progressMotor:onStep(var16)
	p0.progressMotor:setGoal(otterModule.spring(1, t_1))
end

function tooltipContainer.render(p1)
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), getTextHeightModule (ref), getPositionInfoModule (ref), lerpModule (ref), divideTransparencyModule (ref), roactModule (ref), label (ref), t (ref), genericTextLabelModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: getTextSizeModule (copy), p1 (ref), getTextHeightModule (copy), getPositionInfoModule (copy), lerpModule (copy), divideTransparencyModule (copy), roactModule (copy), label (copy), t (copy), genericTextLabelModule (copy)
		local font = p2.Font
		local theme = p2.Theme
		local captionHeader = font.CaptionHeader
		local captionBody = font.CaptionBody
		local var17 = font.BaseSize * font.CaptionBody.RelativeSize
		local x = getTextSizeModule(p1.props.bodyText, var17, captionBody.Font, Vector2.new()).X
		
		if p1.props.headerText then
			x = math.max(x, getTextSizeModule(p1.props.headerText, font.BaseSize * captionHeader.RelativeSize, captionHeader.Font, Vector2.new()).X)
		end
		local minValue = math.min(x, 216)
		local var19 = minValue + 24
		local var20 = getTextHeightModule(p1.props.bodyText, captionBody.Font, var17, minValue)
		local headerText = p1.props.headerText and getTextHeightModule(p1.props.headerText, captionHeader.Font, var17, minValue) or 0
		local var22 = if p1.props.headerText then headerText + var20 + 24 + 4 else var20 + 24
		local var23 = getPositionInfoModule(var19, var22, p1.props.orientation, p1.props.triggerPosition, p1.props.triggerSize, p1.props.screenSize, p1.props.position)
		local var24 = p1.progress:map(function(p3)
			-- upvalues: p1 (copy), var23 (ref)
			local var27 = if p1.props.position then p1.props.position elseif p1.props.isDirectChild then var23.position else var23.absolutePosition
			
			return var27:lerp(var27 + var23.animatedDistance, p3)
		end)
		local var25 = p1.progress:map(function(p4)
			-- upvalues: theme (ref), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.BackgroundMuted.Transparency, 1), p4)
		end)
		local var26 = p1.progress:map(function(p5)
			-- upvalues: theme (ref), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.TextEmphasis.Transparency, 2), p5)
		end)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Visible = p1.visible,
			Position = var24,
			Size = var23.fillDirection == Enum.FillDirection.Vertical and UDim2.fromOffset(var19, var22 + 8) or UDim2.fromOffset(var19 + 8, var22)
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = var23.fillDirection
			}),
			CaretFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var23.caretFrameSize,
				LayoutOrder = var23.caretLayoutOrder
			}, {
				Caret = roactModule.createElement(label, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = var23.caretPosition,
					AnchorPoint = var23.caretAnchorPoint,
					Size = var23.caretImageSize,
					Image = t[var23.updatedOrientation],
					ImageColor3 = theme.BackgroundMuted.Color,
					ImageTransparency = var25,
					[roactModule.Ref] = p1.caretRef
				})
			}),
			Content = roactModule.createElement("TextButton", {
				AutoButtonColor = false,
				Text = "",
				Selectable = false,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(var19, var22),
				BackgroundColor3 = theme.BackgroundMuted.Color,
				BackgroundTransparency = var25,
				LayoutOrder = var23.contentLayoutOrder
			}, {
				VerticalLayout = roactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 4),
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Padding = roactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				Header = p1.props.headerText and roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 1,
					colorStyle = theme.TextEmphasis,
					fontStyle = captionHeader,
					Text = p1.props.headerText,
					TextTransparency = var26,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, headerText)
				}),
				Body = roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 2,
					colorStyle = theme.TextDefault,
					fontStyle = captionBody,
					Text = p1.props.bodyText,
					TextTransparency = var26,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, var20)
				})
			})
		})
	end)
end

function tooltipContainer.didMount(p6)
	p6.progressMotor:start()
end

function tooltipContainer.didUpdate(p7, p8, _)
	if p8.triggerPosition ~= p7.props.triggerPosition then
		if p7.props.triggerPosition.Y < 0 or p7.props.screenSize.Y < p7.props.triggerPosition.Y + p7.props.triggerSize.Y then
			p7.visible = false
			
			return
		end
		p7.visible = true
	end
end

function tooltipContainer.willUnmount(p9)
	p9.progressMotor:destroy()
	p9.progressMotor = nil
end

return tooltipContainer