local expChatSharedModule = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared)
game:DefineFastFlag("ExpChatGlobalCommandAutocompletePrimaryAliasOnly", false)

return function(p1)
	-- upvalues: expChatSharedModule (ref)
	for i, v in expChatSharedModule.GlobalCommands.getGlobalEnabledCommands() do
		if game:GetFastFlag("ExpChatGlobalCommandAutocompletePrimaryAliasOnly") then
			p1.trie:insert(v.alias[1])
		else
			for i_1, v_1 in v.alias do
				p1.trie:insert(v_1)
			end
		end
	end
	return p1.trie
end