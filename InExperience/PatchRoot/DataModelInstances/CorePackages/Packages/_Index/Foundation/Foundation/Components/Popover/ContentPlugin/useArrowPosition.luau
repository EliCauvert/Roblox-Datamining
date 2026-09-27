local foundation = script:FindFirstAncestor("Foundation")
local reactModule = require(foundation.Parent.React)
local constantsModule = require(foundation.Constants)
local flagsModule = require(foundation.Utility.Flags)
local popoverSideModule = require(foundation.Enums.PopoverSide)
local radiusModule = require(foundation.Enums.Radius)
local useTokensModule = require(foundation.Providers.Style.useTokens)
local var1 = if flagsModule.FoundationPopoverPluginOverlayMeasurement and flagsModule.FoundationPluginShadowSize then constantsModule.PLUGIN_SHADOW_SIZE else constantsModule.SHADOW_SIZE

return function(p1, p2, p3, p4, p5, p6)
	-- upvalues: useTokensModule (ref), reactModule (ref), radiusModule (ref), popoverSideModule (ref), var1 (ref)
	local var2 = useTokensModule()
	local var3 = reactModule.useMemo(function()
		-- upvalues: p3 (ref), radiusModule (copy), var2 (ref)
		return if p3 == radiusModule.XSmall then var2.Size.Size_50 elseif p3 == radiusModule.Small then var2.Size.Size_100 elseif p3 == radiusModule.Medium then var2.Size.Size_200 elseif p3 == radiusModule.Large then var2.Size.Size_300 else 0
	end, { p3, var2 })
	
	return p1:map(function(p7)
		-- upvalues: var3 (ref), p3 (ref), radiusModule (copy), p5 (ref), p2 (ref), popoverSideModule (copy), p6 (ref), p4 (ref), var1 (copy)
		local var4
		local offset = p7.X.Offset
		local offset_1 = p7.Y.Offset
		local var5 = (if p3 == radiusModule.Circle then math.min(offset, offset_1) / 2 else var3) + p5
		local var6 = if p2 ~= popoverSideModule.Top then p2 == popoverSideModule.Bottom else true
		local var7 = if var6 then offset else offset_1
		local _ = nil
		
		if p6 and typeof(p6) == "Instance" then
			local absoluteSize = p6.AbsoluteSize
			local var8 = if var6 then absoluteSize.X else absoluteSize.Y
			local var9 = if p4 == 0 then 0 elseif p4 == 0.5 then (var7 - var8) / 2 else var7 - var8
			local maxValue = math.max(0, var9)
			local minValue = math.min(var7, var9 + var8)
			var4 = if maxValue <= minValue then (maxValue + minValue) / 2 elseif var7 < var9 then var7 - p5 else p5
		else
			var4 = var7 * p4
		end
		local var10 = var7 - var5
		var4 = if var5 <= var10 then math.clamp(var4, var5, var10) else var7 / 2
		
		return if var6 then UDim2.fromOffset(var1 + var4, var1 + (if p2 == popoverSideModule.Top then offset_1 else 0)) else UDim2.fromOffset(var1 + (if p2 == popoverSideModule.Left then offset else 0), var1 + var4)
	end)
end