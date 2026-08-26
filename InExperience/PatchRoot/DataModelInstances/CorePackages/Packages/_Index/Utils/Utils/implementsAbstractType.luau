local parent = script.Parent.Parent
local boolean = require(parent.LuauPolyfill).Boolean
local t = {}
local graphQLModule = require(parent.GraphQL)
local doTypesOverlap = graphQLModule.doTypesOverlap
local isCompositeType = graphQLModule.isCompositeType
local _ = require(script.Parent.types)

function t.implementsAbstractType(value, p1, p2)
	-- upvalues: boolean (ref), isCompositeType (ref), doTypesOverlap (ref)
	if p2 == nil or p1 == nil then
		return false
	elseif p1 == p2 then
		return true
	end
	local var1 = isCompositeType(p1)
	
	return if boolean.toJSBoolean(if boolean.toJSBoolean(var1) then isCompositeType(p2) else var1) then doTypesOverlap(value, p1, p2) else false
end

return t