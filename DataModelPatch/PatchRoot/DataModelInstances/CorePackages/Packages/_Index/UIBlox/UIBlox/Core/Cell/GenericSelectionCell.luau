local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local CryoModule = require(Parent1.Cryo)
local TModule = require(Parent1.t)
local WithStyleModule = require(Parent.Core.Style.withStyle)
local ControlStateModule = require(Parent1.UIBlox.Core.Control.Enum.ControlState)
local GenericCellModule = require(Parent1.UIBlox.Core.Cell.GenericCell)
local ImageSetComponentModule = require(Parent1.UIBlox.Core.ImageSet.ImageSetComponent)
local GenericSelectionCell = RoactModule.PureComponent:extend("GenericSelectionCell")
local config = {
	[ControlStateModule.Default] = "BackgroundDefault",
	[ControlStateModule.Hover] = "BackgroundOnHover",
	[ControlStateModule.Pressed] = "BackgroundOnPress"
}
local config1 = {
	[ControlStateModule.Default] = "IconDefault",
	[ControlStateModule.Hover] = "IconEmphasis",
	[ControlStateModule.Pressed] = "IconDefault"
}

local function getCellStyle(p1, Default, p2)
	-- upvalues: ControlStateModule (copy)
	local v1 = p1[Default] or p1[ControlStateModule.Default]
	local config = {
		Color = p2.Theme[v1].Color,
		Transparency = p2.Theme[v1].Transparency
	}
	
	if Default == ControlStateModule.Default or Default == ControlStateModule.Disabled then
		config.Transparency = 1
	end
	return config
end

local function getIconStyle(p1, Default, p2)
	-- upvalues: ControlStateModule (copy)
	local v1 = p1[Default] or p1[ControlStateModule.Default]
	local config = {
		Color = p2.Theme[v1].Color,
		Transparency = p2.Theme[v1].Transparency
	}
	
	if Default == ControlStateModule.Disabled or Default == ControlStateModule.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end

local function _(SubtitleTextStyle, Disabled)
	-- upvalues: ControlStateModule (copy)
	local config = {
		Color = SubtitleTextStyle.Color,
		Transparency = SubtitleTextStyle.Transparency
	}
	
	if Disabled == ControlStateModule.Disabled or Disabled == ControlStateModule.Pressed then
		config.Transparency = 0.5 * config.Transparency + 0.5
	end
	return config
end

GenericSelectionCell.validateProps = TModule.strictInterface({
	text = TModule.string,
	subtitleText = TModule.optional(TModule.string),
	defaultImage = TModule.union(TModule.string, TModule.table),
	selectedImage = TModule.union(TModule.string, TModule.table),
	defaultImageSize = TModule.number,
	selectedImageSize = TModule.number,
	onActivated = TModule.optional(TModule.callback),
	isSelected = TModule.optional(TModule.boolean),
	isDisabled = TModule.optional(TModule.boolean),
	useDefaultControlState = TModule.optional(TModule.boolean),
	controlRef = TModule.optional(TModule.table),
	NextSelectionLeft = TModule.optional(TModule.table),
	NextSelectionRight = TModule.optional(TModule.table),
	NextSelectionUp = TModule.optional(TModule.table),
	NextSelectionDown = TModule.optional(TModule.table),
	SelectionImageObject = TModule.optional(TModule.table)
})
GenericSelectionCell.defaultProps = { isSelected = false }

function GenericSelectionCell.init(p1)
	-- upvalues: ControlStateModule (copy)
	p1.state = { controlState = ControlStateModule.Default }
	
	function p1:onStateChanged(ControlState)
		-- upvalues: p1 (copy)
		p1:setState({ controlState = ControlState })
	end
end

function GenericSelectionCell.render(p1)
	-- upvalues: WithStyleModule (copy), ControlStateModule (copy), getIconStyle (copy), config1 (copy), getCellStyle (copy), config (copy), RoactModule (copy), GenericCellModule (copy), ImageSetComponentModule (copy)
	assert(p1.validateProps(p1.props))
	
	return WithStyleModule(function(p2)
		-- upvalues: p1 (copy), ControlStateModule (upval), getIconStyle (upval), config1 (upval), getCellStyle (upval), config (upval), RoactModule (upval), GenericCellModule (upval), ImageSetComponentModule (upval)
		local _Font = p2.Font
		local Theme = p2.Theme
		local Default = p1.props.useDefaultControlState and ControlStateModule.Default or p1.state.controlState
		local IconStyle = getIconStyle(config1, Default, p2)
		local CellStyle = getCellStyle(config, Default, p2)
		local TextEmphasis = Theme.TextEmphasis
		local TextStyle = {
			Color = TextEmphasis.Color,
			Transparency = TextEmphasis.Transparency
		}
		
		if Default == ControlStateModule.Disabled or Default == ControlStateModule.Pressed then
			TextStyle.Transparency = 0.5 * TextStyle.Transparency + 0.5
		end
		local TextDefault = Theme.TextDefault
		local SubtitleTextStyle = {
			Color = TextDefault.Color,
			Transparency = TextDefault.Transparency
		}
		
		if Default == ControlStateModule.Disabled or Default == ControlStateModule.Pressed then
			SubtitleTextStyle.Transparency = 0.5 * SubtitleTextStyle.Transparency + 0.5
		end
		return RoactModule.createElement(GenericCellModule, {
			titleText = p1.props.text,
			colorStyle = CellStyle,
			textStyle = TextStyle,
			fontStyle = _Font.Header2,
			subtitleText = p1.props.subtitleText,
			subtitleTextStyle = SubtitleTextStyle,
			subtitleFontStyle = _Font.Body,
			rightContentWidth = p1.props.defaultImageSize,
			onActivated = p1.props.onActivated,
			dividerStyle = Theme.Divider,
			isDisabled = p1.props.isDisabled,
			[RoactModule.Ref] = p1.props.controlRef,
			NextSelectionUp = p1.props.NextSelectionUp,
			NextSelectionDown = p1.props.NextSelectionDown,
			NextSelectionLeft = p1.props.NextSelectionLeft,
			NextSelectionRight = p1.props.NextSelectionRight,
			SelectionImageObject = p1.props.SelectionImageObject,
			renderRightContent = function()
				-- upvalues: RoactModule (upval), p1 (upval), ImageSetComponentModule (upval), IconStyle (copy)
				return RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					Size = UDim2.new(0, p1.props.defaultImageSize, 1, 0)
				}, {
					SelectionImage = RoactModule.createElement(ImageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						Image = p1.props.defaultImage,
						Size = UDim2.new(0, p1.props.defaultImageSize, 0, p1.props.defaultImageSize),
						ImageColor3 = IconStyle.Color,
						ImageTransparency = IconStyle.Transparency,
						AnchorPoint = Vector2.new(0.5, 0.5),
						Position = UDim2.new(0.5, 0, 0.5, 0)
					}, {
						SelectedImage = p1.props.isSelected and RoactModule.createElement(ImageSetComponentModule.Label, {
							BackgroundTransparency = 1,
							Image = p1.props.selectedImage,
							Size = UDim2.new(0, p1.props.selectedImageSize, 0, p1.props.selectedImageSize),
							ImageColor3 = IconStyle.Color,
							ImageTransparency = IconStyle.Transparency,
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

return RoactModule.forwardRef(function(p1, ControlRef)
	-- upvalues: RoactModule (copy), GenericSelectionCell (copy), CryoModule (copy)
	return RoactModule.createElement(GenericSelectionCell, CryoModule.Dictionary.join(p1, { controlRef = ControlRef }))
end)