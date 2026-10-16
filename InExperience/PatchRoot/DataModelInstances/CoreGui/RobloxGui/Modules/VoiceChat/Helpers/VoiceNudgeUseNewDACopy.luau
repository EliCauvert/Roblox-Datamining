local IXPService = game:GetService("IXPService")
local NewResult = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local GetFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopyModule = require(script.Parent.Parent.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopy)
local DisruptiveVoiceNudgeVariantIXPLayerName = game:DefineFastString("DisruptiveVoiceNudgeVariantIXPLayerName", "Voice.CivilityAndSafety")
local DisruptiveVoiceNudgeVariantIXPVariableName = game:DefineFastString("DisruptiveVoiceNudgeVariantIXPVariableName", "UseNewDACopy")

return function() --[[ Line: 11 | Named "VoiceNudgeUseNewDACopy" ]]
	-- upvalues: GetFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopyModule (copy), IXPService (copy), DisruptiveVoiceNudgeVariantIXPLayerName (copy), DisruptiveVoiceNudgeVariantIXPVariableName (copy), NewResult (copy)
	if GetFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopyModule() then
		return true
	end
	local Success, Result = pcall(function() --[[ Line: 15 ]]
		-- upvalues: IXPService (upval), DisruptiveVoiceNudgeVariantIXPLayerName (upval)
		return IXPService:GetUserLayerVariables(DisruptiveVoiceNudgeVariantIXPLayerName)
	end)
	
	if Success and Result and Result[DisruptiveVoiceNudgeVariantIXPVariableName] ~= nil then
		IXPService:LogUserLayerExposure(DisruptiveVoiceNudgeVariantIXPLayerName)
		NewResult:debug("Experiment variant for " .. DisruptiveVoiceNudgeVariantIXPVariableName .. ": " .. tostring(Result[DisruptiveVoiceNudgeVariantIXPVariableName]))
		
		return Result[DisruptiveVoiceNudgeVariantIXPVariableName]
	else
		NewResult:debug("Failed to get IXP data for layer: " .. DisruptiveVoiceNudgeVariantIXPLayerName .. " with variable: " .. DisruptiveVoiceNudgeVariantIXPVariableName)
		
		return false
	end
end