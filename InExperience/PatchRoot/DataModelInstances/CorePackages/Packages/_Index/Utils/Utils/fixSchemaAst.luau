local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local buildASTSchema = require(parent.GraphQL).buildASTSchema
local _ = require(script.Parent.types)
local getDocumentNodeFromSchema = require(script.Parent["print-schema-with-directives"]).getDocumentNodeFromSchema

local function buildFixedSchema(p1, p2)
	-- upvalues: getDocumentNodeFromSchema (ref), buildASTSchema (ref), object (ref), boolean (ref)
	return buildASTSchema(getDocumentNodeFromSchema(p1), object.assign({}, if boolean.toJSBoolean(p2) then p2 else {}))
end

function t.fixSchemaAst(p1, p2)
	-- upvalues: boolean (ref), buildFixedSchema (ref)
	local var1 = if not (boolean.toJSBoolean(p1.astNode) and boolean.toJSBoolean(p1.extensionASTNodes)) then buildFixedSchema(p1, p2) else nil
	
	if not boolean.toJSBoolean(p1.astNode) and var1 and boolean.toJSBoolean(var1.astNode) then
		p1.astNode = var1.astNode
	end
	if not boolean.toJSBoolean(p1.extensionASTNodes) and var1 and boolean.toJSBoolean(var1.astNode) then
		p1.extensionASTNodes = var1.extensionASTNodes
	end
	return p1
end

return t