local ConstantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local ReportSuccessToast = ConstantsModule.ReportSuccessToast
local PlayerAbuseTypes = ConstantsModule.PlayerAbuseTypes

return function(Cheating, p1)
	-- upvalues: ReportSuccessToast (copy), PlayerAbuseTypes (copy), ConstantsModule (copy)
	return if Cheating == PlayerAbuseTypes.Cheating then if p1 then ReportSuccessToast.ReportAnythingGeneric else ReportSuccessToast.Cheating elseif Cheating == PlayerAbuseTypes.Username then if p1 then ReportSuccessToast.ReportAnythingGeneric else ReportSuccessToast.BadUserName elseif Cheating == PlayerAbuseTypes.Links or Cheating == ConstantsModule.InappropriateContentAbuseReason then if p1 then ReportSuccessToast.ReportAnythingGeneric else ReportSuccessToast.Place elseif p1 then ReportSuccessToast.ReportAnythingGeneric else ReportSuccessToast.ChatGeneric
end