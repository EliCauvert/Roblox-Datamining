local CorePackages = game:GetService("CorePackages")
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage

return function(Home, GamesList, COMPACT, p1): boolean
	-- upvalues: AppPage (copy), FormFactor (copy)
	return Home == AppPage.Home and (GamesList ~= AppPage.GamesList and (COMPACT == FormFactor.COMPACT and not p1))
end