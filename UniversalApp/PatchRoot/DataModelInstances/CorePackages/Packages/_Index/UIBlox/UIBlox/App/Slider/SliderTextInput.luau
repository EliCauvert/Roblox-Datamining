local userInputService = game:GetService("UserInputService")
local parent = script.Parent.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local eventConnection = require(parent.ReactUtils).EventConnection
local imageSetComponentModule = require(parent.UIBlox.Core.ImageSet.ImageSetComponent)
local imagesModule = require(parent.UIBlox.App.ImageSet.Images)
local withStyleModule = require(parent.UIBlox.Core.Style.withStyle)
local divideTransparencyModule = require(parent.UIBlox.Utility.divideTransparency)
local sliderTextInput = roactModule.PureComponent:extend("SliderTextInput")
sliderTextInput.validateProps = tModule.strictInterface({
	position = tModule.optional(tModule.union(tModule.UDim2, tModule.table)),
	anchorPoint = tModule.optional(tModule.Vector2),
	value = tModule.number,
	min = tModule.number,
	max = tModule.number,
	disabled = tModule.optional(tModule.boolean),
	stepInterval = tModule.numberPositive,
	onValueChanged = tModule.callback,
	layoutOrder = tModule.optional(tModule.integer)
})
sliderTextInput.defaultProps = { disabled = false }

function sliderTextInput.init(p1)
	-- upvalues: roactModule (ref)
	p1.textBoxRef = roactModule.createRef()
end

function sliderTextInput.render(p1)
	-- upvalues: withStyleModule (ref), divideTransparencyModule (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), eventConnection (ref), userInputService (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), divideTransparencyModule (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), eventConnection (copy), userInputService (copy)
		local var1 = if p1.props.disabled then 2 else 1
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = imagesModule["component_assets/circle_16"],
			ImageColor3 = p2.Theme.BackgroundUIContrast.Color,
			ImageTransparency = divideTransparencyModule(p2.Theme.BackgroundUIContrast.Transparency, var1),
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.fromOffset(56, 36),
			SliceCenter = Rect.new(8, 8, 8, 8),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Border = roactModule.createElement(imageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = imagesModule["component_assets/circle_17_stroke_1"],
				ImageColor3 = p2.Theme.Divider.Color,
				ImageTransparency = divideTransparencyModule(p2.Theme.Divider.Transparency, var1),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.fromScale(1, 1),
				SliceCenter = Rect.new(8, 8, 8, 8)
			}),
			TextBox = roactModule.createElement("TextBox", {
				[roactModule.Ref] = p1.textBoxRef,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = p2.Font.Body.Font,
				TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = divideTransparencyModule(p2.Theme.TextDefault.Transparency, var1),
				Size = UDim2.fromScale(1, 1),
				Text = tostring(p1.props.value),
				TextScaled = true,
				TextEditable = not p1.props.disabled,
				ZIndex = 2,
				[roactModule.Event.Focused] = if p1.props.disabled then function(p3)
					p3:ReleaseFocus()
				end else nil,
				[roactModule.Event.FocusLost] = function(p3, _)
					-- upvalues: p1 (copy)
					local var2 = tonumber(p3.Text)
					
					if var2 == nil then
						p3.Text = tostring(p1.props.value)
						
						return
					end
					p1.props.onValueChanged(math.clamp(math.floor(var2 / p1.props.stepInterval + 0.5) * p1.props.stepInterval, p1.props.min, p1.props.max))
				end
			}, {
				TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", {
					MinTextSize = p2.Font.Body.RelativeMinSize * p2.Font.BaseSize,
					MaxTextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
				})
			}),
			UserInputConnection = not p1.props.disabled and roactModule.createElement(eventConnection, {
				event = userInputService.InputBegan,
				callback = function(p3, _)
					-- upvalues: userInputService (copy), p1 (copy)
					if p3.UserInputType ~= Enum.UserInputType.Keyboard then return end
					if userInputService:GetFocusedTextBox() ~= p1.textBoxRef.current then return end
					local var2 = 0
					
					if p3.KeyCode == Enum.KeyCode.Up then
						var2 = 1
					elseif p3.KeyCode == Enum.KeyCode.Down then
						var2 = -1
					end
					if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
						var2 *= 10
					end
					if var2 ~= 0 then
						local clampedValue = math.clamp(math.floor((p1.props.value + p1.props.stepInterval * var2) / p1.props.stepInterval + 0.5) * p1.props.stepInterval, p1.props.min, p1.props.max)
						
						if clampedValue ~= p1.props.value then
							p1.props.onValueChanged(clampedValue)
						end
					end
				end
			})
		})
	end)
end

function sliderTextInput.didMount(p1)
	pcall(function()
		-- upvalues: p1 (ref)
		p1.textBoxRef.current.TextInputType = Enum.TextInputType.Number
	end)
end

return sliderTextInput