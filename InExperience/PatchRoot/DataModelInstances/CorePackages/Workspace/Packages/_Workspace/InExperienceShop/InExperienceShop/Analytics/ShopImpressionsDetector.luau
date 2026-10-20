local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local ReactModule = require(InExperienceShop.Parent.React)
local FIntScanFrequencyInExperienceShopModule = require(InExperienceShop.Flags.FIntScanFrequencyInExperienceShop)
local IsShopInstanceVisibleModule = require(script.Parent.isShopInstanceVisible)

return function(p1)
	-- upvalues: ReactModule (copy), FIntScanFrequencyInExperienceShopModule (copy), IsShopInstanceVisibleModule (copy)
	local UseRefResult = ReactModule.useRef(true)
	local UseRefResult1 = ReactModule.useRef(nil)
	local UseRefResult2 = ReactModule.useRef(nil)
	local ScanDebounceSeconds = p1.scanDebounceSeconds or FIntScanFrequencyInExperienceShopModule
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		return if p1.getViewPortBounds then p1.getViewPortBounds() else p1.viewPortBounds
	end, { p1.getViewPortBounds, p1.viewPortBounds })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), p1 (copy), UseResult (copy), IsShopInstanceVisibleModule (upval), UseRefResult1 (copy)
		if not UseRefResult.current then return end
		if p1.pageFilter and not p1.pageFilter(nil) then return end
		local UseResultResult = UseResult()
		
		if UseResultResult == nil then return end
		local Current = p1.parentRef and p1.parentRef.current
		
		if not Current or not IsShopInstanceVisibleModule(Current, UseResultResult) then return end
		UseRefResult1.current = tick()
		local Guis = {}
		local CollectObjectsFuncFunction = p1.collectObjectsFunc
		local CollectObjectsFuncResult = if CollectObjectsFuncFunction then CollectObjectsFuncFunction(Current) else Current:GetChildren()
		for _, Gui in CollectObjectsFuncResult do
			if Gui:IsA("GuiObject") and IsShopInstanceVisibleModule(Gui, UseResultResult) and (p1.filterImpressionFunc == nil or p1.filterImpressionFunc(Gui)) then
				table.insert(Guis, Gui)
			end
		end
		if #Guis > 0 then
			p1.onImpressionsDetected(Guis)
		end
	end, {
		p1.parentRef, p1.pageFilter, p1.collectObjectsFunc, p1.filterImpressionFunc,
		p1.onImpressionsDetected, UseResult
	})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy), UseRefResult2 (copy), p1 (copy), UseRefResult1 (copy), ScanDebounceSeconds (copy), UseResult1 (copy)
		if not UseRefResult.current then return end
		if UseRefResult2.current ~= nil then return end
		if not p1.parentRef or not p1.parentRef.current then return end
		local Delay = 0
		local Current = UseRefResult1.current
		
		if Current ~= nil then
			local NewCurrent = Current + ScanDebounceSeconds
			UseRefResult2.current = NewCurrent
			Delay = NewCurrent - tick()
		end
		if Delay > 0 then
			task.delay(Delay, function()
				-- upvalues: UseRefResult (upval), UseRefResult2 (upval), UseResult1 (upval)
				if not UseRefResult.current then return end
				if UseRefResult2.current ~= nil and UseRefResult2.current < tick() then
					UseRefResult2.current = nil
					UseResult1()
				end
			end)
			
			return
		else
			UseRefResult2.current = nil
			UseResult1()
		end
	end, { p1.parentRef, ScanDebounceSeconds, UseResult1 })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult (copy), UseResult2 (copy), p1 (copy)
		UseRefResult.current = true
		UseResult2()
		local OnRequestImpressionsSignalConnection = p1.onRequestImpressionsSignal:connect(function()
			-- upvalues: UseResult2 (upval)
			UseResult2()
		end)
		
		return function()
			-- upvalues: UseRefResult (upval), OnRequestImpressionsSignalConnection (copy)
			UseRefResult.current = false
			OnRequestImpressionsSignalConnection:disconnect()
		end
	end, { p1.onRequestImpressionsSignal, UseResult2 })
	ReactModule.useEffect(function()
		-- upvalues: UseResult2 (copy)
		UseResult2()
	end, { UseResult, UseResult2 })
	
	return nil
end