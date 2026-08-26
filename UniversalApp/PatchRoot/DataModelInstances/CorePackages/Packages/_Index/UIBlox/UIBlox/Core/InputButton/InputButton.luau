local parent = script.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local cryoModule = require(parent.Cryo)
local roactGamepadModule = require(parent.RoactGamepad)
local withStyleModule = require(parent.UIBlox.Core.Style.withStyle)
local imageSetComponentModule = require(parent.UIBlox.Core.ImageSet.ImageSetComponent)
local controllableModule = require(parent.UIBlox.Core.Control.Controllable)
local controlStateModule = require(parent.UIBlox.Core.Control.Enum.ControlState)
local fitTextLabel = require(parent.FitFrame).FitTextLabel
local fitFrameHorizontal = require(parent.FitFrame).FitFrameHorizontal
local inputButton = roactModule.PureComponent:extend("InputButton")
inputButton.validateProps = tModule.strictInterface({
	text = tModule.string,
	size = tModule.optional(tModule.UDim2),
	image = tModule.table,
	imageColor = tModule.Color3,
	fillImage = tModule.optional(tModule.table),
	fillImageSize = tModule.optional(tModule.UDim2),
	fillImageColor = tModule.optional(tModule.Color3),
	selectedColor = tModule.Color3,
	textColor = tModule.Color3,
	transparency = tModule.number,
	onActivated = tModule.callback,
	isDisabled = tModule.optional(tModule.boolean),
	layoutOrder = tModule.optional(tModule.number),
	frameRef = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	SelectionImageObject = tModule.optional(tModule.table),
	isRoactGamepadEnabled = tModule.optional(tModule.boolean)
})
inputButton.defaultProps = {
	layoutOrder = 0,
	isDisabled = false,
	isRoactGamepadEnabled = true
}

function inputButton.init(p1)
	-- upvalues: controlStateModule (ref), roactModule (ref)
	p1.state = {
		outerTransparency = 1,
		innerTransparency = 1,
		outerImage = p1.props.image,
		outerImageColor = p1.props.imageColor,
		innerImage = p1.props.image,
		innerImageColor = p1.props.fillImageColor
	}
	
	function p0.changeSprite(p2)
		-- upvalues: controlStateModule (copy), p1 (ref)
		if p2 == controlStateModule.Hover then
			if p1.props.isDisabled then
				return
			else
				p1:setState({ outerImageColor = p1.props.selectedColor })
				
				return
			end
		elseif p2 == controlStateModule.Default then
			p1:setState({ outerImageColor = p1.props.imageColor })
		end
	end
	
	if not p1.props.size then
		local var1, var2 = roactModule.createBinding(UDim2.new(1, 0, 0, 26))
		p1.sizeBinding = var1
		p1.updateSizeBinding = var2
		
		function p0.textAbsoluteSizeChanged(p2)
			-- upvalues: p1 (ref)
			local var3 = 26
			
			if var3 < p2.AbsoluteSize.Y then
				var3 = p2.AbsoluteSize.Y
			end
			p1.updateSizeBinding(UDim2.new(1, 0, 0, var3))
		end
	end
end

function inputButton.render(p1)
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref), fitFrameHorizontal (ref), fitTextLabel (ref), roactGamepadModule (ref), controllableModule (ref), imageSetComponentModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), cryoModule (copy), roactModule (copy), fitFrameHorizontal (copy), fitTextLabel (copy), roactGamepadModule (copy), controllableModule (copy), imageSetComponentModule (copy)
		local var1
		local font = p2.Font
		local _ = nil
		local t = {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = p1.props.text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = font.Body.RelativeSize * font.BaseSize,
			Font = font.Body.Font,
			TextColor3 = p1.props.textColor,
			TextTransparency = p1.props.transparency
		}
		local var2 = "Frame"
		local var3 = false
		
		if p1.props.size then
			var1 = "TextButton"
			t = cryoModule.Dictionary.join(t, {
				Size = UDim2.new(1, -34, 0, 26),
				AutomaticSize = Enum.AutomaticSize.Y,
				[roactModule.Event.Activated] = if not p1.props.isDisabled then p1.props.onActivated else nil
			})
		else
			var3 = true
			var2 = fitFrameHorizontal
			var1 = fitTextLabel
			t = cryoModule.Dictionary.join(t, {
				width = fitTextLabel.Width.FitToText,
				onActivated = p1.props.onActivated,
				[roactModule.Change.AbsoluteSize] = p1.textAbsoluteSizeChanged
			})
		end
		local size
		local fillImage = p1.props.fillImage
		local createElement = roactModule.createElement
		local var4 = if p1.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[var2] else var2
		local t_1 = {}
		
		if not var3 then
			size = p1.props.size or (p1.sizeBinding or nil)
		end
		t_1.Size = size
		t_1.height = var3 and UDim.new(0, 26) or nil
		t_1.AutomaticSize = Enum.AutomaticSize.Y
		t_1.BackgroundTransparency = 1
		t_1.LayoutOrder = p1.props.layoutOrder
		t_1[roactModule.Ref] = p1.props.frameRef
		t_1.SelectionImageObject = p1.props.SelectionImageObject
		t_1.FillDirection = if var3 then Enum.FillDirection.Horizontal else nil
		t_1.VerticalAlignment = if var3 then Enum.VerticalAlignment.Center else nil
		t_1.contentPadding = var3 and UDim.new(0, 8) or nil
		t_1.NextSelectionLeft = p1.props.NextSelectionLeft
		t_1.NextSelectionRight = p1.props.NextSelectionRight
		t_1.NextSelectionUp = p1.props.NextSelectionUp
		t_1.NextSelectionDown = p1.props.NextSelectionDown
		t_1.inputBindings = if p1.props.isRoactGamepadEnabled then {
			Activated = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p1.props.onActivated)
		} else nil
		
		return createElement(var4, t_1, {
			HorizontalLayout = not var3 and roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) or nil,
			Padding = not var3 and roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }) or nil,
			InputButtonImage = roactModule.createElement(controllableModule, {
				controlComponent = {
					component = imageSetComponentModule.Button,
					props = {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 26, 0, 26),
						Image = p1.props.image,
						ImageTransparency = p1.props.transparency,
						ScaleType = p1.props.buttonSliceType,
						SliceCenter = p1.props.buttonSliceCenter,
						ImageColor3 = p1.state.outerImageColor,
						[roactModule.Event.Activated] = p1.props.onActivated,
						LayoutOrder = 1
					},
					children = {
						InputFillImage = fillImage and roactModule.createElement(imageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Size = p1.props.fillImageSize,
							Image = fillImage,
							ImageTransparency = p1.props.transparency,
							ImageColor3 = p1.props.fillImageColor,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					}
				},
				isDisabled = p1.props.isDisabled,
				onStateChanged = function(_, p3)
					-- upvalues: p1 (copy)
					p1.changeSprite(p3)
				end
			}),
			InputButtonText = p1.props.text ~= "" and roactModule.createElement(controllableModule, {
				controlComponent = { component = var1, props = t },
				isDisabled = p1.props.isDisabled,
				onStateChanged = function(_, p3)
					-- upvalues: p1 (copy)
					p1.changeSprite(p3)
				end
			})
		})
	end)
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), inputButton (ref), cryoModule (ref)
	return roactModule.createElement(inputButton, cryoModule.Dictionary.join(p1, { frameRef = p2 }))
end)