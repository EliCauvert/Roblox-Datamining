local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return {
	Destruct = function(p1)
		p1.store:destruct()
	end,
	store = roduxModule.Store.new(require(script.Parent.Reducers.SettingsReducer), nil, { roduxModule.thunkMiddleware })
}