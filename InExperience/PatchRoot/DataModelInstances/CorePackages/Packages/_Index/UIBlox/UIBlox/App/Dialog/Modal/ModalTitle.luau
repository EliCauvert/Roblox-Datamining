local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local roactModule = require(parent_2.Roact)
local tModule = require(parent_2.t)
local cryoModule = require(parent_2.Cryo)
local imagesModule = require(parent.ImageSet.Images)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local controllableModule = require(core.Control.Controllable)
local genericTextLabelModule = require(core.Text.GenericTextLabel.GenericTextLabel)
local withStyleModule = require(parent_1.Core.Style.withStyle)
local closeButtonIconModule = require(script.Parent.Enum.CloseButtonIcon)
local modalTitle = roactModule.PureComponent:extend("ModalTitle")
modalTitle.validateProps = tModule.strictInterface({
	title = tModule.string,
	position = tModule.optional(tModule.UDim2),
	anchor = tModule.optional(tModule.Vector2),
	closeButtonIcon = tModule.optional(closeButtonIconModule.isEnumValue),
	onCloseClicked = tModule.optional(tModule.callback),
	titleBackgroundImageProps = tModule.optional(tModule.strictInterface({
		image = tModule.string,
		imageHeight = tModule.number,
		text = tModule.optional(tModule.string)
	})),
	onTitleSizeChanged = tModule.optional(tModule.callback)
})
modalTitle.defaultProps = {
	title = "",
	position = UDim2.new(0.5, 0, 0, 0),
	anchor = Vector2.new(0.5, 0),
	closeButtonIcon = closeButtonIconModule.Close
}

function modalTitle.GetHeight(_)
	return 48
end

local function _(p0)
	-- upvalues: closeButtonIconModule (ref)
	return if p0 == closeButtonIconModule.Close then "icons/navigation/close" elseif p0 == closeButtonIconModule.Back then "icons/actions/cycleLeft" else nil
end

