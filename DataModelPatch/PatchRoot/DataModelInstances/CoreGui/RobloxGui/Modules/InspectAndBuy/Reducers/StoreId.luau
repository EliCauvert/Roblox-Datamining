local Count = 0

return require(game:GetService("CorePackages").Packages.Rodux).createReducer("0", {
	[require(script.Parent.Parent.Actions.UpdateStoreId).name] = function(_, _): string
		-- upvalues: Count (ref)
		Count += 1
		
		return (tostring(Count))
	end
})