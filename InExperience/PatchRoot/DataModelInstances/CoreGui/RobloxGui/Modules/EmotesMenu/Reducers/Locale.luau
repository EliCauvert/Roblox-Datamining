local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(parent.Constants).FallbackLocale, {
	[require(parent.Actions.SetLocale).name] = function(_, p1)
		return p1.locale
	end
})