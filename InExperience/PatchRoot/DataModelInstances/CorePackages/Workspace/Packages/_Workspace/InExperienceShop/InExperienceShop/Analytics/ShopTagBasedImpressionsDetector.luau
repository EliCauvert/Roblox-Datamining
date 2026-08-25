local parent = script:FindFirstAncestor("InExperienceShop").Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local unifiedEventLogConstants = require(parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local shopScreenSizeImpressionsDetectorModule = require(script.Parent.ShopScreenSizeImpressionsDetector)

return function(p0)
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstants (ref), shopScreenSizeImpressionsDetectorModule (ref)
	local var3 = reactModule.useRef({})
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useCallback(function(p1)
		-- upvalues: var3 (ref)
		return not var3.current[p1:GetFullName()]
	end, {})
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var4 (ref), p0 (ref)
		local t = {}
		
		for i, v in p2 do
			local fullName = v:GetFullName()
			
			if not var3.current[fullName] then
				t[fullName] = v
				
				if not var4.current[fullName] then
					var4.current[fullName] = v.AncestryChanged:Connect(function()
						-- upvalues: v (ref), var3 (copy), fullName (ref), var4 (copy)
						if not v.Parent then
							var3.current[fullName] = nil
							
							if var4.current[fullName] then
								var4.current[fullName]:Disconnect()
								var4.current[fullName] = nil
							end
						end
					end)
				end
				var3.current[fullName] = true
			end
		end
		if next(t) and p0.extensions then
			for i, v_1 in t do
				for i_2, v_2 in p0.extensions do
					v_2({ visibleInstance = v_1 })
				end
			end
		end
	end, { p0.extensions })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref)
		return function()
			-- upvalues: var4 (copy)
			for i, v in var4.current do
				if v then
					v:Disconnect()
				end
			end
			var4.current = {}
		end
	end, {})
	
	return reactModule.createElement(shopScreenSizeImpressionsDetectorModule, {
		parentRef = p0.parentRef,
		pageFilter = p0.pageFilter,
		onRequestImpressionsSignal = p0.requestImpressionsSignal,
		filterImpressionFunc = var5,
		onImpressionsDetected = var6,
		collectObjectsFunc = reactModule.useCallback(function()
			-- upvalues: collectionService (copy), unifiedEventLogConstants (copy)
			return collectionService:GetTagged(unifiedEventLogConstants.TAG_NAME)
		end, {})
	})
end