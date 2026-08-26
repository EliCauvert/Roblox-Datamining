local _ = game:GetService("CoreGui")
local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return {
	Destruct = function(p1)
		p1.store:destruct()
	end,
	store = roduxModule.Store.new(require(script.Parent.Reducers.AppShellReducer), {}, { roduxModule.thunkMiddleware }, nil)
}