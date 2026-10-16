local MutedErrorModule = require(script.Parent.mutedError)
game:DefineFastString("SuppressMutedErrorKeys", "")

local function _() --[[ Line: 32 | Named "getFStringSuppressMutedErrorKeys" ]]
	return game:GetFastString("SuppressMutedErrorKeys")
end

local SuppressMutedErrorKeysFastString = ""
local t = {}

local function shouldSuppressMutedError(p1) --[[ Line: 39 ]]
	-- upvalues: SuppressMutedErrorKeysFastString (ref), t (ref)
	local SuppressMutedErrorKeysFastString1: string = game:GetFastString("SuppressMutedErrorKeys")
	
	if SuppressMutedErrorKeysFastString1 ~= SuppressMutedErrorKeysFastString then
		SuppressMutedErrorKeysFastString = SuppressMutedErrorKeysFastString1
		t = {}
		
		for _, value in SuppressMutedErrorKeysFastString1:split(",") do
			t[value] = true
		end
	end
	return t[p1] or false
end

return function(p2, p3, p4) --[[ Line: 53 | Named "flaggedMutedError" ]]
	-- upvalues: shouldSuppressMutedError (copy), MutedErrorModule (copy)
	if not shouldSuppressMutedError(p2) then
		MutedErrorModule(p3, p4)
	end
end