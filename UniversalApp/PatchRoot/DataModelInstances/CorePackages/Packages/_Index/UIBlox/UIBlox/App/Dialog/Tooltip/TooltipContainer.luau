local Parent = script.Parent
local Parent1 = Parent.Parent.Parent
local Parent2 = Parent1.Parent
local Parent3 = Parent2.Parent
local RoactModule = require(Parent3.Roact)
local TModule = require(Parent3.t)
local OtterModule = require(Parent3.Otter)
local WithStyleModule = require(Parent2.Core.Style.withStyle)
local ImagesModule = require(Parent1.ImageSet.Images)
local Label = require(Parent2.Core.ImageSet.ImageSetComponent).Label
local GenericTextLabelModule = require(Parent2.Core.Text.GenericTextLabel.GenericTextLabel)
local GetTextSizeModule = require(Parent2.Core.Text.GetTextSize)
local GetTextHeightModule = require(Parent2.Core.Text.GetTextHeight)
local DivideTransparencyModule = require(Parent2.Utility.divideTransparency)
local LerpModule = require(Parent2.Utility.lerp)
local TooltipOrientationModule = require(Parent.Enum.TooltipOrientation)
local GetPositionInfoModule = require(Parent.getPositionInfo)
local config = {
	[TooltipOrientationModule.Bottom] = ImagesModule["component_assets/triangleUp_16"],
	[TooltipOrientationModule.Top] = ImagesModule["component_assets/triangleDown_16"],
	[TooltipOrientationModule.Right] = ImagesModule["component_assets/triangleLeft_16"],
	[TooltipOrientationModule.Left] = ImagesModule["component_assets/triangleRight_16"]
}
local config1 = { frequency = 50, dampingRatio = 1 }
local TooltipContainer = RoactModule.PureComponent:extend("TooltipContainer")
TooltipContainer.validateProps = TModule.strictInterface({
	triggerPosition = TModule.Vector2,
	triggerSize = TModule.Vector2,
	bodyText = TModule.string,
	headerText = TModule.optional(TModule.string),
	screenSize = TModule.optional(TModule.Vector2),
	position = TModule.optional(TModule.UDim2),
	orientation = TModule.optional(TooltipOrientationModule.isEnumValue),
	isDirectChild = TModule.optional(TModule.boolean)
})
TooltipContainer.defaultProps = {
	isDirectChild = false,
	screenSize = Vector2.new(10000, 10000),
	orientation = TooltipOrientationModule.Bottom
}

function TooltipContainer.init(p1) --[[ Line: 61 ]]
	-- upvalues: RoactModule (copy), OtterModule (copy), config1 (copy)
	p1.visible = true
	local Binding2
	p1.progress, Binding2 = RoactModule.createBinding(0)
	p1.progressMotor = OtterModule.createSingleMotor(0)
	p1.progressMotor:onStep(Binding2)
	p1.progressMotor:setGoal(OtterModule.spring(1, config1))
end

