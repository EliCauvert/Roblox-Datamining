-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:31:08 2026 Pacific Standard Time.

local makeActionCreatorModule = require(script.Parent.makeActionCreator)

local function makeMockRequestObject(p0) --[[ line: 3 ]]
	-- upvalues: makeActionCreatorModule (ref)
	local var2 = makeActionCreatorModule(p0)
	
	local var3 = function() --[[ line: 5 ]] end
	
	function var2.API() --[[ line: 6 ]]
		-- upvalues: var2 (ref)
		return var2.Succeeded()
	end
	
	var2.Mock = { reply = var3, clear = var3, replyWithError = var3 }
	
	return var2
end

return function() --[[ line: 19 ]]
	-- upvalues: makeMockRequestObject (ref)
	return {
		GET = makeMockRequestObject,
		POST = makeMockRequestObject,
		PATCH = makeMockRequestObject,
		DELETE = makeMockRequestObject
	}
end