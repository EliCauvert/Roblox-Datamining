local AppStorageService = game:GetService("AppStorageService")
local RunService = game:GetService("RunService")
local LocalStorageKey = require(game:GetService("CorePackages").Workspace.Packages.LocalStorage).Enums.LocalStorageKey

local function _()
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
	local Item = AppStorageService:GetItem(LocalStorageKey.AppInstallationId)
	
	return if Item and Item ~= "" then Item else "unknown"
end

local _ = function()
	-- upvalues: AppStorageService (copy), LocalStorageKey (copy)
	local Item = AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)
	
	return if Item and Item ~= "" then Item else "0"
end

return function(p1)
	-- upvalues: RunService (copy), AppStorageService (copy), LocalStorageKey (copy)
	local config = {
		utm_content = p1.utm_content,
		utm_source = p1.utm_source or "UAP",
		utm_app_version = p1.utm_app_version or RunService:GetRobloxVersion()
	}
	local UtmAppId = p1.utm_app_id
	
	if not UtmAppId then
		local Item = AppStorageService:GetItem(LocalStorageKey.AppInstallationId)
		UtmAppId = if Item and Item ~= "" then Item else "unknown"
	end
	config.utm_app_id = UtmAppId
	local UtmBtid = p1.utm_btid
	
	if not UtmBtid then
		local Item = AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId)
		UtmBtid = if Item and Item ~= "" then Item else "0"
	end
	config.utm_btid = UtmBtid
	
	return config
end