local CorePackages = game:GetService("CorePackages")
local CryoModule = require(CorePackages.Packages.Cryo)

return require(CorePackages.Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetAssetToBundlesMapping).name] = function(p1, p2) --[[ Line: 19 ]]
		-- upvalues: CryoModule (copy)
		return CryoModule.Dictionary.join(p1, { [tostring(p2.assetId)] = p2.bundleIds })
	end
})