local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(Modules.Common.Roact)
local ButtonStripSelectorButtonModule = require(Modules.LuaApp.Components.Search.ButtonStripSelectorButton)
local FFlagSearchTopResultsTabEnabledForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagSearchTopResultsTabEnabledForAll
local ButtonStripSelector = RoactModule.PureComponent:extend("ButtonStripSelector")
ButtonStripSelector.defaultProps = { leftRightPadding = 0 }

function ButtonStripSelector.renderChildrenButtonsAndLayout(p1, Selections, ActiveSelection, Offset)
	-- upvalues: RoactModule (copy), ButtonStripSelectorButtonModule (copy), FFlagSearchTopResultsTabEnabledForAll (copy)
	local config = {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			VerticalAlignment = Enum.VerticalAlignment.Center,
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, 8)
		}),
		Padding = RoactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, Offset),
			PaddingRight = UDim.new(0, Offset)
		})
	}
	
	for i = 1, #Selections do
		local Selection = Selections[i]
		
		if Selection then
			config[Selection.name] = RoactModule.createElement(ButtonStripSelectorButtonModule, {
				layoutOrder = i,
				text = Selection.text,
				handleClick = Selection.onActivated,
				selected = ActiveSelection == Selection.name,
				image = Selection.image,
				newDesignEnabled = p1.props.newDesignEnabled or FFlagSearchTopResultsTabEnabledForAll
			})
		end
	end
	return config
end

function ButtonStripSelector.render(p2)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		Size = p2.props.size,
		AutomaticSize = Enum.AutomaticSize.Y,
		Position = p2.props.position,
		LayoutOrder = p2.props.layoutOrder,
		BackgroundColor3 = p2.props.backgroundColor3,
		BackgroundTransparency = p2.props.backgroundTransparency,
		BorderSizePixel = 0,
		[RoactModule.Ref] = p2.props.forwardRef
	}, p2:renderChildrenButtonsAndLayout(p2.props.selections, p2.props.activeSelection or 1, p2.props.leftRightPadding))
end

return RoactModule.forwardRef(function(p2, ForwardRef)
	-- upvalues: RoactModule (copy), ButtonStripSelector (copy), CryoModule (copy)
	return RoactModule.createElement(ButtonStripSelector, CryoModule.Dictionary.join(p2, { forwardRef = ForwardRef }))
end)