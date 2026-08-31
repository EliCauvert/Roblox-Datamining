local graphing = script:FindFirstAncestor("Graphing")
local reactModule = require(graphing.Parent.React)
local typesModule = require(graphing.Types)
local useViewportBindingModule = require(graphing.Util.useViewportBinding)
local useViewportBinding = useViewportBindingModule.useViewportBinding
local useViewportVisibility = useViewportBindingModule.useViewportVisibility

local function _(p1)
	-- upvalues: typesModule (ref)
	return if p1 ~= typesModule.SIDE_TOP then p1 == typesModule.SIDE_BOTTOM else true
end

function SidePositioner(p1)
	-- upvalues: useViewportBinding (ref), typesModule (ref), useViewportVisibility (ref), reactModule (ref)
	return if useViewportVisibility(function(p2)
		-- upvalues: p1 (ref), typesModule (copy)
		local side = p1.Side
		
		return if if side ~= typesModule.SIDE_TOP then side == typesModule.SIDE_BOTTOM else true then p2.isPointInViewportX(p1.Position) else p2.isPointInViewportY(p1.Position)
	end, { p1.Side, p1.Position }) then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		AnchorPoint = Vector2.new(0.5, 0.5),
		Position = useViewportBinding(function(p2)
			-- upvalues: p1 (ref), typesModule (copy)
			local var1 = 0
			local var2 = 0
			local side = p1.Side
			
			if if side ~= typesModule.SIDE_TOP then side == typesModule.SIDE_BOTTOM else true then
				var1 = p2.plotToViewX(p1.Position)
				
				if p1.Side == typesModule.SIDE_BOTTOM then
					var2 = 1
				end
			else
				var2 = p2.plotToViewY(p1.Position)
				
				if p1.Side == typesModule.SIDE_RIGHT then
					var1 = 1
				end
			end
			return UDim2.fromScale(var1, var2)
		end, { p1.Side, p1.Position }),
		Size = UDim2.fromOffset(0, 0),
		ZIndex = p1.ZIndex
	}, p1.children) else nil
end

return SidePositioner