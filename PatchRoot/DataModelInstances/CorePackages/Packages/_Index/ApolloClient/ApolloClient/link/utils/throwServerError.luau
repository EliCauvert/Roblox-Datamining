-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local error = require(parent.Parent.LuauPolyfill).Error
local _ = require(parent.luaUtils.Response)

return {
	throwServerError = function(p0, p1, p2) --[[ line: 31 ]]
		-- upvalues: error (ref)
		local serverError = error.new(p2)
		serverError.name = "ServerError"
		serverError.response = p0
		serverError.statusCode = p0.status
		serverError.result = p1
		error(serverError)
	end
}