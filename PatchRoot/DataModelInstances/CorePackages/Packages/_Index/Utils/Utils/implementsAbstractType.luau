-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:08 2026 Pacific Standard Time.

local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local graphQLModule = require(parent.GraphQL)
local doTypesOverlap = graphQLModule.doTypesOverlap
local isCompositeType = graphQLModule.isCompositeType
local _ = require(script.Parent.types)

function t.implementsAbstractType(value, p0, p1) --[[ line: 20 ]]
	-- upvalues: boolean (ref), isCompositeType (ref), doTypesOverlap (ref)
	if p1 == nil or p0 == nil then
		return false
	elseif p0 == p1 then
		return true
	end
	local var2 = isCompositeType(p0)
	
	return if boolean.toJSBoolean(if boolean.toJSBoolean(var2) then isCompositeType(p1) else var2) then doTypesOverlap(value, p0, p1) else false
end

return t