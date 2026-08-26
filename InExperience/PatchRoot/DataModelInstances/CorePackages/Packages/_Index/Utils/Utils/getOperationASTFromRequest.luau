local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local error = luauPolyfillModule.Error
local t = {}
local getOperationAST = require(parent.GraphQL).getOperationAST
local _ = require(script.Parent.Interfaces)
local memoize1 = require(script.Parent.memoize).memoize1

local function getOperationASTFromDocument(p1, p2)
	-- upvalues: getOperationAST (ref), boolean (ref), error (ref)
	local var1 = getOperationAST(p1, p2)
	
	if not boolean.toJSBoolean(var1) then
		error(error.new(("Cannot infer operation %s"):format(tostring(if boolean.toJSBoolean(p2) then p2 else ""))))
	end
	return var1
end

t.getOperationASTFromDocument = getOperationASTFromDocument
t.getOperationASTFromRequest = memoize1(function(p1)
	-- upvalues: getOperationASTFromDocument (ref)
	return getOperationASTFromDocument(p1.document, p1.operationName)
end)

return t