local _ = game:GetService("CoreGui")
local RoduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return {
	Destruct = function(p1) --[[ Line: 12 ]]
		p1.store:destruct()
	end,
	store = RoduxModule.Store.new(require(script.Parent.Reducers.AppShellReducer), {}, { RoduxModule.thunkMiddleware }, nil)
}