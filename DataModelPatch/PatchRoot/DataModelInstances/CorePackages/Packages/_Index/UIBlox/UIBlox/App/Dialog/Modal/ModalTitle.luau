local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local Parent2 = Parent1.Parent
local RoactModule = require(Parent2.Roact)
local TModule = require(Parent2.t)
local CryoModule = require(Parent2.Cryo)
local ImagesModule = require(Parent.ImageSet.Images)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local ControllableModule = require(Core.Control.Controllable)
local GenericTextLabelModule = require(Core.Text.GenericTextLabel.GenericTextLabel)
local WithStyleModule = require(Parent1.Core.Style.withStyle)
local CloseButtonIconModule = require(script.Parent.Enum.CloseButtonIcon)
local ModalTitle = RoactModule.PureComponent:extend("ModalTitle")
ModalTitle.validateProps = TModule.strictInterface({
	title = TModule.string,
	position = TModule.optional(TModule.UDim2),
	anchor = TModule.optional(TModule.Vector2),
	closeButtonIcon = TModule.optional(CloseButtonIconModule.isEnumValue),
	onCloseClicked = TModule.optional(TModule.callback),
	titleBackgroundImageProps = TModule.optional(TModule.strictInterface({
		image = TModule.string,
		imageHeight = TModule.number,
		text = TModule.optional(TModule.string)
	})),
	onTitleSizeChanged = TModule.optional(TModule.callback)
})
ModalTitle.defaultProps = {
	title = "",
	position = UDim2.new(0.5, 0, 0, 0),
	anchor = Vector2.new(0.5, 0),
	closeButtonIcon = CloseButtonIconModule.Close
}

function ModalTitle:GetHeight(): number
	return 48
end

local function _(Back)
	-- upvalues: CloseButtonIconModule (copy)
	return if Back == CloseButtonIconModule.Close then "icons/navigation/close" elseif Back == CloseButtonIconModule.Back then "icons/actions/cycleLeft" else nil
end

local function renderBackgroundImage(TitleBackgroundImageProps, p1, JoinResult)
	-- upvalues: CryoModule (copy), RoactModule (copy), GenericTextLabelModule (copy), ImageSetComponentModule (copy)
	local Text = TitleBackgroundImageProps.text
	local v1: boolean = Text and #Text > 0
	local v2: boolean = Text and #Text > 0
	local ClampedValue = math.clamp(TitleBackgroundImageProps.imageHeight, 48, 261)
	
	if v1 then
		ClampedValue += 8
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			UICorner = RoactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		})
	end
	if Text and #Text > 0 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			BackgroundText = RoactModule.createElement(GenericTextLabelModule, {
				RichText = true,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, -56),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 48),
				fontStyle = p1.Font.Body,
				colorStyle = p1.Theme.TextEmphasis,
				Text = Text,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	end
	if v2 then
		JoinResult = CryoModule.Dictionary.join(JoinResult, {
			BackgroundTextShadow = RoactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, if v1 then -8 else 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, {
				UIGradient = RoactModule.createElement("UIGradient", {
					Rotation = 90,
					Color = ColorSequence.new(Color3.new(0, 0, 0)),
					Transparency = NumberSequence.new({
						NumberSequenceKeypoint.new(0, 1),
						NumberSequenceKeypoint.new(0.6, 0.25),
						NumberSequenceKeypoint.new(1, 1)
					})
				})
			})
		})
	end
	local Element = RoactModule.createElement(ImageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(1, 0, 0, ClampedValue),
		Position = UDim2.new(0, 0, 0, 0),
		ScaleType = Enum.ScaleType.Crop,
		Image = TitleBackgroundImageProps.image,
		ImageColor3 = Color3.fromRGB(255, 255, 255)
	}, JoinResult)
	
	if v1 then
		Element = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 0, ClampedValue - 8),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}, { TitleBackground = Element })
	end
	return Element
end

function ModalTitle.render(p1)
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ControllableModule (copy), ImageSetComponentModule (copy), ImagesModule (copy), CloseButtonIconModule (copy), GenericTextLabelModule (copy), renderBackgroundImage (copy)
	local TitleBackgroundImageProps = p1.props.titleBackgroundImageProps
	
	return WithStyleModule(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), ControllableModule (upval), ImageSetComponentModule (upval), ImagesModule (upval), CloseButtonIconModule (upval), GenericTextLabelModule (upval), TitleBackgroundImageProps (copy), renderBackgroundImage (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local ScaledBaseSize = _Font.BaseSize * _Font.Header1.RelativeSize
		local CreateElementFunction = RoactModule.createElement
		local v1 = "Frame"
		local config = {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 48),
			BackgroundTransparency = 1,
			[RoactModule.Change.AbsoluteSize] = p1.props.onTitleSizeChanged
		}
		local t = {}
		local Element = nil
		
		if p1.props.onCloseClicked then
			local CloseButtonIcon = p1.props.closeButtonIcon
			Element = RoactModule.createElement(ControllableModule, {
				controlComponent = {
					component = ImageSetComponentModule.Button,
					props = {
						BackgroundTransparency = 1,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0, 32, 0.5, 0),
						Size = UDim2.new(0, 48, 0, 48),
						[RoactModule.Event.Activated] = p1.props.onCloseClicked
					},
					children = {
						InputFillImage = RoactModule.createElement(ImageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Size = UDim2.new(0, 36, 0, 36),
							Image = ImagesModule[if CloseButtonIcon == CloseButtonIconModule.Close then "icons/navigation/close" elseif CloseButtonIcon == CloseButtonIconModule.Back then "icons/actions/cycleLeft" else nil],
							ImageColor3 = Theme.IconEmphasis.Color,
							ImageTransparency = Theme.IconEmphasis.Transparency,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					}
				},
				onStateChanged = function(...) end
			}) or nil
		else
			Element = nil
		end
		t.CloseButton = Element
		t.Title = RoactModule.createElement(GenericTextLabelModule, {
			LayoutOrder = 1,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -104, 1, 0),
			colorStyle = Theme.TextEmphasis,
			fontStyle = _Font.Header1,
			Text = p1.props.title,
			TextSize = ScaledBaseSize,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8)
			})
		})
		t.Underline = not TitleBackgroundImageProps and RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 1, 0),
			BackgroundColor3 = Theme.Divider.Color,
			BackgroundTransparency = Theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		})
		local Element1 = CreateElementFunction(v1, config, t)
		
		return if TitleBackgroundImageProps then renderBackgroundImage(TitleBackgroundImageProps, p2, { TitleText = Element1 }) else Element1
	end)
end

return ModalTitle