local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local buildASTSchema = require(parent.GraphQL).buildASTSchema
local _ = require(script.Parent.types)
local getDocumentNodeFromSchema = require(script.Parent["print-schema-with-directives"]).getDocumentNodeFromSchema

local function buildFixedSchema(p0, p1)
	-- upvalues: getDocumentNodeFromSchema (ref), buildASTSchema (ref), object (ref), boolean (ref)
	return buildASTSchema(getDocumentNodeFromSchema(p0), object.assign({}, if boolean.toJSBoolean(p1) then p1 else {}))
end

function t.fixSchemaAst(p2, p3)
	-- upvalues: boolean (ref), buildFixedSchema (ref)
	local var3 = if not (boolean.toJSBoolean(p2.astNode) and boolean.toJSBoolean(p2.extensionASTNodes)) then buildFixedSchema(p2, p3) else nil
	
	if not boolean.toJSBoolean(p2.astNode) and var3 and boolean.toJSBoolean(var3.astNode) then
		p2.astNode = var3.astNode
	end
	if not boolean.toJSBoolean(p2.extensionASTNodes) and var3 and boolean.toJSBoolean(var3.astNode) then
		p2.extensionASTNodes = var3.extensionASTNodes
	end
	return p2
end

return t