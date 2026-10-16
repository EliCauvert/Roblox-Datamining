local UserInputService = game:GetService("UserInputService")
local Parent = script.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local EventConnection = require(Parent.ReactUtils).EventConnection
local ImageSetComponentModule = require(Parent.UIBlox.Core.ImageSet.ImageSetComponent)
local ImagesModule = require(Parent.UIBlox.App.ImageSet.Images)
local WithStyleModule = require(Parent.UIBlox.Core.Style.withStyle)
local DivideTransparencyModule = require(Parent.UIBlox.Utility.divideTransparency)
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local SliderTextInput = RoactModule.PureComponent:extend("SliderTextInput")
SliderTextInput.validateProps = TModule.strictInterface({
	position = TModule.optional(TModule.union(TModule.UDim2, TModule.table)),
	anchorPoint = TModule.optional(TModule.Vector2),
	value = TModule.number,
	min = TModule.number,
	max = TModule.number,
	disabled = TModule.optional(TModule.boolean),
	stepInterval = TModule.numberPositive,
	onValueChanged = TModule.callback,
	layoutOrder = TModule.optional(TModule.integer)
})
SliderTextInput.defaultProps = { disabled = false }

function SliderTextInput.init(p1) --[[ Line: 41 ]]
	-- upvalues: RoactModule (copy)
	p1.textBoxRef = RoactModule.createRef()
end

function SliderTextInput.render(p1) --[[ Line: 45 ]]
	-- upvalues: WithStyleModule (copy), DivideTransparencyModule (copy), RoactModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), EventConnection (copy), UserInputService (copy)
	return WithStyleModule(function(p2) --[[ Line: 46 ]]
		-- upvalues: p1 (copy), DivideTransparencyModule (upval), RoactModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), EventConnection (upval), UserInputService (upval)
		local v1: number = if p1.props.disabled then 2 else 1
		
		return RoactModule.createElement(ImageSetComponentModule.Label, {
			BackgroundTransparency = 1,
			Image = ImagesModule["component_assets/circle_16"],
			ImageColor3 = p2.Theme.BackgroundUIContrast.Color,
			ImageTransparency = DivideTransparencyModule(p2.Theme.BackgroundUIContrast.Transparency, v1),
			Position = p1.props.position,
			AnchorPoint = p1.props.anchorPoint,
			ScaleType = Enum.ScaleType.Slice,
			Size = UDim2.fromOffset(56, 36),
			SliceCenter = Rect.new(8, 8, 8, 8),
			LayoutOrder = p1.props.layoutOrder
		}, {
			Border = RoactModule.createElement(ImageSetComponentModule.Label, {
				BackgroundTransparency = 1,
				Image = ImagesModule["component_assets/circle_17_stroke_1"],
				ImageColor3 = p2.Theme.Divider.Color,
				ImageTransparency = DivideTransparencyModule(p2.Theme.Divider.Transparency, v1),
				ScaleType = Enum.ScaleType.Slice,
				Size = UDim2.fromScale(1, 1),
				SliceCenter = Rect.new(8, 8, 8, 8)
			}),
			TextBox = RoactModule.createElement("TextBox", {
				[RoactModule.Ref] = p1.textBoxRef,
				BackgroundTransparency = 1,
				ClearTextOnFocus = false,
				Font = if FoundationFontFaceMigration then nil else p2.Font.Body.Font,
				FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(p2.Font.Body.Font) else nil,
				TextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize,
				TextColor3 = p2.Theme.TextDefault.Color,
				TextTransparency = DivideTransparencyModule(p2.Theme.TextDefault.Transparency, v1),
				Size = UDim2.fromScale(1, 1),
				Text = tostring(p1.props.value),
				TextScaled = true,
				TextEditable = not p1.props.disabled,
				ZIndex = 2,
				[RoactModule.Event.Focused] = p1.props.disabled and function(TextBox) --[[ Line: 91 ]]
					TextBox:ReleaseFocus()
				end or nil,
				[RoactModule.Event.FocusLost] = function(p3, _) --[[ Line: 94 ]]
					-- upvalues: p1 (upval)
					local Number: number? = tonumber(p3.Text)
					
					if Number == nil then
						p3.Text = tostring(p1.props.value)
						
						return
					else
						p1.props.onValueChanged((math.clamp(math.floor(Number / p1.props.stepInterval + 0.5) * p1.props.stepInterval, p1.props.min, p1.props.max)))
					end
				end
			}, {
				TextSizeConstraint = RoactModule.createElement("UITextSizeConstraint", {
					MinTextSize = p2.Font.Body.RelativeMinSize * p2.Font.BaseSize,
					MaxTextSize = p2.Font.Body.RelativeSize * p2.Font.BaseSize
				})
			}),
			UserInputConnection = not p1.props.disabled and RoactModule.createElement(EventConnection, {
				event = UserInputService.InputBegan,
				callback = function(Input, _) --[[ Line: 118 ]]
					-- upvalues: UserInputService (upval), p1 (upval)
					if Input.UserInputType ~= Enum.UserInputType.Keyboard then return end
					if UserInputService:GetFocusedTextBox() ~= p1.textBoxRef.current then return end
					local v2 = 0
					
					if Input.KeyCode == Enum.KeyCode.Up then
						v2 = 1
					elseif Input.KeyCode == Enum.KeyCode.Down then
						v2 = -1
					end
					if UserInputService:IsKeyDown(Enum.KeyCode.LeftShift) or UserInputService:IsKeyDown(Enum.KeyCode.RightShift) then
						v2 *= 10
					end
					if v2 ~= 0 then
						local ClampedValue = math.clamp(math.floor((p1.props.value + p1.props.stepInterval * v2) / p1.props.stepInterval + 0.5) * p1.props.stepInterval, p1.props.min, p1.props.max)
						
						if ClampedValue ~= p1.props.value then
							p1.props.onValueChanged(ClampedValue)
						end
					end
				end
			})
		})
	end)
end

function SliderTextInput.didMount(p1) --[[ Line: 159 ]]
	pcall(function() --[[ Line: 162 ]]
		-- upvalues: p1 (copy)
		p1.textBoxRef.current.TextInputType = Enum.TextInputType.Number
	end)
end

return SliderTextInput