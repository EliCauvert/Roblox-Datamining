local Parent = script:FindFirstAncestor("NotApprovedPage").Parent
local MockableProxyServicesModule = require(Parent.MockableProxyServices)
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return function(p1)
	-- upvalues: NewResult (copy), MockableProxyServicesModule (copy)
	local _DateTime = DateTime.fromIsoDate(p1)
	
	if not _DateTime then
		return NewResult:Format("Feature.NotApproved.Label.Hours", {
			hours = string.format("%02d", 0),
			minutes = string.format("%02d", 0)
		})
	end
	local UnixTimestampMillisDelta = _DateTime.UnixTimestampMillis - MockableProxyServicesModule.Workspace:GetServerTimeNow() * 1000
	
	if UnixTimestampMillisDelta < 0 then
		UnixTimestampMillisDelta = 0
	end
	return if UnixTimestampMillisDelta > 86400000 then NewResult:Format("Feature.NotApproved.Label.Days", { number = math.ceil(UnixTimestampMillisDelta / 86400000) }) else NewResult:Format("Feature.NotApproved.Label.Hours", {
		hours = string.format("%02d", (math.floor(UnixTimestampMillisDelta / 3600000))),
		minutes = string.format("%02d", if UnixTimestampMillisDelta > 0 and UnixTimestampMillisDelta < 60000 then 1 else math.floor(UnixTimestampMillisDelta % 3600000 / 60000))
	})
end