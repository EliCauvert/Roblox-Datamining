local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorInventoryModule = require(parent.DataHydration.CreatorInventory)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryDetailView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)

local function _(value, p0) --[[ line: 28 | named "getAssetTypeName" ]]
	return if value == "Model" then p0.model elseif value == "Image" then p0.image else p0.audio
end

local _ = function(p1) --[[ line: 37 | named "formatDate" ]]
	-- upvalues: localizationService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime == nil then p1 else dateTime:FormatLocalTime("ll", localizationService.RobloxLocaleId)
end

local _ = function(p2) --[[ line: 50 | named "formatDateTime" ]]
	-- upvalues: localizationService (ref)
	if p2 == nil or p2 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p2)
	
	return if dateTime == nil then p2 else dateTime:FormatLocalTime("lll", localizationService.RobloxLocaleId)
end

return function(value) --[[ line: 63 | named "useAssetLibraryDetailViewModel" ]]
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), signalsModule (ref), localizationService (ref), signalsReactModule (ref)
	local var8 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var10 = reactModule.useMemo(function() --[[ line: 66 ]]
		-- upvalues: inventoryStore (ref), value (ref)
		return inventoryStore.getAsset(value.universeId, value.assetId)
	end, { inventoryStore, value.universeId, value.assetId })
	local var11 = signalsReactModule.useSignalState(reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: signalsModule (copy), var10 (ref), var8 (ref), localizationService (copy)
		return signalsModule.createComputed(function(p3) --[[ line: 71 ]]
			-- upvalues: var10 (copy), var8 (copy), localizationService (copy)
			local var12 = var10.data(p3)
			
			if var12 == nil then
				return { asset = nil, status = "Failed" }
			end
			local var18
			local var13 = if var12.creationContext ~= nil then nil else var12.creationContext.creator
			local t = { status = "Ready" }
			local t_1 = {
				assetId = var12.assetId,
				displayName = var12.displayName,
				description = var12.description,
				assetType = var12.assetType
			}
			local assetType = var12.assetType
			local var16 = var8
			t_1.displayType = if assetType == "Model" then var16.model elseif assetType == "Image" then var16.image else var16.audio
			local createTime = var12.createTime
			
			if createTime == nil or createTime == "" then
				var18 = nil
			else
				local dateTime = DateTime.fromIsoDate(createTime)
				var18 = if dateTime == nil then createTime else dateTime:FormatLocalTime("ll", localizationService.RobloxLocaleId)
			end
			local var20
			t_1.createTime = var18
			createTime = var12.updateTime
			
			if createTime == nil or createTime == "" then
				var20 = nil
			else
				local dateTime = DateTime.fromIsoDate(createTime)
				var20 = if dateTime == nil then createTime else dateTime:FormatLocalTime("lll", localizationService.RobloxLocaleId)
			end
			t_1.updateTime = var20
			t_1.creatorName = if var13 ~= nil then nil else var13.name
			t.asset = t_1
			
			return t
		end)
	end, { var10, var8 }))
	
	return {
		asset = var11.asset,
		status = var11.status,
		strings = var8,
		onBack = value.onBack
	}
end