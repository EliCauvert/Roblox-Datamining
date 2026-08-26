local parent = script:FindFirstAncestor("ExpChat").Parent
local fFlagExpChatDictation = require(parent.SharedFlags).FFlagExpChatDictation

return require(parent.Rodux).makeActionCreator(script.Name, function(p1, p2, p3, p4, p5)
	-- upvalues: fFlagExpChatDictation (ref)
	return {
		text = p1,
		channelNameOverride = p2,
		metadata = p3,
		isError = if fFlagExpChatDictation then p4 else nil,
		postProcessMessage = p5
	}
end)