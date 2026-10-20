local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactModule = require(Modules.Common.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local ShimmerPanelModule = require(Modules.LuaApp.Components.ShimmerPanel)
local LoadingSkeleton = RoactModule.PureComponent:extend("LoadingSkeleton")

function LoadingSkeleton.render(p1)
	-- upvalues: RoactModule (copy), ShimmerPanelModule (copy), FitChildrenModule (copy)
	local Size = p1.props.Size
	local Position = p1.props.Position
	local AnchorPoint = p1.props.AnchorPoint
	local LayoutOrder = p1.props.LayoutOrder
	local Panels = p1.props.panels
	local CreateLayoutFunction = p1.props.createLayout
	local Elements = {}
	
	if CreateLayoutFunction then
		Elements.Layout = CreateLayoutFunction()
	end
	for LayoutOrder1, panel in ipairs(Panels) do
		Elements[LayoutOrder1] = RoactModule.createElement(ShimmerPanelModule, {
			Size = panel.Size,
			Position = panel.Position,
			LayoutOrder = LayoutOrder1
		})
	end
	return if Size then RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = Size,
		Position = Position,
		AnchorPoint = AnchorPoint,
		LayoutOrder = LayoutOrder
	}, Elements) else RoactModule.createElement(FitChildrenModule.FitFrame, {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 1, 0),
		Position = Position,
		AnchorPoint = AnchorPoint,
		LayoutOrder = LayoutOrder,
		fitAxis = FitChildrenModule.FitAxis.Both
	}, Elements)
end

return LoadingSkeleton