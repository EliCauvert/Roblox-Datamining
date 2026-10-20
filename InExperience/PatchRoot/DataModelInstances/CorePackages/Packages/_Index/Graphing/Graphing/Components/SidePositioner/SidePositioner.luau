local Graphing = script:FindFirstAncestor("Graphing")
local ReactModule = require(Graphing.Parent.React)
local TypesModule = require(Graphing.Types)
local UseViewportBindingModule = require(Graphing.Util.useViewportBinding)
local UseViewportBindingFunction = UseViewportBindingModule.useViewportBinding
local UseViewportVisibilityFunction = UseViewportBindingModule.useViewportVisibility

local function _(SIDEBOTTOM): boolean
	-- upvalues: TypesModule (copy)
	return SIDEBOTTOM == TypesModule.SIDE_TOP or SIDEBOTTOM == TypesModule.SIDE_BOTTOM
end

function SidePositioner(p1)
	-- upvalues: UseViewportBindingFunction (copy), TypesModule (copy), UseViewportVisibilityFunction (copy), ReactModule (copy)
	local UseViewportBindingResult = UseViewportBindingFunction(function(p2): UDim2
		-- upvalues: p1 (copy), TypesModule (upval)
		local XScale = 0
		local YScale = 0
		local Side = p1.Side
		
		if Side == TypesModule.SIDE_TOP or Side == TypesModule.SIDE_BOTTOM then
			XScale = p2.plotToViewX(p1.Position)
			
			if p1.Side == TypesModule.SIDE_BOTTOM then
				YScale = 1
			end
		else
			YScale = p2.plotToViewY(p1.Position)
			
			if p1.Side == TypesModule.SIDE_RIGHT then
				XScale = 1
			end
		end
		return UDim2.fromScale(XScale, YScale)
	end, { p1.Side, p1.Position })
	
	return if UseViewportVisibilityFunction(function(p2)
		-- upvalues: p1 (copy), TypesModule (upval)
		local Side = p1.Side
		local IsSideMatch: boolean = Side == TypesModule.SIDE_TOP or Side == TypesModule.SIDE_BOTTOM
		
		return if IsSideMatch then p2.isPointInViewportX(p1.Position) else p2.isPointInViewportY(p1.Position)
	end, { p1.Side, p1.Position }) then ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = UseViewportBindingResult,
		Size = UDim2.fromOffset(0, 0),
		ZIndex = p1.ZIndex
	}, p1.children) else nil
end

return SidePositioner