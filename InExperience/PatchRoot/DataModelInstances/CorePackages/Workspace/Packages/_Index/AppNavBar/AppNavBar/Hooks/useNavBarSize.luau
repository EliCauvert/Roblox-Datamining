local parent = script.Parent.Parent.Parent
local fFlagRenameDeprecatedUIBloxTokens = require(parent.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local useStyle = require(parent.UIBlox).Core.Style.useStyle

return function() --[[ line: 10 | named "useNavBarSize" ]]
	-- upvalues: useStyle (ref), fFlagRenameDeprecatedUIBloxTokens (ref)
	local tokens = useStyle().Tokens
	
	return if fFlagRenameDeprecatedUIBloxTokens then tokens.Size.Size_1600 else tokens.Global.Size_800
end