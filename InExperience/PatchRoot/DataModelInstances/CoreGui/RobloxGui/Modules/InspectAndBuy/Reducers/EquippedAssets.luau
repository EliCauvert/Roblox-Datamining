return require(game:GetService("CorePackages").Packages.Rodux).createReducer({}, {
	[require(script.Parent.Parent.Actions.SetEquippedAssets).name] = function(_, p0) --[[ line: 11 ]]
		local t = {}
		
		for i, v in ipairs(p0.equippedAssets) do
			t[tostring(v.assetId)] = true
		end
		return t
	end
})