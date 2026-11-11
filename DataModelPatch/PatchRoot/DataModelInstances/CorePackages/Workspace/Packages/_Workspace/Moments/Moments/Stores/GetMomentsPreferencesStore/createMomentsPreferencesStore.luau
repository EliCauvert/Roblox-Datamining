local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local SignalsModule = require(Parent.Signals)
local FFlagEnableArgus = require(Parent.SharedFlags).FFlagEnableArgus
local GetFFlagMomentsFeedStartExpandedModule = require(Moments.Flags.GetFFlagMomentsFeedStartExpanded)
local CreateSignalFunction = SignalsModule.createSignal
local CreateComputedFunction = SignalsModule.createComputed

return function()
	-- upvalues: CreateSignalFunction (copy), GetFFlagMomentsFeedStartExpandedModule (copy), CreateComputedFunction (copy), FFlagEnableArgus (copy)
	local Signal, Signal2 = CreateSignalFunction(not GetFFlagMomentsFeedStartExpandedModule())
	local Signal1, Signal2_1 = CreateSignalFunction(false)
	local Signal3, Signal2_2 = CreateSignalFunction(false)
	local Signal4, Signal2_3 = CreateSignalFunction(false)
	
	return {
		getMinimized = Signal,
		getMediaScaleType = CreateComputedFunction(function(p1)
			-- upvalues: Signal (copy)
			return if Signal(p1) then Enum.ScaleType.Fit else Enum.ScaleType.Crop
		end),
		toggleFeedScaleType = function()
			-- upvalues: FFlagEnableArgus (upval), Signal2 (copy), Signal (copy)
			if FFlagEnableArgus then
				Signal2(not Signal(false))
			end
		end,
		getFeedGlobalMute = Signal1,
		toggleFeedGlobalMute = function()
			-- upvalues: FFlagEnableArgus (upval), Signal2_1 (copy), Signal1 (copy)
			if FFlagEnableArgus then
				Signal2_1(not Signal1(false))
			end
		end,
		getDebugModeEnabled = Signal3,
		toggleFeedDebugMode = function()
			-- upvalues: FFlagEnableArgus (upval), Signal2_2 (copy), Signal3 (copy)
			if FFlagEnableArgus then
				Signal2_2(not Signal3(false))
			end
		end,
		getIsTeleporting = Signal4,
		setTeleporting = function(p1)
			-- upvalues: Signal2_3 (copy)
			Signal2_3(p1)
		end
	}
end