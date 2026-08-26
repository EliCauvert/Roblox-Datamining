local parent = script:FindFirstAncestor("GameCollections").Parent
local reactModule = require(parent.React)
local signal = require(parent.AppCommonLib).Signal
local useRouteName = require(parent.Navigation).useRouteName
local useSelector = require(parent.RoactUtils).Hooks.RoactRodux.useSelector
local cryoModule = require(parent.Cryo)
local impressionsModule = require(parent.Impressions)
local screenSizeImpressionsDetector = impressionsModule.ScreenSizeImpressionsDetector
local impressionsVisualizer = impressionsModule.ImpressionsVisualizer

return function(p1)
	-- upvalues: reactModule (ref), signal (ref), impressionsVisualizer (ref), useRouteName (ref), useSelector (ref), cryoModule (ref), screenSizeImpressionsDetector (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef(signal.new())
	local _ = nil
	local var3 = reactModule.useRef(nil)
	
	if var3.current == nil then
		var3.current = impressionsVisualizer.new(p1.impressionsTag)
	end
	assert(var3.current, "impressionsVisualizer should always be truthy; check needed for lint")
	local var4, var5 = reactModule.useState({})
	local var6, var7 = reactModule.useState(p1.dataUpdatedTimestamp)
	local var8 = useRouteName()
	local var9 = useSelector(function(p2)
		return p2.ScreenSize
	end)
	local var10 = reactModule.useRef(p1.impressionsTag)
	reactModule.useEffect(function()
		-- upvalues: var10 (ref), p1 (ref), var7 (ref), var1 (ref), var3 (write)
		if var10.current ~= p1.impressionsTag then
			var10.current = p1.impressionsTag
			var7(p1.dataUpdatedTimestamp)
			var1.current = {}
			var3.current:onClearAllImpressions()
			var3.current:setImpressionsTag(p1.impressionsTag)
		end
	end, { p1.impressionsTag })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), p1 (ref)
		var2.current:fire()
		local var11 = if p1.scrollViewPositionChangedSignal then p1.scrollViewPositionChangedSignal:connect(function()
			-- upvalues: var2 (copy)
			var2.current:fire()
		end) else nil
		
		return function()
			-- upvalues: var11 (write)
			if var11 ~= nil then
				var11:disconnect()
			end
		end
	end, { p1.scrollViewPositionChangedSignal })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), cryoModule (copy), var8 (ref), var2 (ref), var6 (ref), var7 (ref), var1 (ref), var3 (write)
		local var11
		local _ = false
		
		if type(p1.pageContext) == "table" then
			var11 = cryoModule.List.find(p1.pageContext, var8) ~= nil
			var11 = nil
		else
			var11 = var8 == p1.pageContext
		end
		if var11 then
			var2.current:fire()
			
			if p1.dataUpdatedTimestamp ~= var6 then
				var7(p1.dataUpdatedTimestamp)
				var1.current = {}
				var3.current:onClearAllImpressions()
			end
		end
	end, {
		var8,
		p1.pageContext,
		p1.dataUpdatedTimestamp,
		var6,
		var9
	})
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), p1 (ref), var3 (write), var5 (ref)
		if var4 ~= nil and #var4 > 0 then
			p1.sendGameImpressions(var4)
			var3.current:onSendImpressions(var4)
			var5({})
		end
	end, { var4 })
	reactModule.useEffect(function()
		-- upvalues: var3 (write)
		return function()
			-- upvalues: var3 (copy)
			var3.current:destroy()
		end
	end, {})
	
	return reactModule.createElement(screenSizeImpressionsDetector, {
		onRequestImpressionsSignal = var2.current,
		parentRef = p1.parentRef,
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