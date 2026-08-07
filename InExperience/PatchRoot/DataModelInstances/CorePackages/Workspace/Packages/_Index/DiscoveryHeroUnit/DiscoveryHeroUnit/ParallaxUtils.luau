local parent = script:FindFirstAncestor("DiscoveryHeroUnit").Parent
local reactModule = require(parent.React)
local fFlagLuaAppHeroUnitParallaxUpdates = require(parent.SharedFlags).FFlagLuaAppHeroUnitParallaxUpdates

local function _(p0, p1, p2, p3, p4) --[[ line: 123 | named "customEasing" ]]
	return (1 - p0) ^ 3 * p1 + 3 * (1 - p0) ^ 2 * p0 * p2 + 3 * (1 - p0) * p0 ^ 2 * p3 + p0 ^ 3 * p4
end

return {
	useNormalizedVerticalProgress = function(p5, p6) --[[ line: 55 ]]
		-- upvalues: reactModule (ref)
		local var1, var2 = reactModule.useBinding(-1)
		reactModule.useEffect(function() --[[ line: 62 ]]
			-- upvalues: p5 (ref), p6 (ref), var2 (ref)
			local t = {}
			
			if p5 and p5.current and p6.current then
				local current = p6.current
				local current_1 = p5.current
				local y = current_1.AbsolutePosition.Y
				local y_1 = current_1.AbsoluteWindowSize.Y
				
				local function _() --[[ line: 72 | named "calculateOffset" ]]
					-- upvalues: current (ref), current_1 (ref), y (write)
					return current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y
				end
				
				local var4 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y
				
				local function updateBinding() --[[ line: 79 ]]
					-- upvalues: y_1 (write), var4 (write), current_1 (ref), var2 (copy)
					if y_1 == 0 then
						return
					end
					var2((var4 - current_1.CanvasPosition.Y) / y_1)
				end
				
				local function updateWindowParams() --[[ line: 90 ]]
					-- upvalues: y (write), current_1 (ref), y_1 (write), var4 (write), current (ref), var2 (copy)
					y = current_1.AbsolutePosition.Y
					y_1 = current_1.AbsoluteWindowSize.Y
					var4 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - y
					
					if y_1 == 0 then
						return
					end
					var2((var4 - current_1.CanvasPosition.Y) / y_1)
				end
				
				y_1 = current_1.AbsoluteWindowSize.Y
				var4 = current.AbsolutePosition.Y + current_1.CanvasPosition.Y - current_1.AbsolutePosition.Y
				
				if y_1 ~= 0 then
					var2((var4 - current_1.CanvasPosition.Y) / y_1)
				end
				t = {
					current_1:GetPropertyChangedSignal("AbsolutePosition"):Connect(updateWindowParams),
					current_1:GetPropertyChangedSignal("AbsoluteWindowSize"):Connect(updateWindowParams),
					current_1:GetPropertyChangedSignal("AbsoluteCanvasSize"):Connect(updateWindowParams),
					current_1:GetPropertyChangedSignal("CanvasPosition"):Connect(updateBinding)
				}
			end
			return function() --[[ line: 106 ]]
				-- upvalues: t (write)
				for i, v in t do
					v:Disconnect()
				end
			end
		end, { p6, p5 })
		
		return var1
	end,
	getYPositionOffsetForMotion = function(value, p7, p8, p9) --[[ line: 127 ]]
		-- upvalues: fFlagLuaAppHeroUnitParallaxUpdates (ref)
		if not fFlagLuaAppHeroUnitParallaxUpdates then
			local clampedValue = math.clamp(value, 0, 1)
			local var12 = ((1 - clampedValue) ^ 3 * 0.25 + 3 * (1 - clampedValue) ^ 2 * clampedValue * 0.25 + 3 * (1 - clampedValue) * clampedValue ^ 2 * 0.5 + clampedValue ^ 3 * 1 - 0.25) / 0.75
			
			return p8 * var12 + p7 * (1 - var12)
		end
		local clampedValue = math.clamp(value, -1, 1)
		
		if clampedValue >= 0 then
			local var8 = (1 - clampedValue) ^ 3 * 0 + 3 * (1 - clampedValue) ^ 2 * clampedValue * 0.3 + 3 * (1 - clampedValue) * clampedValue ^ 2 * 0.6 + clampedValue ^ 3 * 1
			
			return p8 * var8 + p9 * (1 - var8)
		end
		local var9 = -clampedValue
		local var10 = (1 - var9) ^ 3 * 0 + 3 * (1 - var9) ^ 2 * var9 * 0.3 + 3 * (1 - var9) * var9 ^ 2 * 0.6 + var9 ^ 3 * 1
		
		return p7 * var10 + p9 * (1 - var10)
	end,
	getNormalizedCenterPosition = if fFlagLuaAppHeroUnitParallaxUpdates then nil else function(p10, p11) --[[ line: 10 | named "getNormalizedCenterPosition" ]]
		if not p11 or not p10 then
			return nil
		end
		local y = p10.AbsoluteWindowSize.Y
		
		return if y == 0 then nil else (p11.AbsolutePosition.Y + p10.CanvasPosition.Y - p10.AbsolutePosition.Y + p11.AbsoluteSize.Y * 0.5 - p10.CanvasPosition.Y) / y
	end,
	getNormalizedTopPosition = if fFlagLuaAppHeroUnitParallaxUpdates then function(p12, p13) --[[ line: 32 | named "getNormalizedTopPosition" ]]
		if not p13 or not p12 then
			return nil
		end
		local y = p12.AbsoluteWindowSize.Y
		
		return if y == 0 then nil else (p13.AbsolutePosition.Y + p12.CanvasPosition.Y - p12.AbsolutePosition.Y - p12.CanvasPosition.Y) / y
	end else nil
}