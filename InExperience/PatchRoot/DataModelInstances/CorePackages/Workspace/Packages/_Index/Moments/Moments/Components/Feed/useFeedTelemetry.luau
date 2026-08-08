local parent = script:FindFirstAncestor("Moments").Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.FeedTypes)

return function(p0, p1) --[[ line: 66 | named "useFeedTelemetry" ]]
	-- upvalues: reactModule (ref), signalsModule (ref)
	local active = p1.active
	local var2 = reactModule.useRef(nil)
	local var3 = reactModule.useRef(1)
	local var4 = reactModule.useRef(0)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(p1.telemetry)
	var6.current = p1.telemetry
	local var7 = reactModule.useRef(p1.recommendationSource)
	var7.current = p1.recommendationSource
	local var8 = reactModule.useRef(p1.getAttribution)
	var8.current = p1.getAttribution
	local var9 = reactModule.useRef(p1.onItemBecameActive)
	var9.current = p1.onItemBecameActive
	local var10 = reactModule.useRef(p1.onEndStateReached)
	var10.current = p1.onEndStateReached
	local var11 = reactModule.useRef(active)
	var11.current = active
	local var12 = reactModule.useCallback(function() --[[ line: 100 ]]
		-- upvalues: var2 (ref), var4 (ref), var5 (ref), var6 (ref), var3 (ref), var7 (ref)
		local current = var2.current
		
		if current == nil then return end
		local current_1 = var4.current
		
		if var5.current ~= nil then
			current_1 += os.clock() - var5.current
		end
		var2.current = nil
		var5.current = nil
		var4.current = 0
		
		if current_1 <= 0 then
			return
		end
		var6.current.logView(current, {
			durationSeconds = current_1,
			itemPosition = var3.current,
			recommendationSource = var7.current
		})
	end, {})
	reactModule.useEffect(function() --[[ line: 132 ]]
		-- upvalues: signalsModule (copy), p0 (ref), var12 (ref), var11 (ref), var10 (ref), var8 (ref), var2 (ref), var3 (ref), var4 (ref), var5 (ref), var9 (ref)
		local var13 = signalsModule.createEffect(function(p2) --[[ line: 133 ]]
			-- upvalues: p0 (copy), var12 (copy), var11 (copy), var10 (copy), var8 (copy), var2 (copy), var3 (copy), var4 (copy), var5 (copy), var9 (copy)
			local currentItem = p0.getCurrentItem(p2)
			var12()
			
			if currentItem == nil then return end
			if currentItem.kind == "endState" and var11.current and var10.current then
				var10.current(p0.getCurrentIndex(false))
			end
			local var15 = var8.current(currentItem)
			
			if var15 == nil then return end
			var2.current = var15
			var3.current = p0.getCurrentIndex(false)
			var4.current = 0
			var5.current = if var11.current then os.clock() else nil
			
			if var11.current and var9.current then
				var9.current(currentItem)
			end
		end)
		
		return function() --[[ line: 164 ]]
			-- upvalues: var13 (ref), var12 (copy)
			var13()
			var12()
		end
	end, { p0, var12 })
	reactModule.useEffect(function() --[[ line: 175 ]]
		-- upvalues: active (ref), var2 (ref), var5 (ref), var4 (ref)
		if active then
			if var2.current == nil or var5.current ~= nil then
				return
			else
				var5.current = os.clock()
				
				return
			end
		elseif var5.current ~= nil then
			var4.current += os.clock() - var5.current
			var5.current = nil
		end
	end, { active })
	
	return { flushView = var12 }
end