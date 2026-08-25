local parent = script:FindFirstAncestor("ExpChat").Parent
local fFlagExpChatDictation = require(parent.SharedFlags).FFlagExpChatDictation

return require(parent.Rodux).makeActionCreator(script.Name, function(p0, p1, p2, p3, p4)
	-- upvalues: fFlagExpChatDictation (ref)
	return {
		text = p0,
		channelNameOverride = p1,
		metadata = p2,
		isError = if fFlagExpChatDictation then p3 else nil,
		postProcessMessage = p4
	}
end)