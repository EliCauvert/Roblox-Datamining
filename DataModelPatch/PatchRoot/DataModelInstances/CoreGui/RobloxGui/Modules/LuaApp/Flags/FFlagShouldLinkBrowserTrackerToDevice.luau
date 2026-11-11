local AppStorageService = game:GetService("AppStorageService")
local LocalStorageKey = require(game:GetService("CorePackages").Workspace.Packages.LocalStorage).Enums.LocalStorageKey
game:DefineFastInt("LinkBrowserTrackerToDeviceRollout", 0)

return function(): boolean
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
	return (AppStorageService and LocalStorageKey and tonumber(AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)) or 99) % 100 < game:GetFastInt("LinkBrowserTrackerToDeviceRollout")
end