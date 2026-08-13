local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local _ = require(profilePlatform.Common.Types)
local inspectAvatarUtilsModule = require(profilePlatform.Components.InspectAvatar.InspectAvatarUtils)
local isItemPurchasable = inspectAvatarUtilsModule.isItemPurchasable
local getPriceStatus = inspectAvatarUtilsModule.getPriceStatus
local priceStatusEnum = inspectAvatarUtilsModule.PriceStatusEnum

return function(p0) --[[ line: 33 | named "useRecentActivityPurchaseSelection" ]]
	-- upvalues: reactModule (ref), isItemPurchasable (ref), dashModule (ref), inspectAvatarUtilsModule (ref), getPriceStatus (ref), priceStatusEnum (ref)
	local var4, var5 = reactModule.useState({})
	local var6 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 39 ]]
		-- upvalues: p0 (ref), isItemPurchasable (copy), var6 (ref), var5 (ref), dashModule (copy)
		if #p0 == 0 then return end
		local t = {}
		local var8 = false
		
		for i, v in p0 do
			local id = v.id
			
			if isItemPurchasable(v) and not var6.current[id] then
				var6.current[id] = true
				t[id] = true
				var8 = true
			end
		end
		if var8 then
			var5(function(p1) --[[ line: 56 ]]
				-- upvalues: dashModule (copy), t (ref)
				return dashModule.join(p1, t)
			end)
			
			return
		end
	end, { p0 })
	
	return {
		selectedItems = var4,
		onToggleItem = reactModule.useCallback(function(p2) --[[ line: 61 ]]
			-- upvalues: var5 (ref), dashModule (copy)
			var5(function(p3) --[[ line: 62 ]]
				-- upvalues: dashModule (copy), p2 (ref)
				return dashModule.join(p3, { [p2] = not p3[p2] })
			end)
		end, {}),
		purchaseData = reactModule.useMemo(function() --[[ line: 67 ]]
			-- upvalues: p0 (ref), var4 (ref), isItemPurchasable (copy), inspectAvatarUtilsModule (copy), getPriceStatus (copy), priceStatusEnum (copy)
			local t = {}
			local var10 = 0
			local var11 = 0
			
			for i, v in p0 do
				if v.id and var4[v.id] and isItemPurchasable(v) then
					local effectivePrice = inspectAvatarUtilsModule.getEffectivePrice(v)
					table.insert(t, {
						collectibleProductId = if getPriceStatus(v) == priceStatusEnum.PurchaseFromResale and v.collectibleItemDetails then v.collectibleItemDetails.collectibleLowestAvailableResaleProductId or v.collectibleProductId else v.collectibleProductId,
						agreedPriceRobux = effectivePrice
					})
					var10 += effectivePrice
					var11 += 1
				end
			end
			return { lineItems = t, totalPrice = var10, count = var11 }
		end, { p0, var4 })
	}
end