local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local getShopImpressionsViewportBounds = require(script.Parent.getShopViewportBounds).getShopImpressionsViewportBounds
local shopImpressionsDetectorModule = require(script.Parent.ShopImpressionsDetector)
local vector2 = Vector2.new(1920, 1080)

return function(p0) --[[ line: 22 | named "ShopScreenSizeImpressionsDetector" ]]
	-- upvalues: vector2 (ref), reactModule (ref), getShopImpressionsViewportBounds (ref), shopImpressionsDetectorModule (ref)
	local currentCamera = workspace.CurrentCamera
	local var3, var4 = reactModule.useState(if currentCamera then currentCamera.ViewportSize else vector2)
	reactModule.useEffect(function() --[[ line: 27 ]]
		-- upvalues: var4 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera == nil then
			return function() --[[ line: 30 ]] end
		end
		local var5 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function() --[[ line: 33 ]]
			-- upvalues: var4 (copy), currentCamera (ref)
			var4(currentCamera.ViewportSize)
		end)
		
		return function() --[[ line: 37 ]]
			-- upvalues: var5 (ref)
			var5:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(shopImpressionsDetectorModule, {
		parentRef = p0.parentRef,
		onRequestImpressionsSignal = p0.onRequestImpressionsSignal,
		getViewPortBounds = reactModule.useCallback(function() --[[ line: 42 ]]
			-- upvalues: p0 (ref), getShopImpressionsViewportBounds (copy), var3 (ref)
			return getShopImpressionsViewportBounds(var3, if p0.parentRef then p0.parentRef.current else nil)
		end, { p0.parentRef, var3 }),
		pageFilter = p0.pageFilter,
		collectObjectsFunc = p0.collectObjectsFunc,
		filterImpressionFunc = p0.filterImpressionFunc,
		onImpressionsDetected = p0.onImpressionsDetected,
		scanDebounceSeconds = p0.scanDebounceSeconds
	})
end