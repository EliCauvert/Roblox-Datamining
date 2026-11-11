local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local UrlBuilderModule = require(Modules.LuaApp.Http.UrlBuilder)
local PromiseModule = require(Modules.LuaApp.Promise)
local LocalStorageKey = require(game:GetService("CorePackages").Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local AppStorageService = game:GetService("AppStorageService")
local DeviceIdService = game:GetService("DeviceIdService")

return function(Callback)
	-- upvalues: UrlBuilderModule (copy), AppStorageService (copy), LocalStorageKey (copy), DeviceIdService (copy), PromiseModule (copy), HttpService (copy)
	local AssociateBrowserTrackerToDevice = UrlBuilderModule.fromString("apis:original-users/v1/associateBrowserTrackerToDevice")
	local Number: number? = tonumber(AppStorageService:GetItem(LocalStorageKey.BrowserTrackerId))
	local DeviceId = DeviceIdService:GetDeviceId()
	
	if Number == nil or Number <= 0 or DeviceId == nil or DeviceId == "" or DeviceId == "00000000-0000-0000-0000-000000000000" then
		return PromiseModule.reject()
	else
		Callback(AssociateBrowserTrackerToDevice(), "POST", {
			postBody = HttpService:JSONEncode({ browser_tracker_id = Number, device_id = DeviceId })
		}):catch(function() end)
		
		return PromiseModule.resolve()
	end
end