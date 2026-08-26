local t = {}
local t_1 = {}
t_1.__index = t_1
local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local commandModules = clientChatModules:WaitForChild("CommandModules")
local utilModule = require(commandModules:WaitForChild("Util"))
local _ = script.Parent
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))

function t_1.SetupCommandProcessors(value)
	-- upvalues: commandModules (ref), utilModule (ref)
	local children = commandModules:GetChildren()
	
	for i = 1, #children do
		if children[i]:IsA("ModuleScript") and children[i].Name ~= "Util" then
			local unknownModule = require(children[i])
			local KEY_COMMAND_PROCESSOR_TYPE = unknownModule[utilModule.KEY_COMMAND_PROCESSOR_TYPE]
			local KEY_PROCESSOR_FUNCTION = unknownModule[utilModule.KEY_PROCESSOR_FUNCTION]
			
			if KEY_COMMAND_PROCESSOR_TYPE == utilModule.IN_PROGRESS_MESSAGE_PROCESSOR then
				table.insert(value.InProgressMessageProcessors, KEY_PROCESSOR_FUNCTION)
			elseif KEY_COMMAND_PROCESSOR_TYPE == utilModule.COMPLETED_MESSAGE_PROCESSOR then
				table.insert(value.CompletedMessageProcessors, KEY_PROCESSOR_FUNCTION)
			end
		end
	end
end

function t_1.ProcessCompletedChatMessage(p1, p2, p3)
	-- upvalues: chatSettingsModule (ref)
	for i = 1, #p1.CompletedMessageProcessors do
		if not p1.CompletedMessageProcessors[i](p2, p3, chatSettingsModule) then
			continue
		end
		return true
	end
	return false
end

function t_1.ProcessInProgressChatMessage(p4, p5, p6, p7)
	-- upvalues: chatSettingsModule (ref)
	for i = 1, #p4.InProgressMessageProcessors do
		local var1 = p4.InProgressMessageProcessors[i](p5, p6, p7, chatSettingsModule)
		
		if not var1 then
			continue
		end
		return var1
	end
	return nil
end

function t.new()
	-- upvalues: t_1 (ref)
	local tbl = setmetatable({}, t_1)
	tbl.CompletedMessageProcessors = {}
	tbl.InProgressMessageProcessors = {}
	tbl:SetupCommandProcessors()
	
	return tbl
end

return t