local Parent = script.Parent.Parent
local LuauPolyfillModule = require(Parent.LuauPolyfill)
local Boolean = LuauPolyfillModule.Boolean
local Object = LuauPolyfillModule.Object
local GraphQLModule = require(Parent.GraphQL)
local Kind = GraphQLModule.Kind
local ParseFunction = GraphQLModule.parse
local Source = GraphQLModule.Source
local VisitFunction = GraphQLModule.visit
local IsTypeSystemDefinitionNodeFunction = GraphQLModule.isTypeSystemDefinitionNode
local PrintFunction = GraphQLModule.print
local CommentsModule = require(script.Parent.comments)
local DedentBlockStringValueFunction = CommentsModule.dedentBlockStringValue
local GetLeadingCommentBlockFunction = CommentsModule.getLeadingCommentBlock
local _ = require(script.Parent.Interfaces)
local String1 = LuauPolyfillModule.String
local Callback = nil
local Callback1 = nil

local function _(Text: string)
	-- upvalues: String1 (copy)
	return String1.trim((string.gsub(Text, "(#[^*]*)", "")))
end

local function parseGraphQLSDL(Location, Text: string, p1)
	-- upvalues: Boolean (copy), String1 (copy), Callback (ref), ParseFunction (copy), PrintFunction (copy), Source (copy), Kind (copy)
	local T = if p1 == nil then {} else p1
	local Document = nil
	local Success, Result = pcall(function()
		-- upvalues: Boolean (upval), T (copy), String1 (upval), Text (copy), Document (ref), Callback (upval), ParseFunction (upval), PrintFunction (upval), Source (upval), Location (copy)
		if Boolean.toJSBoolean(T.commentDescriptions) and String1.includes(Text, "#") then
			Document = Callback(Text, T)
			
			if Boolean.toJSBoolean(T.noLocation) then
				Document = ParseFunction(PrintFunction(Document), T)
				
				return
			end
		else
			Document = ParseFunction(Source.new(Text, Location), T)
		end
	end)
	
	if not Success then
		if String1.includes(Result.message, "EOF") and String1.trim((string.gsub(Text, "(#[^*]*)", ""))) == "" then
			Document = { kind = Kind.DOCUMENT, definitions = {} }
		else
			error(Result)
		end
	end
	return { location = Location, document = Document }
end

Callback = function(p1, p2)
	-- upvalues: ParseFunction (copy), Object (copy), VisitFunction (copy), Boolean (copy), Callback1 (ref), GetLeadingCommentBlockFunction (copy), DedentBlockStringValueFunction (copy), String1 (copy), Kind (copy)
	return (VisitFunction(ParseFunction(p1, Object.assign({}, if p2 == nil then {} else p2, { noLocation = false })), {
		leave = function(_, p3)
			-- upvalues: Boolean (upval), Callback1 (upval), GetLeadingCommentBlockFunction (upval), DedentBlockStringValueFunction (upval), String1 (upval), Object (upval), Kind (upval)
			if Boolean.toJSBoolean(Callback1(p3)) then
				local LeadingCommentBlock = GetLeadingCommentBlockFunction(p3)
				
				if LeadingCommentBlock ~= nil then
					local DedentBlockStringValueResult = DedentBlockStringValueFunction("\n" .. tostring(LeadingCommentBlock))
					local Block = String1.includes(DedentBlockStringValueResult, "\n")
					
					return if Boolean.toJSBoolean(p3.description) then Object.assign({}, p3, {
						description = Object.assign({}, p3.description, {
							block = true,
							value = p3.description.value .. "\n" .. DedentBlockStringValueResult
						})
					}) else Object.assign({}, p3, {
						description = {
							kind = Kind.STRING,
							value = DedentBlockStringValueResult,
							block = Block
						}
					})
				end
			end
		end
	}))
end

Callback1 = function(p1)
	-- upvalues: IsTypeSystemDefinitionNodeFunction (copy), Kind (copy)
	return IsTypeSystemDefinitionNodeFunction(p1) or (p1.kind == Kind.FIELD_DEFINITION or (p1.kind == Kind.INPUT_VALUE_DEFINITION or p1.kind == Kind.ENUM_VALUE_DEFINITION))
end

return {
	parseGraphQLSDL = parseGraphQLSDL,
	transformCommentsToDescriptions = Callback,
	isDescribable = Callback1
}