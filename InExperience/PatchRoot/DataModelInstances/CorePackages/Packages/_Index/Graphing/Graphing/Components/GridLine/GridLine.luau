local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local StyleUtilModule = require(Graphing.Util.StyleUtil)
local TypesModule = require(Graphing.Types)
local UseViewportBindingModule = require(Graphing.Util.useViewportBinding)
local UseViewportBindingFunction = UseViewportBindingModule.useViewportBinding
local UseViewportVisibilityFunction = UseViewportBindingModule.useViewportVisibility

function GridLine(p1) --[[ Line: 38 ]]
	-- upvalues: TypesModule (copy), StyleUtilModule (copy), UseViewportBindingFunction (copy), UseViewportVisibilityFunction (copy), ReactModule (copy)
	assert(p1.Orientation == TypesModule.ORIENTATION_VERTICAL or p1.Orientation == TypesModule.ORIENTATION_HORIZONTAL, `Invalid orientation {p1.Orientation}`)
	local _Color3 = p1.Color3 or StyleUtilModule.GRID_LINE_COLOR3
	local Transparency = p1.Transparency or StyleUtilModule.GRID_LINE_TRANSPARENCY
	local Thickness = p1.Thickness or StyleUtilModule.GRID_LINE_THICKNESS
	local UseViewportBindingResult = UseViewportBindingFunction(function(p2) --[[ Line: 48 ]]
		-- upvalues: p1 (copy), TypesModule (upval), Thickness (copy)
		local PlotToViewXResult = if p1.Orientation == TypesModule.ORIENTATION_VERTICAL then p2.plotToViewX(p1.Position) else p2.plotToViewY(p1.Position)
		local PlotToViewXResult1 = 0
		local PlotToViewXResult2 = 1
		
		if p1.OppositeAxisBounds then
			if p1.Orientation == TypesModule.ORIENTATION_VERTICAL then
				PlotToViewXResult1 = p2.plotToViewY(p1.OppositeAxisBounds.Min)
				PlotToViewXResult2 = p2.plotToViewY(p1.OppositeAxisBounds.Max)
			else
				PlotToViewXResult1 = p2.plotToViewX(p1.OppositeAxisBounds.Min)
				PlotToViewXResult2 = p2.plotToViewX(p1.OppositeAxisBounds.Max)
			end
		end
		local _UDim2 = nil
		local _UDim2_1 = nil
		if p1.Orientation == TypesModule.ORIENTATION_VERTICAL then
			_UDim2 = UDim2.fromScale(PlotToViewXResult, (PlotToViewXResult1 + PlotToViewXResult2) / 2)
			_UDim2_1 = UDim2.new(0, Thickness, PlotToViewXResult2 - PlotToViewXResult1, 0)
		else
			_UDim2 = UDim2.fromScale((PlotToViewXResult1 + PlotToViewXResult2) / 2, PlotToViewXResult)
			_UDim2_1 = UDim2.new(PlotToViewXResult2 - PlotToViewXResult1, 0, 0, Thickness)
		end
		return { position = _UDim2, size = _UDim2_1 }
	end, {
		p1.Orientation,
		p1.Position,
		p1.OppositeAxisBounds,
		Thickness
	})
	
	return if UseViewportVisibilityFunction(function(p2) --[[ Line: 76 ]]
		-- upvalues: p1 (copy), TypesModule (upval)
		return if p1.OppositeAxisBounds then if p1.Orientation == TypesModule.ORIENTATION_VERTICAL then p2.isRectInViewport(Rect.new(p1.Position, p1.OppositeAxisBounds.Min, p1.Position, p1.OppositeAxisBounds.Max)) else p2.isRectInViewport(Rect.new(p1.OppositeAxisBounds.Min, p1.Position, p1.OppositeAxisBounds.Max, p1.Position)) elseif p1.Orientation == TypesModule.ORIENTATION_VERTICAL then p2.isPointInViewportX(p1.Position) else p2.isPointInViewportY(p1.Position)
	end, { p1.Orientation, p1.Position, p1.OppositeAxisBounds }) then ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UseViewportBindingResult:map(function(p2) --[[ Line: 98 ]]
			return p2.position
		end),
		Size = UseViewportBindingResult:map(function(p2) --[[ Line: 101 ]]
			return p2.size
		end),
		BackgroundColor3 = _Color3,
		BackgroundTransparency = Transparency,
		ZIndex = p1.ZIndex
	}, p1.children) else nil
end

return GridLine