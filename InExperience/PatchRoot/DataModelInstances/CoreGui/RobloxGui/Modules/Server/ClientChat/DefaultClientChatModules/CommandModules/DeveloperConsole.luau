local starterGuiService = game:GetService("StarterGui")
local utilModule = require(script.Parent:WaitForChild("Util"))

function ProcessMessage(p0, _, _) --[[ line: 9 ]]
	-- upvalues: starterGuiService (ref)
	if string.sub(p0, 1, 8):lower() ~= "/console" and string.sub(p0, 1, 11):lower() ~= "/newconsole" then
		return false
	end
	local ok, status = pcall(function() --[[ line: 11 ]]
		-- upvalues: starterGuiService (copy)
		return starterGuiService:GetCore("DevConsoleVisible")
	end)
	
	if ok then
		local ok_1, status_1 = pcall(function() --[[ line: 13 ]]
			-- upvalues: starterGuiService (copy), status (ref)
			starterGuiService:SetCore("DevConsoleVisible", not status)
		end)
		
		if not ok_1 and status_1 then
			print("Error making developer console visible: " .. status_1)
		end
	end
	return true
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.COMPLETED_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}