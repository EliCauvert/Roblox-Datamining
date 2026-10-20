local CorePackages = game:GetService("CorePackages")
local FStringSocialCaptureIXPLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringSocialCaptureIXPLayer
local FStringSocialCaptureTakenIXPLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringSocialCaptureTakenIXPLayer
local _ = require(script.Parent.Parent.Flags.GetFFlagEnableNewInviteMenuIXP)
local GetFStringLargerRobuxUpsellIxpLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer
local GetFStringLuaAppExperienceMenuLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringLuaAppExperienceMenuLayer
local GetFStringLuaAppConsoleExperienceMenuLayerModule = require(script.Parent.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer)
local GetFFlagReportAnythingAnnotationIXPFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local GetFStringReportAnythingAnnotationIXPLayerNameFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName
local GetFStringChatTranslationLayerNameModule = require(script.Parent.Parent.Flags.GetFStringChatTranslationLayerName)
local GetFFlagChatTranslationSettingEnabledModule = require(script.Parent.Parent.Flags.GetFFlagChatTranslationSettingEnabled)
local GetFFlagVoiceUserAgencyEnableIXPModule = require(script.Parent.Parent.Flags.GetFFlagVoiceUserAgencyEnableIXP)
local GetFStringVoiceUserAgencyIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringVoiceUserAgencyIXPLayerName)
local GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(script.Parent.Parent.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local GetFStringDesktopToastNotificationLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFStringDesktopToastNotificationLayer
local GetFStringGameInviteMenuLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer
local GetFFlagUXForCameraPerformanceIXPEnabledModule = require(script.Parent.Parent.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local GetFStringUXForCameraPerformanceIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local GetFStringVoiceExposureIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringVoiceExposureIXPLayerName)
local GetFStringAndroidPhoneVerificationLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local GetFStringIOSPhoneVerificationLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringIOSPhoneVerificationLayer
local GetFFlagEnableAppChatInExperienceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local GetFStringAppChatInExperienceIXPLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFStringAppChatInExperienceIXPLayer
local FStringReportMenuIXPLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringReportMenuIXPLayer
local FStringReportingIXPLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringReportingIXPLayer

return function()
	-- upvalues: GetFStringDesktopToastNotificationLayerFunction (copy), FStringReportMenuIXPLayer (copy), FStringReportingIXPLayer (copy), FStringSocialCaptureIXPLayer (copy), FStringSocialCaptureTakenIXPLayer (copy), GetFStringLuaAppExperienceMenuLayerFunction (copy), GetFStringLuaAppConsoleExperienceMenuLayerModule (copy), GetFStringLargerRobuxUpsellIxpLayerFunction (copy), GetFFlagReportAnythingAnnotationIXPFunction (copy), GetFStringReportAnythingAnnotationIXPLayerNameFunction (copy), GetFFlagChatTranslationSettingEnabledModule (copy), GetFStringChatTranslationLayerNameModule (copy), GetFFlagVoiceUserAgencyEnableIXPModule (copy), GetFStringVoiceUserAgencyIXPLayerNameModule (copy), GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (copy), GetFStringGameInviteMenuLayerFunction (copy), GetFFlagUXForCameraPerformanceIXPEnabledModule (copy), GetFStringUXForCameraPerformanceIXPLayerNameModule (copy), GetFStringVoiceExposureIXPLayerNameModule (copy), GetFStringAndroidPhoneVerificationLayerFunction (copy), GetFStringIOSPhoneVerificationLayerFunction (copy), GetFFlagEnableAppChatInExperienceFunction (copy), GetFStringAppChatInExperienceIXPLayerFunction (copy)
	local List = {
		"AbuseReports", GetFStringDesktopToastNotificationLayerFunction(),
		FStringReportMenuIXPLayer, FStringReportingIXPLayer,
		FStringSocialCaptureIXPLayer, FStringSocialCaptureTakenIXPLayer
	}
	table.insert(List, GetFStringLuaAppExperienceMenuLayerFunction())
	table.insert(List, GetFStringLuaAppConsoleExperienceMenuLayerModule())
	
	if GetFStringLargerRobuxUpsellIxpLayerFunction() then
		table.insert(List, GetFStringLargerRobuxUpsellIxpLayerFunction())
	end
	if GetFFlagReportAnythingAnnotationIXPFunction() then
		table.insert(List, GetFStringReportAnythingAnnotationIXPLayerNameFunction())
	end
	if GetFFlagChatTranslationSettingEnabledModule() and #GetFStringChatTranslationLayerNameModule() > 0 then
		table.insert(List, GetFStringChatTranslationLayerNameModule())
	end
	if GetFFlagVoiceUserAgencyEnableIXPModule() then
		table.insert(List, GetFStringVoiceUserAgencyIXPLayerNameModule())
	end
	if GetFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then
		table.insert(List, GetFStringGameInviteMenuLayerFunction())
	end
	if GetFFlagUXForCameraPerformanceIXPEnabledModule() then
		table.insert(List, GetFStringUXForCameraPerformanceIXPLayerNameModule())
	end
	table.insert(List, GetFStringVoiceExposureIXPLayerNameModule())
	
	if GetFStringAndroidPhoneVerificationLayerFunction() then
		table.insert(List, GetFStringAndroidPhoneVerificationLayerFunction())
	end
	if GetFStringIOSPhoneVerificationLayerFunction() then
		table.insert(List, GetFStringIOSPhoneVerificationLayerFunction())
	end
	if GetFFlagEnableAppChatInExperienceFunction() then
		table.insert(List, GetFStringAppChatInExperienceIXPLayerFunction())
	end
	return List
end