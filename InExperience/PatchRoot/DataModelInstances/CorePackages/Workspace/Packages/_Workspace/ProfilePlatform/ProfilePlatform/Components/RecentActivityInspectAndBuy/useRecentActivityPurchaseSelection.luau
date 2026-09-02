local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local dashModule = require(parent.Dash)
local _ = require(profilePlatform.Common.Types)
local inspectAvatarUtilsModule = require(profilePlatform.Components.InspectAvatar.InspectAvatarUtils)
local _ = require(profilePlatform.Analytics.sendProfilePurchaseEvents)
local fFlagProfileUnifiedPurchaseLoggingModule = require(profilePlatform.Flags.FFlagProfileUnifiedPurchaseLogging)
local isItemPurchasable = inspectAvatarUtilsModule.isItemPurchasable
local getPriceStatus = inspectAvatarUtilsModule.getPriceStatus
local priceStatusEnum = inspectAvatarUtilsModule.PriceStatusEnum

return function(p1)
	-- upvalues: reactModule (ref), isItemPurchasable (ref), dashModule (ref), fFlagProfileUnifiedPurchaseLoggingModule (ref), inspectAvatarUtilsModule (ref), getPriceStatus (ref), priceStatusEnum (ref)
	local var1, var2 = reactModule.useState({})
	local var3 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), isItemPurchasable (copy), var3 (ref), var2 (ref), dashModule (copy)
		if #p1 == 0 then return end
		local t = {}
		local var4 = false
		
		for i, v in p1 do
			local id = v.id
			
			if isItemPurchasable(v) and not var3.current[id] then
				var3.current[id] = true
				t[id] = true
				var4 = true
			end
		end
		if var4 then
			var2(function(p2)
				-- upvalues: dashModule (copy), t (ref)
				return dashModule.join(p2, t)
			end)
			
			return
		end
	end, { p1 })
	
	return {
		selectedItems = var1,
		onToggleItem = reactModule.useCallback(function(p2)
			-- upvalues: var2 (ref), dashModule (copy)
			var2(function(p3)
				-- upvalues: dashModule (copy), p2 (ref)
				return dashModule.join(p3, { [p2] = not p3[p2] })
			end)
		end, {}),
		purchaseData = reactModule.useMemo(function()
			-- upvalues: fFlagProfileUnifiedPurchaseLoggingModule (copy), p1 (ref), var1 (ref), isItemPurchasable (copy), inspectAvatarUtilsModule (copy), getPriceStatus (copy), priceStatusEnum (copy)
			local t = {}
			local var5 = if fFlagProfileUnifiedPurchaseLoggingModule then {} else nil
			local var6 = 0
			local var7 = 0
			
			for i, v in p1 do
				if v.id then
					local id = v.id
					
					if var1[id] and isItemPurchasable(v) then
						local effectivePrice = inspectAvatarUtilsModule.getEffectivePrice(v)
						table.insert(t, {
							collectibleProductId = if getPriceStatus(v) == priceStatusEnum.PurchaseFromResale and v.collectibleItemDetails then v.collectibleItemDetails.collectibleLowestAvailableResaleProductId or v.collectibleProductId else v.collectibleProductId,
							agreedPriceRobux = effectivePrice
						})
						
						if fFlagProfileUnifiedPurchaseLoggingModule and var5 then
							table.insert(var5, {
								itemId = id,
								itemType = v.itemType,
								itemSubType = tonumber(v.itemSubType),
								priceInRobux = effectivePrice
							})
						end
						var6 += effectivePrice
						var7 += 1
					end
				end
			end
			return {
				lineItems = t,
				totalPrice = var6,
				count = var7,
				purchasedItems = var5
			}
		end, { p1, var1 })
	}
end