local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local reactModule = require(inExperienceShop.Parent.React)
local fIntScanFrequencyInExperienceShopModule = require(inExperienceShop.Flags.FIntScanFrequencyInExperienceShop)
local isShopInstanceVisibleModule = require(script.Parent.isShopInstanceVisible)

return function(p1)
	-- upvalues: reactModule (ref), fIntScanFrequencyInExperienceShopModule (ref), isShopInstanceVisibleModule (ref)
	local var1 = reactModule.useRef(true)
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(nil)
	local scanDebounceSeconds = p1.scanDebounceSeconds or fIntScanFrequencyInExperienceShopModule
	local var4 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		return if p1.getViewPortBounds then p1.getViewPortBounds() else p1.viewPortBounds
	end, { p1.getViewPortBounds, p1.viewPortBounds })
	local var5 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), p1 (ref), var4 (ref), isShopInstanceVisibleModule (copy), var2 (ref)
		if not var1.current then return end
		if p1.pageFilter and not p1.pageFilter(nil) then return end
		local var6 = var4()
		
		if var6 == nil then return end
		local current = p1.parentRef and p1.parentRef.current
		
		if not current or not isShopInstanceVisibleModule(current, var6) then return end
		var2.current = tick()
		local t = {}
		local collectObjectsFunc = p1.collectObjectsFunc
		
		for i, v in if collectObjectsFunc then collectObjectsFunc(current) else current:GetChildren() do
			if v:IsA("GuiObject") and isShopInstanceVisibleModule(v, var6) and (p1.filterImpressionFunc == nil or p1.filterImpressionFunc(v)) then
				table.insert(t, v)
			end
		end
		if #t > 0 then
			p1.onImpressionsDetected(t)
		end
	end, {
		p1.parentRef, p1.pageFilter, p1.collectObjectsFunc, p1.filterImpressionFunc,
		p1.onImpressionsDetected, var4
	})
	local var7 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var3 (ref), p1 (ref), var2 (ref), scanDebounceSeconds (ref), var5 (ref)
		if not var1.current then return end
		if var3.current ~= nil then return end
		if not p1.parentRef or not p1.parentRef.current then return end
		local var8 = 0
		local current = var2.current
		
		if current ~= nil then
			local var9 = current + scanDebounceSeconds
			var3.current = var9
			var8 = var9 - tick()
		end
		if var8 > 0 then
			task.delay(var8, function()
				-- upvalues: var1 (copy), var3 (copy), var5 (copy)
				if not var1.current then return end
				if var3.current ~= nil and var3.current < tick() then
					var3.current = nil
					var5()
				end
			end)
			
			return
		end
		var3.current = nil
		var5()
	end, { p1.parentRef, scanDebounceSeconds, var5 })
	reactModule.useEffect(function()
		-- upvalues: var1 (ref), var7 (ref), p1 (ref)
		var1.current = true
		var7()
		local onRequestImpressionsSignalConnection = p1.onRequestImpressionsSignal:connect(function()
			-- upvalues: var7 (copy)
			var7()
		end)
		
		return function()
			-- upvalues: var1 (copy), onRequestImpressionsSignalConnection (ref)
			var1.current = false
			onRequestImpressionsSignalConnection:disconnect()
		end
	end, { p1.onRequestImpressionsSignal, var7 })
	reactModule.useEffect(function()
		-- upvalues: var7 (ref)
		var7()
	end, { var4, var7 })
	
	return nil
end