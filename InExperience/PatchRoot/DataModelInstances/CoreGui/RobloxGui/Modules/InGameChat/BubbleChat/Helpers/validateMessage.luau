local TModule = require(game:GetService("CorePackages").Packages.t)
local ConstantsModule = require(script.Parent.Parent.Constants)
local MaybeAssertModule = require(script.Parent.maybeAssert)

return function(Text) --[[ Line: 15 | Named "validateMessageText" ]]
	-- upvalues: MaybeAssertModule (copy), TModule (copy), ConstantsModule (copy)
	MaybeAssertModule(TModule.string(Text))
	
	if utf8.len(Text) == nil then
		return false
	end
	local Length = utf8.len(utf8.nfcnormalize(Text))
	
	if ConstantsModule.MAX_MESSAGE_LENGTH < Length then
		return false, Length
	else
		return true
	end
end