-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:15 2026 Pacific Standard Time.

local t = {}
local parent = script.Parent.Parent.Parent
local luauPolyfillModule = require(parent.Parent.LuauPolyfill)
local array = luauPolyfillModule.Array
local object = luauPolyfillModule.Object
local invariantError = require(parent.jsutils.invariant).InvariantError
local _ = require(script.Parent.Parent.core.types)

function t.validateOperation(p0) --[[ line: 19 ]]
	-- upvalues: object (ref), array (ref), invariantError (ref)
	local list = {
		"query",
		"operationName",
		"variables",
		"extensions",
		"context"
	}
	
	for i, v in ipairs(object.keys(p0)) do
		if array.indexOf(list, v) < 0 then
			error(invariantError.new(("illegal argument: %s"):format(v)))
		end
	end
	return p0
end

return t