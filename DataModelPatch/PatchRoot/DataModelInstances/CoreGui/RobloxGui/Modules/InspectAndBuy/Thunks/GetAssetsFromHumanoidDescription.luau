local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local GetProductInfoModule = require(Parent.Thunks.GetProductInfo)
local GetVersionInfoModule = require(Parent.Thunks.GetVersionInfo)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetAssetsModule = require(Parent.Actions.SetAssets)
local SetEquippedAssetsModule = require(Parent.Actions.SetEquippedAssets)
local ConstantsModule = require(Parent.Constants)
local GetAssetBundlesModule = require(Parent.Thunks.GetAssetBundles)
local BatchGetAssetsModule = require(Parent.Thunks.BatchGetAssets)
local FFlagAXEnableRegionalFilteringofAssetsModule = require(Parent.Flags.FFlagAXEnableRegionalFilteringofAssets)
local t = {}

local function getAssetIds(Humanoid: Humanoid)
	-- upvalues: ConstantsModule (copy), AssetInfoModule (copy)
	local FromHumanoidDescriptionResults = {}
	
	for i, value in pairs(ConstantsModule.AssetTypeIdStringToHumanoidDescriptionProp) do
		if ConstantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			for _, value1 in pairs(string.split(Humanoid[value] or "")) do
				if tonumber(value1) and value1 ~= "0" then
					table.insert(FromHumanoidDescriptionResults, AssetInfoModule.fromHumanoidDescription(value1))
				end
			end
		end
	end
	for _, accessory in pairs((Humanoid:GetAccessories(true))) do
		FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescription(accessory.AssetId)
	end
	for _, emote in pairs((Humanoid:GetEmotes())) do
		for _, value2 in pairs(emote) do
			FromHumanoidDescriptionResults[#FromHumanoidDescriptionResults + 1] = AssetInfoModule.fromHumanoidDescription(value2)
		end
	end
	return FromHumanoidDescriptionResults
end

return function(Humanoid, p1)
	-- upvalues: ThunkModule (copy), t (copy), getAssetIds (copy), FFlagAXEnableRegionalFilteringofAssetsModule (copy), BatchGetAssetsModule (copy), GetProductInfoModule (copy), GetAssetBundlesModule (copy), GetVersionInfoModule (copy), SetAssetsModule (copy), SetEquippedAssetsModule (copy)
	return ThunkModule.new(script.Name, t, function(p2, _)
		-- upvalues: getAssetIds (upval), Humanoid (copy), p1 (copy), FFlagAXEnableRegionalFilteringofAssetsModule (upval), BatchGetAssetsModule (upval), GetProductInfoModule (upval), GetAssetBundlesModule (upval), GetVersionInfoModule (upval), SetAssetsModule (upval), SetEquippedAssetsModule (upval)
		local AssetIds = getAssetIds(Humanoid)
		
		if p1 then
			p2:dispatch(SetEquippedAssetsModule(AssetIds))
			
			return
		end
		if FFlagAXEnableRegionalFilteringofAssetsModule then
			p2:dispatch(BatchGetAssetsModule(AssetIds))
			
			return
		end
		for _, assetId in ipairs(AssetIds) do
			coroutine.wrap(function()
				-- upvalues: p2 (copy), GetProductInfoModule (upval), assetId (copy), GetAssetBundlesModule (upval), GetVersionInfoModule (upval)
				p2:dispatch(GetProductInfoModule(assetId.assetId))
				
				if assetId.parentBundleId == nil then
					p2:dispatch(GetAssetBundlesModule(assetId.assetId))
				end
				p2:dispatch(GetVersionInfoModule(assetId.assetId))
			end)()
		end
		p2:dispatch(SetAssetsModule(AssetIds))
	end)
end