local function renderBackgroundImage(value, p1, p2)
	-- upvalues: cryoModule (ref), roactModule (ref), genericTextLabelModule (ref), imageSetComponentModule (ref)
	local text = value.text
	local var11 = text and #text > 0
	local var12 = text and #text > 0
	local clampedValue = math.clamp(value.imageHeight, 48, 261)
	
	if var11 then
		clampedValue += 8
		p2 = cryoModule.Dictionary.join(p2, {
			UICorner = roactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		})
	end
	if text and #text > 0 then
		p2 = cryoModule.Dictionary.join(p2, {
			BackgroundText = roactModule.createElement(genericTextLabelModule, {
				RichText = true,
				ZIndex = 2,
				Size = UDim2.new(1, 0, 1, -56),
				AnchorPoint = Vector2.new(0.5, 0),
				Position = UDim2.new(0.5, 0, 0, 48),
				fontStyle = p1.Font.Body,
				colorStyle = p1.Theme.TextEmphasis,
				Text = text,
				TextTruncate = Enum.TextTruncate.AtEnd
			})
		})
	end
	if var12 then
		p2 = cryoModule.Dictionary.join(p2, {
			BackgroundTextShadow = roactModule.createElement("Frame", {
				BackgroundTransparency = 0,
				ZIndex = 1,
				Size = UDim2.new(1, 0, 1, if var11 then -8 else 0),
				Position = UDim2.new(0, 0, 0, 0)
			}, {
				UIGradient = roactModule.createElement("UIGradient", {
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
	local var14 = roactModule.createElement(imageSetComponentModule.Label, {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0, 0),
		Size = UDim2.new(1, 0, 0, clampedValue),
		Position = UDim2.new(0, 0, 0, 0),
		ScaleType = Enum.ScaleType.Crop,
		Image = value.image,
		ImageColor3 = Color3.fromRGB(255, 255, 255)
	}, p2)
	
	if var11 then
		var14 = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(1, 0, 0, clampedValue - 8),
			Position = UDim2.new(0.5, 0, 0.5, 0)
		}, { TitleBackground = var14 })
	end
	return var14
end

function modalTitle.render(p3)
	-- upvalues: withStyleModule (ref), roactModule (ref), controllableModule (ref), imageSetComponentModule (ref), imagesModule (ref), closeButtonIconModule (ref), genericTextLabelModule (ref), renderBackgroundImage (ref)
	local titleBackgroundImageProps = p3.props.titleBackgroundImageProps
	
	return withStyleModule(function(p4)
		-- upvalues: roactModule (copy), p3 (ref), controllableModule (copy), imageSetComponentModule (copy), imagesModule (copy), closeButtonIconModule (copy), genericTextLabelModule (copy), titleBackgroundImageProps (ref), renderBackgroundImage (copy)
		local createElement_1
		local font = p4.Font
		local theme = p4.Theme
		local var15 = font.BaseSize * font.Header1.RelativeSize
		local createElement = roactModule.createElement
		local var16 = "Frame"
		local t = {
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, 0, 0, 48),
			BackgroundTransparency = 1,
			[roactModule.Change.AbsoluteSize] = p3.props.onTitleSizeChanged
		}
		local t_1 = {}
		
		if p3.props.onCloseClicked then
			createElement_1 = roactModule.createElement
			local var19 = controllableModule
			local t_2 = {}
			local t_3 = {
				component = imageSetComponentModule.Button,
				props = {
					BackgroundTransparency = 1,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.new(0, 32, 0.5, 0),
					Size = UDim2.new(0, 48, 0, 48),
					[roactModule.Event.Activated] = p3.props.onCloseClicked
				}
			}
			local t_4 = {}
			local createElement_2 = roactModule.createElement
			local label = imageSetComponentModule.Label
			local t_5 = {
				BackgroundTransparency = 1,
				Size = UDim2.new(0, 36, 0, 36)
			}
			local closeButtonIcon = p3.props.closeButtonIcon
			t_5.Image = imagesModule[if closeButtonIcon == closeButtonIconModule.Close then "icons/navigation/close" elseif closeButtonIcon == closeButtonIconModule.Back then "icons/actions/cycleLeft" else nil]
			t_5.ImageColor3 = theme.IconEmphasis.Color
			t_5.ImageTransparency = theme.IconEmphasis.Transparency
			t_5.AnchorPoint = Vector2.new(0.5, 0.5)
			t_5.Position = UDim2.new(0.5, 0, 0.5, 0)
			t_4.InputFillImage = createElement_2(label, t_5)
			t_3.children = t_4
			t_2.controlComponent = t_3
			
			function t_2.onStateChanged(...) end
			
			createElement_1 = createElement_1(var19, t_2) or nil
		end
		t_1.CloseButton = createElement_1
		t_1.Title = roactModule.createElement(genericTextLabelModule, {
			LayoutOrder = 1,
			TextWrapped = true,
			AnchorPoint = Vector2.new(0.5, 0),
			Position = UDim2.new(0.5, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			Size = UDim2.new(1, -104, 1, 0),
			colorStyle = theme.TextEmphasis,
			fontStyle = font.Header1,
			Text = p3.props.title,
			TextSize = var15,
			TextTruncate = Enum.TextTruncate.AtEnd
		}, {
			Padding = roactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 8),
				PaddingBottom = UDim.new(0, 8)
			})
		})
		t_1.Underline = not titleBackgroundImageProps and roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			LayoutOrder = 2,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 1, 0),
			BackgroundColor3 = theme.Divider.Color,
			BackgroundTransparency = theme.Divider.Transparency,
			Size = UDim2.new(1, 0, 0, 1)
		})
		createElement = createElement(var16, t, t_1)
		
		return if titleBackgroundImageProps then renderBackgroundImage(titleBackgroundImageProps, p4, { TitleText = createElement }) else createElement
	end)
end

return modalTitle