local roduxModule = require(game:GetService("CorePackages").Packages.Rodux)

return roduxModule.Store.new(require(game:GetService("CoreGui").RobloxGui.Modules.Settings.Pages.ShareGame.AppReducer), nil, { roduxModule.thunkMiddleware })