local parent = script:FindFirstAncestor("SplitPane").Parent
local reactModule = require(parent.React)
local appSplitViewModule = require(parent.AppSplitView)
local _ = require(script.Parent.Parent.Stores.getSplitPaneEducationalTourStore)
local _ = require(script.Parent.Parent.Stores.SplitPaneStore)
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode

return function(p1)
	-- upvalues: reactModule (ref), supportPaneMode (ref)
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(false)
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), p1 (ref)
		var1.current = p2
		p1.splitPaneStore.setTemporarySupportPaneMode(p2)
	end, { p1.splitPaneStore })
	local var4 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref)
		local current = var1.current
		
		if current ~= nil and p1.splitPaneStore.getTemporarySupportPaneMode(false) == current then
			p1.splitPaneStore.setTemporarySupportPaneMode(nil)
		end
		var1.current = nil
	end, { p1.splitPaneStore })
	local var5 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), supportPaneMode (copy), var3 (ref)
		var3(if p1.splitPaneStore.getSupportPaneMode(false) == supportPaneMode.Expanded then supportPaneMode.Expanded else supportPaneMode.Normal)
	end, { p1.splitPaneStore, var3 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref)
		if p1.stepIndex == p1.totalSteps then
			var5()
		end
	end, { p1.stepIndex, p1.totalSteps, var5 })
	local var6 = reactModule.useRef(p1.supportPaneMode)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), var6 (ref), var4 (ref)
		var3(var6.current)
		
		return function()
			-- upvalues: var4 (copy)
			var4()
		end
	end, { var3, var4 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref)
		if p1.isSupportSurfaceEligible then
			return
		end
		var4()
		p1.tourStore.reset()
	end, { p1.isSupportSurfaceEligible, var4, p1.tourStore })
	local var7 = reactModule.useRef(p1.shouldDefaultToCollapsed)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p1 (ref), var5 (ref)
		local current = var7.current
		var7.current = p1.shouldDefaultToCollapsed
		
		if current and not p1.shouldDefaultToCollapsed then
			var5()
		end
	end, { p1.shouldDefaultToCollapsed, var5 })
	
	return {
		endTour = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var2 (ref), supportPaneMode (copy), var4 (ref)
			local supportPaneMode_1 = p1.splitPaneStore.getSupportPaneMode(false)
			
			if var2.current and supportPaneMode_1 ~= supportPaneMode.Collapsed then
				p1.splitPaneStore.setSupportPaneMode(if supportPaneMode_1 == supportPaneMode.Expanded then supportPaneMode.Expanded else supportPaneMode.Normal)
			end
			var4()
			p1.tourStore.discardPendingTour()
		end, { p1.splitPaneStore, p1.tourStore, var4 }),
		handleNext = reactModule.useCallback(function()
			-- upvalues: p1 (ref), var2 (ref), var3 (ref), supportPaneMode (copy)
			local stepIndex = p1.tourStore.getStepIndex(false)
			
			if stepIndex == 1 and p1.isSupportPaneCollapsed then
				var2.current = true
				var3(supportPaneMode.Normal)
			end
			p1.tourStore.setStepIndex(stepIndex + 1)
		end, { p1.tourStore, p1.isSupportPaneCollapsed, var3 })
	}
end