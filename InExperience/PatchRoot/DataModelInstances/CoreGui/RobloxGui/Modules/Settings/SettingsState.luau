local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return {
	Destruct = function(p0)
		p0.store:destruct()
	end,
	store = roduxModule.Store.new(require(script.Parent.Reducers.SettingsReducer), nil, { roduxModule.thunkMiddleware })
}