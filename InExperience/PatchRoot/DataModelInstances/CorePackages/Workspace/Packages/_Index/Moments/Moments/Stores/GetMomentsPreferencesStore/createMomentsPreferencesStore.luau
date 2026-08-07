local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local signalsModule = require(parent.Signals)
local fFlagEnableArgus = require(parent.SharedFlags).FFlagEnableArgus
local getFFlagMomentsFeedStartExpandedModule = require(moments.Flags.GetFFlagMomentsFeedStartExpanded)
local createSignal = signalsModule.createSignal
local createComputed = signalsModule.createComputed

return function() --[[ line: 50 | named "createMomentsPreferencesStore" ]]
	-- upvalues: createSignal (ref), getFFlagMomentsFeedStartExpandedModule (ref), createComputed (ref), fFlagEnableArgus (ref)
	local var3, var4 = createSignal(not getFFlagMomentsFeedStartExpandedModule())
	local var5, var6 = createSignal(false)
	local var7, var8 = createSignal(false)
	local var9, var10 = createSignal(false)
	
	return {
		getMinimized = var3,
		getMediaScaleType = createComputed(function(p0) --[[ line: 61 ]]
			-- upvalues: var3 (ref)
			return if var3(p0) then Enum.ScaleType.Fit else Enum.ScaleType.Crop
		end),
		toggleFeedScaleType = function() --[[ line: 69 ]]
			-- upvalues: fFlagEnableArgus (copy), var4 (ref), var3 (ref)
			if fFlagEnableArgus then
				var4(not var3(false))
			end
		end,
		getFeedGlobalMute = var5,
		toggleFeedGlobalMute = function() --[[ line: 75 ]]
			-- upvalues: fFlagEnableArgus (copy), var6 (ref), var5 (ref)
			if fFlagEnableArgus then
				var6(not var5(false))
			end
		end,
		getDebugModeEnabled = var7,
		toggleFeedDebugMode = function() --[[ line: 81 ]]
			-- upvalues: fFlagEnableArgus (copy), var8 (ref), var7 (ref)
			if fFlagEnableArgus then
				var8(not var7(false))
			end
		end,
		getIsTeleporting = var9,
		setTeleporting = function(value) --[[ line: 65 ]]
			-- upvalues: var10 (ref)
			var10(value)
		end
	}
end