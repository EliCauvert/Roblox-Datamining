local appStorageService = game:GetService("AppStorageService")
local httpService = game:GetService("HttpService")
local fIntEdpGameLeavePromptsRecentInstallWindowDays = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SharedFlags).FIntEdpGameLeavePromptsRecentInstallWindowDays
local isAppFirstLaunchTimestampsSupportedModule = require(script.Parent.isAppFirstLaunchTimestampsSupported)

local function readFirstLaunchTimestamp(p1)
	-- upvalues: appStorageService (ref), httpService (ref)
	local appFirstLaunchTimestampsItem = appStorageService:GetItem("AppFirstLaunchTimestamps")
	
	if typeof(appFirstLaunchTimestampsItem) ~= "string" or appFirstLaunchTimestampsItem == "" then
		return nil
	end
	local ok, status = pcall(function()
		-- upvalues: httpService (copy), appFirstLaunchTimestampsItem (ref)
		return httpService:JSONDecode(appFirstLaunchTimestampsItem)
	end)
	
	if not ok or type(status) ~= "table" then
		return nil
	end
	local var1 = status[p1]
	
	return if type(var1) == "number" then var1 else nil
end

return function(p1)
	-- upvalues: isAppFirstLaunchTimestampsSupportedModule (ref), readFirstLaunchTimestamp (ref), fIntEdpGameLeavePromptsRecentInstallWindowDays (ref)
	if not isAppFirstLaunchTimestampsSupportedModule() then
		return false
	elseif p1 == nil or p1 == "" or p1 == "-1" then
		return false
	end
	local var1 = readFirstLaunchTimestamp(p1)
	
	return if var1 == nil then false else DateTime.now().UnixTimestamp - var1 <= fIntEdpGameLeavePromptsRecentInstallWindowDays * 86400
end