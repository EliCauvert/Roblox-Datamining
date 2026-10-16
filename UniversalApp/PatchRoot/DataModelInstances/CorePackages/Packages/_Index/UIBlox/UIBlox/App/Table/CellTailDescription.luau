local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local Core = Parent1.Core
local Parent2 = Parent1.Parent
local TModule = require(Parent2.t)
local RoactModule = require(Parent2.Roact)
local ReactModule = require(Parent2.React)
local WithStyleModule = require(Core.Style.withStyle)
local GenericTextLabelModule = require(Parent1.Core.Text.GenericTextLabel.GenericTextLabel)
local ImageSetComponentModule = require(Core.ImageSet.ImageSetComponent)
local IconSizeModule = require(Parent.ImageSet.Enum.IconSize)
local GetIconSizeModule = require(Parent.ImageSet.getIconSize)
local ImagesModule = require(Parent.ImageSet.Images)
local UIBloxConfigModule = require(Parent1.UIBloxConfig)
local CellTailDescription = RoactModule.PureComponent:extend("CellTailDescription")
CellTailDescription.validateProps = TModule.strictInterface({
	text = TModule.optional(TModule.string),
	textColor = TModule.optional((require(Core.Style.Validator.validateColorInfo))),
	textFont = TModule.optional(TModule.union(require(Core.Style.Validator.validateFontInfo), (require(Core.Style.Validator.validateTypographyInfo)))),
	renderTextOverride = TModule.optional(TModule.callback),
	showArrow = TModule.optional(TModule.boolean),
	infoIcon = TModule.optional(TModule.string),
	testId = TModule.optional(TModule.string)
})
CellTailDescription.defaultProps = {
	showArrow = false,
	infoIcon = nil,
	testId = "--uiblox-cell-tail-description"
}

function CellTailDescription.init(p1) --[[ Line: 44 ]]
	-- upvalues: RoactModule (copy), GenericTextLabelModule (copy)
	function p1.getDescription(Text, ColorStyle, FontStyle, LayoutOrder, Callback) --[[ Line: 45 ]]
		-- upvalues: RoactModule (upval), GenericTextLabelModule (upval)
		local Element = nil
		
		if Text then
			if Callback then
				Element = Callback()
			end
			if not Element then
				Element = RoactModule.createElement(GenericTextLabelModule, {
					BackgroundTransparency = 1,
					LayoutOrder = LayoutOrder,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = Text,
					colorStyle = ColorStyle,
					fontStyle = FontStyle
				})
			end
		end
		return Element
	end
end

function CellTailDescription.render(p1) --[[ Line: 69 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy), ReactModule (copy), ImageSetComponentModule (copy), UIBloxConfigModule (copy), GetIconSizeModule (copy), IconSizeModule (copy), ImagesModule (copy)
	local Text = p1.props.text
	local RenderTextOverride = p1.props.renderTextOverride
	local ShowArrow = p1.props.showArrow
	local HasInfoIcon = p1.props.infoIcon ~= nil
	
	return if Text or ShowArrow or HasInfoIcon then WithStyleModule(function(p2) --[[ Line: 79 ]]
		-- upvalues: p1 (copy), RoactModule (upval), ReactModule (upval), Text (copy), RenderTextOverride (copy), ShowArrow (copy), ImageSetComponentModule (upval), UIBloxConfigModule (upval), GetIconSizeModule (upval), IconSizeModule (upval), ImagesModule (upval), HasInfoIcon (copy)
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 8)
			}),
			Description = p1.getDescription(Text, p1.props.textColor or p2.Theme.TextDefault, p1.props.textFont or p2.Font.Body, 1, RenderTextOverride),
			RightArrow = ShowArrow and RoactModule.createElement(ImageSetComponentModule.Label, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = if UIBloxConfigModule.enableScalingForSomeEdpIcons then UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Small, p2), GetIconSizeModule(IconSizeModule.Small, p2)) else UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Small), GetIconSizeModule(IconSizeModule.Small)),
				Image = ImagesModule["icons/navigation/pushRight_small"],
				ImageColor3 = p2.Theme.TextEmphasis.Color,
				ImageTransparency = p2.Theme.TextEmphasis.Transparency
			}) or nil,
			InfoIcon = HasInfoIcon and RoactModule.createElement(ImageSetComponentModule.Label, {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = if UIBloxConfigModule.enableScalingForSomeEdpIcons then UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Small, p2), GetIconSizeModule(IconSizeModule.Small, p2)) else UDim2.fromOffset(GetIconSizeModule(IconSizeModule.Small), GetIconSizeModule(IconSizeModule.Small)),
				Image = p1.props.infoIcon,
				ImageColor3 = p2.Theme.IconEmphasis.Color,
				ImageTransparency = p2.Theme.IconEmphasis.Transparency
			}) or nil
		})
	end) else nil
end

return CellTailDescription