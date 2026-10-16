local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.FeedTypes)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)

return function(p1, p2)
	-- upvalues: reactModule (ref), signalsModule (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref)
	local active = p2.active
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(1)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(p2.telemetry)
	var5.current = p2.telemetry
	local var6 = reactModule.useRef(p2.recommendationSource)
	var6.current = p2.recommendationSource
	local var7 = reactModule.useRef(p2.getAttribution)
	var7.current = p2.getAttribution
	local var8 = reactModule.useRef(p2.onItemBecameActive)
	var8.current = p2.onItemBecameActive
	local var9 = reactModule.useRef(p2.onEndStateReached)
	var9.current = p2.onEndStateReached
	local var10 = reactModule.useRef(active)
	var10.current = active
	local var11 = reactModule.useCallback(function()
		-- upvalues: var1 (ref), var3 (ref), var4 (ref), var5 (ref), var2 (ref), var6 (ref)
		local current = var1.current
		
		if current == nil then return end
		local current_1 = var3.current
		
		if var4.current ~= nil then
			current_1 += os.clock() - var4.current
		end
		var1.current = nil
		var4.current = nil
		var3.current = 0
		
		if current_1 <= 0 then
			return
		end
		var5.current.logView(current, {
			durationSeconds = current_1,
			itemPosition = var2.current,
			recommendationSource = var6.current
		})
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), p1 (ref), var11 (ref), var10 (ref), var9 (ref), var7 (ref), var1 (ref), var2 (ref), var3 (ref), var4 (ref), var8 (ref)
		local var12 = signalsModule.createEffect(function(p3)
			-- upvalues: p1 (copy), var11 (copy), var10 (copy), var9 (copy), var7 (copy), var1 (copy), var2 (copy), var3 (copy), var4 (copy), var8 (copy)
			local currentItem = p1.getCurrentItem(p3)
			var11()
			
			if currentItem == nil then return end
			if currentItem.kind == "endState" and var10.current and var9.current then
				var9.current(p1.getCurrentIndex(false))
			end
			local var13 = var7.current(currentItem)
			
			if var13 == nil then return end
			var1.current = var13
			var2.current = p1.getCurrentIndex(false)
			var3.current = 0
			var4.current = if var10.current then os.clock() else nil
			
			if var10.current and var8.current then
				var8.current(currentItem)
			end
		end)
		
		return function()
			-- upvalues: var12 (ref), var11 (copy)
			var12()
			var11()
		end
	end, { p1, var11 })
	reactModule.useEffect(function()
		-- upvalues: active (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var1 (ref), p1 (ref), var7 (ref), var2 (ref), var3 (ref), var4 (ref), var11 (ref)
		if active then
			if fFlagMomentsFixRecommendationImpressionLifecycleModule and var1.current == nil then
				local currentItem = p1.getCurrentItem(false)
				
				if currentItem == nil then return end
				local var12 = var7.current(currentItem)
				
				if var12 == nil then
					return
				end
				var1.current = var12
				var2.current = p1.getCurrentIndex(false)
				var3.current = 0
				var4.current = os.clock()
				
				return
			elseif var1.current == nil or var4.current ~= nil then
				return
			else
				var4.current = os.clock()
				
				return
			end
		elseif fFlagMomentsFixRecommendationImpressionLifecycleModule then
			var11()
			
			return
		elseif var4.current ~= nil then
			var3.current += os.clock() - var4.current
			var4.current = nil
		end
	end, { active, p1, var11 })
	
	return { flushView = var11 }
end