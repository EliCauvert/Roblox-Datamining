local Parent = script.Parent.Parent
local ThunkModule = require(Parent.Thunk)
local ConstantsModule = require(Parent.Constants)
local BundleInfoModule = require(Parent.Models.BundleInfo)
local AssetInfoModule = require(Parent.Models.AssetInfo)
local SetBundlesModule = require(Parent.Actions.SetBundles)
local SetAssetsModule = require(Parent.Actions.SetAssets)

return function(p1, Asset) --[[ Line: 12 | Named "UpdateOwnedStatus" ]]
	-- upvalues: ThunkModule (copy), ConstantsModule (copy), AssetInfoModule (copy), SetAssetsModule (copy), BundleInfoModule (copy), SetBundlesModule (copy)
	return ThunkModule.new(script.Name, {}, function(p2, _) --[[ Line: 13 ]]
		-- upvalues: Asset (copy), ConstantsModule (upval), p1 (copy), AssetInfoModule (upval), SetAssetsModule (upval), BundleInfoModule (upval), SetBundlesModule (upval)
		local State = p2:getState()
		
		if Asset == ConstantsModule.ItemType.Asset then
			if State.assets[p1] then
				p2:dispatch(SetAssetsModule({ (AssetInfoModule.fromPurchaseSuccess(p1)) }))
				
				return
			end
		elseif Asset == ConstantsModule.ItemType.Bundle and State.bundles[p1] then
			p2:dispatch(SetBundlesModule({ (BundleInfoModule.fromPurchaseSuccess(p1)) }))
		end
	end)
end