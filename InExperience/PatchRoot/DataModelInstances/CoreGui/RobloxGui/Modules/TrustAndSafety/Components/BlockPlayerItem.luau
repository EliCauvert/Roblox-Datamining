local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local UIBloxModule = require(corePackagesService.Packages.UIBlox)
local checkbox = require(corePackagesService.Packages.Foundation).Checkbox
local tModule = require(corePackagesService.Packages.t)
local dependenciesModule = require(script.Parent.Parent.Dependencies)
local dividerModule = require(dependenciesModule.Divider)
local themedTextLabelModule = require(dependenciesModule.ThemedTextLabel)
local withStyle = UIBloxModule.Style.withStyle
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local blockPlayerItem = roactModule.PureComponent:extend("BlockPlayerItem")
blockPlayerItem.validateProps = tModule.strictInterface({
	layoutOrder = tModule.optional(tModule.number),
	size = tModule.UDim2,
	text = tModule.string,
	description = tModule.string,
	icon = tModule.union(tModule.string, tModule.table),
	iconSize = tModule.UDim2,
	isDisabled = tModule.optional(tModule.boolean),
	isCheckBoxSelected = tModule.boolean,
	onCheckBoxActivated = tModule.callback
})
blockPlayerItem.defaultProps = { isDisabled = false, isCheckBoxSelected = false }

function blockPlayerItem.init(p0)
	function p0.onClicked()
		-- upvalues: p0 (ref)
		if p0.props.onCheckBoxActivated and not p0.props.isDisabled then
			p0.props.onCheckBoxActivated(not p0.props.isCheckBoxSelected)
		end
	end
end

function blockPlayerItem.render(p1)
	-- upvalues: withStyle (ref), roactModule (ref), imageSetLabel (ref), checkbox (ref), themedTextLabelModule (ref), dividerModule (ref)
	local props = p1.props
	
	return withStyle(function(p2)
		-- upvalues: roactModule (copy), props (ref), p1 (ref), imageSetLabel (copy), checkbox (copy), themedTextLabelModule (copy), dividerModule (copy)
		local _ = p2.Theme
		
		return roactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			LayoutOrder = props.layoutOrder,
			Size = props.size,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			[roactModule.Event.Activated] = p1.onClicked
		}, {
			BlockIcon = roactModule.createElement(imageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = props.icon,
				ImageTransparency = if props.isDisabled then 0.5 else nil,
				Position = UDim2.new(0, 16, 0.5, 0),
				Size = props.iconSize
			}),
			CheckBoxFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -20, 0.5, 0),
				Size = UDim2.fromOffset(24, 24)
			}, {
				CheckBox = roactModule.createElement(checkbox, {
					label = "",
					isDisabled = props.isDisabled,
					onActivated = props.onCheckBoxActivated,
					isChecked = props.isCheckBoxSelected
				})
			}),
			TextFrame = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 60, 0.5, 0),
				Size = UDim2.new(1, -124, 1, 0)
			}, {
				Layout = roactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				Text = roactModule.createElement(themedTextLabelModule, {
					LayoutOrder = 1,
					fontKey = "SubHeader1",
					themeKey = "TextEmphasis",
					TextTransparency = if props.isDisabled then 0.5 else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = props.text,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Description = roactModule.createElement(themedTextLabelModule, {
					LayoutOrder = 2,
					fontKey = "Footer",
					TextWrapped = true,
					themeKey = "TextDefault",
					LineHeight = 1.25,
					TextTransparency = if props.isDisabled then 0.5 else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = props.description,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			Divider = roactModule.createElement(dividerModule, { Position = UDim2.new(0, 0, 1, 0) })
		})
	end)
end

return blockPlayerItem