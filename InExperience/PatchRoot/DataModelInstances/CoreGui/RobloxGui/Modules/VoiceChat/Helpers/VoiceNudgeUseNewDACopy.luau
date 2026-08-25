local IXPService = game:GetService("IXPService")
local name = require(game:GetService("CorePackages").Workspace.Packages.CoreScriptsInitializer).CoreLogger:new(script.Name)
local getFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopyModule = require(script.Parent.Parent.Flags.GetFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopy)
local disruptiveVoiceNudgeVariantIXPLayerName = game:DefineFastString("DisruptiveVoiceNudgeVariantIXPLayerName", "Voice.CivilityAndSafety")
local disruptiveVoiceNudgeVariantIXPVariableName = game:DefineFastString("DisruptiveVoiceNudgeVariantIXPVariableName", "UseNewDACopy")

return function()
	-- upvalues: getFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopyModule (ref), IXPService (ref), disruptiveVoiceNudgeVariantIXPLayerName (ref), disruptiveVoiceNudgeVariantIXPVariableName (ref), name (ref)
	if getFFlagVoiceChatDisruptiveVoiceNudgeForceUseNewDACopyModule() then
		return true
	end
	local ok, status = pcall(function()
		-- upvalues: IXPService (copy), disruptiveVoiceNudgeVariantIXPLayerName (copy)
		return IXPService:GetUserLayerVariables(disruptiveVoiceNudgeVariantIXPLayerName)
	end)
	
	if ok and status and status[disruptiveVoiceNudgeVariantIXPVariableName] ~= nil then
		IXPService:LogUserLayerExposure(disruptiveVoiceNudgeVariantIXPLayerName)
		name:debug("Experiment variant for " .. disruptiveVoiceNudgeVariantIXPVariableName .. ": " .. tostring(status[disruptiveVoiceNudgeVariantIXPVariableName]))
		
		return status[disruptiveVoiceNudgeVariantIXPVariableName]
	end
	name:debug("Failed to get IXP data for layer: " .. disruptiveVoiceNudgeVariantIXPLayerName .. " with variable: " .. disruptiveVoiceNudgeVariantIXPVariableName)
	
	return false
end