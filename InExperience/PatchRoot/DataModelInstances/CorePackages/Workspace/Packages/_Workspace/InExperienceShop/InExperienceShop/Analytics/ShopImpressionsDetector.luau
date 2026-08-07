local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local reactModule = require(inExperienceShop.Parent.React)
local fIntScanFrequencyInExperienceShopModule = require(inExperienceShop.Flags.FIntScanFrequencyInExperienceShop)
local isShopInstanceVisibleModule = require(script.Parent.isShopInstanceVisible)

return function(p0) --[[ line: 25 | named "ShopImpressionsDetector" ]]
	-- upvalues: reactModule (ref), fIntScanFrequencyInExperienceShopModule (ref), isShopInstanceVisibleModule (ref)
	local var4 = reactModule.useRef(true)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local scanDebounceSeconds = p0.scanDebounceSeconds or fIntScanFrequencyInExperienceShopModule
	local var8 = reactModule.useCallback(function() --[[ line: 32 ]]
		-- upvalues: p0 (ref)
		return if p0.getViewPortBounds then p0.getViewPortBounds() else p0.viewPortBounds
	end, { p0.getViewPortBounds, p0.viewPortBounds })
	local var9 = reactModule.useCallback(function() --[[ line: 40 ]]
		-- upvalues: var4 (ref), p0 (ref), var8 (ref), isShopInstanceVisibleModule (copy), var5 (ref)
		if not var4.current then return end
		if p0.pageFilter and not p0.pageFilter(nil) then return end
		local var11 = var8()
		
		if var11 == nil then return end
		local current = p0.parentRef and p0.parentRef.current
		
		if not current or not isShopInstanceVisibleModule(current, var11) then return end
		var5.current = tick()
		local t = {}
		local collectObjectsFunc = p0.collectObjectsFunc
		
		for i, v in if collectObjectsFunc then collectObjectsFunc(current) else current:GetChildren() do
			if v:IsA("GuiObject") and isShopInstanceVisibleModule(v, var11) and (p0.filterImpressionFunc == nil or p0.filterImpressionFunc(v)) then
				table.insert(t, v)
			end
		end
		if #t > 0 then
			p0.onImpressionsDetected(t)
		end
	end, {
		p0.parentRef, p0.pageFilter, p0.collectObjectsFunc, p0.filterImpressionFunc,
		p0.onImpressionsDetected, var8
	})
	local var10 = reactModule.useCallback(function() --[[ line: 90 ]]
		-- upvalues: var4 (ref), var6 (ref), p0 (ref), var5 (ref), scanDebounceSeconds (ref), var9 (ref)
		if not var4.current then return end
		if var6.current ~= nil then return end
		if not p0.parentRef or not p0.parentRef.current then return end
		local var14 = 0
		local current = var5.current
		
		if current ~= nil then
			local var15 = current + scanDebounceSeconds
			var6.current = var15
			var14 = var15 - tick()
		end
		if var14 > 0 then
			task.delay(var14, function() --[[ line: 112 ]]
				-- upvalues: var4 (copy), var6 (copy), var9 (copy)
				if not var4.current then return end
				if var6.current ~= nil and var6.current < tick() then
					var6.current = nil
					var9()
				end
			end)
			
			return
		end
		var6.current = nil
		var9()
	end, { p0.parentRef, scanDebounceSeconds, var9 })
	reactModule.useEffect(function() --[[ line: 127 ]]
		-- upvalues: var4 (ref), var10 (ref), p0 (ref)
		var4.current = true
		var10()
		local onRequestImpressionsSignalConnection = p0.onRequestImpressionsSignal:connect(function() --[[ line: 131 ]]
			-- upvalues: var10 (copy)
			var10()
		end)
		
		return function() --[[ line: 135 ]]
			-- upvalues: var4 (copy), onRequestImpressionsSignalConnection (ref)
			var4.current = false
			onRequestImpressionsSignalConnection:disconnect()
		end
	end, { p0.onRequestImpressionsSignal, var10 })
	reactModule.useEffect(function() --[[ line: 141 ]]
		-- upvalues: var10 (ref)
		var10()
	end, { var8, var10 })
	
	return nil
end