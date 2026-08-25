local parent = script.Parent.Parent
local thunkModule = require(parent.Thunk)
local constantsModule = require(parent.Constants)
local bundleInfoModule = require(parent.Models.BundleInfo)
local assetInfoModule = require(parent.Models.AssetInfo)
local setBundlesModule = require(parent.Actions.SetBundles)
local setAssetsModule = require(parent.Actions.SetAssets)

return function(p0, p1)
	-- upvalues: thunkModule (ref), constantsModule (ref), assetInfoModule (ref), setAssetsModule (ref), bundleInfoModule (ref), setBundlesModule (ref)
	return thunkModule.new(script.Name, {}, function(p2, _)
		-- upvalues: p1 (ref), constantsModule (copy), p0 (ref), assetInfoModule (copy), setAssetsModule (copy), bundleInfoModule (copy), setBundlesModule (copy)
		local state = p2:getState()
		
		if p1 == constantsModule.ItemType.Asset then
			if state.assets[p0] then
				p2:dispatch(setAssetsModule({ assetInfoModule.fromPurchaseSuccess(p0) }))
				
				return
			end
		elseif p1 == constantsModule.ItemType.Bundle and state.bundles[p0] then
			p2:dispatch(setBundlesModule({ bundleInfoModule.fromPurchaseSuccess(p0) }))
		end
	end)
end