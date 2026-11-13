local _ = require("./types")
local _ = require("./navigation_types")
local _ = require("../vendor/compose/core")
local MaterializeModule = require("./materialize")

return function(p1)
	-- upvalues: MaterializeModule (copy)
	local Runtime = p1.runtime
	local TypesUDim2 = p1.types.UDim2
	local TypesVector2 = p1.types.Vector2
	
	return function(Object, Callback, Callback1, p2)
		-- upvalues: p1 (copy), TypesVector2 (copy), TypesUDim2 (copy), Runtime (copy), MaterializeModule (upval)
		local P2 = p2 or {}
		local Rested = P2.rested
		local RiseFunction = P2.rise
		local ParentResult = p1.observe.Parent(Object)
		
		local function position(Callback, Value: number, Value1: number)
			-- upvalues: ParentResult (copy), TypesVector2 (upval), TypesUDim2 (upval)
			local CallbackResult = Callback(ParentResult)
			while CallbackResult and not CallbackResult:IsA("GuiBase2d") do
				CallbackResult = CallbackResult.Parent
			end
			local AbsoluteSize = if CallbackResult and CallbackResult:IsA("GuiBase2d") then CallbackResult.AbsoluteSize else TypesVector2.zero
			local Floored = math.floor(Value)
			local Floored1 = math.floor(Value1)
			
			return TypesUDim2.new(if AbsoluteSize.X > 0 then (Value - Floored) / AbsoluteSize.X else 0, if AbsoluteSize.X > 0 then Floored else Value, if AbsoluteSize.Y > 0 then (Value1 - Floored1) / AbsoluteSize.Y else 0, if AbsoluteSize.Y > 0 then Floored1 else Value1)
		end
		
		local function scale(Callback1)
			-- upvalues: Object (copy), Rested (copy), RiseFunction (copy), P2 (copy), p1 (upval), Callback (copy)
			if Object:HasTag("facet-menu") or Object:HasTag("facet-popover") or Object:HasTag("facet-tooltip") then
				return 1
			elseif Rested and not Callback1(Rested) or RiseFunction and RiseFunction(Callback1) ~= nil then
				return 1
			else
				local From = P2.from or p1.metric("motion.materialize.anchored", Callback1)
				
				return From + (1 - From) * Callback(Callback1)
			end
		end
		
		if P2.pinned then
			local Size = P2.size or p1.observe.AbsoluteSize(Object)
			Runtime.decorate(Object, {
				AnchorPoint = function(Callback)
					-- upvalues: RiseFunction (copy), TypesVector2 (upval), Callback1 (copy), Size (copy)
					if RiseFunction and RiseFunction(Callback) ~= nil then
						return TypesVector2.zero
					else
						local _, CallbackResult2 = Callback1(Callback)
						local CallbackResult = Callback(Size)
						
						return TypesVector2.new(if CallbackResult.X > 0 then math.clamp(CallbackResult2.X / CallbackResult.X, 0, 1) else 0, if CallbackResult.Y > 0 then math.clamp(CallbackResult2.Y / CallbackResult.Y, 0, 1) else 0)
					end
				end,
				Position = function(p3)
					-- upvalues: Callback1 (copy), RiseFunction (copy), position (copy), Callback (copy)
					local CallbackResult, CallbackResult2 = Callback1(p3)
					local RiseResult = if RiseFunction then RiseFunction(p3) else nil
					
					return if RiseResult then position(p3, CallbackResult.X, CallbackResult.Y + RiseResult * (1 - Callback(p3))) else position(p3, CallbackResult.X + CallbackResult2.X, CallbackResult.Y + CallbackResult2.Y)
				end
			})
		else
			Runtime.decorate(Object, {
				Position = function(p3)
					-- upvalues: Callback1 (copy), RiseFunction (copy), position (copy), Callback (copy), scale (copy)
					local CallbackResult, CallbackResult2 = Callback1(p3)
					local RiseResult = if RiseFunction then RiseFunction(p3) else nil
					
					if RiseResult then
						return position(p3, CallbackResult.X, CallbackResult.Y + RiseResult * (1 - Callback(p3)))
					else
						local v1 = 1 - scale(p3)
						
						return position(p3, CallbackResult.X + CallbackResult2.X * v1, CallbackResult.Y + CallbackResult2.Y * v1)
					end
				end
			})
		end
		MaterializeModule(p1, Object, assert(P2.geometry), scale, function(Callback)
			-- upvalues: Callback1 (copy), P2 (copy), Object (copy), TypesVector2 (upval)
			local _, CallbackResult2 = Callback1(Callback)
			local CallbackResult = if P2.size then Callback(P2.size) else Object.AbsoluteSize
			
			return TypesVector2.new(if CallbackResult.X > 0 then CallbackResult2.X / CallbackResult.X else 0.5, if CallbackResult.Y > 0 then CallbackResult2.Y / CallbackResult.Y else 0.5)
		end, Object:HasTag("facet-menu") or (Object:HasTag("facet-popover") or Object:HasTag("facet-tooltip")))
		
		return scale
	end
end