function TooltipContainer.render(p1) --[[ Line: 72 ]]
	-- upvalues: WithStyleModule (copy), GetTextSizeModule (copy), GetTextHeightModule (copy), GetPositionInfoModule (copy), LerpModule (copy), DivideTransparencyModule (copy), RoactModule (copy), Label (copy), config (copy), GenericTextLabelModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 73 ]]
		-- upvalues: GetTextSizeModule (upval), p1 (copy), GetTextHeightModule (upval), GetPositionInfoModule (upval), LerpModule (upval), DivideTransparencyModule (upval), RoactModule (upval), Label (upval), config (upval), GenericTextLabelModule (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local CaptionHeader = _Font.CaptionHeader
		local CaptionBody = _Font.CaptionBody
		local ScaledBaseSize = _Font.BaseSize * _Font.CaptionBody.RelativeSize
		local X = GetTextSizeModule(p1.props.bodyText, ScaledBaseSize, CaptionBody.Font, Vector2.new()).X
		
		if p1.props.headerText then
			X = math.max(X, GetTextSizeModule(p1.props.headerText, _Font.BaseSize * CaptionHeader.RelativeSize, CaptionHeader.Font, Vector2.new()).X)
		end
		local Smallest = math.min(X, 216)
		local XOffset = Smallest + 24
		local TextHeightModule: number = GetTextHeightModule(p1.props.bodyText, CaptionBody.Font, ScaledBaseSize, Smallest)
		local TextHeightModule1 = p1.props.headerText and GetTextHeightModule(p1.props.headerText, CaptionHeader.Font, ScaledBaseSize, Smallest) or 0
		local YOffset: number = p1.props.headerText and TextHeightModule1 + TextHeightModule + 24 + 4 or TextHeightModule + 24
		local PositionInfoModule = GetPositionInfoModule(XOffset, YOffset, p1.props.orientation, p1.props.triggerPosition, p1.props.triggerSize, p1.props.screenSize, p1.props.position)
		local MapResult = p1.progress:map(function(p3) --[[ Line: 124 ]]
			-- upvalues: Theme (copy), LerpModule (upval), DivideTransparencyModule (upval)
			return LerpModule(1, DivideTransparencyModule(Theme.BackgroundMuted.Transparency, 1), p3)
		end)
		local MapResult1 = p1.progress:map(function(p3) --[[ Line: 130 ]]
			-- upvalues: Theme (copy), LerpModule (upval), DivideTransparencyModule (upval)
			return LerpModule(1, DivideTransparencyModule(Theme.TextEmphasis.Transparency, 2), p3)
		end)
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Visible = p1.visible,
			Position = p1.progress:map(function(p3) --[[ Line: 113 ]]
				-- upvalues: p1 (upval), PositionInfoModule (copy)
				local Position = if p1.props.position then p1.props.position else p1.props.isDirectChild and PositionInfoModule.position or PositionInfoModule.absolutePosition
				
				return Position:lerp(Position + PositionInfoModule.animatedDistance, p3)
			end),
			Size = PositionInfoModule.fillDirection == Enum.FillDirection.Vertical and UDim2.fromOffset(XOffset, YOffset + 8) or UDim2.fromOffset(XOffset + 8, YOffset)
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = PositionInfoModule.fillDirection
			}),
			CaretFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				Size = PositionInfoModule.caretFrameSize,
				LayoutOrder = PositionInfoModule.caretLayoutOrder
			}, {
				Caret = RoactModule.createElement(Label, {
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					Position = PositionInfoModule.caretPosition,
					AnchorPoint = PositionInfoModule.caretAnchorPoint,
					Size = PositionInfoModule.caretImageSize,
					Image = config[PositionInfoModule.updatedOrientation],
					ImageColor3 = Theme.BackgroundMuted.Color,
					ImageTransparency = MapResult,
					[RoactModule.Ref] = p1.caretRef
				})
			}),
			Content = RoactModule.createElement("TextButton", {
				AutoButtonColor = false,
				Text = "",
				Selectable = false,
				BorderSizePixel = 0,
				Size = UDim2.fromOffset(XOffset, YOffset),
				BackgroundColor3 = Theme.BackgroundMuted.Color,
				BackgroundTransparency = MapResult,
				LayoutOrder = PositionInfoModule.contentLayoutOrder
			}, {
				VerticalLayout = RoactModule.createElement("UIListLayout", {
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					Padding = UDim.new(0, 4),
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				Padding = RoactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, 12),
					PaddingBottom = UDim.new(0, 12),
					PaddingLeft = UDim.new(0, 12),
					PaddingRight = UDim.new(0, 12)
				}),
				Header = p1.props.headerText and RoactModule.createElement(GenericTextLabelModule, {
					LayoutOrder = 1,
					colorStyle = Theme.TextEmphasis,
					fontStyle = CaptionHeader,
					Text = p1.props.headerText,
					TextTransparency = MapResult1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, TextHeightModule1)
				}),
				Body = RoactModule.createElement(GenericTextLabelModule, {
					LayoutOrder = 2,
					colorStyle = Theme.TextDefault,
					fontStyle = CaptionBody,
					Text = p1.props.bodyText,
					TextTransparency = MapResult1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Size = UDim2.new(1, 0, 0, TextHeightModule)
				})
			})
		})
	end)
end

function TooltipContainer.didMount(p1) --[[ Line: 212 ]]
	p1.progressMotor:start()
end

function TooltipContainer.didUpdate(p1, p2, _) --[[ Line: 216 ]]
	if p2.triggerPosition ~= p1.props.triggerPosition then
		if p1.props.triggerPosition.Y < 0 or p1.props.screenSize.Y < p1.props.triggerPosition.Y + p1.props.triggerSize.Y then
			p1.visible = false
			
			return
		end
		p1.visible = true
	end
end

function TooltipContainer.willUnmount(p1) --[[ Line: 229 ]]
	p1.progressMotor:destroy()
	p1.progressMotor = nil
end

return TooltipContainer