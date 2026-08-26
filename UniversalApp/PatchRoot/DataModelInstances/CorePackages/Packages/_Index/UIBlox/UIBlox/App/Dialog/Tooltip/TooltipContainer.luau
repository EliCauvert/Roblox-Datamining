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

function tooltipContainer.init(p1)
	-- upvalues: roactModule (ref), otterModule (ref), t_1 (ref)
	p1.visible = true
	local _ = nil
	local var1, var2 = roactModule.createBinding(0)
	p1.progress = var1
	p1.progressMotor = otterModule.createSingleMotor(0)
	p1.progressMotor:onStep(var2)
	p1.progressMotor:setGoal(otterModule.spring(1, t_1))
end

function tooltipContainer.render(p1)
	-- upvalues: withStyleModule (ref), getTextSizeModule (ref), getTextHeightModule (ref), getPositionInfoModule (ref), lerpModule (ref), divideTransparencyModule (ref), roactModule (ref), label (ref), t (ref), genericTextLabelModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: getTextSizeModule (copy), p1 (ref), getTextHeightModule (copy), getPositionInfoModule (copy), lerpModule (copy), divideTransparencyModule (copy), roactModule (copy), label (copy), t (copy), genericTextLabelModule (copy)
		local font = p2.Font
		local theme = p2.Theme
		local captionHeader = font.CaptionHeader
		local captionBody = font.CaptionBody
		local var1 = font.BaseSize * font.CaptionBody.RelativeSize
		local x = getTextSizeModule(p1.props.bodyText, var1, captionBody.Font, Vector2.new()).X
		
		if p1.props.headerText then
			x = math.max(x, getTextSizeModule(p1.props.headerText, font.BaseSize * captionHeader.RelativeSize, captionHeader.Font, Vector2.new()).X)
		end
		local minValue = math.min(x, 216)
		local var2 = minValue + 24
		local var3 = getTextHeightModule(p1.props.bodyText, captionBody.Font, var1, minValue)
		local headerText = p1.props.headerText and getTextHeightModule(p1.props.headerText, captionHeader.Font, var1, minValue) or 0
		local var4 = if p1.props.headerText then headerText + var3 + 24 + 4 else var3 + 24
		local var5 = getPositionInfoModule(var2, var4, p1.props.orientation, p1.props.triggerPosition, p1.props.triggerSize, p1.props.screenSize, p1.props.position)
		local var6 = p1.progress:map(function(p3)
			-- upvalues: p1 (copy), var5 (ref)
			local var7 = if p1.props.position then p1.props.position elseif p1.props.isDirectChild then var5.position else var5.absolutePosition
			
			return var7:lerp(var7 + var5.animatedDistance, p3)
		end)
		local var7 = p1.progress:map(function(p3)
			-- upvalues: theme (ref), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.BackgroundMuted.Transparency, 1), p3)
		end)
		local var8 = p1.progress:map(function(p3)
			-- upvalues: theme (ref), lerpModule (copy), divideTransparencyModule (copy)
			return lerpModule(1, divideTransparencyModule(theme.TextEmphasis.Transparency, 2), p3)
		end)
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Visible = p1.visible,
			Position = var6,
			Size = var5.fillDirection == Enum.FillDirection.Vertical and UDim2.fromOffset(var2, var4 + 8) or UDim2.fromOffset(var2 + 8, var4)
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = var5.fillDirection
			}),
			CaretFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = var5.caretFrameSize,
				LayoutOrder = var5.caretLayoutOrder
			}, {
				Caret = roactModule.createElement(label, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = var5.caretPosition,
					AnchorPoint = var5.caretAnchorPoint,
					Size = var5.caretImageSize,
					Image = t[var5.updatedOrientation],
					ImageColor3 = theme.BackgroundMuted.Color,
					ImageTransparency = var7,
					[roactModule.Ref] = p1.caretRef
				})
			}),
			Content = roactModule.createElement("TextButton", {
				AutoButtonColor = false,
				Text = "",
				Selectable = false,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(var2, var4),
				BackgroundColor3 = theme.BackgroundMuted.Color,
				BackgroundTransparency = var7,
				LayoutOrder = var5.contentLayoutOrder
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
					TextTransparency = var8,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, headerText)
				}),
				Body = roactModule.createElement(genericTextLabelModule, {
					LayoutOrder = 2,
					colorStyle = theme.TextDefault,
					fontStyle = captionBody,
					Text = p1.props.bodyText,
					TextTransparency = var8,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, var3)
				})
			})
		})
	end)
end

function tooltipContainer.didMount(p1)
	p1.progressMotor:start()
end

function tooltipContainer.didUpdate(p1, p2, _)
	if p2.triggerPosition ~= p1.props.triggerPosition then
		if p1.props.triggerPosition.Y < 0 or p1.props.screenSize.Y < p1.props.triggerPosition.Y + p1.props.triggerSize.Y then
			p1.visible = false
			
			return
		end
		p1.visible = true
	end
end

function tooltipContainer.willUnmount(p1)
	p1.progressMotor:destroy()
	p1.progressMotor = nil
end

return tooltipContainer