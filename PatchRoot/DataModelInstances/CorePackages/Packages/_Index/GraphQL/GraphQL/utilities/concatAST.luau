-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:37 2026 Pacific Standard Time.

local array = require(script.Parent.Parent.Parent.LuauPolyfill).Array
local _ = require(script.Parent.Parent.language.ast)

function concatAST(p0) --[[ line: 23 ]]
	-- upvalues: array (ref)
	local t = {}
	
	for i, v in ipairs(p0) do
		t = array.concat(t, v.definitions)
	end
	return { kind = "Document", definitions = t }
end

return { concatAST = concatAST }