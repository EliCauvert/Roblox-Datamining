local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local SHADOW_SIZE = constantsModule.SHADOW_SIZE

return function(p0, p1, p2, p3, p4, p5)
	-- upvalues: useTokensModule (ref), reactModule (ref), radiusModule (ref), popoverSideModule (ref), SHADOW_SIZE (ref)
	local var6 = useTokensModule()
	local var7 = reactModule.useMemo(function()
		-- upvalues: p2 (ref), radiusModule (copy), var6 (ref)
		return if p2 == radiusModule.XSmall then var6.Size.Size_50 elseif p2 == radiusModule.Small then var6.Size.Size_100 elseif p2 == radiusModule.Medium then var6.Size.Size_200 elseif p2 == radiusModule.Large then var6.Size.Size_300 else 0
	end, { p2, var6 })
	
	return p0:map(function(p6)
		-- upvalues: var7 (ref), p2 (ref), radiusModule (copy), p4 (ref), p1 (ref), popoverSideModule (copy), p5 (ref), p3 (ref), SHADOW_SIZE (copy)
		local var11
		local offset = p6.X.Offset
		local offset_1 = p6.Y.Offset
		local var8 = (if p2 == radiusModule.Circle then math.min(offset, offset_1) / 2 else var7) + p4
		local var9 = if p1 ~= popoverSideModule.Top then p1 == popoverSideModule.Bottom else true
		local var10 = if var9 then offset else offset_1
		local _ = nil
		
		if p5 and typeof(p5) == "Instance" then
			local absoluteSize = p5.AbsoluteSize
			local var12 = if var9 then absoluteSize.X else absoluteSize.Y
			local var13 = if p3 == 0 then 0 elseif p3 == 0.5 then (var10 - var12) / 2 else var10 - var12
			local maxValue = math.max(0, var13)
			local minValue = math.min(var10, var13 + var12)
			var11 = if maxValue <= minValue then (maxValue + minValue) / 2 elseif var10 < var13 then var10 - p4 else p4
		else
			var11 = var10 * p3
		end
		local var16 = var10 - var8
		var11 = if var8 <= var16 then math.clamp(var11, var8, var16) else var10 / 2
		
		return if var9 then UDim2.fromOffset(SHADOW_SIZE + var11, SHADOW_SIZE + (if p1 == popoverSideModule.Top then offset_1 else 0)) else UDim2.fromOffset(SHADOW_SIZE + (if p1 == popoverSideModule.Left then offset else 0), SHADOW_SIZE + var11)
	end)
end