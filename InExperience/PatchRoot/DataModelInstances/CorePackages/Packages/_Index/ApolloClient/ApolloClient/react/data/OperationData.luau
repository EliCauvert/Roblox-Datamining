local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local Boolean = require(Parent1.LuauPolyfill).Boolean
local _ = require(Parent1.GraphQL)
local EqualModule = require(Parent.jsutils.equal)
local InvariantFunction = require(Parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.Parent.core)
local ParserModule = require(script.Parent.Parent.parser)
local ParserFunction = ParserModule.parser
local OperationNameFunction = ParserModule.operationName
local _ = require(script.Parent.Parent.types.types)
local Module = {}
Module.__index = Module

function Module.new(p1, p2) --[[ Line: 39 ]]
	-- upvalues: Boolean (copy), Module (copy)
	return (setmetatable({
		options = Boolean.toJSBoolean(p1) and p1 or {},
		context = Boolean.toJSBoolean(p2) and p2 or {}
	}, Module))
end

function Module:getOptions() --[[ Line: 46 ]]
	return self.options
end

function Module:setOptions(Options, p1: boolean) --[[ Line: 50 ]]
	-- upvalues: EqualModule (copy)
	if p1 == nil then
		p1 = false
	end
	if p1 and not EqualModule(self.options, Options) then
		self.previousOptions = self.options
	end
	self.options = Options
end

function Module:unmount() --[[ Line: 60 ]]
	self.isMounted = false
end

function Module:refreshClient() --[[ Line: 64 ]]
	-- upvalues: Boolean (copy), InvariantFunction (copy)
	local Client = Boolean.toJSBoolean(if Boolean.toJSBoolean(self.options) then self.options.client else self.options) and (if Boolean.toJSBoolean(self.options) then self.options.client else self.options) or (if Boolean.toJSBoolean(self.context) then self.context.client else self.context)
	InvariantFunction(Boolean.toJSBoolean(Client), "Could not find \"client\" in the context or passed in as an option. Wrap the root component in an <ApolloProvider>, or pass an ApolloClient instance in via options.")
	local IsNew = false
	
	if Client ~= self.client then
		IsNew = true
		self.client = Client
		self:cleanup()
	end
	return { client = self.client, isNew = IsNew }
end

function Module:verifyDocumentType(p1, Type) --[[ Line: 99 ]]
	-- upvalues: ParserFunction (copy), OperationNameFunction (copy), InvariantFunction (copy)
	local ParserResult = ParserFunction(p1)
	local OperationNameResult = OperationNameFunction(Type)
	InvariantFunction(ParserResult.type == Type, ("Running a %s requires a graphql "):format(OperationNameResult) .. ("%s, but a %s was used instead."):format(OperationNameResult, (OperationNameFunction(ParserResult.type))))
end

return { OperationData = Module }