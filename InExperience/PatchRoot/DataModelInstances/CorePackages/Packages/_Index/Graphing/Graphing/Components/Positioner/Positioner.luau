local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local _ = require(Graphing.Types)
local UseViewportBindingModule = require(Graphing.Util.useViewportBinding)
local UseViewportBindingFunction = UseViewportBindingModule.useViewportBinding
local UseViewportVisibilityFunction = UseViewportBindingModule.useViewportVisibility

function Positioner(p1, Ref) --[[ Line: 34 ]]
	-- upvalues: UseViewportBindingFunction (copy), UseViewportVisibilityFunction (copy), ReactModule (copy)
	if typeof(p1.Position) == "Vector2" then
		local Position = p1.Position
		local UseViewportBindingResult = UseViewportBindingFunction(function(p2): UDim2 --[[ Line: 38 ]]
			-- upvalues: Position (copy)
			local PlotToViewResult = p2.plotToView(Position)
			
			return UDim2.fromScale(PlotToViewResult.X, PlotToViewResult.Y)
		end, { Position })
		
		return if UseViewportVisibilityFunction(function(p2) --[[ Line: 43 ]]
			-- upvalues: Position (copy)
			return p2.isPointInViewport(Position)
		end, { Position }) then ReactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UseViewportBindingResult,
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = p1.ZIndex,
			ref = Ref,
			[ReactModule.Tag] = p1.Tag
		}, p1.children) else nil
	else
		return ReactModule.createElement("Frame", {
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = p1.Position,
			Size = UDim2.fromOffset(0, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = p1.ZIndex,
			ref = Ref,
			[ReactModule.Tag] = p1.Tag
		}, p1.children)
	end
end

return ReactModule.forwardRef(Positioner)