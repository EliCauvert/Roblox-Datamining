local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local Components = script.Parent.Parent.Parent.Components
local CellLabelModule = require(Components.CellLabel)
local BannerButtonModule = require(Components.BannerButton)
local MainRowPadding = require(script.Parent.Parent.Parent.Constants).GeneralFormatting.MainRowPadding
local CollapsibleSection = RoactModule.PureComponent:extend("CollapsibleSection")

function CollapsibleSection.init(p1) --[[ Line: 15 ]]
	p1.state = {
		expanded = p1.props.defaultExpanded == nil or p1.props.defaultExpanded
	}
	
	function p1.onButtonPress() --[[ Line: 20 ]]
		-- upvalues: p1 (copy)
		p1:setState(function(p2) --[[ Line: 21 ]]
			return { expanded = not p2.expanded }
		end)
	end
end

function CollapsibleSection.render(p1) --[[ Line: 27 ]]
	-- upvalues: RoactModule (copy), MainRowPadding (copy), BannerButtonModule (copy), CellLabelModule (copy)
	local Expanded = p1.state.expanded
	
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.props.layoutOrder
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, MainRowPadding)
		}),
		Header = RoactModule.createElement(BannerButtonModule, {
			isExpandable = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			isExpanded = Expanded,
			hideLines = p1.props.hideLines,
			onButtonPress = p1.onButtonPress
		}, {
			Label = RoactModule.createElement(CellLabelModule, {
				bold = true,
				text = p1.props.title,
				size = UDim2.new(1, -20, 1, 0),
				pos = UDim2.new(0, 20, 0, 0)
			})
		}),
		Content = Expanded and RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, MainRowPadding)
			}),
			Children = RoactModule.createFragment(p1.props[RoactModule.Children] or {})
		}) or nil
	})
end

return CollapsibleSection