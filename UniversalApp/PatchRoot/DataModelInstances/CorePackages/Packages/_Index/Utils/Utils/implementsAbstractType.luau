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