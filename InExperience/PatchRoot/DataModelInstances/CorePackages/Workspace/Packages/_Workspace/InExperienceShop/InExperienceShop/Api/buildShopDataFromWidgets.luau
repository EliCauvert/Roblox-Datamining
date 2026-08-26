local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local promiseModule = require(parent.Promise)
local sharedFlagsModule = require(parent.SharedFlags)
local constantsModule = require(inExperienceShop.Constants)
local _ = require(inExperienceShop.Types)
local fFlagEnableRobuxInExperienceShop = sharedFlagsModule.FFlagEnableRobuxInExperienceShop
local _ = require(script.Parent.multiGetProductInfo)
local shopItemMappingModule = require(script.Parent.shopItemMapping)
local hydrateRobuxBonusItemsModule = require(script.Parent.hydrateRobuxBonusItems)
local toRobuxPackageItem = require(script.Parent.robuxWidgetMapping).toRobuxPackageItem
local appendBonusItemRequests = hydrateRobuxBonusItemsModule.appendBonusItemRequests
local mergeBonusItemDetailsIntoSections = hydrateRobuxBonusItemsModule.mergeBonusItemDetailsIntoSections
local makeRequestKey = shopItemMappingModule.makeRequestKey
local toShopItem = shopItemMappingModule.toShopItem
local logCounterModule = require(inExperienceShop.Internal.logCounter)
local productInfoFailedItemsCounterModule = require(inExperienceShop.Events.ProductInfoFailedItemsCounter)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local t = {
	name = "CommonUI.Features.Label.Home",
	id = constantsModule.HOME_CATEGORY_ID
}

return function(p1, p2)
	-- upvalues: t (ref), constantsModule (ref), fFlagEnableRobuxInExperienceShop (ref), toRobuxPackageItem (ref), promiseModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), appendBonusItemRequests (ref), makeRequestKey (ref), toShopItem (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), mergeBonusItemDetailsIntoSections (ref)
	local list = { t }
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	for i, v in ipairs(p1.categories) do
		if not constantsModule.BLACKLISTED_CATEGORY_NAMES[string.lower(v.name)] then
			local var1 = tostring(v.id)
			table.insert(list, { id = var1, name = v.name })
			local var2 = #t_1 + 1
			local t_5 = { id = var1, name = v.name, items = {} }
			local metadata = v.metadata
			
			if fFlagEnableRobuxInExperienceShop and metadata ~= nil and metadata.paymentSessionId ~= nil then
				t_5.paymentSessionId = metadata.paymentSessionId
			end
			t_1[var2] = t_5
			local var3 = 0
			
			for i_1, v_1 in ipairs(v.items) do
				local product, var4
				local type = v_1.type
				local _ = nil
				local _ = nil
				
				if type == "Product" then
					product = Enum.InfoType.Product
					var4 = type
				elseif type == "GamePass" then
					product = Enum.InfoType.GamePass
					var4 = type
				elseif type == "Robux" and fFlagEnableRobuxInExperienceShop then
					local var5 = toRobuxPackageItem(v_1)
					
					if var5 ~= nil then
						if t_5.robuxPackages == nil then
							t_5.robuxPackages = {}
						end
						local robuxPackages = t_5.robuxPackages
						
						if #robuxPackages == 0 then
							var5.isPrimaryRobuxPackage = true
						end
						table.insert(robuxPackages, var5)
					end
				end
				var3 += 1
				t_4[var2] = true
				table.insert(t_2, { id = v_1.id, infoType = product })
				table.insert(t_3, {
					categoryIndex = var2,
					sectionId = var1,
					itemType = var4,
					sectionItemIndex = var3
				})
			end
		end
	end
	local function filterOutput(p3)
		-- upvalues: t_4 (ref), list (ref), constantsModule (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p3) do
			if t_4[i] or v.robuxPackages ~= nil and #v.robuxPackages > 0 then
				table.insert(t, v)
				t_1[v.id] = true
			end
		end
		local t_2 = {}
		
		for i_1, v_1 in ipairs(list) do
			if v_1.id == constantsModule.HOME_CATEGORY_ID or t_1[v_1.id] then
				table.insert(t_2, v_1)
			end
		end
		return t_2, t
	end
	
	if p2 == nil then
		local list_1 = table.create(#t_2)
		
		for i_1, v_1 in ipairs(t_2) do
			local var6 = t_3[i_1]
			list_1[i_1] = {
				id = v_1.id,
				infoType = v_1.infoType,
				itemType = var6.itemType,
				sectionId = var6.sectionId,
				originalIndex = var6.sectionItemIndex
			}
		end
		local var7, var8 = filterOutput(t_1)
		
		return promiseModule.resolve({
			categories = var7,
			sections = var8,
			failedItems = list_1,
			metadata = if fFlagEnableExperienceShopGlobalIconModule then p1.metadata else nil
		})
	else
		local t_2Count = #t_2
		
		if fFlagEnableRobuxInExperienceShop then
			appendBonusItemRequests(t_2, t_1)
		end
		return p2(t_2):andThen(function(p4)
			-- upvalues: makeRequestKey (copy), t_2Count (ref), t_2 (ref), t_3 (ref), t_1 (ref), toShopItem (copy), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), fFlagEnableRobuxInExperienceShop (copy), mergeBonusItemDetailsIntoSections (copy), filterOutput (ref), fFlagEnableExperienceShopGlobalIconModule (copy), p1 (ref)
			local t = {}
			
			for i, v in ipairs(p4) do
				t[makeRequestKey(v.request.id, v.request.infoType)] = v
			end
			local t_4 = {}
			
			for i_1 = 1, t_2Count do
				local var9 = t_2[i_1]
				local var10 = t_3[i_1]
				local id = t[makeRequestKey(var9.id, var9.infoType)]
				
				if id == nil or not id.ok then
					table.insert(t_4, {
						id = var9.id,
						infoType = var9.infoType,
						itemType = var10.itemType,
						sectionId = var10.sectionId,
						originalIndex = var10.sectionItemIndex
					})
				else
					local categoryIndex = t_1[var10.categoryIndex]
					local var11 = toShopItem(id.value, var10.itemType, var9.id)
					var11.originalIndex = var10.sectionItemIndex
					table.insert(categoryIndex.items, var11)
				end
			end
			if #t_4 > 0 then
				logCounterModule(productInfoFailedItemsCounterModule, #t_4)
			end
			local var12, var13 = filterOutput(if fFlagEnableRobuxInExperienceShop then mergeBonusItemDetailsIntoSections(t_1, p4) else t_1)
			
			return {
				categories = var12,
				sections = var13,
				failedItems = t_4,
				metadata = if fFlagEnableExperienceShopGlobalIconModule then p1.metadata else nil
			}
		end)
	end
end