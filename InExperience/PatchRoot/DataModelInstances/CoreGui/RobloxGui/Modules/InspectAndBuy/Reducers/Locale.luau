return require(game:GetService("CorePackages").Packages.Rodux).createReducer("en-us", {
	[require(script.Parent.Parent.Actions.SetLocale).name] = function(_, p1)
		return p1.locale
	end
})