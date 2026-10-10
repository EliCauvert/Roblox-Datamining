local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local _ = require(script.Parent.FeedTypes)
local navigationDestinationTypeModule = require(moments.Enums.NavigationDestinationType)
local fFlagMomentsFixRecommendationImpressionLifecycleModule = require(moments.Flags.FFlagMomentsFixRecommendationImpressionLifecycle)
local fFlagMomentsNavigationEventModule = require(moments.Flags.FFlagMomentsNavigationEvent)
local httpService = game:GetService("HttpService")

local function _()
	-- upvalues: httpService (ref)
	return httpService:GenerateGUID(false)
end

local _ = function(p1, p2, p3)
	-- upvalues: navigationDestinationTypeModule (ref)
	return if p1 == nil or p2 == nil or (p1.leftItemId ~= p2 or p1.toIndex ~= p3) then navigationDestinationTypeModule.Unknown else p1.destination
end

return function(p1, p2)
	-- upvalues: reactModule (ref), fFlagMomentsNavigationEventModule (ref), navigationDestinationTypeModule (ref), signalsModule (ref), httpService (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (ref)
	local active = p2.active
	local var1 = reactModule.useRef(nil)
	local var2 = reactModule.useRef(1)
	local var3 = reactModule.useRef(0)
	local var4 = reactModule.useRef(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = reactModule.useRef(p2.telemetry)
	var7.current = p2.telemetry
	local var8 = reactModule.useRef(p2.recommendationSource)
	var8.current = p2.recommendationSource
	local var9 = reactModule.useRef(p2.getAttribution)
	var9.current = p2.getAttribution
	local var10 = reactModule.useRef(p2.onItemBecameActive)
	var10.current = p2.onItemBecameActive
	local var11 = reactModule.useRef(p2.onEndStateReached)
	var11.current = p2.onEndStateReached
	local var12 = reactModule.useRef(p2.onViewEnded)
	var12.current = p2.onViewEnded
	local var13 = reactModule.useRef(p2.inactiveDestination)
	var13.current = p2.inactiveDestination
	local var14 = reactModule.useRef(active)
	var14.current = active
	local var15 = reactModule.useCallback(function(p3)
		-- upvalues: var1 (ref), var3 (ref), var4 (ref), var5 (ref), var7 (ref), var2 (ref), var8 (ref), var12 (ref), fFlagMomentsNavigationEventModule (copy), navigationDestinationTypeModule (copy)
		local current = var1.current
		
		if current == nil then
			return nil
		end
		local current_1 = var3.current
		
		if var4.current ~= nil then
			current_1 += os.clock() - var4.current
		end
		local current_2 = var5.current
		var1.current = nil
		var4.current = nil
		var3.current = 0
		var5.current = nil
		
		if current_1 <= 0 then
			return current_2
		end
		var7.current.logView(current, {
			durationSeconds = current_1,
			itemPosition = var2.current,
			recommendationSource = var8.current
		})
		local current_3 = var12.current
		
		if fFlagMomentsNavigationEventModule and current_2 ~= nil and current_3 ~= nil then
			current_3(current, {
				viewId = current_2,
				durationSeconds = current_1,
				itemPosition = var2.current,
				destination = p3 or navigationDestinationTypeModule.Unknown
			})
		end
		return current_2
	end, {})
	reactModule.useEffect(function()
		-- upvalues: signalsModule (copy), p1 (ref), fFlagMomentsNavigationEventModule (copy), var1 (ref), var6 (ref), navigationDestinationTypeModule (copy), var15 (ref), var14 (ref), var11 (ref), var9 (ref), var2 (ref), var3 (ref), var5 (ref), httpService (copy), var4 (ref), var10 (ref)
		local var16 = signalsModule.createEffect(function(p3)
			-- upvalues: p1 (copy), fFlagMomentsNavigationEventModule (copy), var1 (copy), var6 (copy), navigationDestinationTypeModule (copy), var15 (copy), var14 (copy), var11 (copy), var9 (copy), var2 (copy), var3 (copy), var5 (copy), httpService (copy), var4 (copy), var10 (copy)
			local currentItem = p1.getCurrentItem(p3)
			local var17 = nil
			
			if fFlagMomentsNavigationEventModule then
				local current = var1.current
				local current_1 = var6.current
				local var18 = if current ~= nil then nil else current.itemId
				var17 = if current_1 == nil or var18 == nil or (current_1.leftItemId ~= var18 or current_1.toIndex ~= p1.getCurrentIndex(false)) then navigationDestinationTypeModule.Unknown else current_1.destination
				var6.current = nil
			end
			var15(var17)
			
			if currentItem == nil then return end
			if currentItem.kind == "endState" and var14.current and var11.current then
				var11.current(p1.getCurrentIndex(false))
			end
			local var19 = var9.current(currentItem)
			
			if var19 == nil then return end
			var1.current = var19
			var2.current = p1.getCurrentIndex(false)
			var3.current = 0
			var5.current = if fFlagMomentsNavigationEventModule then httpService:GenerateGUID(false) else nil
			var4.current = if var14.current then os.clock() else nil
			
			if var14.current and var10.current then
				var10.current(currentItem)
			end
		end)
		
		return function()
			-- upvalues: var16 (ref), var15 (copy)
			var16()
			var15()
		end
	end, { p1, var15 })
	reactModule.useEffect(function()
		-- upvalues: active (ref), fFlagMomentsFixRecommendationImpressionLifecycleModule (copy), var1 (ref), p1 (ref), var9 (ref), var2 (ref), var3 (ref), var4 (ref), var5 (ref), fFlagMomentsNavigationEventModule (copy), httpService (copy), var15 (ref), var13 (ref)
		if active then
			if fFlagMomentsFixRecommendationImpressionLifecycleModule and var1.current == nil then
				local currentItem = p1.getCurrentItem(false)
				
				if currentItem == nil then return end
				local var16 = var9.current(currentItem)
				
				if var16 == nil then
					return
				end
				var1.current = var16
				var2.current = p1.getCurrentIndex(false)
				var3.current = 0
				var4.current = os.clock()
				var5.current = if fFlagMomentsNavigationEventModule then httpService:GenerateGUID(false) else nil
				
				return
			elseif var1.current == nil or var4.current ~= nil then
				return
			else
				var4.current = os.clock()
				
				return
			end
		elseif fFlagMomentsFixRecommendationImpressionLifecycleModule then
			var15(var13.current)
			
			return
		elseif var4.current ~= nil then
			var3.current += os.clock() - var4.current
			var4.current = nil
		end
	end, { active, p1, var15 })
	
	return {
		flushView = var15,
		getViewId = function()
			-- upvalues: var5 (ref)
			return var5.current
		end,
		noteUserStep = function(p3, p4)
			-- upvalues: var6 (ref), var1 (ref), navigationDestinationTypeModule (copy)
			local var16 = p4 - p3
			
			if var16 == 1 or var16 == -1 then
				local current = var1.current
				var6.current = {
					leftItemId = if current ~= nil then nil else current.itemId,
					toIndex = p4,
					destination = if var16 == 1 then navigationDestinationTypeModule.NextMoment else navigationDestinationTypeModule.PreviousMoment
				}
				
				return
			end
			var6.current = nil
		end
	}
end