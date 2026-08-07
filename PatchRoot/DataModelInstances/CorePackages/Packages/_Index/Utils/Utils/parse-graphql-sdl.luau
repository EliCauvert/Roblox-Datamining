-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:09 2026 Pacific Standard Time.

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
local var4 = nil
local var5 = nil

local function _(p0) --[[ line: 51 | named "removeCommentsAndTrim" ]]
	-- upvalues: string (ref)
	return string.trim(string.gsub(p0, "(#[^*]*)", ""))
end

function t.parseGraphQLSDL(p1, p2, p3) --[[ line: 56 ]]
	-- upvalues: boolean (ref), string (ref), var4 (write), parse (ref), print (ref), source (ref), kind (ref)
	local var6 = if p3 ~= nil then {} else p3
	local t = nil
	local ok, status = pcall(function() --[[ line: 62 ]]
		-- upvalues: boolean (copy), var6 (ref), string (copy), p2 (ref), t (write), var4 (copy), parse (copy), print (copy), source (copy), p1 (ref)
		if boolean.toJSBoolean(var6.commentDescriptions) and string.includes(p2, "#") then
			t = var4(p2, var6)
			
			if boolean.toJSBoolean(var6.noLocation) then
				t = parse(print(t), var6)
				
				return
			end
		else
			t = parse(source.new(p2, p1), var6)
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

function t.transformCommentsToDescriptions(p4, p5) --[[ line: 122 ]]
	-- upvalues: parse (ref), object (ref), visit (ref), boolean (ref), var5 (write), getLeadingCommentBlock (ref), dedentBlockStringValue (ref), string (ref), kind (ref)
	return visit(parse(p4, object.assign({}, if p5 ~= nil then {} else p5, { noLocation = false })), {
		leave = function(_, p6) --[[ line: 129 ]]
			-- upvalues: boolean (copy), var5 (copy), getLeadingCommentBlock (copy), dedentBlockStringValue (copy), string (copy), object (copy), kind (copy)
			if boolean.toJSBoolean(var5(p6)) then
				local var8 = getLeadingCommentBlock(p6)
				
				if var8 == nil then return end
				local var9 = dedentBlockStringValue("\n" .. tostring(var8))
				
				return if boolean.toJSBoolean(p6.description) then object.assign({}, p6, {
					description = object.assign({}, p6.description, {
						block = true,
						value = p6.description.value .. "\n" .. var9
					})
				}) else object.assign({}, p6, {
					description = {
						kind = kind.STRING,
						value = var9,
						block = string.includes(var9, "\n")
					}
				})
			end
		end
	})
end

function t.isDescribable(p7) --[[ line: 176 ]]
	-- upvalues: isTypeSystemDefinitionNode (ref), kind (ref)
	return isTypeSystemDefinitionNode(p7) or (if p7.kind ~= kind.FIELD_DEFINITION then if p7.kind ~= kind.INPUT_VALUE_DEFINITION then p7.kind == kind.ENUM_VALUE_DEFINITION else true else true)
end

return t