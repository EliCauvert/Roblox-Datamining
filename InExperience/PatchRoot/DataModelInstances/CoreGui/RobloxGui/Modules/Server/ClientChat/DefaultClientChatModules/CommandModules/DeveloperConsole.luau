local StarterGui = game:GetService("StarterGui")
local UtilModule = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(Text: string, _, _): boolean --[[ Line: 9 ]]
	-- upvalues: StarterGui (copy)
	if string.sub(Text, 1, 8):lower() ~= "/console" and string.sub(Text, 1, 11):lower() ~= "/newconsole" then
		return false
	end
	local Success, Result = pcall(function() --[[ Line: 11 ]]
		-- upvalues: StarterGui (upval)
		return StarterGui:GetCore("DevConsoleVisible")
	end)
	
	if Success then
		local Success1, Result1 = pcall(function() --[[ Line: 13 ]]
			-- upvalues: StarterGui (upval), Result (copy)
			StarterGui:SetCore("DevConsoleVisible", not Result)
		end)
		
		if not Success1 and Result1 then
			print("Error making developer console visible: " .. Result1)
		end
	end
	return true
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.COMPLETED_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}