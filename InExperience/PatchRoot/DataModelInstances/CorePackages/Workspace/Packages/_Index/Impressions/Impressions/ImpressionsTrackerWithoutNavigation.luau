local Parent = script:FindFirstAncestor("Impressions").Parent
local ReactModule = require(Parent.React)
local Signal = require(Parent.AppCommonLib).Signal
local ImpressionsDetectorModule = require(script.Parent.ImpressionsDetector)
local ImpressionDetectorWithoutNavigationModule = require(script.Parent.ImpressionDetectorWithoutNavigation)
local ImpressionsVisualizerModule = require(script.Parent.ImpressionsVisualizer)
local LuaAppFixImpressionsHookDependencies = game:DefineFastFlag("LuaAppFixImpressionsHookDependencies", false)
local FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions = require(Parent.SharedFlags).FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions

return function(p1)
	-- upvalues: ReactModule (copy), Signal (copy), ImpressionsVisualizerModule (copy), LuaAppFixImpressionsHookDependencies (copy), ImpressionsDetectorModule (copy), ImpressionDetectorWithoutNavigationModule (copy), FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef(Signal.new())
	local UseRefResult2 = nil
	UseRefResult2 = ReactModule.useRef(nil)
	
	if UseRefResult2.current == nil then
		UseRefResult2.current = ImpressionsVisualizerModule.new(p1.impressionsTag)
	end
	assert(UseRefResult2.current, "impressionsVisualizer should always be truthy; check needed for lint")
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(p1.dataUpdatedTimestamp)
	local UseRefResult3 = ReactModule.useRef(p1.impressionsTag)
	local ViewPortBounds = p1.viewPortBounds
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult3 (copy), p1 (copy), UseStateResult2_1 (copy), UseRefResult (copy), UseRefResult2 (ref), UseRefResult1 (copy)
		if UseRefResult3.current ~= p1.impressionsTag then
			UseRefResult3.current = p1.impressionsTag
			UseStateResult2_1(p1.dataUpdatedTimestamp)
			UseRefResult.current = {}
			UseRefResult2.current:onClearAllImpressions()
			UseRefResult2.current:setImpressionsTag(p1.impressionsTag)
			UseRefResult1.current:fire()
		end
	end, {
		p1.impressionsTag,
		if LuaAppFixImpressionsHookDependencies then p1.dataUpdatedTimestamp else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), p1 (copy)
		UseRefResult1.current:fire()
		local ScrollViewPositionChangedSignalConnection = if p1.scrollViewPositionChangedSignal then p1.scrollViewPositionChangedSignal:connect(function()
			-- upvalues: UseRefResult1 (upval)
			UseRefResult1.current:fire()
		end) else nil
		
		return function()
			-- upvalues: ScrollViewPositionChangedSignalConnection (ref)
			if ScrollViewPositionChangedSignalConnection ~= nil then
				ScrollViewPositionChangedSignalConnection:disconnect()
			end
		end
	end, { p1.scrollViewPositionChangedSignal })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), UseRefResult (copy), UseRefResult2 (ref)
		if p1.pageContext and p1.routeName == p1.pageContext then
			UseRefResult1.current:fire()
			
			if p1.dataUpdatedTimestamp ~= UseStateResult1 then
				UseStateResult2_1(p1.dataUpdatedTimestamp)
				UseRefResult.current = {}
				UseRefResult2.current:onClearAllImpressions()
			end
		end
	end, {
		p1.routeName,
		p1.pageContext,
		p1.dataUpdatedTimestamp,
		UseStateResult1,
		ViewPortBounds
	})
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), p1 (copy), UseRefResult2 (ref), UseStateResult2 (copy)
		if UseStateResult ~= nil and #UseStateResult > 0 then
			p1.sendImpressions(UseStateResult)
			UseRefResult2.current:onSendImpressions(UseStateResult)
			UseStateResult2({})
		end
	end, {
		UseStateResult,
		if LuaAppFixImpressionsHookDependencies then p1.sendImpressions else nil
	})
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (ref)
		return function()
			-- upvalues: UseRefResult2 (upval)
			UseRefResult2.current:destroy()
		end
	end, {})
	
	return ReactModule.createElement(if p1.pageContext then ImpressionsDetectorModule else ImpressionDetectorWithoutNavigationModule, {
		parentRef = p1.parentRef,
		viewPortBounds = ViewPortBounds,
		viewPortFillBounds = if FFlagLuaAppUseScreenFillBoundsForFrameBoundsImpressions then p1.viewPortFillBounds else nil,
		onRequestImpressionsSignal = UseRefResult1.current,
		filterImpressionFunc = ReactModule.useCallback(function(p2): boolean
			-- upvalues: UseRefResult (copy)
			if UseRefResult.current[p2] == nil then
				UseRefResult.current[p2] = true
				
				return true
			else
				return false
			end
		end, {}),
		onImpressionsDetected = ReactModule.useCallback(function(p2)
			-- upvalues: UseStateResult2 (copy)
			if p2 and #p2 ~= 0 then
				UseStateResult2(p2)
				
				return
			end
		end, {}),
		impressionsTag = p1.impressionsTag
	})
end