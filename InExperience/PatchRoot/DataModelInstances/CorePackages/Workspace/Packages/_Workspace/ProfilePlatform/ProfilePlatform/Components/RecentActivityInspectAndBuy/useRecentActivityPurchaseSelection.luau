local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local DashModule = require(Parent.Dash)
local _ = require(ProfilePlatform.Common.Types)
local InspectAvatarUtilsModule = require(ProfilePlatform.Components.InspectAvatar.InspectAvatarUtils)
local _ = require(ProfilePlatform.Analytics.sendProfilePurchaseEvents)
local FFlagProfileUnifiedPurchaseLoggingModule = require(ProfilePlatform.Flags.FFlagProfileUnifiedPurchaseLogging)
local IsItemPurchasableFunction = InspectAvatarUtilsModule.isItemPurchasable
local GetPriceStatusFunction = InspectAvatarUtilsModule.getPriceStatus
local PriceStatusEnum = InspectAvatarUtilsModule.PriceStatusEnum

return function(p1) --[[ Line: 40 | Named "useRecentActivityPurchaseSelection" ]]
	-- upvalues: ReactModule (copy), IsItemPurchasableFunction (copy), DashModule (copy), FFlagProfileUnifiedPurchaseLoggingModule (copy), InspectAvatarUtilsModule (copy), GetPriceStatusFunction (copy), PriceStatusEnum (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState({})
	local UseRefResult = ReactModule.useRef({})
	ReactModule.useEffect(function() --[[ Line: 46 ]]
		-- upvalues: p1 (copy), IsItemPurchasableFunction (upval), UseRefResult (copy), UseStateResult2 (copy), DashModule (upval)
		if #p1 == 0 then return end
		local t = {}
		local Flag = false
		
		for _, value in p1 do
			local Id = value.id
			
			if IsItemPurchasableFunction(value) and not UseRefResult.current[Id] then
				UseRefResult.current[Id] = true
				t[Id] = true
				Flag = true
			end
		end
		if Flag then
			UseStateResult2(function(p2) --[[ Line: 63 ]]
				-- upvalues: DashModule (upval), t (copy)
				return DashModule.join(p2, t)
			end)
			
			return
		end
	end, { p1 })
	
	return {
		selectedItems = UseStateResult,
		onToggleItem = ReactModule.useCallback(function(p2) --[[ Line: 68 ]]
			-- upvalues: UseStateResult2 (copy), DashModule (upval)
			UseStateResult2(function(p3) --[[ Line: 69 ]]
				-- upvalues: DashModule (upval), p2 (copy)
				return DashModule.join(p3, { [p2] = not p3[p2] })
			end)
		end, {}),
		purchaseData = ReactModule.useMemo(function() --[[ Line: 74 ]]
			-- upvalues: FFlagProfileUnifiedPurchaseLoggingModule (upval), p1 (copy), UseStateResult (copy), IsItemPurchasableFunction (upval), InspectAvatarUtilsModule (upval), GetPriceStatusFunction (upval), PriceStatusEnum (upval)
			local LineItems = {}
			local T = if FFlagProfileUnifiedPurchaseLoggingModule then {} else nil
			local TotalPrice = 0
			local Count = 0
			
			for _, value in p1 do
				if value.id then
					local Id = value.id
					
					if UseStateResult[Id] and IsItemPurchasableFunction(value) then
						local EffectivePrice: number = InspectAvatarUtilsModule.getEffectivePrice(value)
						table.insert(LineItems, {
							collectibleProductId = GetPriceStatusFunction(value) == PriceStatusEnum.PurchaseFromResale and value.collectibleItemDetails and value.collectibleItemDetails.collectibleLowestAvailableResaleProductId or value.collectibleProductId,
							agreedPriceRobux = EffectivePrice
						})
						
						if FFlagProfileUnifiedPurchaseLoggingModule and T then
							table.insert(T, {
								itemId = Id,
								itemType = value.itemType,
								itemSubType = tonumber(value.itemSubType),
								priceInRobux = EffectivePrice
							})
						end
						TotalPrice += EffectivePrice
						Count += 1
					end
				end
			end
			return {
				lineItems = LineItems,
				totalPrice = TotalPrice,
				count = Count,
				purchasedItems = T
			}
		end, { p1, UseStateResult })
	}
end