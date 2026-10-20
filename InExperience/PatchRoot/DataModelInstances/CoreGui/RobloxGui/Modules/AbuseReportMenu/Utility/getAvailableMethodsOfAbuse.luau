local ConstantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local RobloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)

function getAvailableMethodsOfAbuse(p1, p2)
	-- upvalues: RobloxTranslatorModule (copy), ConstantsModule (copy)
	local List = {
		{
			label = RobloxTranslatorModule:FormatByKey(ConstantsModule.localizationKeys[ConstantsModule.AbuseMethods.TextChat]),
			subLabel = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Text.Subtitle"),
			identifier = ConstantsModule.AbuseMethods.TextChat
		}
	}
	
	if p2 then
		List[#List + 1] = {
			label = RobloxTranslatorModule:FormatByKey(ConstantsModule.localizationKeys[ConstantsModule.AbuseMethods.Avatar]),
			subLabel = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.AvatarSubtitle"),
			identifier = ConstantsModule.AbuseMethods.Avatar
		}
	else
		List[#List + 1] = {
			label = RobloxTranslatorModule:FormatByKey(ConstantsModule.localizationKeys[ConstantsModule.AbuseMethods.Other]),
			subLabel = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Other.Subtitle"),
			identifier = ConstantsModule.AbuseMethods.Other
		}
	end
	if p1 then
		table.insert(List, 1, {
			label = RobloxTranslatorModule:FormatByKey(ConstantsModule.localizationKeys[ConstantsModule.AbuseMethods.VoiceChat]),
			subLabel = RobloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.VoiceChat.Subtitle"),
			identifier = ConstantsModule.AbuseMethods.VoiceChat
		})
	end
	return List
end

return getAvailableMethodsOfAbuse