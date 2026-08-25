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

return function(p0, p1)
	-- upvalues: t (ref), constantsModule (ref), fFlagEnableRobuxInExperienceShop (ref), toRobuxPackageItem (ref), promiseModule (ref), fFlagEnableExperienceShopGlobalIconModule (ref), appendBonusItemRequests (ref), makeRequestKey (ref), toShopItem (ref), logCounterModule (ref), productInfoFailedItemsCounterModule (ref), mergeBonusItemDetailsIntoSections (ref)
	local list = { t }
	local t_1 = {}
	local t_2 = {}
	local t_3 = {}
	local t_4 = {}
	
	for i, v in ipairs(p0.categories) do
		if not constantsModule.BLACKLISTED_CATEGORY_NAMES[string.lower(v.name)] then
			local var21 = tostring(v.id)
			table.insert(list, { id = var21, name = v.name })
			local var22 = #t_1 + 1
			local t_5 = { id = var21, name = v.name, items = {} }
			local metadata = v.metadata
			
			if fFlagEnableRobuxInExperienceShop and metadata ~= nil and metadata.paymentSessionId ~= nil then
				t_5.paymentSessionId = metadata.paymentSessionId
			end
			t_1[var22] = t_5
			local var24 = 0
			
			for i_1, v_1 in ipairs(v.items) do
				local product, var25
				local type = v_1.type
				local _ = nil
				local _ = nil
				
				if type == "Product" then
					product = Enum.InfoType.Product
					var25 = type
				elseif type == "GamePass" then
					product = Enum.InfoType.GamePass
					var25 = type
				elseif type == "Robux" and fFlagEnableRobuxInExperienceShop then
					local var26 = toRobuxPackageItem(v_1)
					
					if var26 ~= nil then
						if t_5.robuxPackages == nil then
							t_5.robuxPackages = {}
						end
						local robuxPackages = t_5.robuxPackages
						
						if #robuxPackages == 0 then
							var26.isPrimaryRobuxPackage = true
						end
						table.insert(robuxPackages, var26)
					end
				end
				var24 += 1
				t_4[var22] = true
				table.insert(t_2, { id = v_1.id, infoType = product })
				table.insert(t_3, {
					categoryIndex = var22,
					sectionId = var21,
					itemType = var25,
					sectionItemIndex = var24
				})
			end
		end
	end
	local function filterOutput(p2)
		-- upvalues: t_4 (ref), list (ref), constantsModule (copy)
		local t = {}
		local t_1 = {}
		
		for i, v in ipairs(p2) do
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
	
	if p1 == nil then
		local list_1 = table.create(#t_2)
		
		for i_1, v_1 in ipairs(t_2) do
			local var19 = t_3[i_1]
			list_1[i_1] = {
				id = v_1.id,
				infoType = v_1.infoType,
				itemType = var19.itemType,
				sectionId = var19.sectionId,
				originalIndex = var19.sectionItemIndex
			}
		end
		local var17, var18 = filterOutput(t_1)
		
		return promiseModule.resolve({
			categories = var17,
			sections = var18,
			failedItems = list_1,
			metadata = if fFlagEnableExperienceShopGlobalIconModule then p0.metadata else nil
		})
	else
		local t_2Count = #t_2
		
		if fFlagEnableRobuxInExperienceShop then
			appendBonusItemRequests(t_2, t_1)
		end
		return p1(t_2):andThen(function(p3)
			-- upvalues: makeRequestKey (copy), t_2Count (ref), t_2 (ref), t_3 (ref), t_1 (ref), toShopItem (copy), logCounterModule (copy), productInfoFailedItemsCounterModule (copy), fFlagEnableRobuxInExperienceShop (copy), mergeBonusItemDetailsIntoSections (copy), filterOutput (ref), fFlagEnableExperienceShopGlobalIconModule (copy), p0 (ref)
			local t = {}
			
			for i, v in ipairs(p3) do
				t[makeRequestKey(v.request.id, v.request.infoType)] = v
			end
			local t_4 = {}
			
			for i_1 = 1, t_2Count do
				local var32 = t_2[i_1]
				local var33 = t_3[i_1]
				local id = t[makeRequestKey(var32.id, var32.infoType)]
				
				if id == nil or not id.ok then
					table.insert(t_4, {
						id = var32.id,
						infoType = var32.infoType,
						itemType = var33.itemType,
						sectionId = var33.sectionId,
						originalIndex = var33.sectionItemIndex
					})
				else
					local categoryIndex = t_1[var33.categoryIndex]
					local var34 = toShopItem(id.value, var33.itemType, var32.id)
					var34.originalIndex = var33.sectionItemIndex
					table.insert(categoryIndex.items, var34)
				end
			end
			if #t_4 > 0 then
				logCounterModule(productInfoFailedItemsCounterModule, #t_4)
			end
			local var35, var36 = filterOutput(if fFlagEnableRobuxInExperienceShop then mergeBonusItemDetailsIntoSections(t_1, p3) else t_1)
			
			return {
				categories = var35,
				sections = var36,
				failedItems = t_4,
				metadata = if fFlagEnableExperienceShopGlobalIconModule then p0.metadata else nil
			}
		end)
	end
end