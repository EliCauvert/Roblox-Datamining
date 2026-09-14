local localizationService = game:GetService("LocalizationService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local creatorInventoryModule = require(parent.DataHydration.CreatorInventory)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(script.Parent.AssetLibraryDetailView)
local _ = require(script.Parent.Parent.AssetLibraryTypes)
local useAssetLibraryStringsModule = require(script.Parent.Parent.useAssetLibraryStrings)

local function _(value, p1)
	return if value == "Model" then p1.model elseif value == "Image" then p1.image else p1.audio
end

local _ = function(p1)
	-- upvalues: localizationService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime == nil then p1 else dateTime:FormatLocalTime("ll", localizationService.RobloxLocaleId)
end

local _ = function(p1)
	-- upvalues: localizationService (ref)
	if p1 == nil or p1 == "" then
		return nil
	end
	local dateTime = DateTime.fromIsoDate(p1)
	
	return if dateTime == nil then p1 else dateTime:FormatLocalTime("lll", localizationService.RobloxLocaleId)
end

return function(value)
	-- upvalues: useAssetLibraryStringsModule (ref), creatorInventoryModule (ref), reactModule (ref), signalsModule (ref), localizationService (ref), signalsReactModule (ref)
	local var1 = useAssetLibraryStringsModule()
	local inventoryStore = value.inventoryStore or creatorInventoryModule.getCreatorInventoryStore(false)
	local var2 = reactModule.useMemo(function()
		-- upvalues: inventoryStore (ref), value (ref)
		return inventoryStore.getAsset(value.universeId, value.assetId)
	end, { inventoryStore, value.universeId, value.assetId })
	local var3 = signalsReactModule.useSignalState(reactModule.useMemo(function()
		-- upvalues: signalsModule (copy), var2 (ref), var1 (ref), localizationService (copy)
		return signalsModule.createComputed(function(p1)
			-- upvalues: var2 (copy), var1 (copy), localizationService (copy)
			local var4 = var2.data(p1)
			
			if var4 == nil then
				return { asset = nil, status = "Failed" }
			end
			local var5
			local var6 = if var4.creationContext ~= nil then nil else var4.creationContext.creator
			local t = { status = "Ready" }
			local t_1 = {
				assetId = var4.assetId,
				displayName = var4.displayName,
				description = var4.description,
				assetType = var4.assetType
			}
			local assetType = var4.assetType
			local var7 = var1
			t_1.displayType = if assetType == "Model" then var7.model elseif assetType == "Image" then var7.image else var7.audio
			local createTime = var4.createTime
			
			if createTime == nil or createTime == "" then
				var5 = nil
			else
				local dateTime = DateTime.fromIsoDate(createTime)
				var5 = if dateTime == nil then createTime else dateTime:FormatLocalTime("ll", localizationService.RobloxLocaleId)
			end
			local var8
			t_1.createTime = var5
			createTime = var4.updateTime
			
			if createTime == nil or createTime == "" then
				var8 = nil
			else
				local dateTime = DateTime.fromIsoDate(createTime)
				var8 = if dateTime == nil then createTime else dateTime:FormatLocalTime("lll", localizationService.RobloxLocaleId)
			end
			t_1.updateTime = var8
			t_1.creatorName = if var6 ~= nil then nil else var6.name
			t.asset = t_1
			
			return t
		end)
	end, { var2, var1 }))
	
	return {
		asset = var3.asset,
		status = var3.status,
		strings = var1,
		onBack = value.onBack
	}
end