local signalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)
local fFlagSplitPaneEducationalTourSkipOnDeepLinkModule = require(script.Parent.Parent.Flags.FFlagSplitPaneEducationalTourSkipOnDeepLink)

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref), fFlagSplitPaneEducationalTourSkipOnDeepLinkModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(nil)
	local t = {}
	local var7 = nil
	local var8, var9 = signalsModule.createSignal(false)
	
	local function setTourVisibleCallback(value)
		-- upvalues: var7 (write)
		var7 = value
	end
	
	local var10 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref)
		return var1(p1) > 0
	end)
	local var11, var12 = signalsModule.createSignal(nil)
	local var13, var14 = signalsModule.createSignal(nil)
	
	return {
		getStepIndex = var1,
		setStepIndex = var2,
		getIsOpen = var3,
		setIsOpen = var4,
		getPendingUserId = var5,
		setPendingUserId = var6,
		hasHandledCustomPromptForUser = function(p1)
			-- upvalues: t (ref)
			return t[p1] == true
		end,
		setHasHandledCustomPromptForUser = function(value, p1)
			-- upvalues: t (ref)
			t[value] = p1
		end,
		setOnTourVisible = setTourVisibleCallback,
		notifyTourVisible = function()
			-- upvalues: fFlagSplitPaneEducationalTourSkipOnDeepLinkModule (copy), var9 (ref), var7 (write)
			if fFlagSplitPaneEducationalTourSkipOnDeepLinkModule then
				var9(true)
			end
			var7 = nil
			
			if var7 ~= nil then
				var7()
			end
		end,
		clearOnTourVisible = function()
			-- upvalues: var7 (write)
			var7 = nil
		end,
		getHasShownTour = var8,
		discardPendingTour = function()
			-- upvalues: fFlagSplitPaneEducationalTourSkipOnDeepLinkModule (copy), var9 (ref), var4 (ref), var6 (ref), var7 (write), var2 (ref)
			if fFlagSplitPaneEducationalTourSkipOnDeepLinkModule then
				var9(false)
			end
			var4(false)
			var6(nil)
			var7 = nil
			var2(0)
		end,
		getIsTourActive = var10,
		getCollapsedExpandButtonRect = var11,
		setCollapsedExpandButtonRect = var12,
		getCollapsedExpandButtonInstance = var13,
		setCollapsedExpandButtonInstance = var14,
		reset = function()
			-- upvalues: var2 (ref)
			var2(0)
		end
	}
end)