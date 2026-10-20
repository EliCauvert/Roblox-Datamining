local ExpChat = script:FindFirstAncestor("ExpChat")
local IsGlobalTabFirstModule = require(ExpChat.isGlobalTabFirst)
local FFlagExpChatGlobalTabDefaultModule = require(ExpChat.Flags.FFlagExpChatGlobalTabDefault)

return function(p1)
	-- upvalues: FFlagExpChatGlobalTabDefaultModule (copy), IsGlobalTabFirstModule (copy)
	return if FFlagExpChatGlobalTabDefaultModule and IsGlobalTabFirstModule() and p1.RBXGlobal ~= nil then "RBXGlobal" elseif p1.RBXGeneral == nil then nil else "RBXGeneral"
end