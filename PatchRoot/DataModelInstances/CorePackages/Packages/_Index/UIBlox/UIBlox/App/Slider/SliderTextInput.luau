-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:58 2026 Pacific Standard Time.

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

function sliderTextInput.init(p0) --[[ line: 37 ]]
	-- upvalues: roactModule (ref)
	p0.textBoxRef = roactModule.createRef()
end

function sliderTextInput.render(p1) --[[ line: 41 ]]
	-- upvalues: withStyleModule (ref), divideTransparencyModule (ref), roactModule (ref), imageSetComponentModule (ref), imagesModule (ref), eventConnection (ref), userInputService (ref)
	return withStyleModule(function(p2) --[[ line: 42 ]]
		-- upvalues: p1 (ref), divideTransparencyModule (copy), roactModule (copy), imageSetComponentModule (copy), imagesModule (copy), eventConnection (copy), userInputService (copy)
		local var8 = if p1.props.disabled then 2 else 1
		
		return roactModule.createElement(imageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = imagesModule["component_assets/circle_16"],
			ImageColor3 = p2.Theme.BackgroundUIContrast.Color,
			ImageTransparency = divideTransparencyModule(p2.Theme.BackgroundUIContrast.Transparency, var8),
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
				ImageTransparency = divideTransparencyModule(p2.Theme.Divider.Transparency, var8),
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
				TextTransparency = divideTransparencyModule(p2.Theme.TextDefault.Transparency, var8),
				Size = UDim2.fromScale(1, 1),
				Text = tostring(p1.props.value),
				TextScaled = true,
				TextEditable = not p1.props.disabled,
				ZIndex = 2,
				[roactModule.Event.Focused] = if p1.props.disabled then function(p3) --[[ line: 86 ]]
					p3:ReleaseFocus()
				end else nil,
				[roactModule.Event.FocusLost] = function(p4, _) --[[ line: 89 ]]
					-- upvalues: p1 (copy)
					local var9 = tonumber(p4.Text)
					
					if var9 == nil then
						p4.Text = tostring(p1.props.value)
						
						return
					end
					p1.props.onValueChanged(math.clamp(math.floor(var9 / p1.props.stepInterval + 0.5) * p1.props.stepInterval, p1.props.min, p1.props.max))
				end
			}, {
				TextSizeConstraint = roactModule.createElement("UITextSizeConstraint", {
					MinTextSize = p2.Font.Body.RelativeMinSize * p2.Font.BaseSize,
					MaxTextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
				})
			}),
			UserInputConnection = not p1.props.disabled and roactModule.createElement(eventConnection, {
				event = userInputService.InputBegan,
				callback = function(p5, _) --[[ line: 113 ]]
					-- upvalues: userInputService (copy), p1 (copy)
					if p5.UserInputType ~= Enum.UserInputType.Keyboard then return end
					if userInputService:GetFocusedTextBox() ~= p1.textBoxRef.current then return end
					local var10 = 0
					
					if p5.KeyCode == Enum.KeyCode.Up then
						var10 = 1
					elseif p5.KeyCode == Enum.KeyCode.Down then
						var10 = -1
					end
					if userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or userInputService:IsKeyDown(Enum.KeyCode.RightShift) then
						var10 *= 10
					end
					if var10 ~= 0 then
						local clampedValue = math.clamp(math.floor((p1.props.value + p1.props.stepInterval * var10) / p1.props.stepInterval + 0.5) * p1.props.stepInterval, p1.props.min, p1.props.max)
						
						if clampedValue ~= p1.props.value then
							p1.props.onValueChanged(clampedValue)
						end
					end
				end
			})
		})
	end)
end

function sliderTextInput.didMount(p6) --[[ line: 154 ]]
	pcall(function() --[[ line: 157 ]]
		-- upvalues: p6 (ref)
		p6.textBoxRef.current.TextInputType = Enum.TextInputType.Number
	end)
end

return sliderTextInput