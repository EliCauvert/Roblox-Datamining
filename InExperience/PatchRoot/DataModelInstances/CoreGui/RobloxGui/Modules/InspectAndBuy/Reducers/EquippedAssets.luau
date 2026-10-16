return require(game:GetService("CorePackages").Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetEquippedAssets).name] = function(_, p1) --[[ Line: 11 ]]
		local t = {}
		
		for _, equippedAsset in ipairs(p1.equippedAssets) do
			t[tostring(equippedAsset.assetId)] = true
		end
		return t
	end
})