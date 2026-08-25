local var0 = 0

return require(game:GetService("CorePackages").Packages.Rodux).createReducer("0", {
	[require(script.Parent.Parent.Actions.UpdateStoreId).name] = function(_, _)
		-- upvalues: var0 (write)
		var0 += 1
		
		return tostring(var0)
	end
})