local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useTokensModule (ref), reactModule (ref), radiusModule (ref), popoverSideModule (ref), SHADOW_SIZE (ref)
	local var1 = useTokensModule()
	local var2 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), radiusModule (copy), var1 (ref)
		return if p3 == radiusModule.XSmall then var1.Size.Size_50 elseif p3 == radiusModule.Small then var1.Size.Size_100 elseif p3 == radiusModule.Medium then var1.Size.Size_200 elseif p3 == radiusModule.Large then var1.Size.Size_300 else 0
	end, { p3, var1 })
	
	return p1:map(function(p7)
		-- upvalues: var2 (ref), p3 (ref), radiusModule (copy), p5 (ref), p2 (ref), popoverSideModule (copy), p6 (ref), p4 (ref), SHADOW_SIZE (copy)
		local var3
		local offset = p7.X.Offset
		local offset_1 = p7.Y.Offset
		local var4 = (if p3 == radiusModule.Circle then math.min(offset, offset_1) / 2 else var2) + p5
		local var5 = if p2 ~= popoverSideModule.Top then p2 == popoverSideModule.Bottom else true
		local var6 = if var5 then offset else offset_1
		local _ = nil
		
		if p6 and typeof(p6) == "Instance" then
			local absoluteSize = p6.AbsoluteSize
			local var7 = if var5 then absoluteSize.X else absoluteSize.Y
			local var8 = if p4 == 0 then 0 elseif p4 == 0.5 then (var6 - var7) / 2 else var6 - var7
			local maxValue = math.max(0, var8)
			local minValue = math.min(var6, var8 + var7)
			var3 = if maxValue <= minValue then (maxValue + minValue) / 2 elseif var6 < var8 then var6 - p5 else p5
		else
			var3 = var6 * p4
		end
		local var9 = var6 - var4
		var3 = if var4 <= var9 then math.clamp(var3, var4, var9) else var6 / 2
		
		return if var5 then UDim2.fromOffset(SHADOW_SIZE + var3, SHADOW_SIZE + (if p2 == popoverSideModule.Top then offset_1 else 0)) else UDim2.fromOffset(SHADOW_SIZE + (if p2 == popoverSideModule.Left then offset else 0), SHADOW_SIZE + var3)
	end)
end