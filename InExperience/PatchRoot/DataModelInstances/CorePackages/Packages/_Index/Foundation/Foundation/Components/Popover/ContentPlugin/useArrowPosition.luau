local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local PopoverSideModule = require(Foundation.Enums.PopoverSide)
local RadiusModule = require(Foundation.Enums.Radius)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local PLUGINSHADOWSIZE = if FlagsModule.FoundationPopoverPluginOverlayMeasurement and FlagsModule.FoundationPluginShadowSize then ConstantsModule.PLUGIN_SHADOW_SIZE else ConstantsModule.SHADOW_SIZE

return function(p1, Top, Circle, p2, p3, Frame) --[[ Line: 19 | Named "useArrowPosition" ]]
	-- upvalues: UseTokensModule (copy), ReactModule (copy), RadiusModule (copy), PopoverSideModule (copy), PLUGINSHADOWSIZE (copy)
	local UseTokensModuleResult = UseTokensModule()
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 28 ]]
		-- upvalues: Circle (copy), RadiusModule (upval), UseTokensModuleResult (copy)
		return if Circle == RadiusModule.XSmall then UseTokensModuleResult.Size.Size_50 elseif Circle == RadiusModule.Small then UseTokensModuleResult.Size.Size_100 elseif Circle == RadiusModule.Medium then UseTokensModuleResult.Size.Size_200 elseif Circle == RadiusModule.Large then UseTokensModuleResult.Size.Size_300 else 0
	end, { Circle, UseTokensModuleResult })
	
	return p1:map(function(Vector): UDim2 --[[ Line: 42 ]]
		-- upvalues: UseMemoResult (copy), Circle (copy), RadiusModule (upval), p3 (copy), Top (copy), PopoverSideModule (upval), Frame (copy), p2 (copy), PLUGINSHADOWSIZE (upval)
		local Offset: number = Vector.X.Offset
		local Offset1: number = Vector.Y.Offset
		local MinValue = (if Circle == RadiusModule.Circle then math.min(Offset, Offset1) / 2 else UseMemoResult) + p3
		local IsTopMatch: boolean = Top == PopoverSideModule.Top or Top == PopoverSideModule.Bottom
		local Offset2: number = if IsTopMatch then Offset else Offset1
		local Value = nil
		
		if Frame and typeof(Frame) == "Instance" then
			local AbsoluteSize = Frame.AbsoluteSize
			local X = if IsTopMatch then AbsoluteSize.X else AbsoluteSize.Y
			local OffsetRatio: number = if p2 == 0 then 0 elseif p2 == 0.5 then (Offset2 - X) / 2 else Offset2 - X
			local Largest = math.max(0, OffsetRatio)
			local Smallest = math.min(Offset2, OffsetRatio + X)
			Value = if Largest <= Smallest then (Largest + Smallest) / 2 elseif Offset2 < OffsetRatio then Offset2 - p3 else p3
		else
			Value = Offset2 * p2
		end
		local MaxValue = Offset2 - MinValue
		local ClampedValue: number = if MinValue <= MaxValue then math.clamp(Value, MinValue, MaxValue) else Offset2 / 2
		
		return if IsTopMatch then UDim2.fromOffset(PLUGINSHADOWSIZE + ClampedValue, PLUGINSHADOWSIZE + (if Top == PopoverSideModule.Top then Offset1 else 0)) else UDim2.fromOffset(PLUGINSHADOWSIZE + (if Top == PopoverSideModule.Left then Offset else 0), PLUGINSHADOWSIZE + ClampedValue)
	end)
end