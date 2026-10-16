local ClientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local ChatConstantsModule = require(ClientChatModules:WaitForChild("ChatConstants"))
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))

return function(p1) --[[ Line: 10 | Named "Run" ]]
	-- upvalues: ChatSettingsModule (copy), ChatConstantsModule (copy)
	if ChatSettingsModule and ChatSettingsModule.AllowMeCommand then
		p1:RegisterFilterMessageFunction("me_command", function(_, p2, _) --[[ Line: 13 | Named "MeCommandFilterFunction" ]]
			-- upvalues: ChatConstantsModule (upval)
			local Message: string = p2.Message
			
			if Message and string.sub(Message, 1, 4):lower() == "/me " then
				p2.MessageType = ChatConstantsModule.MessageTypeMeCommand
			end
		end)
	end
end