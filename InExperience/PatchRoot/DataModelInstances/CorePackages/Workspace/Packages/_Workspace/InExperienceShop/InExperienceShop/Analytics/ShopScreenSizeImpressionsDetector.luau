local reactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local getShopImpressionsViewportBounds = require(script.Parent.getShopViewportBounds).getShopImpressionsViewportBounds
local shopImpressionsDetectorModule = require(script.Parent.ShopImpressionsDetector)
local vector2 = Vector2.new(1920, 1080)

return function(p1)
	-- upvalues: vector2 (ref), reactModule (ref), getShopImpressionsViewportBounds (ref), shopImpressionsDetectorModule (ref)
	local currentCamera = workspace.CurrentCamera
	local var1, var2 = reactModule.useState(if currentCamera then currentCamera.ViewportSize else vector2)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		local currentCamera = workspace.CurrentCamera
		
		if currentCamera == nil then
			return function() end
		end
		local var3 = currentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
			-- upvalues: var2 (copy), currentCamera (ref)
			var2(currentCamera.ViewportSize)
		end)
		
		return function()
			-- upvalues: var3 (ref)
			var3:Disconnect()
		end
	end, {})
	
	return reactModule.createElement(shopImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
		getViewPortBounds = reactModule.useCallback(function()
			-- upvalues: p1 (ref), getShopImpressionsViewportBounds (copy), var1 (ref)
			return getShopImpressionsViewportBounds(var1, if p1.parentRef then p1.parentRef.current else nil)
		end, { p1.parentRef, var1 }),
		pageFilter = p1.pageFilter,
		collectObjectsFunc = p1.collectObjectsFunc,
		filterImpressionFunc = p1.filterImpressionFunc,
		onImpressionsDetected = p1.onImpressionsDetected,
		scanDebounceSeconds = p1.scanDebounceSeconds
	})
end