local Module = {}
Module.__index = Module
local ClientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local CommandModules = ClientChatModules:WaitForChild("CommandModules")
local UtilModule = require(CommandModules:WaitForChild("Util"))
local _ = script.Parent
local ChatSettingsModule = require(ClientChatModules:WaitForChild("ChatSettings"))

function Module.SetupCommandProcessors(p1)
	-- upvalues: CommandModules (copy), UtilModule (copy)
	local Children = CommandModules:GetChildren()
	
	for i = 1, #Children do
		if Children[i]:IsA("ModuleScript") and Children[i].Name ~= "Util" then
			local Module = require(Children[i])
			local Entry = Module[UtilModule.KEY_COMMAND_PROCESSOR_TYPE]
			local Entry1 = Module[UtilModule.KEY_PROCESSOR_FUNCTION]
			
			if Entry == UtilModule.IN_PROGRESS_MESSAGE_PROCESSOR then
				table.insert(p1.InProgressMessageProcessors, Entry1)
			elseif Entry == UtilModule.COMPLETED_MESSAGE_PROCESSOR then
				table.insert(p1.CompletedMessageProcessors, Entry1)
			end
		end
	end
end

function Module.ProcessCompletedChatMessage(p2, p3, p4): boolean
	-- upvalues: ChatSettingsModule (copy)
	for i = 1, #p2.CompletedMessageProcessors do
		if p2.CompletedMessageProcessors[i](p3, p4, ChatSettingsModule) then
			return true
		end
	end
	return false
end

function Module.ProcessInProgressChatMessage(p5, p6, p7, p8)
	-- upvalues: ChatSettingsModule (copy)
	local v1 = nil
	for i = 1, #p5.InProgressMessageProcessors do
		v1 = p5.InProgressMessageProcessors[i](p6, p7, p8, ChatSettingsModule)
		
		if v1 then
			return v1
		end
	end
	return nil
end

return {
	new = function()
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.CompletedMessageProcessors = {}
		self.InProgressMessageProcessors = {}
		self:SetupCommandProcessors()
		
		return self
	end
}