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
local GetFStringDesktopToastNotificationLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFStringDesktopToastNotificationLayer
local GetFFlagUXForCameraPerformanceIXPEnabledModule = require(script.Parent.Parent.Flags.GetFFlagUXForCameraPerformanceIXPEnabled)
local GetFStringUXForCameraPerformanceIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringUXForCameraPerformanceIXPLayerName)
local GetFStringVoiceExposureIXPLayerNameModule = require(script.Parent.Parent.Flags.GetFStringVoiceExposureIXPLayerName)
local GetFStringAndroidPhoneVerificationLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringAndroidPhoneVerificationLayer
local GetFStringIOSPhoneVerificationLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFStringIOSPhoneVerificationLayer
local GetFFlagEnableAppChatInExperienceFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAppChatInExperience
local GetFStringAppChatInExperienceIXPLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFStringAppChatInExperienceIXPLayer
local FStringReportMenuIXPLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringReportMenuIXPLayer
local FStringReportingIXPLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringReportingIXPLayer
local FFlagEnableShopExposureLoggingModule = require(CorePackages.Workspace.Packages.InExperienceShop.FFlagEnableShopExposureLogging)
local FStringExperienceShopLayer1Module = require(CorePackages.Workspace.Packages.InExperienceShop.FStringExperienceShopLayer1)
local FStringExperienceShopLayer2Module = require(CorePackages.Workspace.Packages.InExperienceShop.FStringExperienceShopLayer2)

return function()
	-- upvalues: GetFStringDesktopToastNotificationLayerFunction (copy), FStringReportMenuIXPLayer (copy), FStringReportingIXPLayer (copy), FStringSocialCaptureIXPLayer (copy), FStringSocialCaptureTakenIXPLayer (copy), GetFStringLuaAppExperienceMenuLayerFunction (copy), GetFStringLuaAppConsoleExperienceMenuLayerModule (copy), GetFStringLargerRobuxUpsellIxpLayerFunction (copy), GetFFlagReportAnythingAnnotationIXPFunction (copy), GetFStringReportAnythingAnnotationIXPLayerNameFunction (copy), GetFFlagChatTranslationSettingEnabledModule (copy), GetFStringChatTranslationLayerNameModule (copy), GetFFlagVoiceUserAgencyEnableIXPModule (copy), GetFStringVoiceUserAgencyIXPLayerNameModule (copy), GetFFlagUXForCameraPerformanceIXPEnabledModule (copy), GetFStringUXForCameraPerformanceIXPLayerNameModule (copy), GetFStringVoiceExposureIXPLayerNameModule (copy), GetFStringAndroidPhoneVerificationLayerFunction (copy), GetFStringIOSPhoneVerificationLayerFunction (copy), GetFFlagEnableAppChatInExperienceFunction (copy), GetFStringAppChatInExperienceIXPLayerFunction (copy), FFlagEnableShopExposureLoggingModule (copy), FStringExperienceShopLayer1Module (copy), FStringExperienceShopLayer2Module (copy)
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
	if FFlagEnableShopExposureLoggingModule then
		table.insert(List, FStringExperienceShopLayer1Module)
		table.insert(List, FStringExperienceShopLayer2Module)
	end
	return List
end