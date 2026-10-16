local Parent = script.Parent.Parent

return require(game:GetService("CorePackages").Packages.Rodux).createReducer(require(Parent.Constants).FallbackLocale, {
	[require(Parent.Actions.SetLocale).name] = function(_, p1) --[[ Line: 14 ]]
		return p1.locale
	end
})