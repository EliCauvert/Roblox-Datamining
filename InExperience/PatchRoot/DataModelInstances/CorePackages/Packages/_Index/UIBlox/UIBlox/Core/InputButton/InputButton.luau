local Parent = script.Parent.Parent.Parent.Parent
local RoactModule = require(Parent.Roact)
local TModule = require(Parent.t)
local CryoModule = require(Parent.Cryo)
local RoactGamepadModule = require(Parent.RoactGamepad)
local FoundationModule = require(Parent.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local WithStyleModule = require(Parent.UIBlox.Core.Style.withStyle)
local ImageSetComponentModule = require(Parent.UIBlox.Core.ImageSet.ImageSetComponent)
local ControllableModule = require(Parent.UIBlox.Core.Control.Controllable)
local ControlStateModule = require(Parent.UIBlox.Core.Control.Enum.ControlState)
local FitTextLabel = require(Parent.FitFrame).FitTextLabel
local FitFrameHorizontal = require(Parent.FitFrame).FitFrameHorizontal
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local InputButton = RoactModule.PureComponent:extend("InputButton")
InputButton.validateProps = TModule.strictInterface({
	text = TModule.string,
	size = TModule.optional(TModule.UDim2),
	image = TModule.table,
	imageColor = TModule.Color3,
	fillImage = TModule.optional(TModule.table),
	fillImageSize = TModule.optional(TModule.UDim2),
	fillImageColor = TModule.optional(TModule.Color3),
	selectedColor = TModule.Color3,
	textColor = TModule.Color3,
	transparency = TModule.number,
	onActivated = TModule.callback,
	isDisabled = TModule.optional(TModule.boolean),
	layoutOrder = TModule.optional(TModule.number),
	frameRef = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	SelectionImageObject = TModule.optional(TModule.table),
	isRoactGamepadEnabled = TModule.optional(TModule.boolean)
})
InputButton.defaultProps = {
	layoutOrder = 0,
	isDisabled = false,
	isRoactGamepadEnabled = true
}

function InputButton.init(p1)
	-- upvalues: ControlStateModule (copy), RoactModule (copy)
	p1.state = {
		outerTransparency = 1,
		innerTransparency = 1,
		outerImage = p1.props.image,
		outerImageColor = p1.props.imageColor,
		innerImage = p1.props.image,
		innerImageColor = p1.props.fillImageColor
	}
	
	function p1.changeSprite(Default)
		-- upvalues: ControlStateModule (upval), p1 (copy)
		if Default == ControlStateModule.Hover then
			if not p1.props.isDisabled then
				p1:setState({ outerImageColor = p1.props.selectedColor })
				
				return
			end
		elseif Default == ControlStateModule.Default then
			p1:setState({ outerImageColor = p1.props.imageColor })
		end
	end
	
	if not p1.props.size then
		p1.sizeBinding, p1.updateSizeBinding = RoactModule.createBinding(UDim2.new(1, 0, 0, 26))
		
		function p1.textAbsoluteSizeChanged(Frame: Frame)
			-- upvalues: p1 (copy)
			local YOffset = 26
			
			if YOffset < Frame.AbsoluteSize.Y then
				YOffset = Frame.AbsoluteSize.Y
			end
			p1.updateSizeBinding(UDim2.new(1, 0, 0, YOffset))
		end
	end
end

function InputButton.render(p1)
	-- upvalues: WithStyleModule (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), CryoModule (copy), RoactModule (copy), FitFrameHorizontal (copy), FitTextLabel (copy), RoactGamepadModule (copy), ControllableModule (copy), ImageSetComponentModule (copy)
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), FoundationFontFaceMigration (upval), NormalizeFontFaceFunction (upval), CryoModule (upval), RoactModule (upval), FitFrameHorizontal (upval), FitTextLabel (upval), RoactGamepadModule (upval), ControllableModule (upval), ImageSetComponentModule (upval)
		local _Font = p2.Font
		local BodyFont = _Font.Body.Font
		local config = {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			TextWrapped = true,
			Text = p1.props.text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextSize = _Font.Body.RelativeSize * _Font.BaseSize,
			Font = if FoundationFontFaceMigration then nil else BodyFont,
			FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyFont) else nil,
			TextColor3 = p1.props.textColor,
			TextTransparency = p1.props.transparency
		}
		local v1 = "Frame"
		local Flag = false
		local Component = nil
		local JoinResult = nil
		
		if p1.props.size then
			Component = "TextButton"
			JoinResult = CryoModule.Dictionary.join(config, {
				Size = UDim2.new(1, -34, 0, 26),
				AutomaticSize = Enum.AutomaticSize.Y,
				[RoactModule.Event.Activated] = if p1.props.isDisabled then nil else p1.props.onActivated or nil
			})
		else
			Flag = true
			v1 = FitFrameHorizontal
			Component = FitTextLabel
			JoinResult = CryoModule.Dictionary.join(config, {
				Font = if FoundationFontFaceMigration then NormalizeFontFaceFunction(BodyFont) else nil,
				FontFace = if FoundationFontFaceMigration then CryoModule.None else nil,
				width = FitTextLabel.Width.FitToText,
				onActivated = p1.props.onActivated,
				[RoactModule.Change.AbsoluteSize] = p1.textAbsoluteSizeChanged
			})
		end
		local FillImage = p1.props.fillImage
		
		return RoactModule.createElement(if p1.props.isRoactGamepadEnabled then RoactGamepadModule.Focusable[v1] else v1, {
			Size = if Flag then nil else p1.props.size or (p1.sizeBinding or nil),
			height = Flag and UDim.new(0, 26) or nil,
			AutomaticSize = Enum.AutomaticSize.Y,
			BackgroundTransparency = 1,
			LayoutOrder = p1.props.layoutOrder,
			[RoactModule.Ref] = p1.props.frameRef,
			SelectionImageObject = p1.props.SelectionImageObject,
			FillDirection = Flag and Enum.FillDirection.Horizontal or nil,
			VerticalAlignment = Flag and Enum.VerticalAlignment.Center or nil,
			contentPadding = Flag and UDim.new(0, 8) or nil,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			inputBindings = if p1.props.isRoactGamepadEnabled then {
				Activated = RoactGamepadModule.Input.onBegin(Enum.KeyCode.ButtonA, p1.props.onActivated)
			} else nil
		}, {
			HorizontalLayout = if Flag then nil else RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				Padding = UDim.new(0, 8),
				VerticalAlignment = Enum.VerticalAlignment.Center
			}) or nil,
			Padding = if Flag then nil else RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 8) }) or nil,
			InputButtonImage = RoactModule.createElement(ControllableModule, {
				controlComponent = {
					component = ImageSetComponentModule.Button,
					props = {
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 26, 0, 26),
						Image = p1.props.image,
						ImageTransparency = p1.props.transparency,
						ScaleType = p1.props.buttonSliceType,
						SliceCenter = p1.props.buttonSliceCenter,
						ImageColor3 = p1.state.outerImageColor,
						[RoactModule.Event.Activated] = p1.props.onActivated,
						LayoutOrder = 1
					},
					children = {
						InputFillImage = FillImage and RoactModule.createElement(ImageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Size = p1.props.fillImageSize,
							Image = FillImage,
							ImageTransparency = p1.props.transparency,
							ImageColor3 = p1.props.fillImageColor,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					}
				},
				isDisabled = p1.props.isDisabled,
				onStateChanged = function(_, p3)
					-- upvalues: p1 (upval)
					p1.changeSprite(p3)
				end
			}),
			InputButtonText = p1.props.text ~= "" and RoactModule.createElement(ControllableModule, {
				controlComponent = { component = Component, props = JoinResult },
				isDisabled = p1.props.isDisabled,
				onStateChanged = function(_, p3)
					-- upvalues: p1 (upval)
					p1.changeSprite(p3)
				end
			})
		})
	end)
end

return RoactModule.forwardRef(function(p1, FrameRef)
	-- upvalues: RoactModule (copy), InputButton (copy), CryoModule (copy)
	return RoactModule.createElement(InputButton, CryoModule.Dictionary.join(p1, { frameRef = FrameRef }))
end)