local Parent = script.Parent.Parent.Parent
local Core = Parent.Core
local Parent1 = Parent.Parent
local TModule = require(Parent1.t)
local ValidateColorInfoModule = require(Core.Style.Validator.validateColorInfo)
local ValidateFontInfoModule = require(Core.Style.Validator.validateFontInfo)
local ValidateTypographyInfoModule = require(Core.Style.Validator.validateTypographyInfo)
local RoactModule = require(Parent1.Roact)
local WithStyleModule = require(Core.Style.withStyle)
local GenericTextLabelModule = require(Parent.Core.Text.GenericTextLabel.GenericTextLabel)
local CellHeadDetail = RoactModule.PureComponent:extend("CellHeadDetail")
CellHeadDetail.validateProps = TModule.strictInterface({
	labelText = TModule.string,
	labelTextColor = TModule.optional(ValidateColorInfoModule),
	labelTextFont = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule)),
	subLabelText = TModule.optional(TModule.string),
	subLabelTextColor = TModule.optional(ValidateColorInfoModule),
	subLabelTextFont = TModule.optional(TModule.union(ValidateFontInfoModule, ValidateTypographyInfoModule)),
	openTypeFeatures = TModule.optional(TModule.string)
})

function CellHeadDetail.render(p1) --[[ Line: 30 ]]
	-- upvalues: WithStyleModule (copy), RoactModule (copy), GenericTextLabelModule (copy)
	return WithStyleModule(function(p2) --[[ Line: 31 ]]
		-- upvalues: p1 (copy), RoactModule (upval), GenericTextLabelModule (upval)
		local SubLabelText = p1.props.subLabelText
		local SubLabelTextColor = p1.props.subLabelTextColor or p2.Theme.TextDefault
		local SubLabelTextFont = p1.props.subLabelTextFont or p2.Font.CaptionBody
		
		return RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			AutomaticSize = Enum.AutomaticSize.XY
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical
			}),
			Label = RoactModule.createElement(GenericTextLabelModule, {
				LayoutOrder = 1,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = p1.props.labelText,
				colorStyle = p1.props.labelTextColor or p2.Theme.TextEmphasis,
				fontStyle = p1.props.labelTextFont or p2.Font.Header2,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SubLabel = SubLabelText and RoactModule.createElement(GenericTextLabelModule, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = SubLabelText,
				colorStyle = SubLabelTextColor,
				fontStyle = SubLabelTextFont,
				openTypeFeatures = p1.props.openTypeFeatures,
				TextXAlignment = Enum.TextXAlignment.Left
			}) or nil
		})
	end)
end

return CellHeadDetail