local parent = script.Parent.Parent.Parent
local core = parent.Core
local parent_1 = parent.Parent
local tModule = require(parent_1.t)
local validateColorInfoModule = require(core.Style.Validator.validateColorInfo)
local validateFontInfoModule = require(core.Style.Validator.validateFontInfo)
local validateTypographyInfoModule = require(core.Style.Validator.validateTypographyInfo)
local roactModule = require(parent_1.Roact)
local withStyleModule = require(core.Style.withStyle)
local genericTextLabelModule = require(parent.Core.Text.GenericTextLabel.GenericTextLabel)
local cellHeadDetail = roactModule.PureComponent:extend("CellHeadDetail")
cellHeadDetail.validateProps = tModule.strictInterface({
	labelText = tModule.string,
	labelTextColor = tModule.optional(validateColorInfoModule),
	labelTextFont = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	subLabelText = tModule.optional(tModule.string),
	subLabelTextColor = tModule.optional(validateColorInfoModule),
	subLabelTextFont = tModule.optional(tModule.union(validateFontInfoModule, validateTypographyInfoModule)),
	openTypeFeatures = tModule.optional(tModule.string)
})

function cellHeadDetail.render(p1)
	-- upvalues: withStyleModule (ref), roactModule (ref), genericTextLabelModule (ref)
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), genericTextLabelModule (copy)
		local subLabelText = p1.props.subLabelText
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			Label = roactModule.createElement(genericTextLabelModule, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p1.props.labelText,
				colorStyle = p1.props.labelTextColor or p2.Theme.TextEmphasis,
				fontStyle = p1.props.labelTextFont or p2.Font.Header2,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SubLabel = subLabelText and roactModule.createElement(genericTextLabelModule, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = subLabelText,
				colorStyle = p1.props.subLabelTextColor or p2.Theme.TextDefault,
				fontStyle = p1.props.subLabelTextFont or p2.Font.CaptionBody,
				openTypeFeatures = p1.props.openTypeFeatures,
				TextXAlignment = Enum.TextXAlignment.Left
			}) or nil
		})
	end)
end

return cellHeadDetail