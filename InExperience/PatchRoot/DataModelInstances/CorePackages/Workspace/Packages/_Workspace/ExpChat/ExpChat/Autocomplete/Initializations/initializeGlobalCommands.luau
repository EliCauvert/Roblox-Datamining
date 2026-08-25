local expChatSharedModule = require(script:FindFirstAncestor("ExpChat").Parent.ExpChatShared)
game:DefineFastFlag("ExpChatGlobalCommandAutocompletePrimaryAliasOnly", false)

return function(p0)
	-- upvalues: expChatSharedModule (ref)
	for i, v in expChatSharedModule.GlobalCommands.getGlobalEnabledCommands() do
		if game:GetFastFlag("ExpChatGlobalCommandAutocompletePrimaryAliasOnly") then
			p0.trie:insert(v.alias[1])
		else
			for i_1, v_1 in v.alias do
				p0.trie:insert(v_1)
			end
		end
	end
	return p0.trie
end