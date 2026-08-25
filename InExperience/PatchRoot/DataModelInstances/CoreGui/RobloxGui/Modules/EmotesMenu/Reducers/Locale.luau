local parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(parent.Constants).FallbackLocale, {
	[require(parent.Actions.SetLocale).name] = function(_, p0)
		return p0.locale
	end
})