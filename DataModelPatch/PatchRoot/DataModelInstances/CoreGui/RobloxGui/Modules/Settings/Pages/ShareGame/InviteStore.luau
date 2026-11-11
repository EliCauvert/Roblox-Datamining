local RoduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return RoduxModule.Store.new(require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.AppReducer), nil, { RoduxModule.thunkMiddleware })