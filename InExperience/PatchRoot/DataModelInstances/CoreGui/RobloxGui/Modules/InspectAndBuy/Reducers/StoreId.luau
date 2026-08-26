local var1 = 0

return require(game:GetService("CorePackages").Packages.Rodux).createReducer("0", {
	[require(script.Parent.Parent.Actions.UpdateStoreId).name] = function(_, _)
		-- upvalues: var1 (write)
		var1 += 1
		
		return tostring(var1)
	end
})