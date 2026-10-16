local Parent = script:FindFirstAncestor("SplitPane").Parent
local ReactModule = require(Parent.React)
local _ = require(script.Parent.Parent.Stores.getSplitPaneEducationalTourStore)
local _ = require(script.Parent.Parent.Stores.SplitPaneStore)
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode

return function(p1) --[[ Line: 30 | Named "useSplitPaneEducationalTourLifecycle" ]]
	-- upvalues: ReactModule (copy), SupportPaneMode (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(Current) --[[ Line: 35 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		UseRefResult.current = Current
		p1.splitPaneStore.setTemporarySupportPaneMode(Current)
	end, { p1.splitPaneStore })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 39 ]]
		-- upvalues: UseRefResult (copy), p1 (copy)
		local Current = UseRefResult.current
		
		if Current ~= nil and p1.splitPaneStore.getTemporarySupportPaneMode(false) == Current then
			p1.splitPaneStore.setTemporarySupportPaneMode(nil)
		end
		UseRefResult.current = nil
	end, { p1.splitPaneStore })
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 50 ]]
		-- upvalues: p1 (copy), SupportPaneMode (upval), UseResult (copy)
		UseResult(if p1.splitPaneStore.getSupportPaneMode(false) == SupportPaneMode.Expanded then SupportPaneMode.Expanded else SupportPaneMode.Normal)
	end, { p1.splitPaneStore, UseResult })
	ReactModule.useEffect(function() --[[ Line: 58 ]]
		-- upvalues: p1 (copy), UseResult2 (copy)
		if p1.stepIndex == p1.totalSteps then
			UseResult2()
		end
	end, { p1.stepIndex, p1.totalSteps, UseResult2 })
	local UseRefResult2 = ReactModule.useRef(p1.supportPaneMode)
	ReactModule.useEffect(function() --[[ Line: 66 ]]
		-- upvalues: UseResult (copy), UseRefResult2 (copy), UseResult1 (copy)
		UseResult(UseRefResult2.current)
		
		return function() --[[ Line: 68 ]]
			-- upvalues: UseResult1 (upval)
			UseResult1()
		end
	end, { UseResult, UseResult1 })
	ReactModule.useEffect(function() --[[ Line: 73 ]]
		-- upvalues: p1 (copy), UseResult1 (copy)
		if not p1.isSupportSurfaceEligible then
			UseResult1()
			p1.tourStore.reset()
			
			return
		end
	end, { p1.isSupportSurfaceEligible, UseResult1, p1.tourStore })
	local UseRefResult3 = ReactModule.useRef(p1.shouldDefaultToCollapsed)
	ReactModule.useEffect(function() --[[ Line: 84 ]]
		-- upvalues: UseRefResult3 (copy), p1 (copy), UseResult2 (copy)
		local Current = UseRefResult3.current
		UseRefResult3.current = p1.shouldDefaultToCollapsed
		
		if Current and not p1.shouldDefaultToCollapsed then
			UseResult2()
		end
	end, { p1.shouldDefaultToCollapsed, UseResult2 })
	
	return {
		endTour = ReactModule.useCallback(function() --[[ Line: 92 ]]
			-- upvalues: p1 (copy), UseRefResult1 (copy), SupportPaneMode (upval), UseResult1 (copy)
			local SupportPaneMode1 = p1.splitPaneStore.getSupportPaneMode(false)
			
			if UseRefResult1.current and SupportPaneMode1 ~= SupportPaneMode.Collapsed then
				p1.splitPaneStore.setSupportPaneMode(if SupportPaneMode1 == SupportPaneMode.Expanded then SupportPaneMode.Expanded else SupportPaneMode.Normal)
			end
			UseResult1()
			p1.tourStore.discardPendingTour()
		end, { p1.splitPaneStore, p1.tourStore, UseResult1 }),
		handleNext = ReactModule.useCallback(function() --[[ Line: 104 ]]
			-- upvalues: p1 (copy), UseRefResult1 (copy), UseResult (copy), SupportPaneMode (upval)
			local StepIndex: number = p1.tourStore.getStepIndex(false)
			
			if StepIndex == 1 and p1.isSupportPaneCollapsed then
				UseRefResult1.current = true
				UseResult(SupportPaneMode.Normal)
			end
			p1.tourStore.setStepIndex(StepIndex + 1)
		end, { p1.tourStore, p1.isSupportPaneCollapsed, UseResult })
	}
end