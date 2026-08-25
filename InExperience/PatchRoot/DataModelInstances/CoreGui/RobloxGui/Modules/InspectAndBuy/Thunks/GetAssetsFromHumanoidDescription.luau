local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local getProductInfoModule = require(parent.Thunks.GetProductInfo)
local getVersionInfoModule = require(parent.Thunks.GetVersionInfo)
local assetInfoModule = require(parent.Models.AssetInfo)
local setAssetsModule = require(parent.Actions.SetAssets)
local setEquippedAssetsModule = require(parent.Actions.SetEquippedAssets)
local constantsModule = require(parent.Constants)
local getAssetBundlesModule = require(parent.Thunks.GetAssetBundles)
local batchGetAssetsModule = require(parent.Thunks.BatchGetAssets)
local fFlagAXEnableRegionalFilteringofAssetsModule = require(parent.Flags.FFlagAXEnableRegionalFilteringofAssets)
local t = {}

local function getAssetIds(value)
	-- upvalues: constantsModule (ref), assetInfoModule (ref)
	local t = {}
	
	for i, v in pairs(constantsModule.AssetTypeIdStringToHumanoidDescriptionProp) do
		if constantsModule.AssetTypeIdToAccessoryTypeEnum[i] == nil then
			for i_1, v_1 in pairs(string.split(value[v] or "")) do
				if tonumber(v_1) and v_1 ~= "0" then
					table.insert(t, assetInfoModule.fromHumanoidDescription(v_1))
				end
			end
		end
	end
	for i_1, v_1 in pairs(value:GetAccessories(true)) do
		t[#t + 1] = assetInfoModule.fromHumanoidDescription(v_1.AssetId)
	end
	for i_2, v_2 in pairs(value:GetEmotes()) do
		for i_3, v_3 in pairs(v_2) do
			t[#t + 1] = assetInfoModule.fromHumanoidDescription(v_3)
		end
	end
	return t
end

return function(value, p0)
	-- upvalues: thunkModule (ref), t (ref), getAssetIds (ref), fFlagAXEnableRegionalFilteringofAssetsModule (ref), batchGetAssetsModule (ref), getProductInfoModule (ref), getAssetBundlesModule (ref), getVersionInfoModule (ref), setAssetsModule (ref), setEquippedAssetsModule (ref)
	return thunkModule.new(script.Name, t, function(p1, _)
		-- upvalues: getAssetIds (copy), value (ref), p0 (ref), fFlagAXEnableRegionalFilteringofAssetsModule (copy), batchGetAssetsModule (copy), getProductInfoModule (copy), getAssetBundlesModule (copy), getVersionInfoModule (copy), setAssetsModule (copy), setEquippedAssetsModule (copy)
		local var13 = getAssetIds(value)
		
		if p0 then
			p1:dispatch(setEquippedAssetsModule(var13))
			
			return
		elseif fFlagAXEnableRegionalFilteringofAssetsModule then
			p1:dispatch(batchGetAssetsModule(var13))
			
			return
		end
		for i, v in ipairs(var13) do
			coroutine.wrap(function()
				-- upvalues: p1 (ref), getProductInfoModule (copy), v (ref), getAssetBundlesModule (copy), getVersionInfoModule (copy)
				p1:dispatch(getProductInfoModule(v.assetId))
				
				if v.parentBundleId == nil then
					p1:dispatch(getAssetBundlesModule(v.assetId))
				end
				p1:dispatch(getVersionInfoModule(v.assetId))
			end)()
		end
		p1:dispatch(setAssetsModule(var13))
	end)
end