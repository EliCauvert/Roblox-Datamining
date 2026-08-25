local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local reportSuccessToast = constantsModule.ReportSuccessToast
local playerAbuseTypes = constantsModule.PlayerAbuseTypes

return function(p0, p1)
	-- upvalues: reportSuccessToast (ref), playerAbuseTypes (ref), constantsModule (ref)
	local chatGeneric = reportSuccessToast.ChatGeneric
	
	if p0 == playerAbuseTypes.Cheating then
		chatGeneric = reportSuccessToast.Cheating
	elseif p0 == playerAbuseTypes.Username then
		chatGeneric = reportSuccessToast.BadUserName
	elseif p0 == playerAbuseTypes.Links or p0 == constantsModule.InappropriateContentAbuseReason then
		chatGeneric = reportSuccessToast.Place
	end
	if p1 then
		chatGeneric = reportSuccessToast.ReportAnythingGeneric
	end
	return chatGeneric
end