local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local impressionsDetectorModule = require(script.Parent.ImpressionsDetector)
local impressionDetectorWithoutNavigationModule = require(script.Parent.ImpressionDetectorWithoutNavigation)
local impressionsVisualizerModule = require(script.Parent.ImpressionsVisualizer)
local luaAppFixImpressionsHookDependencies = game:DefineFastFlag("LuaAppFixImpressionsHookDependencies", false)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), impressionsVisualizerModule (ref), luaAppFixImpressionsHookDependencies (ref), impressionsDetectorModule (ref), impressionDetectorWithoutNavigationModule (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(signal.new())
	local _ = nil
	local var3 = reactModule.useRef(nil)
	
	if var3.current == nil then
		var3.current = impressionsVisualizerModule.new(p1.impressionsTag)
	end
	assert(var3.current, "impressionsVisualizer should always be truthy; check needed for lint")
	local var4, var5 = reactModule.useState({})
	local var6, var7 = reactModule.useState(p1.dataUpdatedTimestamp)
	local var8 = reactModule.useRef(p1.impressionsTag)
	local viewPortBounds = p1.viewPortBounds
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), p1 (ref), var7 (ref), var1 (ref), var3 (write), var2 (ref)
		if var8.current ~= p1.impressionsTag then
			var8.current = p1.impressionsTag
			var7(p1.dataUpdatedTimestamp)
			var1.current = {}
			var3.current:onClearAllImpressions()
			var3.current:setImpressionsTag(p1.impressionsTag)
			var2.current:fire()
		end
	end, {
		p1.impressionsTag,
		if luaAppFixImpressionsHookDependencies then p1.dataUpdatedTimestamp else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.current:fire()
		local var9 = if p1.scrollViewPositionChangedSignal then p1.scrollViewPositionChangedSignal:connect(function()
			-- upvalues: var2 (copy)
			var2.current:fire()
		end) else nil
		
		return function()
			-- upvalues: var9 (write)
			if var9 ~= nil then
				var9:disconnect()
			end
		end
	end, { p1.scrollViewPositionChangedSignal })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var2 (ref), var6 (ref), var7 (ref), var1 (ref), var3 (write)
		if p1.pageContext and p1.routeName == p1.pageContext then
			var2.current:fire()
			
			if p1.dataUpdatedTimestamp ~= var6 then
				var7(p1.dataUpdatedTimestamp)
				var1.current = {}
				var3.current:onClearAllImpressions()
			end
		end
	end, {
		p1.routeName,
		p1.pageContext,
		p1.dataUpdatedTimestamp,
		var6,
		viewPortBounds
	})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref), var3 (write), var5 (ref)
		if var4 ~= nil and #var4 > 0 then
			p1.sendImpressions(var4)
			var3.current:onSendImpressions(var4)
			var5({})
		end
	end, {
		var4,
		if luaAppFixImpressionsHookDependencies then p1.sendImpressions else nil
	})
	reactModule.useEffect(function()
		-- upvalues: var3 (write)
		return function()
			-- upvalues: var3 (copy)
			var3.current:destroy()
		end
	end, {})
	
	return reactModule.createElement(if p1.pageContext then impressionsDetectorModule else impressionDetectorWithoutNavigationModule, {
		parentRef = p1.parentRef,
		viewPortBounds = viewPortBounds,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p1.viewPortFillBounds else nil,
		onRequestImpressionsSignal = var2.current,
		filterImpressionFunc = reactModule.useCallback(function(p2)
			-- upvalues: var1 (ref)
			if var1.current[p2] == nil then
				var1.current[p2] = true
				
				return true
			end
			return false
		end, {}),
		onImpressionsDetected = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref)
			if p2 and #p2 ~= 0 then
				var5(p2)
				
				return
			end
		end, {}),
		impressionsTag = p1.impressionsTag
	})
end