local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local BuildASTSchemaFunction = require(Parent.GraphQL).buildASTSchema
local _ = require(script.Parent.types)
local GetDocumentNodeFromSchemaFunction = require(script.Parent["print-schema-with-directives"]).getDocumentNodeFromSchema

local function buildFixedSchema(p1, p2)
	-- upvalues: GetDocumentNodeFromSchemaFunction (copy), BuildASTSchemaFunction (copy), Object (copy), Boolean (copy)
	return BuildASTSchemaFunction(GetDocumentNodeFromSchemaFunction(p1), Object.assign({}, Boolean.toJSBoolean(p2) and p2 or {}))
end

return {
	fixSchemaAst = function(p1, p2)
		-- upvalues: Boolean (copy), buildFixedSchema (copy)
		local FixedSchema = if not Boolean.toJSBoolean(p1.astNode) or not Boolean.toJSBoolean(p1.extensionASTNodes) then buildFixedSchema(p1, p2) else nil
		
		if not Boolean.toJSBoolean(p1.astNode) and FixedSchema and Boolean.toJSBoolean(FixedSchema.astNode) then
			p1.astNode = FixedSchema.astNode
		end
		if not Boolean.toJSBoolean(p1.extensionASTNodes) and FixedSchema and Boolean.toJSBoolean(FixedSchema.astNode) then
			p1.extensionASTNodes = FixedSchema.extensionASTNodes
		end
		return p1
	end
}