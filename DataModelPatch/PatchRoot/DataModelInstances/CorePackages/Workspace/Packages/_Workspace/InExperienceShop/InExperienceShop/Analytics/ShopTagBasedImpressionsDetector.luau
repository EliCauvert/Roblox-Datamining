local Parent = script:FindFirstAncestor("InExperienceShop").Parent
local CollectionService = game:GetService("CollectionService")
local ReactModule = require(Parent.React)
local UnifiedEventLogConstants = require(Parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local ShopScreenSizeImpressionsDetectorModule = require(script.Parent.ShopScreenSizeImpressionsDetector)

return function(p1)
	-- upvalues: ReactModule (copy), CollectionService (copy), UnifiedEventLogConstants (copy), ShopScreenSizeImpressionsDetectorModule (copy)
	local UseRefResult = ReactModule.useRef({})
	local UseRefResult1 = ReactModule.useRef({})
	local UseResult = ReactModule.useCallback(function(Object): boolean
		-- upvalues: UseRefResult (copy)
		return not UseRefResult.current[Object:GetFullName()]
	end, {})
	local UseResult1 = ReactModule.useCallback(function(List)
		-- upvalues: UseRefResult (copy), UseRefResult1 (copy), p1 (copy)
		local VisibleInstances = {}
		
		for _, value in List do
			local FullName = value:GetFullName()
			
			if not UseRefResult.current[FullName] then
				VisibleInstances[FullName] = value
				
				if not UseRefResult1.current[FullName] then
					UseRefResult1.current[FullName] = value.AncestryChanged:Connect(function()
						-- upvalues: value (copy), UseRefResult (upval), FullName (copy), UseRefResult1 (upval)
						if not value.Parent then
							UseRefResult.current[FullName] = nil
							
							if UseRefResult1.current[FullName] then
								UseRefResult1.current[FullName]:Disconnect()
								UseRefResult1.current[FullName] = nil
							end
						end
					end)
				end
				UseRefResult.current[FullName] = true
			end
		end
		if next(VisibleInstances) and p1.extensions then
			for _, visibleInstance in VisibleInstances do
				for _, extension in p1.extensions do
					extension({ visibleInstance = visibleInstance })
				end
			end
		end
	end, { p1.extensions })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy)
		return function()
			-- upvalues: UseRefResult1 (upval)
			for _, Connection in UseRefResult1.current do
				if Connection then
					Connection:Disconnect()
				end
			end
			UseRefResult1.current = {}
		end
	end, {})
	
	return ReactModule.createElement(ShopScreenSizeImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		pageFilter = p1.pageFilter,
		onRequestImpressionsSignal = p1.requestImpressionsSignal,
		filterImpressionFunc = UseResult,
		onImpressionsDetected = UseResult1,
		collectObjectsFunc = ReactModule.useCallback(function()
			-- upvalues: CollectionService (upval), UnifiedEventLogConstants (upval)
			return CollectionService:GetTagged(UnifiedEventLogConstants.TAG_NAME)
		end, {})
	})
end