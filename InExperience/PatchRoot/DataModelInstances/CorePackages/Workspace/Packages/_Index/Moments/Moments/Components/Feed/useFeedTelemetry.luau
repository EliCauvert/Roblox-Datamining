local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.FeedTypes)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)

return function(p0, p1) --[[ line: 67 | named "useFeedTelemetry" ]]
	-- upvalues: reactModule (ref), signalsModule (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref)
	local active = p1.active
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(1)
	local var6 = reactModule.useRef(0)
	local var7 = reactModule.useRef(nil)
	local var8 = reactModule.useRef(p1.telemetry)
	var8.current = p1.telemetry
	local var9 = reactModule.useRef(p1.recommendationSource)
	var9.current = p1.recommendationSource
	local var10 = reactModule.useRef(p1.getAttribution)
	var10.current = p1.getAttribution
	local var11 = reactModule.useRef(p1.onItemBecameActive)
	var11.current = p1.onItemBecameActive
	local var12 = reactModule.useRef(p1.onEndStateReached)
	var12.current = p1.onEndStateReached
	local var13 = reactModule.useRef(active)
	var13.current = active
	local var14 = reactModule.useCallback(function() --[[ line: 101 ]]
		-- upvalues: var4 (ref), var6 (ref), var7 (ref), var8 (ref), var5 (ref), var9 (ref)
		local current = var4.current
		
		if current == nil then return end
		local current_1 = var6.current
		
		if var7.current ~= nil then
			current_1 += os.clock() - var7.current
		end
		var4.current = nil
		var7.current = nil
		var6.current = 0
		
		if current_1 <= 0 then
			return
		end
		var8.current.logView(current, {
			durationSeconds = current_1,
			itemPosition = var5.current,
			recommendationSource = var9.current
		})
	end, {})
	reactModule.useEffect(function() --[[ line: 133 ]]
		-- upvalues: signalsModule (copy), p0 (ref), var14 (ref), var13 (ref), var12 (ref), var10 (ref), var4 (ref), var5 (ref), var6 (ref), var7 (ref), var11 (ref)
		local var15 = signalsModule.createEffect(function(p2) --[[ line: 134 ]]
			-- upvalues: p0 (copy), var14 (copy), var13 (copy), var12 (copy), var10 (copy), var4 (copy), var5 (copy), var6 (copy), var7 (copy), var11 (copy)
			local currentItem = p0.getCurrentItem(p2)
			var14()
			
			if currentItem == nil then return end
			if currentItem.kind == "endState" and var13.current and var12.current then
				var12.current(p0.getCurrentIndex(false))
			end
			local var17 = var10.current(currentItem)
			
			if var17 == nil then return end
			var4.current = var17
			var5.current = p0.getCurrentIndex(false)
			var6.current = 0
			var7.current = if var13.current then os.clock() else nil
			
			if var13.current and var11.current then
				var11.current(currentItem)
			end
		end)
		
		return function() --[[ line: 165 ]]
			-- upvalues: var15 (ref), var14 (copy)
			var15()
			var14()
		end
	end, { p0, var14 })
	reactModule.useEffect(function() --[[ line: 176 ]]
		-- upvalues: active (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var4 (ref), p0 (ref), var10 (ref), var5 (ref), var6 (ref), var7 (ref), var14 (ref)
		if active then
			if fFlagMomentsFixRecommendationImpressionLifecycleModule and var4.current == nil then
				local currentItem = p0.getCurrentItem(false)
				
				if currentItem == nil then return end
				local var19 = var10.current(currentItem)
				
				if var19 == nil then
					return
				end
				var4.current = var19
				var5.current = p0.getCurrentIndex(false)
				var6.current = 0
				var7.current = os.clock()
				
				return
			elseif var4.current == nil or var7.current ~= nil then
				return
			else
				var7.current = os.clock()
				
				return
			end
		elseif fFlagMomentsFixRecommendationImpressionLifecycleModule then
			var14()
			
			return
		elseif var7.current ~= nil then
			var6.current += os.clock() - var7.current
			var7.current = nil
		end
	end, { active, p0, var14 })
	
	return { flushView = var14 }
end