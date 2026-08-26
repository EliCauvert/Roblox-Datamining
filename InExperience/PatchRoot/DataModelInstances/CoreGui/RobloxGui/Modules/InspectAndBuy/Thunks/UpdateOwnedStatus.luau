local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local constantsModule = require(parent.Constants)
local bundleInfoModule = require(parent.Models.BundleInfo)
local assetInfoModule = require(parent.Models.AssetInfo)
local setBundlesModule = require(parent.Actions.SetBundles)
local setAssetsModule = require(parent.Actions.SetAssets)

return function(p1, p2)
	-- upvalues: thunkModule (ref), constantsModule (ref), assetInfoModule (ref), setAssetsModule (ref), bundleInfoModule (ref), setBundlesModule (ref)
	return thunkModule.new(script.Name, {}, function(p3, _)
		-- upvalues: p2 (ref), constantsModule (copy), p1 (ref), assetInfoModule (copy), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy)
		local state = p3:getState()
		
		if p2 == constantsModule.ItemType.Asset then
			if state.assets[p1] then
				p3:dispatch(setAssetsModule({ assetInfoModule.fromPurchaseSuccess(p1) }))
				
				return
			end
		elseif p2 == constantsModule.ItemType.Bundle and state.bundles[p1] then
			p3:dispatch(setBundlesModule({ bundleInfoModule.fromPurchaseSuccess(p1) }))
		end
	end)
end