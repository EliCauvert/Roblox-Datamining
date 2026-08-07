local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local useRouteName = require(parent.Navigation).useRouteName
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local cryoModule = require(parent.Cryo)
local impressionsModule = require(parent.Impressions)
local screenSizeImpressionsDetector = impressionsModule.ScreenSizeImpressionsDetector
local impressionsVisualizer = impressionsModule.ImpressionsVisualizer

return function(p0) --[[ line: 23 ]]
	-- upvalues: reactModule (ref), signal (ref), impressionsVisualizer (ref), useRouteName (ref), useSelector (ref), cryoModule (ref), screenSizeImpressionsDetector (ref)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef(signal.new())
	local _ = nil
	local var5 = reactModule.useRef(nil)
	
	if var5.current == nil then
		var5.current = impressionsVisualizer.new(p0.impressionsTag)
	end
	assert(var5.current, "impressionsVisualizer should always be truthy; check needed for lint")
	local var6, var7 = reactModule.useState({})
	local var8, var9 = reactModule.useState(p0.dataUpdatedTimestamp)
	local var10 = useRouteName()
	local var11 = useSelector(function(p1) --[[ line: 36 ]]
		return p1.ScreenSize
	end)
	local var12 = reactModule.useRef(p0.impressionsTag)
	reactModule.useEffect(function() --[[ line: 42 ]]
		-- upvalues: var12 (ref), p0 (ref), var9 (ref), var3 (ref), var5 (write)
		if var12.current ~= p0.impressionsTag then
			var12.current = p0.impressionsTag
			var9(p0.dataUpdatedTimestamp)
			var3.current = {}
			var5.current:onClearAllImpressions()
			var5.current:setImpressionsTag(p0.impressionsTag)
		end
	end, { p0.impressionsTag })
	reactModule.useEffect(function() --[[ line: 52 ]]
		-- upvalues: var4 (ref), p0 (ref)
		var4.current:fire()
		local var13 = if p0.scrollViewPositionChangedSignal then p0.scrollViewPositionChangedSignal:connect(function() --[[ line: 59 ]]
			-- upvalues: var4 (copy)
			var4.current:fire()
		end) else nil
		
		return function() --[[ line: 64 ]]
			-- upvalues: var13 (write)
			if var13 ~= nil then
				var13:disconnect()
			end
		end
	end, { p0.scrollViewPositionChangedSignal })
	reactModule.useEffect(function() --[[ line: 71 ]]
		-- upvalues: p0 (ref), cryoModule (copy), var10 (ref), var4 (ref), var8 (ref), var9 (ref), var3 (ref), var5 (write)
		local var14
		local _ = false
		
		if type(p0.pageContext) == "table" then
			var14 = cryoModule.List.find(p0.pageContext, var10) ~= nil
			var14 = nil
		else
			var14 = var10 == p0.pageContext
		end
		if var14 then
			var4.current:fire()
			
			if p0.dataUpdatedTimestamp ~= var8 then
				var9(p0.dataUpdatedTimestamp)
				var3.current = {}
				var5.current:onClearAllImpressions()
			end
		end
	end, {
		var10,
		p0.pageContext,
		p0.dataUpdatedTimestamp,
		var8,
		var11
	})
	reactModule.useEffect(function() --[[ line: 90 ]]
		-- upvalues: var6 (ref), p0 (ref), var5 (write), var7 (ref)
		if var6 ~= nil and #var6 > 0 then
			p0.sendGameImpressions(var6)
			var5.current:onSendImpressions(var6)
			var7({})
		end
	end, { var6 })
	reactModule.useEffect(function() --[[ line: 98 ]]
		-- upvalues: var5 (write)
		return function() --[[ line: 99 ]]
			-- upvalues: var5 (copy)
			var5.current:destroy()
		end
	end, {})
	
	return reactModule.createElement(screenSizeImpressionsDetector, {
		onRequestImpressionsSignal = var4.current,
		parentRef = p0.parentRef,
		filterImpressionFunc = reactModule.useCallback(function(p2) --[[ line: 104 ]]
			-- upvalues: var3 (ref)
			if var3.current[p2] == nil then
				var3.current[p2] = true
				
				return true
			end
			return false
		end, {}),
		onImpressionsDetected = reactModule.useCallback(function(p3) --[[ line: 113 ]]
			-- upvalues: var7 (ref)
			if p3 and #p3 ~= 0 then
				var7(p3)
				
				return
			end
		end, {}),
		impressionsTag = p0.impressionsTag
	})
end