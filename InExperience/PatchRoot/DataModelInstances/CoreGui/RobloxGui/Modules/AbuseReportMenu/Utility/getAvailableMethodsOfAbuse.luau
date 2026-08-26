local constantsModule = require(script:FindFirstAncestor("AbuseReportMenu").Components.Constants)
local robloxTranslatorModule = require(game:GetService("CorePackages").Workspace.Packages.RobloxTranslator)

function getAvailableMethodsOfAbuse(p1, p2)
	-- upvalues: robloxTranslatorModule (ref), constantsModule (ref)
	local list = {
		{
			label = robloxTranslatorModule:FormatByKey(constantsModule.localizationKeys[constantsModule.AbuseMethods.TextChat]),
			subLabel = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Text.Subtitle"),
			identifier = constantsModule.AbuseMethods.TextChat
		}
	}
	
	if p2 then
		list[#list + 1] = {
			label = robloxTranslatorModule:FormatByKey(constantsModule.localizationKeys[constantsModule.AbuseMethods.Avatar]),
			subLabel = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.AvatarSubtitle"),
			identifier = constantsModule.AbuseMethods.Avatar
		}
	else
		list[#list + 1] = {
			label = robloxTranslatorModule:FormatByKey(constantsModule.localizationKeys[constantsModule.AbuseMethods.Other]),
			subLabel = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.Other.Subtitle"),
			identifier = constantsModule.AbuseMethods.Other
		}
	end
	if p1 then
		table.insert(list, 1, {
			label = robloxTranslatorModule:FormatByKey(constantsModule.localizationKeys[constantsModule.AbuseMethods.VoiceChat]),
			subLabel = robloxTranslatorModule:FormatByKey("Feature.SettingsHub.MethodOfAbuse.VoiceChat.Subtitle"),
			identifier = constantsModule.AbuseMethods.VoiceChat
		})
	end
	return list
end

return getAvailableMethodsOfAbuse