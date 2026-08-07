-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:42:36 2026 Pacific Standard Time.

return setmetatable({ __NULL_IDENTIFIER__ = "__GRAPHQL_NULL_OBJECT__" }, {
	__metatable = false,
	__newindex = function(_, p0, _) --[[ line: 7 ]]
		error(("%q (%s) is not a valid member of %s"):format(tostring(p0), typeof(p0), "null"), 2)
	end,
	__tostring = function() --[[ line: 17 ]]
		return "null"
	end
})