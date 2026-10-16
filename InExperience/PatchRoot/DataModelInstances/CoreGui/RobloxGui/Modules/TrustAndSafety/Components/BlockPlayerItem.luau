local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Checkbox = require(CorePackages.Packages.Foundation).Checkbox
local TModule = require(CorePackages.Packages.t)
local DependenciesModule = require(script.Parent.Parent.Dependencies)
local DividerModule = require(DependenciesModule.Divider)
local ThemedTextLabelModule = require(DependenciesModule.ThemedTextLabel)
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local BlockPlayerItem = RoactModule.PureComponent:extend("BlockPlayerItem")
BlockPlayerItem.validateProps = TModule.strictInterface({
	layoutOrder = TModule.optional(TModule.number),
	size = TModule.UDim2,
	text = TModule.string,
	description = TModule.string,
	icon = TModule.union(TModule.string, TModule.table),
	iconSize = TModule.UDim2,
	isDisabled = TModule.optional(TModule.boolean),
	isCheckBoxSelected = TModule.boolean,
	onCheckBoxActivated = TModule.callback
})
BlockPlayerItem.defaultProps = { isDisabled = false, isCheckBoxSelected = false }

function BlockPlayerItem.init(p1) --[[ Line: 39 ]]
	function p1.onClicked() --[[ Line: 40 ]]
		-- upvalues: p1 (copy)
		if p1.props.onCheckBoxActivated and not p1.props.isDisabled then
			p1.props.onCheckBoxActivated(not p1.props.isCheckBoxSelected)
		end
	end
end

function BlockPlayerItem.render(p1) --[[ Line: 47 ]]
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), ImageSetLabel (copy), Checkbox (copy), ThemedTextLabelModule (copy), DividerModule (copy)
	local Props = p1.props
	
	return WithStyleFunction(function(p2) --[[ Line: 50 ]]
		-- upvalues: RoactModule (upval), Props (copy), p1 (copy), ImageSetLabel (upval), Checkbox (upval), ThemedTextLabelModule (upval), DividerModule (upval)
		local _ = p2.Theme
		
		return RoactModule.createElement("TextButton", {
			BackgroundTransparency = 1,
			LayoutOrder = Props.layoutOrder,
			Size = Props.size,
			AutoButtonColor = false,
			BorderSizePixel = 0,
			Text = "",
			[RoactModule.Event.Activated] = p1.onClicked
		}, {
			BlockIcon = RoactModule.createElement(ImageSetLabel, {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Image = Props.icon,
				ImageTransparency = if Props.isDisabled then 0.5 else nil,
				Position = UDim2.new(0, 16, 0.5, 0),
				Size = Props.iconSize
			}),
			CheckBoxFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(1, 0.5),
				Position = UDim2.new(1, -20, 0.5, 0),
				Size = UDim2.fromOffset(24, 24)
			}, {
				CheckBox = RoactModule.createElement(Checkbox, {
					label = "",
					isDisabled = Props.isDisabled,
					onActivated = Props.onCheckBoxActivated,
					isChecked = Props.isCheckBoxSelected
				})
			}),
			TextFrame = RoactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				AnchorPoint = Vector2.new(0, 0.5),
				Position = UDim2.new(0, 60, 0.5, 0),
				Size = UDim2.new(1, -124, 1, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					SortOrder = Enum.SortOrder.LayoutOrder,
					Padding = UDim.new(0, 4)
				}),
				Text = RoactModule.createElement(ThemedTextLabelModule, {
					LayoutOrder = 1,
					fontKey = "SubHeader1",
					themeKey = "TextEmphasis",
					TextTransparency = if Props.isDisabled then 0.5 else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = Props.text,
					TextTruncate = Enum.TextTruncate.AtEnd,
					TextXAlignment = Enum.TextXAlignment.Left
				}),
				Description = RoactModule.createElement(ThemedTextLabelModule, {
					LayoutOrder = 2,
					fontKey = "Footer",
					TextWrapped = true,
					themeKey = "TextDefault",
					LineHeight = 1.25,
					TextTransparency = if Props.isDisabled then 0.5 else nil,
					AutomaticSize = Enum.AutomaticSize.XY,
					Text = Props.description,
					TextXAlignment = Enum.TextXAlignment.Left
				})
			}),
			Divider = RoactModule.createElement(DividerModule, { Position = UDim2.new(0, 0, 1, 0) })
		})
	end)
end

return BlockPlayerItem