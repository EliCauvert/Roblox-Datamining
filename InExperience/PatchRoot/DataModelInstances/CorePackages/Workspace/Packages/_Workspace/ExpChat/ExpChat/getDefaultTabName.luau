local expChat = script:FindFirstAncestor("ExpChat")
local isGlobalTabFirstModule = require(expChat.isGlobalTabFirst)
local fFlagExpChatGlobalTabDefaultModule = require(expChat.Flags.FFlagExpChatGlobalTabDefault)

return function(p1)
	-- upvalues: fFlagExpChatGlobalTabDefaultModule (ref), isGlobalTabFirstModule (ref)
	return if fFlagExpChatGlobalTabDefaultModule and isGlobalTabFirstModule() and p1.RBXGlobal ~= nil then "RBXGlobal" elseif p1.RBXGeneral == nil then nil else "RBXGeneral"
end