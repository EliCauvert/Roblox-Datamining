local SignalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)
local FFlagSplitPaneEducationalTourSkipOnDeepLinkModule = require(script.Parent.Parent.Flags.FFlagSplitPaneEducationalTourSkipOnDeepLink)

return SignalsModule.createComputed(function() --[[ Line: 35 ]]
	-- upvalues: SignalsModule (copy), FFlagSplitPaneEducationalTourSkipOnDeepLinkModule (copy)
	local Signal, Signal2 = SignalsModule.createSignal(0)
	local Signal1, Signal2_1 = SignalsModule.createSignal(false)
	local Signal3, Signal2_2 = SignalsModule.createSignal(nil)
	local t = {}
	local TourVisibleCallback = nil
	local Signal4, Signal2_3 = SignalsModule.createSignal(false)
	
	local function setTourVisibleCallback(Value) --[[ Line: 47 ]]
		-- upvalues: TourVisibleCallback (ref)
		TourVisibleCallback = Value
	end
	
	local Computed = SignalsModule.createComputed(function(p1): boolean --[[ Line: 51 ]]
		-- upvalues: Signal (copy)
		return Signal(p1) > 0
	end)
	local Signal5, Signal2_4 = SignalsModule.createSignal(nil)
	local Signal6, Signal2_5 = SignalsModule.createSignal(nil)
	
	return {
		getStepIndex = Signal,
		setStepIndex = Signal2,
		getIsOpen = Signal1,
		setIsOpen = Signal2_1,
		getPendingUserId = Signal3,
		setPendingUserId = Signal2_2,
		hasHandledCustomPromptForUser = function(p1): boolean --[[ Line: 69 ]]
			-- upvalues: t (copy)
			return t[p1] == true
		end,
		setHasHandledCustomPromptForUser = function(Key, p1) --[[ Line: 72 ]]
			-- upvalues: t (copy)
			t[Key] = p1
		end,
		setOnTourVisible = setTourVisibleCallback,
		notifyTourVisible = function() --[[ Line: 76 ]]
			-- upvalues: FFlagSplitPaneEducationalTourSkipOnDeepLinkModule (upval), Signal2_3 (copy), TourVisibleCallback (ref)
			if FFlagSplitPaneEducationalTourSkipOnDeepLinkModule then
				Signal2_3(true)
			end
			local Callback: () -> () = TourVisibleCallback
			TourVisibleCallback = nil
			
			if Callback ~= nil then
				Callback()
			end
		end,
		clearOnTourVisible = function() --[[ Line: 86 ]]
			-- upvalues: TourVisibleCallback (ref)
			TourVisibleCallback = nil
		end,
		getHasShownTour = Signal4,
		discardPendingTour = function() --[[ Line: 90 ]]
			-- upvalues: FFlagSplitPaneEducationalTourSkipOnDeepLinkModule (upval), Signal2_3 (copy), Signal2_1 (copy), Signal2_2 (copy), TourVisibleCallback (ref), Signal2 (copy)
			if FFlagSplitPaneEducationalTourSkipOnDeepLinkModule then
				Signal2_3(false)
			end
			Signal2_1(false)
			Signal2_2(nil)
			TourVisibleCallback = nil
			Signal2(0)
		end,
		getIsTourActive = Computed,
		getCollapsedExpandButtonRect = Signal5,
		setCollapsedExpandButtonRect = Signal2_4,
		getCollapsedExpandButtonInstance = Signal6,
		setCollapsedExpandButtonInstance = Signal2_5,
		reset = function() --[[ Line: 58 ]]
			-- upvalues: Signal2 (copy)
			Signal2(0)
		end
	}
end)