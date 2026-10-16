local ExpChatSharedModule = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared)
game:DefineFastFlag("ExpChatGlobalCommandAutocompletePrimaryAliasOnly", false)

return function(p1) --[[ Line: 7 ]]
	-- upvalues: ExpChatSharedModule (copy)
	for _, value in ExpChatSharedModule.GlobalCommands.getGlobalEnabledCommands() do
		if game:GetFastFlag("ExpChatGlobalCommandAutocompletePrimaryAliasOnly") then
			p1.trie:insert(value.alias[1])
		else
			for _, alia in value.alias do
				p1.trie:insert(alia)
			end
		end
	end
	return p1.trie
end