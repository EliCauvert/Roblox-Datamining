local parent = script.Parent.Parent
local parent_1 = parent.Parent
local core = parent_1.Core
local parent_2 = parent_1.Parent
local tModule = require(parent_2.t)
local validateColorInfoModule = require(core.Style.Validator.validateColorInfo)
local validateFontInfoModule = require(core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(core.Style.Validator.validateTypographyInfo)
local roactModule = require(parent_2.Roact)
local reactModule = require(parent_2.React)
local withStyleModule = require(core.Style.withStyle)
local genericTextLabelModule = require(parent_1.Core.Text.GenericTextLabel.GenericTextLabel)
local imageSetComponentModule = require(core.ImageSet.ImageSetComponent)
local iconSizeModule = require(parent.ImageSet.Enum.IconSize)
local getIconSizeModule = require(parent.ImageSet.getIconSize)
local imagesModule = require(parent.ImageSet.Images)
local UIBloxConfigModule = require(parent_1.UIBloxConfig)
local cellTailDescription = roactModule.PureComponent:extend("CellTailDescription")
cellTailDescription.validateProps = tModule.strictInterface({
	text = tModule.optional(tModule.string),
	textColor = tModule.optional(validateColorInfoModule),
	textFont = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	renderTextOverride = tModule.optional(tModule.callback),
	showArrow = tModule.optional(tModule.boolean),
	infoIcon = tModule.optional(tModule.string),
	testId = tModule.optional(tModule.string)
})
cellTailDescription.defaultProps = {
	showArrow = false,
	infoIcon = nil,
	testId = "--uiblox-cell-tail-description"
}

function cellTailDescription.init(p1)
	-- upvalues: roactModule (ref), genericTextLabelModule (ref)
	function p0.getDescription(p1, p2, p3, p4, p5)
		-- upvalues: roactModule (copy), genericTextLabelModule (copy)
		local var1 = nil
		
		if p1 then
			if p5 then
				var1 = p5()
			end
			var1 = var1 or roactModule.createElement(genericTextLabelModule, {
				BackgroundTransparency = 1,
				LayoutOrder = p4,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p1,
				colorStyle = p2,
				fontStyle = p3
			})
		end
		return var1
	end
end

function cellTailDescription.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), reactModule (ref), imageSetComponentModule (ref), UIBloxConfigModule (ref), getIconSizeModule (ref), iconSizeModule (ref), imagesModule (ref)
	local text = p1.props.text
	local renderTextOverride = p1.props.renderTextOverride
	local showArrow = p1.props.showArrow
	local var1 = p1.props.infoIcon ~= nil
	
	return if text or showArrow or var1 then withStyleModule(function(p1)
		-- upvalues: p1 (ref), roactModule (copy), reactModule (copy), text (ref), renderTextOverride (ref), showArrow (ref), imageSetComponentModule (copy), UIBloxConfigModule (copy), getIconSizeModule (copy), iconSizeModule (copy), imagesModule (copy), var1 (ref)
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY,
			[reactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil
		}, {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				Padding = UDim.new(0, 8)
			}),
			Description = p1.getDescription(text, p1.props.textColor or p1.Theme.TextDefault, p1.props.textFont or p1.Font.Body, 1, renderTextOverride),
			RightArrow = showArrow and (roactModule.createElement(imageSetComponentModule.Label, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				Size = if UIBloxConfigModule.enableScalingForSomeEdpIcons then UDim2.fromOffset(getIconSizeModule(iconSizeModule.Small, p1), getIconSizeModule(iconSizeModule.Small, p1)) else UDim2.fromOffset(getIconSizeModule(iconSizeModule.Small), getIconSizeModule(iconSizeModule.Small)),
				Image = imagesModule["icons/navigation/pushRight_small"],
				ImageColor3 = p1.Theme.TextEmphasis.Color,
				ImageTransparency = p1.Theme.TextEmphasis.Transparency
			}) or nil),
			InfoIcon = var1 and (roactModule.createElement(imageSetComponentModule.Label, {
				LayoutOrder = 2,
				BorderSizePixel = 0,
				BackgroundTransparency = 1,
				Size = if UIBloxConfigModule.enableScalingForSomeEdpIcons then UDim2.fromOffset(getIconSizeModule(iconSizeModule.Small, p1), getIconSizeModule(iconSizeModule.Small, p1)) else UDim2.fromOffset(getIconSizeModule(iconSizeModule.Small), getIconSizeModule(iconSizeModule.Small)),
				Image = p1.props.infoIcon,
				ImageColor3 = p1.Theme.IconEmphasis.Color,
				ImageTransparency = p1.Theme.IconEmphasis.Transparency
			}) or nil)
		})
	end) else nil
end

return cellTailDescription