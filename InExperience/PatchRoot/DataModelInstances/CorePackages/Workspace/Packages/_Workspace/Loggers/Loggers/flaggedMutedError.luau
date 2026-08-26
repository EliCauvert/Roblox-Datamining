local mutedErrorModule = require(script.Parent.mutedError)
game:DefineFastString("SuppressMutedErrorKeys", "")

local function _()
	return game:GetFastString("SuppressMutedErrorKeys")
end

local var1 = ""
local t = {}

local function shouldSuppressMutedError(p1)
	-- upvalues: var1 (write), t (write)
	local suppressMutedErrorKeysFastString = game:GetFastString("SuppressMutedErrorKeys")
	
	if suppressMutedErrorKeysFastString ~= var1 then
		var1 = suppressMutedErrorKeysFastString
		t = {}
		
		for i, v in suppressMutedErrorKeysFastString:split(",") do
			t[v] = true
		end
	end
	return t[p1] or false
end

return function(p2, p3, p4)
	-- upvalues: shouldSuppressMutedError (ref), mutedErrorModule (ref)
	if not shouldSuppressMutedError(p2) then
		mutedErrorModule(p3, p4)
	end
end