local corePackagesService = game:GetService("CorePackages")
local fStringSocialCaptureIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).FStringSocialCaptureIXPLayer
local fStringSocialCaptureTakenIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).FStringSocialCaptureTakenIXPLayer
local _ = require(script.Parent.Parent.Flags.GetFFlagEnableNewInviteMenuIXP)
local getFStringLargerRobuxUpsellIxpLayer = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringLargerRobuxUpsellIxpLayer
local getFStringLuaAppExperienceMenuLayer = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringLuaAppExperienceMenuLayer
local getFStringLuaAppConsoleExperienceMenuLayerModule = require(script.Parent.Parent.Flags.GetFStringLuaAppConsoleExperienceMenuLayer)
local getFFlagReportAnythingAnnotationIXP = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagReportAnythingAnnotationIXP
local getFStringReportAnythingAnnotationIXPLayerName = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringReportAnythingAnnotationIXPLayerName
local _ = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagReportTabShareIXPLayerWithMenu
local getFStringChatTranslationLayerNameModule = require(script.Parent.Parent.Flags.GetFStringChatTranslationLayerName)
local getFFlagChatTranslationSettingEnabledModule = require(script.Parent.Parent.Flags.GetFFlagChatTranslationSettingEnabled)
local getFFlagVoiceUserAgencyEnableIXPModule = require(script.Parent.Parent.Flags.GetFFlagVoiceUserAgencyEnableIXP)
local getFStringVoiceUserAgencyIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringVoiceUserAgencyIXPLayerName)
local getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule = require(script.Parent.Parent.Flags.GetFFlagLuaInExperienceCoreScriptsGameInviteUnification)
local getFStringDesktopToastNotificationLayer = require(corePackagesService.Workspace.Packages.SharedFlags).getFStringDesktopToastNotificationLayer
local getFStringGameInviteMenuLayer = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringGameInviteMenuLayer
local getFFlagUXForCameraPerformanceIXPEnabledModule = require(script.Parent.Parent.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local getFStringUXForCameraPerformanceIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local getFStringVoiceExposureIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringVoiceExposureIXPLayerName)
local getFStringAndroidPhoneVerificationLayer = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local getFStringIOSPhoneVerificationLayer = require(corePackagesService.Workspace.Packages.SharedFlags).GetFStringIOSPhoneVerificationLayer
local getFFlagEnableAppChatInExperience = require(corePackagesService.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local getFStringAppChatInExperienceIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).getFStringAppChatInExperienceIXPLayer
local fStringReportMenuIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).FStringReportMenuIXPLayer
local fStringReportingIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).FStringReportingIXPLayer
local fStringEARReportMenuIXPLayer = require(corePackagesService.Workspace.Packages.SharedFlags).FStringEARReportMenuIXPLayer

return function() --[[ line: 44 ]]
	-- upvalues: getFStringDesktopToastNotificationLayer (ref), fStringReportMenuIXPLayer (ref), fStringReportingIXPLayer (ref), fStringEARReportMenuIXPLayer (ref), fStringSocialCaptureIXPLayer (ref), fStringSocialCaptureTakenIXPLayer (ref), getFStringLuaAppExperienceMenuLayer (ref), getFStringLuaAppConsoleExperienceMenuLayerModule (ref), getFStringLargerRobuxUpsellIxpLayer (ref), getFFlagReportAnythingAnnotationIXP (ref), getFStringReportAnythingAnnotationIXPLayerName (ref), getFFlagChatTranslationSettingEnabledModule (ref), getFStringChatTranslationLayerNameModule (ref), getFFlagVoiceUserAgencyEnableIXPModule (ref), getFStringVoiceUserAgencyIXPLayerNameModule (ref), getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule (ref), getFStringGameInviteMenuLayer (ref), getFFlagUXForCameraPerformanceIXPEnabledModule (ref), getFStringUXForCameraPerformanceIXPLayerNameModule (ref), getFStringVoiceExposureIXPLayerNameModule (ref), getFStringAndroidPhoneVerificationLayer (ref), getFStringIOSPhoneVerificationLayer (ref), getFFlagEnableAppChatInExperience (ref), getFStringAppChatInExperienceIXPLayer (ref)
	local list = {
		"AbuseReports", getFStringDesktopToastNotificationLayer(),
		fStringReportMenuIXPLayer, fStringReportingIXPLayer,
		fStringEARReportMenuIXPLayer, fStringSocialCaptureIXPLayer,
		fStringSocialCaptureTakenIXPLayer
	}
	table.insert(list, getFStringLuaAppExperienceMenuLayer())
	table.insert(list, getFStringLuaAppConsoleExperienceMenuLayerModule())
	
	if getFStringLargerRobuxUpsellIxpLayer() then
		table.insert(list, getFStringLargerRobuxUpsellIxpLayer())
	end
	if getFFlagReportAnythingAnnotationIXP() then
		table.insert(list, getFStringReportAnythingAnnotationIXPLayerName())
	end
	if getFFlagChatTranslationSettingEnabledModule() and #getFStringChatTranslationLayerNameModule() > 0 then
		table.insert(list, getFStringChatTranslationLayerNameModule())
	end
	if getFFlagVoiceUserAgencyEnableIXPModule() then
		table.insert(list, getFStringVoiceUserAgencyIXPLayerNameModule())
	end
	if getFFlagLuaInExperienceCoreScriptsGameInviteUnificationModule() then
		table.insert(list, getFStringGameInviteMenuLayer())
	end
	if getFFlagUXForCameraPerformanceIXPEnabledModule() then
		table.insert(list, getFStringUXForCameraPerformanceIXPLayerNameModule())
	end
	table.insert(list, getFStringVoiceExposureIXPLayerNameModule())
	
	if getFStringAndroidPhoneVerificationLayer() then
		table.insert(list, getFStringAndroidPhoneVerificationLayer())
	end
	if getFStringIOSPhoneVerificationLayer() then
		table.insert(list, getFStringIOSPhoneVerificationLayer())
	end
	if getFFlagEnableAppChatInExperience() then
		table.insert(list, getFStringAppChatInExperienceIXPLayer())
	end
	return list
end