local tModule = require(game:GetService("CorePackages").Packages.t)
local constantsModule = require(script.Parent.Parent.Constants)
local maybeAssertModule = require(script.Parent.maybeAssert)

return function(p0) --[[ line: 15 | named "validateMessageText" ]]
	-- upvalues: maybeAssertModule (ref), tModule (ref), constantsModule (ref)
	maybeAssertModule(tModule.string(p0))
	
	if utf8.len(p0) == nil then
		return false
	end
	local charCount = utf8.len(utf8.nfcnormalize(p0))
	
	if constantsModule.MAX_MESSAGE_LENGTH < charCount then
		return false, charCount
	end
	return true
end