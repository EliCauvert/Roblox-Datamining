local parent = script.Parent.Parent
local luauPolyfillModule = require(parent.LuauPolyfill)
local boolean = luauPolyfillModule.Boolean
local object = luauPolyfillModule.Object
local t = {}
local graphQLModule = require(parent.GraphQL)
local kind = graphQLModule.Kind
local parse = graphQLModule.parse
local source = graphQLModule.Source
local visit = graphQLModule.visit
local isTypeSystemDefinitionNode = graphQLModule.isTypeSystemDefinitionNode
local print = graphQLModule.print
local commentsModule = require(script.Parent.comments)
local dedentBlockStringValue = commentsModule.dedentBlockStringValue
local getLeadingCommentBlock = commentsModule.getLeadingCommentBlock
local _ = require(script.Parent.Interfaces)
local string = luauPolyfillModule.String
local var1 = nil
local var2 = nil

local function _(p1)
	-- upvalues: string (ref)
	return string.trim(string.gsub(p1, "(#[^*]*)", ""))
end

function t.parseGraphQLSDL(p1, p2, p3)
	-- upvalues: boolean (ref), string (ref), var1 (write), parse (ref), print (ref), source (ref), kind (ref)
	local var3 = if p3 ~= nil then {} else p3
	local t = nil
	local ok, status = pcall(function()
		-- upvalues: boolean (copy), var3 (ref), string (copy), p2 (ref), t (write), var1 (copy), parse (copy), print (copy), source (copy), p1 (ref)
		if boolean.toJSBoolean(var3.commentDescriptions) and string.includes(p2, "#") then
			t = var1(p2, var3)
			
			if boolean.toJSBoolean(var3.noLocation) then
				t = parse(print(t), var3)
				
				return
			end
		else
			t = parse(source.new(p2, p1), var3)
		end
	end)
	
	if not ok then
		if string.includes(status.message, "EOF") and string.trim(string.gsub(p2, "(#[^*]*)", "")) == "" then
			t = { kind = kind.DOCUMENT, definitions = {} }
		else
			error(status)
		end
	end
	return { location = p1, document = t }
end

function t.transformCommentsToDescriptions(p1, p2)
	-- upvalues: parse (ref), object (ref), visit (ref), boolean (ref), var2 (write), getLeadingCommentBlock (ref), dedentBlockStringValue (ref), string (ref), kind (ref)
	return visit(parse(p1, object.assign({}, if p2 ~= nil then {} else p2, { noLocation = false })), {
		leave = function(_, p3)
			-- upvalues: boolean (copy), var2 (copy), getLeadingCommentBlock (copy), dedentBlockStringValue (copy), string (copy), object (copy), kind (copy)
			if boolean.toJSBoolean(var2(p3)) then
				local var3 = getLeadingCommentBlock(p3)
				
				if var3 == nil then return end
				local var4 = dedentBlockStringValue("\n" .. tostring(var3))
				
				return if boolean.toJSBoolean(p3.description) then object.assign({}, p3, {
					description = object.assign({}, p3.description, {
						block = true,
						value = p3.description.value .. "\n" .. var9
					})
				}) else object.assign({}, p3, {
					description = {
						kind = kind.STRING,
						value = var4,
						block = string.includes(var4, "\n")
					}
				})
			end
		end
	})
end

function t.isDescribable(p1)
	-- upvalues: isTypeSystemDefinitionNode (ref), kind (ref)
	return isTypeSystemDefinitionNode(p1) or (if p1.kind ~= kind.FIELD_DEFINITION then if p1.kind ~= kind.INPUT_VALUE_DEFINITION then p1.kind == kind.ENUM_VALUE_DEFINITION else true else true)
end

return t