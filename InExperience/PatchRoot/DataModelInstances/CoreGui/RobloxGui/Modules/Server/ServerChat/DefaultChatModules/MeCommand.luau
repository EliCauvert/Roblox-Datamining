local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local chatConstantsModule = require(clientChatModules:WaitForChild("ChatConstants"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))

return function(p0) --[[ line: 10 | named "Run" ]]
	-- upvalues: chatSettingsModule (ref), chatConstantsModule (ref)
	if chatSettingsModule and chatSettingsModule.AllowMeCommand then
		p0:RegisterFilterMessageFunction("me_command", function(_, p1, _) --[[ line: 13 | named "MeCommandFilterFunction" ]]
			-- upvalues: chatConstantsModule (copy)
			local message = p1.Message
			
			if message and string.sub(message, 1, 4):lower() == "/me " then
				p1.MessageType = chatConstantsModule.MessageTypeMeCommand
			end
		end)
	end
end