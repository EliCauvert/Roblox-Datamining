local AppStorageService = game:GetService("AppStorageService")
local LocalStorageKey = require(game:GetService("CorePackages").Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local WebLoginModule = {}
WebLoginModule.__index = WebLoginModule

function WebLoginModule.getWebLogin(): number
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
	return tonumber(AppStorageService:GetItem(LocalStorageKey.WebLogin)) or 0
end

return WebLoginModule