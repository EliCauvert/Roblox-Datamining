local RoduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return {
	Destruct = function(p1)
		p1.store:destruct()
	end,
	store = RoduxModule.Store.new(require(script.Parent.Reducers.SettingsReducer), nil, { RoduxModule.thunkMiddleware })
}