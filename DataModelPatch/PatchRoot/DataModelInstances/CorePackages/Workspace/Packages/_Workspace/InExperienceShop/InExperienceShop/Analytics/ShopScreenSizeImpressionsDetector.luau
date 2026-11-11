local ReactModule = require(script:FindFirstAncestor("InExperienceShop").Parent.React)
local GetShopImpressionsViewportBoundsFunction = require(script.Parent.getShopViewportBounds).getShopImpressionsViewportBounds
local ShopImpressionsDetectorModule = require(script.Parent.ShopImpressionsDetector)
local _Vector2 = Vector2.new(1920, 1080)

return function(p1)
	-- upvalues: _Vector2 (copy), ReactModule (copy), GetShopImpressionsViewportBoundsFunction (copy), ShopImpressionsDetectorModule (copy)
	local CurrentCamera = workspace.CurrentCamera
	local UseStateResult, UseStateResult2 = ReactModule.useState(if CurrentCamera then CurrentCamera.ViewportSize else _Vector2)
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult2 (copy)
		local CurrentCamera = workspace.CurrentCamera
		
		if CurrentCamera == nil then
			return function() end
		else
			local Connection = CurrentCamera:GetPropertyChangedSignal("ViewportSize"):Connect(function()
				-- upvalues: UseStateResult2 (upval), CurrentCamera (copy)
				UseStateResult2(CurrentCamera.ViewportSize)
			end)
			
			return function()
				-- upvalues: Connection (copy)
				Connection:Disconnect()
			end
		end
	end, {})
	
	return ReactModule.createElement(ShopImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		onRequestImpressionsSignal = p1.onRequestImpressionsSignal,
		getViewPortBounds = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), GetShopImpressionsViewportBoundsFunction (upval), UseStateResult (copy)
			return GetShopImpressionsViewportBoundsFunction(UseStateResult, if p1.parentRef then p1.parentRef.current else nil)
		end, { p1.parentRef, UseStateResult }),
		pageFilter = p1.pageFilter,
		collectObjectsFunc = p1.collectObjectsFunc,
		filterImpressionFunc = p1.filterImpressionFunc,
		onImpressionsDetected = p1.onImpressionsDetected,
		scanDebounceSeconds = p1.scanDebounceSeconds
	})
end