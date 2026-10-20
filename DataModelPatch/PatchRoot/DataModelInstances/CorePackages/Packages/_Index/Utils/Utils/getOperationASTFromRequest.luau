local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Error1 = LuauPolyfillModule.Error
local GetOperationASTFunction = require(Parent.GraphQL).getOperationAST
local _ = require(script.Parent.Interfaces)

local function getOperationASTFromDocument(Document, OperationName)
	-- upvalues: GetOperationASTFunction (copy), Boolean (copy), Error1 (copy)
	local OperationAST = GetOperationASTFunction(Document, OperationName)
	
	if not Boolean.toJSBoolean(OperationAST) then
		error(Error1.new(("Cannot infer operation %s"):format((tostring(Boolean.toJSBoolean(OperationName) and OperationName or "")))))
	end
	return OperationAST
end

return {
	getOperationASTFromDocument = getOperationASTFromDocument,
	getOperationASTFromRequest = require(script.Parent.memoize).memoize1(function(p1)
		-- upvalues: getOperationASTFromDocument (copy)
		return (getOperationASTFromDocument(p1.document, p1.operationName))
	end)
}