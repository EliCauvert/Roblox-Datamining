local parent = script:FindFirstAncestor("Impressions").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local impressionsDetectorModule = require(script.Parent.ImpressionsDetector)
local impressionDetectorWithoutNavigationModule = require(script.Parent.ImpressionDetectorWithoutNavigation)
local impressionsVisualizerModule = require(script.Parent.ImpressionsVisualizer)
local luaAppFixImpressionsHookDependencies = game:DefineFastFlag("LuaAppFixImpressionsHookDependencies", false)
local fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions
local luaAppFireRequestImpressionsOnTagChange = game:DefineFastFlag("LuaAppFireRequestImpressionsOnTagChange", false)

return function(p0) --[[ line: 36 ]]
	-- upvalues: reactModule (ref), signal (ref), impressionsVisualizerModule (ref), luaAppFireRequestImpressionsOnTagChange (ref), luaAppFixImpressionsHookDependencies (ref), impressionsDetectorModule (ref), impressionDetectorWithoutNavigationModule (ref), fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (ref)
	local var6 = reactModule.useRef({})
	local var7 = reactModule.useRef(signal.new())
	local _ = nil
	local var8 = reactModule.useRef(nil)
	
	if var8.current == nil then
		var8.current = impressionsVisualizerModule.new(p0.impressionsTag)
	end
	assert(var8.current, "impressionsVisualizer should always be truthy; check needed for lint")
	local var9, var10 = reactModule.useState({})
	local var11, var12 = reactModule.useState(p0.dataUpdatedTimestamp)
	local var13 = reactModule.useRef(p0.impressionsTag)
	local viewPortBounds = p0.viewPortBounds
	reactModule.useEffect(function() --[[ line: 51 ]]
		-- upvalues: var13 (ref), p0 (ref), var12 (ref), var6 (ref), var8 (write), luaAppFireRequestImpressionsOnTagChange (copy), var7 (ref)
		if var13.current ~= p0.impressionsTag then
			var13.current = p0.impressionsTag
			var12(p0.dataUpdatedTimestamp)
			var6.current = {}
			var8.current:onClearAllImpressions()
			var8.current:setImpressionsTag(p0.impressionsTag)
			
			if luaAppFireRequestImpressionsOnTagChange then
				var7.current:fire()
			end
		end
	end, {
		p0.impressionsTag,
		if luaAppFixImpressionsHookDependencies then p0.dataUpdatedTimestamp else nil
	})
	reactModule.useEffect(function() --[[ line: 67 ]]
		-- upvalues: var7 (ref), p0 (ref)
		var7.current:fire()
		local var14 = if p0.scrollViewPositionChangedSignal then p0.scrollViewPositionChangedSignal:connect(function() --[[ line: 71 ]]
			-- upvalues: var7 (copy)
			var7.current:fire()
		end) else nil
		
		return function() --[[ line: 76 ]]
			-- upvalues: var14 (write)
			if var14 ~= nil then
				var14:disconnect()
			end
		end
	end, { p0.scrollViewPositionChangedSignal })
	reactModule.useEffect(function() --[[ line: 84 ]]
		-- upvalues: p0 (ref), var7 (ref), var11 (ref), var12 (ref), var6 (ref), var8 (write)
		if p0.pageContext and p0.routeName == p0.pageContext then
			var7.current:fire()
			
			if p0.dataUpdatedTimestamp ~= var11 then
				var12(p0.dataUpdatedTimestamp)
				var6.current = {}
				var8.current:onClearAllImpressions()
			end
		end
	end, {
		p0.routeName,
		p0.pageContext,
		p0.dataUpdatedTimestamp,
		var11,
		viewPortBounds
	})
	reactModule.useEffect(function() --[[ line: 107 ]]
		-- upvalues: var9 (ref), p0 (ref), var8 (write), var10 (ref)
		if var9 ~= nil and #var9 > 0 then
			p0.sendImpressions(var9)
			var8.current:onSendImpressions(var9)
			var10({})
		end
	end, {
		var9,
		if luaAppFixImpressionsHookDependencies then p0.sendImpressions else nil
	})
	reactModule.useEffect(function() --[[ line: 118 ]]
		-- upvalues: var8 (write)
		return function() --[[ line: 119 ]]
			-- upvalues: var8 (copy)
			var8.current:destroy()
		end
	end, {})
	
	return reactModule.createElement(if p0.pageContext then impressionsDetectorModule else impressionDetectorWithoutNavigationModule, {
		parentRef = p0.parentRef,
		viewPortBounds = viewPortBounds,
		viewPortFillBounds = if fFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p0.viewPortFillBounds else nil,
		onRequestImpressionsSignal = var7.current,
		filterImpressionFunc = reactModule.useCallback(function(p1) --[[ line: 124 ]]
			-- upvalues: var6 (ref)
			if var6.current[p1] == nil then
				var6.current[p1] = true
				
				return true
			end
			return false
		end, {}),
		onImpressionsDetected = reactModule.useCallback(function(p2) --[[ line: 133 ]]
			-- upvalues: var10 (ref)
			if p2 and #p2 ~= 0 then
				var10(p2)
				
				return
			end
		end, {}),
		impressionsTag = p0.impressionsTag
	})
end