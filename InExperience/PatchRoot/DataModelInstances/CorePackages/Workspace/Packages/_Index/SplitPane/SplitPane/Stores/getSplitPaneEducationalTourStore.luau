local signalsModule = require(script:FindFirstAncestor("SplitPane").Parent.Signals)

return signalsModule.createComputed(function()
	-- upvalues: signalsModule (ref)
	local var1, var2 = signalsModule.createSignal(0)
	local var3, var4 = signalsModule.createSignal(false)
	local var5, var6 = signalsModule.createSignal(nil)
	local t = {}
	local var7 = nil
	
	local function setTourVisibleCallback(value)
		-- upvalues: var7 (write)
		var7 = value
	end
	
	local var8 = signalsModule.createComputed(function(p1)
		-- upvalues: var1 (ref)
		return var1(p1) > 0
	end)
	local var9, var10 = signalsModule.createSignal(nil)
	local var11, var12 = signalsModule.createSignal(nil)
	
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
			-- upvalues: var7 (write)
			var7 = nil
			
			if var7 ~= nil then
				var7()
			end
		end,
		clearOnTourVisible = function()
			-- upvalues: var7 (write)
			var7 = nil
		end,
		discardPendingTour = function()
			-- upvalues: var4 (ref), var6 (ref), var7 (write), var2 (ref)
			var4(false)
			var6(nil)
			var7 = nil
			var2(0)
		end,
		getIsTourActive = var8,
		getCollapsedExpandButtonRect = var9,
		setCollapsedExpandButtonRect = var10,
		getCollapsedExpandButtonInstance = var11,
		setCollapsedExpandButtonInstance = var12,
		reset = function()
			-- upvalues: var2 (ref)
			var2(0)
		end
	}
end)