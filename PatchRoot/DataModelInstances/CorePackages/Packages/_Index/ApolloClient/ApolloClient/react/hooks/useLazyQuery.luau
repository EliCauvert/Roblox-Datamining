-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:52:16 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local _ = require(parent.Parent.GraphQL)
local _ = require(parent.jsutils.typedDocumentNode)
local _ = require(parent.react.types.types)
local useBaseQuery = require(script.Parent.utils.useBaseQuery).useBaseQuery
local _ = require(parent.core)

return {
	useLazyQuery = function(p0, p1) --[[ line: 26 ]]
		-- upvalues: useBaseQuery (ref)
		return useBaseQuery(p0, p1, true)
	end
}