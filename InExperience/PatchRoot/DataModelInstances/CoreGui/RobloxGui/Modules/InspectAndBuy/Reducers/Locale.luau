return require(game:GetService("CorePackages").Packages.Rodux).createReducer("en-us", {
	[require(script.Parent.Parent.Actions.SetLocale).name] = function(_, p0) --[[ line: 9 ]]
		return p0.locale
	end
})