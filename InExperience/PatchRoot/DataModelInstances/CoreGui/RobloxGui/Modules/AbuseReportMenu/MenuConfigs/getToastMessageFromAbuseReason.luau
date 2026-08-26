local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local reportSuccessToast = constantsModule.ReportSuccessToast
local playerAbuseTypes = constantsModule.PlayerAbuseTypes

return function(p1, p2)
	-- upvalues: reportSuccessToast (ref), playerAbuseTypes (ref), constantsModule (ref)
	local chatGeneric = reportSuccessToast.ChatGeneric
	
	if p1 == playerAbuseTypes.Cheating then
		chatGeneric = reportSuccessToast.Cheating
	elseif p1 == playerAbuseTypes.Username then
		chatGeneric = reportSuccessToast.BadUserName
	elseif p1 == playerAbuseTypes.Links or p1 == constantsModule.InappropriateContentAbuseReason then
		chatGeneric = reportSuccessToast.Place
	end
	if p2 then
		chatGeneric = reportSuccessToast.ReportAnythingGeneric
	end
	return chatGeneric
end