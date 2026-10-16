local AppStorageService = game:GetService("AppStorageService")
local HttpService = game:GetService("HttpService")
local FIntEdpGameLeavePromptsRecentInstallWindowDays = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SharedFlags).FIntEdpGameLeavePromptsRecentInstallWindowDays
local IsAppFirstLaunchTimestampsSupportedModule = require(script.Parent.isAppFirstLaunchTimestampsSupported)

local function readFirstLaunchTimestamp(p1) --[[ Line: 16 ]]
	-- upvalues: AppStorageService (copy), HttpService (copy)
	local AppFirstLaunchTimestampsItem = AppStorageService:GetItem("AppFirstLaunchTimestamps")
	
	if typeof(AppFirstLaunchTimestampsItem) ~= "string" or AppFirstLaunchTimestampsItem == "" then
		return nil
	end
	local Success, Result = pcall(function() --[[ Line: 22 ]]
		-- upvalues: HttpService (upval), AppFirstLaunchTimestampsItem (copy)
		return HttpService:JSONDecode(AppFirstLaunchTimestampsItem)
	end)
	
	if Success and type(Result) == "table" then
		local Entry = Result[p1]
		
		return if type(Entry) == "number" then Entry else nil
	else
		return nil
	end
end

return function(p1): boolean --[[ Line: 35 | Named "isRecentInstall" ]]
	-- upvalues: IsAppFirstLaunchTimestampsSupportedModule (copy), readFirstLaunchTimestamp (copy), FIntEdpGameLeavePromptsRecentInstallWindowDays (copy)
	if not IsAppFirstLaunchTimestampsSupportedModule() then
		return false
	elseif p1 == nil or p1 == "" or p1 == "-1" then
		return false
	else
		local FirstLaunchTimestamp = readFirstLaunchTimestamp(p1)
		
		return FirstLaunchTimestamp ~= nil and DateTime.now().UnixTimestamp - FirstLaunchTimestamp <= FIntEdpGameLeavePromptsRecentInstallWindowDays * 86400
	end
end