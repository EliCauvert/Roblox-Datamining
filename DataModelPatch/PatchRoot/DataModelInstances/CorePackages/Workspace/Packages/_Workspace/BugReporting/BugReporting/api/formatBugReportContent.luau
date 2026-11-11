local _ = require(script.Parent.Parent.BugReporterTypes)

return function(p1, EndIndex: number)
	local Description = p1.description or ""
	
	return {
		title = string.sub(Description, 1, EndIndex) .. (if EndIndex < #Description then "..." else ""),
		description = table.concat({
			Description, "\n", "*Metadata:*", `- User ID: {p1.userId}`,
			`- User Name: {p1.userDisplayName}`, `- Screen: {p1.additionalInfo.screen}`,
			`- Locale: {p1.additionalInfo.locale}`,
			`- Client Channel: {p1.additionalInfo.clientChannel}`,
			`- CoreScript Version: {p1.additionalInfo.coreScriptVersion}`,
			`- Manufacturer: {p1.systemInfo.manufacturer}`,
			`- Device Name: {p1.systemInfo.deviceName}`, `- OS: {p1.systemInfo.baseOs}`,
			`- System Version: {p1.systemInfo.systemVersion}`,
			`- App Version: {p1.systemInfo.appVersion}`,
			`- Network Type: {p1.systemInfo.networkType}`, "\n\n",
			p1.logUrl and `[Backtrace Device Log|{p1.logUrl}]` or ""
		}, "\n")
	}
end