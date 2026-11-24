local SystemInfoProtocol = require(script:FindFirstAncestor("ServerTriggeredModals").Parent.SystemInfoProtocol).SystemInfoProtocol
local config = {
	[Enum.Platform.IOS] = "iOS",
	[Enum.Platform.Android] = "Android"
}

return function()
	-- upvalues: config (copy), SystemInfoProtocol (copy)
	local Entry = config[game:GetService("UserInputService"):GetPlatform()]
	
	if Entry == nil then
		return nil
	end
	local Success, Result = pcall(function()
		-- upvalues: SystemInfoProtocol (upval)
		return SystemInfoProtocol.default:getSystemInfo({ SystemInfoProtocol.InfoNames.SYSTEM_VERSION })
	end)
	
	if Success and typeof(Result) == "table" then
		local SystemVersion: string = Result.systemVersion
		local Match = if typeof(SystemVersion) == "string" then string.match(SystemVersion, "^%s*(%d+)") else nil
		
		return if Match == nil then nil else { osName = Entry, osMajorVersion = Match }
	else
		return nil
	end
end