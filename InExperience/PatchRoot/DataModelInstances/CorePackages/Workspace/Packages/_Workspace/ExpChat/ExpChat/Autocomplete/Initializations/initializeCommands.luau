local textChatService = game:GetService("TextChatService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local list = require(parent.llama).List
local expChatSharedModule = require(parent.ExpChatShared)
local initialCommandsModule = require(script.Parent.initialCommands)
local t = {}

local function getCommandKeys() --[[ line: 10 ]]
	-- upvalues: textChatService (ref), t (ref)
	local t_1 = {}
	
	for i, v in ipairs(textChatService:GetDescendants()) do
		if v.ClassName == "TextChatCommand" and string.sub(v.PrimaryAlias, 1, 1) == "/" then
			if v.AutocompleteVisible then
				table.insert(t_1, v.PrimaryAlias)
			end
			table.insert(t, v)
		end
	end
	return t_1
end

return function(p0) --[[ line: 25 ]]
	-- upvalues: getCommandKeys (ref), list (ref), expChatSharedModule (ref), initialCommandsModule (ref), t (ref)
	list.map(getCommandKeys(), function(p1) --[[ line: 27 ]]
		-- upvalues: p0 (ref)
		p0.trie:insert(p1)
	end)
	
	for i, v in expChatSharedModule.Commands.getVirtualLocalEnabledCommands() do
		for i_1, v_1 in v.alias do
			p0.trie:insert(v_1)
		end
	end
	initialCommandsModule(t)
	
	return p0.trie
end