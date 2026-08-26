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

local function getCellStyle(p1, p2, p3)
	-- upvalues: controlStateModule (ref)
	local var1 = p1[p2] or p1[controlStateModule.Default]
	local t = {
		Color = p3.Theme[var1].Color,
		Transparency = p3.Theme[var1].Transparency
	}
	
	if p2 == controlStateModule.Default or p2 == controlStateModule.Disabled then
		t.Transparency = 1
	end
	return t
end

local function getIconStyle(p1, p2, p3)
	-- upvalues: controlStateModule (ref)
	local var1 = p1[p2] or p1[controlStateModule.Default]
	local t = {
		Color = p3.Theme[var1].Color,
		Transparency = p3.Theme[var1].Transparency
	}
	
	if p2 == controlStateModule.Disabled or p2 == controlStateModule.Pressed then
		t.Transparency = 0.5 * t.Transparency + 0.5
	end
	return t
end

local function _(p1, p2)
	-- upvalues: controlStateModule (ref)
	local t = { Color = p1.Color, Transparency = p1.Transparency }
	
	if p2 == controlStateModule.Disabled or p2 == controlStateModule.Pressed then
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

function genericSelectionCell.init(p1)
	-- upvalues: controlStateModule (ref)
	p1.state = { controlState = controlStateModule.Default }
	
	function p8.onStateChanged(_, p2)
		-- upvalues: p1 (ref)
		p1:setState({ controlState = p2 })
	end
end

function genericSelectionCell.render(p1)
	-- upvalues: withStyleModule (ref), controlStateModule (ref), getIconStyle (ref), t_1 (ref), getCellStyle (ref), t (ref), roactModule (ref), genericCellModule (ref), imageSetComponentModule (ref)
	assert(p1.validateProps(p1.props))
	
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), controlStateModule (copy), getIconStyle (copy), t_1 (copy), getCellStyle (copy), t (copy), roactModule (copy), genericCellModule (copy), imageSetComponentModule (copy)
		local font = p2.Font
		local theme = p2.Theme
		local var1 = if p1.props.useDefaultControlState then controlStateModule.Default else p1.state.controlState
		local var2 = getIconStyle(t_1, var1, p2)
		local var3 = getCellStyle(t, var1, p2)
		local textEmphasis = theme.TextEmphasis
		local t_2 = {
			Color = textEmphasis.Color,
			Transparency = textEmphasis.Transparency
		}
		
		if var1 == controlStateModule.Disabled or var1 == controlStateModule.Pressed then
			t_2.Transparency = 0.5 * t_2.Transparency + 0.5
		end
		local textDefault = theme.TextDefault
		local t_3 = {
			Color = textDefault.Color,
			Transparency = textDefault.Transparency
		}
		
		if var1 == controlStateModule.Disabled or var1 == controlStateModule.Pressed then
			t_3.Transparency = 0.5 * t_3.Transparency + 0.5
		end
		return roactModule.createElement(genericCellModule, {
			titleText = p1.props.text,
			colorStyle = var3,
			textStyle = t_2,
			fontStyle = font.Header2,
			subtitleText = p1.props.subtitleText,
			subtitleTextStyle = t_3,
			subtitleFontStyle = font.Body,
			rightContentWidth = p1.props.defaultImageSize,
			onActivated = p1.props.onActivated,
			dividerStyle = theme.Divider,
			isDisabled = p1.props.isDisabled,
			[roactModule.Ref] = p1.props.controlRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject,
			renderRightContent = function()
				-- upvalues: roactModule (copy), p1 (copy), imageSetComponentModule (copy), var2 (ref)
				return roactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(0, p1.props.defaultImageSize, 1, 0)
				}, {
					SelectionImage = roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						Image = p1.props.defaultImage,
						Size = UDim2.new(0, p1.props.defaultImageSize, 0, p1.props.defaultImageSize),
						ImageColor3 = var2.Color,
						ImageTransparency = var2.Transparency,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}, {
						SelectedImage = p1.props.isSelected and roactModule.createElement(imageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Image = p1.props.selectedImage,
							Size = UDim2.new(0, p1.props.selectedImageSize, 0, p1.props.selectedImageSize),
							ImageColor3 = var2.Color,
							ImageTransparency = var2.Transparency,
							AnchorPoint = Vector2.new(0.5, 0.5),
							Position = UDim2.new(0.5, 0, 0.5, 0)
						})
					})
				})
			end,
			onStateChanged = p1.onStateChanged
		})
	end)
end

return roactModule.forwardRef(function(p1, p2)
	-- upvalues: roactModule (ref), genericSelectionCell (ref), cryoModule (ref)
	return roactModule.createElement(genericSelectionCell, cryoModule.Dictionary.join(p1, { controlRef = p2 }))
end)