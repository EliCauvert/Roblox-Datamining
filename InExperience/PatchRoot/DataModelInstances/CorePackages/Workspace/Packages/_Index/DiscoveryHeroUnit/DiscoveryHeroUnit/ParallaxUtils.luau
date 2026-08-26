local reactModule = require(script:FindFirstAncestor("DiscoveryHeroUnit").Parent.React)

local function _(p1, p2, p3, p4, p5)
	return (1 - p1) ^ 3 * p2 + 3 * (1 - p1) ^ 2 * p1 * p3 + 3 * (1 - p1) * p1 ^ 2 * p4 + p1 ^ 3 * p5
end

return {
	useNormalizedVerticalProgress = function(p1, p2)
		-- upvalues: reactModule (ref)
		local var1, var2 = reactModule.useBinding(-1)
		reactModule.useEffect(function()
			-- upvalues: p1 (ref), p2 (ref), var2 (ref)
			local t = {}
			
			if p1 and p1.current and p2.current then
				local current = p2.current
				local current_1 = p1.current
				local y = current_1.AbsolutePosition.Y
				local y_1 = current_1.AbsoluteWindowSize.Y
				
				local function _()
					-- upvalues: current (ref), current_1 (ref), y (write)
					return current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y
				end
				
				local var3 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y
				
				local function updateBinding()
					-- upvalues: y_1 (write), var3 (write), current_1 (ref), var2 (copy)
					if y_1 == 0 then
						return
					end
					var2((var3 - current_1.CanvasPosition.Y) / y_1)
				end
				
				local function updateWindowParams()
					-- upvalues: y (write), current_1 (ref), y_1 (write), var3 (write), current (ref), var2 (copy)
					y = current_1.AbsolutePosition.Y
					y_1 = current_1.AbsoluteWindowSize.Y
					var3 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y
					
					if y_1 == 0 then
						return
					end
					var2((var3 - current_1.CanvasPosition.Y) / y_1)
				end
				
				y_1 = current_1.AbsoluteWindowSize.Y
				var3 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - current_1.AbsolutePosition.Y
				
				if y_1 ~= 0 then
					var2((var3 - current_1.CanvasPosition.Y) / y_1)
				end
				t = {
					current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams),
					current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams),
					current_1:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateWindowParams),
					current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateBinding)
				}
			end
			return function()
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
			end
		end, { p2, p1 })
		
		return var1
	end,
	getYPositionOffsetForMotion = function(value, p3, p4, p5)
		local clampedValue = math.clamp(value, -1, 1)
		
		if clampedValue >= 0 then
			local var3 = (1 - clampedValue) ^ 3 * 0 + 3 * (1 - clampedValue) ^ 2 * clampedValue * 0.3 + 3 * (1 - clampedValue) * clampedValue ^ 2 * 0.6 + clampedValue ^ 3 * 1
			
			return p4 * var3 + p5 * (1 - var3)
		end
		local var4 = -clampedValue
		local var5 = (1 - var4) ^ 3 * 0 + 3 * (1 - var4) ^ 2 * var4 * 0.3 + 3 * (1 - var4) * var4 ^ 2 * 0.6 + var4 ^ 3 * 1
		
		return p3 * var5 + p5 * (1 - var5)
	end,
	getNormalizedTopPosition = function(p3, p4)
		if not p4 or not p3 then
			return nil
		end
		local y = p3.AbsoluteWindowSize.Y
		
		return if y == 0 then nil else (p4.AbsolutePosition.Y + p3.CanvasPosition.Y - p3.AbsolutePosition.Y - p3.CanvasPosition.Y) / y
	end
}