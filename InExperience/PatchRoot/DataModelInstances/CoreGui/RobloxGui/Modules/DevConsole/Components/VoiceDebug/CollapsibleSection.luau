local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local components = script.Parent.Parent.Parent.Components
local cellLabelModule = require(components.CellLabel)
local bannerButtonModule = require(components.BannerButton)
local mainRowPadding = require(script.Parent.Parent.Parent.Constants).GeneralFormatting.MainRowPadding
local collapsibleSection = roactModule.PureComponent:extend("CollapsibleSection")

function collapsibleSection.init(p1)
	p1.state = {
		expanded = p1.props.defaultExpanded == nil or p1.props.defaultExpanded
	}
	
	function p0.onButtonPress()
		-- upvalues: p1 (ref)
		p1:setState(function(p2)
			return { expanded = not p2.expanded }
		end)
	end
end

function collapsibleSection.render(p1)
	-- upvalues: roactModule (ref), bannerButtonModule (ref), cellLabelModule (ref), mainRowPadding (ref)
	local expanded = p1.state.expanded
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		LayoutOrder = p1.props.layoutOrder
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
		Header = roactModule.createElement(bannerButtonModule, {
			isExpandable = true,
			layoutOrder = 1,
			size = UDim2.new(1, 0, 0, 20),
			isExpanded = expanded,
			hideLines = p1.props.hideLines,
			onButtonPress = p1.onButtonPress
		}, {
			Label = roactModule.createElement(cellLabelModule, {
				bold = true,
				text = p1.props.title,
				size = UDim2.new(1, -20, 1, 0),
				pos = UDim2.new(0, 20, 0, 0)
			})
		}),
		Content = expanded and (roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 2,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		}, {
			UIListLayout = roactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, mainRowPadding)
			}),
			Children = roactModule.createFragment(p1.props[roactModule.Children] or {})
		}) or nil)
	})
end

return collapsibleSection