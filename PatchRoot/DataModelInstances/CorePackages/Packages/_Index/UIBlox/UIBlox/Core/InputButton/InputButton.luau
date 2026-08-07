-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:03 2026 Pacific Standard Time.

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

function inputButton.init(p0) --[[ line: 53 ]]
	-- upvalues: controlStateModule (ref), roactModule (ref)
	p0.state = {
		outerTransparency = 1,
		innerTransparency = 1,
		outerImage = p0.props.image,
		outerImageColor = p0.props.imageColor,
		innerImage = p0.props.image,
		innerImageColor = p0.props.fillImageColor
	}
	
	function p0.changeSprite(p1) --[[ line: 63 ]]
		-- upvalues: controlStateModule (copy), p0 (ref)
		if p1 == controlStateModule.Hover then
			if p0.props.isDisabled then
				return
			else
				p0:setState({ outerImageColor = p0.props.selectedColor })
				
				return
			end
		elseif p1 == controlStateModule.Default then
			p0:setState({ outerImageColor = p0.props.imageColor })
		end
	end
	
	if not p0.props.size then
		local var9, var10 = roactModule.createBinding(UDim2.new(1, 0, 0, 26))
		p0.sizeBinding = var9
		p0.updateSizeBinding = var10
		
		function p0.textAbsoluteSizeChanged(p2) --[[ line: 81 ]]
			-- upvalues: p0 (ref)
			local var11 = 26
			
			if var11 < p2.AbsoluteSize.Y then
				var11 = p2.AbsoluteSize.Y
			end
			p0.updateSizeBinding(UDim2.new(1, 0, 0, var11))
		end
	end
end

function inputButton.render(p3) --[[ line: 91 ]]
	-- upvalues: withStyleModule (ref), cryoModule (ref), roactModule (ref), fitFrameHorizontal (ref), fitTextLabel (ref), roactGamepadModule (ref), controllableModule (ref), imageSetComponentModule (ref)
	return withStyleModule(function(p4) --[[ line: 92 ]]
		-- upvalues: p3 (ref), cryoModule (copy), roactModule (copy), fitFrameHorizontal (copy), fitTextLabel (copy), roactGamepadModule (copy), controllableModule (copy), imageSetComponentModule (copy)
		local var15
		local font = p4.Font
		local _ = nil
		local t = {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = p3.props.text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = font.Body.RelativeSize * font.BaseSize,
			Font = font.Body.Font,
			TextColor3 = p3.props.textColor,
			TextTransparency = p3.props.transparency
		}
		local var13 = "Frame"
		local var14 = false
		
		if p3.props.size then
			var15 = "TextButton"
			t = cryoModule.Dictionary.join(t, {
				Size = UDim2.new(1, -34, 0, 26),
				AutomaticSize = Enum.AutomaticSize.Y,
				[roactModule.Event.Activated] = if not p3.props.isDisabled then p3.props.onActivated else nil
			})
		else
			var14 = true
			var13 = fitFrameHorizontal
			var15 = fitTextLabel
			t = cryoModule.Dictionary.join(t, {
				width = fitTextLabel.Width.FitToText,
				onActivated = p3.props.onActivated,
				[roactModule.Change.AbsoluteSize] = p3.textAbsoluteSizeChanged
			})
		end
		local size
		local fillImage = p3.props.fillImage
		local createElement = roactModule.createElement
		local var16 = if p3.props.isRoactGamepadEnabled then roactGamepadModule.Focusable[var13] else var13
		local t_1 = {}
		
		if not var14 then
			size = p3.props.size or (p3.sizeBinding or nil)
		end
		t_1.Size = size
		t_1.height = var14 and UDim.new(0, 26) or nil
		t_1.AutomaticSize = Enum.AutomaticSize.Y
		t_1.BackgroundTransparency = 1
		t_1.LayoutOrder = p3.props.layoutOrder
		t_1[roactModule.Ref] = p3.props.frameRef
		t_1.SelectionImageObject = p3.props.SelectionImageObject
		t_1.FillDirection = if var14 then Enum.FillDirection.Horizontal else nil
		t_1.VerticalAlignment = if var14 then Enum.VerticalAlignment.Center else nil
		t_1.contentPadding = var14 and UDim.new(0, 8) or nil
		t_1.NextSelectionLeft = p3.props.NextSelectionLeft
		t_1.NextSelectionRight = p3.props.NextSelectionRight
		t_1.NextSelectionUp = p3.props.NextSelectionUp
		t_1.NextSelectionDown = p3.props.NextSelectionDown
		t_1.inputBindings = if p3.props.isRoactGamepadEnabled then {
			Activated = roactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p3.props.onActivated)
		} else nil
		
		return createElement(var16, t_1, {
			HorizontalLayout = not var14 and roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) or nil,
			Padding = not var14 and roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }) or nil,
			InputButtonImage = roactModule.createElement(controllableModule, {
				controlComponent = {
					component = imageSetComponentModule.Button,
					props = {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 26, 0, 26),
						Image = p3.props.image,
						ImageTransparency = p3.props.transparency,
						ScaleType = p3.props.buttonSliceType,
						SliceCenter = p3.props.buttonSliceCenter,
						ImageColor3 = p3.state.outerImageColor,
						[roactModule.Event.Activated] = p3.props.onActivated,
						LayoutOrder = 1
					},
					children = {
						InputFillImage = fillImage and roactModule.createElement(imageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Size = p3.props.fillImageSize,
							Image = fillImage,
							ImageTransparency = p3.props.transparency,
							ImageColor3 = p3.props.fillImageColor,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					}
				},
				isDisabled = p3.props.isDisabled,
				onStateChanged = function(_, p5) --[[ line: 196 ]]
					-- upvalues: p3 (copy)
					p3.changeSprite(p5)
				end
			}),
			InputButtonText = p3.props.text ~= "" and roactModule.createElement(controllableModule, {
				controlComponent = { component = var15, props = t },
				isDisabled = p3.props.isDisabled,
				onStateChanged = function(_, p6) --[[ line: 207 ]]
					-- upvalues: p3 (copy)
					p3.changeSprite(p6)
				end
			})
		})
	end)
end

return roactModule.forwardRef(function(p7, p8) --[[ line: 216 ]]
	-- upvalues: roactModule (ref), inputButton (ref), cryoModule (ref)
	return roactModule.createElement(inputButton, cryoModule.Dictionary.join(p7, { frameRef = p8 }))
end)