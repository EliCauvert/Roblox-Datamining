local parent = script:FindFirstAncestor("InExperienceShop").Parent
local collectionService = game:GetService("CollectionService")
local reactModule = require(parent.React)
local unifiedEventLogConstants = require(parent.AvatarExperienceAnalytics).UnifiedEventLogConstants
local shopScreenSizeImpressionsDetectorModule = require(script.Parent.ShopScreenSizeImpressionsDetector)

return function(p1)
	-- upvalues: reactModule (ref), collectionService (ref), unifiedEventLogConstants (ref), shopScreenSizeImpressionsDetectorModule (ref)
	local var1 = reactModule.useRef({})
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref)
		return not var1.current[p2:GetFullName()]
	end, {})
	local var4 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), var2 (ref), p1 (ref)
		local t = {}
		
		for i, v in p2 do
			local fullName = v:GetFullName()
			
			if not var1.current[fullName] then
				t[fullName] = v
				
				if not var2.current[fullName] then
					var2.current[fullName] = v.AncestryChanged:Connect(function()
						-- upvalues: v (ref), var1 (copy), fullName (ref), var2 (copy)
						if not v.Parent then
							var1.current[fullName] = nil
							
							if var2.current[fullName] then
								var2.current[fullName]:Disconnect()
								var2.current[fullName] = nil
							end
						end
					end)
				end
				var1.current[fullName] = true
			end
		end
		if next(t) and p1.extensions then
			for i, v_1 in t do
				for i_2, v_2 in p1.extensions do
					v_2({ visibleInstance = v_1 })
				end
			end
		end
	end, { p1.extensions })
	reactModule.useEffect(function()
		-- upvalues: var2 (ref)
		return function()
			-- upvalues: var2 (copy)
			for i, v in var2.current do
				if v then
					v:Disconnect()
				end
			end
			var2.current = {}
		end
	end, {})
	
	return reactModule.createElement(shopScreenSizeImpressionsDetectorModule, {
		parentRef = p1.parentRef,
		pageFilter = p1.pageFilter,
		onRequestImpressionsSignal = p1.requestImpressionsSignal,
		filterImpressionFunc = var3,
		onImpressionsDetected = var4,
		collectObjectsFunc = reactModule.useCallback(function()
			-- upvalues: collectionService (copy), unifiedEventLogConstants (copy)
			return collectionService:GetTagged(unifiedEventLogConstants.TAG_NAME)
		end, {})
	})
end