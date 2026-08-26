local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local styleUtilModule = require(graphing.Util.StyleUtil)
local typesModule = require(graphing.Types)
local useViewportBindingModule = require(graphing.Util.useViewportBinding)
local useViewportBinding = useViewportBindingModule.useViewportBinding
local useViewportVisibility = useViewportBindingModule.useViewportVisibility

function GridLine(p1)
	-- upvalues: typesModule (ref), styleUtilModule (ref), useViewportBinding (ref), useViewportVisibility (ref), reactModule (ref)
	assert(if p1.Orientation ~= typesModule.ORIENTATION_VERTICAL then p1.Orientation == typesModule.ORIENTATION_HORIZONTAL else true, `Invalid orientation {p1.Orientation}`)
	local color3 = p1.Color3 or styleUtilModule.GRID_LINE_COLOR3
	local transparency = p1.Transparency or styleUtilModule.GRID_LINE_TRANSPARENCY
	local thickness = p1.Thickness or styleUtilModule.GRID_LINE_THICKNESS
	local var1 = useViewportBinding(function(p2)
		-- upvalues: p1 (ref), typesModule (copy), thickness (ref)
		local var2 = if p1.Orientation == typesModule.ORIENTATION_VERTICAL then p2.plotToViewX(p1.Position) else p2.plotToViewY(p1.Position)
		local var3 = 0
		local var4 = 1
		
		if p1.OppositeAxisBounds then
			if p1.Orientation == typesModule.ORIENTATION_VERTICAL then
				var3 = p2.plotToViewY(p1.OppositeAxisBounds.Min)
				var4 = p2.plotToViewY(p1.OppositeAxisBounds.Max)
			else
				var3 = p2.plotToViewX(p1.OppositeAxisBounds.Min)
				var4 = p2.plotToViewX(p1.OppositeAxisBounds.Max)
			end
		end
		local uDim2, uDim2_1
		local _ = nil
		local _ = nil
		
		if p1.Orientation == typesModule.ORIENTATION_VERTICAL then
			uDim2 = UDim2.fromScale(var2, (var3 + var4) / 2)
			uDim2_1 = UDim2.new(0, thickness, var4 - var3, 0)
		else
			uDim2 = UDim2.fromScale((var3 + var4) / 2, var2)
			uDim2_1 = UDim2.new(var4 - var3, 0, 0, thickness)
		end
		return { position = uDim2, size = uDim2_1 }
	end, {
		p1.Orientation,
		p1.Position,
		p1.OppositeAxisBounds,
		thickness
	})
	
	return if useViewportVisibility(function(p2)
		-- upvalues: p1 (ref), typesModule (copy)
		return if p1.OppositeAxisBounds then if p1.Orientation == typesModule.ORIENTATION_VERTICAL then p2.isRectInViewport(Rect.new(p1.Position, p1.OppositeAxisBounds.Min, p1.Position, p1.OppositeAxisBounds.Max)) else p2.isRectInViewport(Rect.new(p1.OppositeAxisBounds.Min, p1.Position, p1.OppositeAxisBounds.Max, p1.Position)) elseif p1.Orientation == typesModule.ORIENTATION_VERTICAL then p2.isPointInViewportX(p1.Position) else p2.isPointInViewportY(p1.Position)
	end, { p1.Orientation, p1.Position, p1.OppositeAxisBounds }) then reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = var1:map(function(p2)
			return p2.position
		end),
		Size = var1:map(function(p2)
			return p2.size
		end),
		BackgroundColor3 = color3,
		BackgroundTransparency = transparency,
		ZIndex = p1.ZIndex
	}, p1.children) else nil
end

return GridLine