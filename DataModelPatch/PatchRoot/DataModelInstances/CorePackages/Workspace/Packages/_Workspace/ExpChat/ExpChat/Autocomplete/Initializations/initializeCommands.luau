local TextChatService = game:GetService("TextChatService")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local List = require(Parent.llama).List
local ExpChatSharedModule = require(Parent.ExpChatShared)
local InitialCommandsModule = require(script.Parent.initialCommands)
local List1 = {}

local function getCommandKeys()
	-- upvalues: TextChatService (copy), List1 (copy)
	local List = {}
	
	for _, TextChatCommand in ipairs((TextChatService:GetDescendants())) do
		if TextChatCommand.ClassName == "TextChatCommand" and string.sub(TextChatCommand.PrimaryAlias, 1, 1) == "/" then
			if TextChatCommand.AutocompleteVisible then
				table.insert(List, TextChatCommand.PrimaryAlias)
			end
			table.insert(List1, TextChatCommand)
		end
	end
	return List
end

return function(p1)
	-- upvalues: getCommandKeys (copy), List (copy), ExpChatSharedModule (copy), InitialCommandsModule (copy), List1 (copy)
	List.map(getCommandKeys(), function(p2)
		-- upvalues: p1 (copy)
		p1.trie:insert(p2)
	end)
	
	for _, value in ExpChatSharedModule.Commands.getVirtualLocalEnabledCommands() do
		for _, alia in value.alias do
			p1.trie:insert(alia)
		end
	end
	InitialCommandsModule(List1)
	
	return p1.trie
end