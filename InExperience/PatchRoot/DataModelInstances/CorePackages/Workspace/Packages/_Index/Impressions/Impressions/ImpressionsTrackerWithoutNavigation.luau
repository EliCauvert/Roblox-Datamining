local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local impressionsDetectorModule = require(script.Parent.ImpressionsDetector)
local impressionDetectorWithoutNavigationModule = require(script.Parent.ImpressionDetectorWithoutNavigation)
local impressionsVisualizerModule = require(script.Parent.ImpressionsVisualizer)
local luaAppFixImpressionsHookDependencies = game:DefineFastFlag("LuaAppFixImpressionsHookDependencies", false)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions

return function(p0) --[[ line: 34 ]]
	-- upvalues: reactModule (ref), signal (ref), impressionsVisualizerModule (ref), luaAppFixImpressionsHookDependencies (ref), impressionsDetectorModule (ref), impressionDetectorWithoutNavigationModule (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef(signal.new())
	local _ = nil
	local var7 = reactModule.useRef(nil)
	
	if var7.current == nil then
		var7.current = impressionsVisualizerModule.new(p0.impressionsTag)
	end
	assert(var7.current, "impressionsVisualizer should always be truthy; check needed for lint")
	local var8, var9 = reactModule.useState({})
	local var10, var11 = reactModule.useState(p0.dataUpdatedTimestamp)
	local var12 = reactModule.useRef(p0.impressionsTag)
	local viewPortBounds = p0.viewPortBounds
	reactModule.useEffect(function() --[[ line: 49 ]]
		-- upvalues: var12 (ref), p0 (ref), var11 (ref), var5 (ref), var7 (write), var6 (ref)
		if var12.current ~= p0.impressionsTag then
			var12.current = p0.impressionsTag
			var11(p0.dataUpdatedTimestamp)
			var5.current = {}
			var7.current:onClearAllImpressions()
			var7.current:setImpressionsTag(p0.impressionsTag)
			var6.current:fire()
		end
	end, {
		p0.impressionsTag,
		if luaAppFixImpressionsHookDependencies then p0.dataUpdatedTimestamp else nil
	})
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var6 (ref), p0 (ref)
		var6.current:fire()
		local var13 = if p0.scrollViewPositionChangedSignal then p0.scrollViewPositionChangedSignal:connect(function() --[[ line: 67 ]]
			-- upvalues: var6 (copy)
			var6.current:fire()
		end) else nil
		
		return function() --[[ line: 72 ]]
			-- upvalues: var13 (write)
			if var13 ~= nil then
				var13:disconnect()
			end
		end
	end, { p0.scrollViewPositionChangedSignal })
	reactModule.useEffect(function() --[[ line: 80 ]]
		-- upvalues: p0 (ref), var6 (ref), var10 (ref), var11 (ref), var5 (ref), var7 (write)
		if p0.pageContext and p0.routeName == p0.pageContext then
			var6.current:fire()
			
			if p0.dataUpdatedTimestamp ~= var10 then
				var11(p0.dataUpdatedTimestamp)
				var5.current = {}
				var7.current:onClearAllImpressions()
			end
		end
	end, {
		p0.routeName,
		p0.pageContext,
		p0.dataUpdatedTimestamp,
		var10,
		viewPortBounds
	})
	reactModule.useEffect(function() --[[ line: 103 ]]
		-- upvalues: var8 (ref), p0 (ref), var7 (write), var9 (ref)
		if var8 ~= nil and #var8 > 0 then
			p0.sendImpressions(var8)
			var7.current:onSendImpressions(var8)
			var9({})
		end
	end, {
		var8,
		if luaAppFixImpressionsHookDependencies then p0.sendImpressions else nil
	})
	reactModule.useEffect(function() --[[ line: 114 ]]
		-- upvalues: var7 (write)
		return function() --[[ line: 115 ]]
			-- upvalues: var7 (copy)
			var7.current:destroy()
		end
	end, {})
	
	return reactModule.createElement(if p0.pageContext then impressionsDetectorModule else impressionDetectorWithoutNavigationModule, {
		parentRef = p0.parentRef,
		viewPortBounds = viewPortBounds,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p0.viewPortFillBounds else nil,
		onRequestImpressionsSignal = var6.current,
		filterImpressionFunc = reactModule.useCallback(function(p1) --[[ line: 120 ]]
			-- upvalues: var5 (ref)
			if var5.current[p1] == nil then
				var5.current[p1] = true
				
				return true
			end
			return false
		end, {}),
		onImpressionsDetected = reactModule.useCallback(function(p2) --[[ line: 129 ]]
			-- upvalues: var9 (ref)
			if p2 and #p2 ~= 0 then
				var9(p2)
				
				return
			end
		end, {}),
		impressionsTag = p0.impressionsTag
	})
end