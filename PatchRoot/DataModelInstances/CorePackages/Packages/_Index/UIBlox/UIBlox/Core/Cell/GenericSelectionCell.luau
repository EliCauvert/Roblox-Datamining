-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:02 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local cryoModule = require(parent_1.Cryo)
local tModule = require(parent_1.t)
local withStyleModule = require(parent.Core.Style.withStyle)
local controlStateModule = require(parent_1.UIBlox.Core.Control.Enum.ControlState)
local genericCellModule = require(parent_1.UIBlox.Core.Cell.GenericCell)
local imageSetComponentModule = require(parent_1.UIBlox.Core.ImageSet.ImageSetComponent)
local genericSelectionCell = roactModule.PureComponent:extend("GenericSelectionCell")
local t = {
	[controlStateModule.Default] = "BackgroundDefault",
	[controlStateModule.Hover] = "BackgroundOnHover",
	[controlStateModule.Pressed] = "BackgroundOnPress"
}
local t_1 = {
	[controlStateModule.Default] = "IconDefault",
	[controlStateModule.Hover] = "IconEmphasis",
	[controlStateModule.Pressed] = "IconDefault"
}

local function getCellStyle(p0, p1, p2) --[[ line: 30 ]]
	-- upvalues: controlStateModule (ref)
	local var12 = p0[p1] or p0[controlStateModule.Default]
	local t = {
		Color = p2.Theme[var12].Color,
		Transparency = p2.Theme[var12].Transparency
	}
	
	if p1 == controlStateModule.Default or p1 == controlStateModule.Disabled then
		t.Transparency = 1
	end
	return t
end

local function getIconStyle(p3, p4, p5) --[[ line: 47 ]]
	-- upvalues: controlStateModule (ref)
	local var14 = p3[p4] or p3[controlStateModule.Default]
	local t = {
		Color = p5.Theme[var14].Color,
		Transparency = p5.Theme[var14].Transparency
	}
	
	if p4 == controlStateModule.Disabled or p4 == controlStateModule.Pressed then
		t.Transparency = 0.5 * t.Transparency + 0.5
	end
	return t
end

local function _(p6, p7) --[[ line: 63 | named "getTextStyle" ]]
	-- upvalues: controlStateModule (ref)
	local t = { Color = p6.Color, Transparency = p6.Transparency }
	
	if p7 == controlStateModule.Disabled or p7 == controlStateModule.Pressed then
		t.Transparency = 0.5 * t.Transparency + 0.5
	end
	return t
end

genericSelectionCell.validateProps = tModule.strictInterface({
	text = tModule.string,
	subtitleText = tModule.optional(tModule.string),
	defaultImage = tModule.union(tModule.string, tModule.table),
	selectedImage = tModule.union(tModule.string, tModule.table),
	defaultImageSize = tModule.number,
	selectedImageSize = tModule.number,
	onActivated = tModule.optional(tModule.callback),
	isSelected = tModule.optional(tModule.boolean),
	isDisabled = tModule.optional(tModule.boolean),
	useDefaultControlState = tModule.optional(tModule.boolean),
	controlRef = tModule.optional(tModule.table),
	NextSelectionLeft = tModule.optional(tModule.table),
	NextSelectionRight = tModule.optional(tModule.table),
	NextSelectionUp = tModule.optional(tModule.table),
	NextSelectionDown = tModule.optional(tModule.table),
	SelectionImageObject = tModule.optional(tModule.table)
})
genericSelectionCell.defaultProps = { isSelected = false }

function genericSelectionCell.init(p8) --[[ line: 121 ]]
	-- upvalues: controlStateModule (ref)
	p8.state = { controlState = controlStateModule.Default }
	
	function p8.onStateChanged(_, p9) --[[ line: 126 ]]
		-- upvalues: p8 (ref)
		p8:setState({ controlState = p9 })
	end
end

function genericSelectionCell.render(p10) --[[ line: 133 ]]
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getIconStyle (ref), t_1 (ref), getCellStyle (ref), t (ref), roactModule (ref), genericCellModule (ref), imageSetComponentModule (ref)
	assert(p10.validateProps(p10.props))
	
	return withStyleModule(function(p11) --[[ line: 136 ]]
		-- upvalues: p10 (ref), controlStateModule (copy), getIconStyle (copy), t_1 (copy), getCellStyle (copy), t (copy), roactModule (copy), genericCellModule (copy), imageSetComponentModule (copy)
		local font = p11.Font
		local theme = p11.Theme
		local var17 = if p10.props.useDefaultControlState then controlStateModule.Default else p10.state.controlState
		local var18 = getIconStyle(t_1, var17, p11)
		local var19 = getCellStyle(t, var17, p11)
		local textEmphasis = theme.TextEmphasis
		local t_2 = {
			Color = textEmphasis.Color,
			Transparency = textEmphasis.Transparency
		}
		
		if var17 == controlStateModule.Disabled or var17 == controlStateModule.Pressed then
			t_2.Transparency = 0.5 * t_2.Transparency + 0.5
		end
		local textDefault = theme.TextDefault
		local t_3 = {
			Color = textDefault.Color,
			Transparency = textDefault.Transparency
		}
		
		if var17 == controlStateModule.Disabled or var17 == controlStateModule.Pressed then
			t_3.Transparency = 0.5 * t_3.Transparency + 0.5
		end
		return roactModule.createElement(genericCellModule, {
			titleText = p10.props.text,
			colorStyle = var19,
			textStyle = t_2,
			fontStyle = font.Header2,
			subtitleText = p10.props.subtitleText,
			subtitleTextStyle = t_3,
			subtitleFontStyle = font.Body,
			rightContentWidth = p10.props.defaultImageSize,
			onActivated = p10.props.onActivated,
			dividerStyle = theme.Divider,
			isDisabled = p10.props.isDisabled,
			[roactModule.Ref] = p10.props.controlRef,
			NextSelectionUp = p10.props.NextSelectionUp,
			NextSelectionDown = p10.props.NextSelectionDown,
			NextSelectionLeft = p10.props.NextSelectionLeft,
			NextSelectionRight = p10.props.NextSelectionRight,
			SelectionImageObject = p10.props.SelectionImageObject,
			renderRightContent = function() --[[ line: 166 ]]
				-- upvalues: roactModule (copy), p10 (copy), imageSetComponentModule (copy), var18 (ref)
				return roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(0, p10.props.defaultImageSize, 1, 0)
				}, {
					SelectionImage = roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						Image = p10.props.defaultImage,
						Size = UDim2.new(0, p10.props.defaultImageSize, 0, p10.props.defaultImageSize),
						ImageColor3 = var18.Color,
						ImageTransparency = var18.Transparency,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}, {
						SelectedImage = p10.props.isSelected and roactModule.createElement(imageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Image = p10.props.selectedImage,
							Size = UDim2.new(0, p10.props.selectedImageSize, 0, p10.props.selectedImageSize),
							ImageColor3 = var18.Color,
							ImageTransparency = var18.Transparency,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					})
				})
			end,
			onStateChanged = p10.onStateChanged
		})
	end)
end

return roactModule.forwardRef(function(p12, p13) --[[ line: 198 ]]
	-- upvalues: roactModule (ref), genericSelectionCell (ref), cryoModule (ref)
	return roactModule.createElement(genericSelectionCell, cryoModule.Dictionary.join(p12, { controlRef = p13 }))
end)