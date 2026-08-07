-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:32:59 2026 Pacific Standard Time.

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

function cellHeadDetail.render(p0) --[[ line: 30 ]]
	-- upvalues: withStyleModule (ref), roactModule (ref), genericTextLabelModule (ref)
	return withStyleModule(function(p1) --[[ line: 31 ]]
		-- upvalues: p0 (ref), roactModule (copy), genericTextLabelModule (copy)
		local subLabelText = p0.props.subLabelText
		
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
				Text = p0.props.labelText,
				colorStyle = p0.props.labelTextColor or p1.Theme.TextEmphasis,
				fontStyle = p0.props.labelTextFont or p1.Font.Header2,
				TextXAlignment = Enum.TextXAlignment.Left
			}),
			SubLabel = subLabelText and roactModule.createElement(genericTextLabelModule, {
				LayoutOrder = 2,
				BackgroundTransparency = 1,
				AutomaticSize = Enum.AutomaticSize.XY,
				Text = subLabelText,
				colorStyle = p0.props.subLabelTextColor or p1.Theme.TextDefault,
				fontStyle = p0.props.subLabelTextFont or p1.Font.CaptionBody,
				openTypeFeatures = p0.props.openTypeFeatures,
				TextXAlignment = Enum.TextXAlignment.Left
			}) or nil
		})
	end)
end

return cellHeadDetail