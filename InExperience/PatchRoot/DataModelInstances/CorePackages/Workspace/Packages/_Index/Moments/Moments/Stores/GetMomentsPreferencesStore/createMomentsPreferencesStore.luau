local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local getFFlagMomentsFeedStartExpandedModule = require(moments.Flags.GetFFlagMomentsFeedStartExpanded)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function()
	-- upvalues: createSignal (ref), getFFlagMomentsFeedStartExpandedModule (ref), createComputed (ref), fFlagEnableArgus (ref)
	local var1, var2 = createSignal(not getFFlagMomentsFeedStartExpandedModule())
	local var3, var4 = createSignal(false)
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(false)
	
	return {
		getMinimized = var1,
		getMediaScaleType = createComputed(function(p1)
			-- upvalues: var1 (ref)
			return if var1(p1) then Enum.ScaleType.Fit else Enum.ScaleType.Crop
		end),
		toggleFeedScaleType = function()
			-- upvalues: fFlagEnableArgus (copy), var2 (ref), var1 (ref)
			if fFlagEnableArgus then
				var2(not var1(false))
			end
		end,
		getFeedGlobalMute = var3,
		toggleFeedGlobalMute = function()
			-- upvalues: fFlagEnableArgus (copy), var4 (ref), var3 (ref)
			if fFlagEnableArgus then
				var4(not var3(false))
			end
		end,
		getDebugModeEnabled = var5,
		toggleFeedDebugMode = function()
			-- upvalues: fFlagEnableArgus (copy), var6 (ref), var5 (ref)
			if fFlagEnableArgus then
				var6(not var5(false))
			end
		end,
		getIsTeleporting = var7,
		setTeleporting = function(value)
			-- upvalues: var8 (ref)
			var8(value)
		end
	}
end