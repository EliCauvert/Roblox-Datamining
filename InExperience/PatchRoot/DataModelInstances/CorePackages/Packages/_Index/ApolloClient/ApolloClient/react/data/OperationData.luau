local t = {}
local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local boolean = require(parent_1.LuauPolyfill).Boolean
local _ = require(parent_1.GraphQL)
local equalModule = require(parent.jsutils.equal)
local invariant = require(parent.jsutils.invariant).invariant
local _ = require(script.Parent.Parent.Parent.core)
local parserModule = require(script.Parent.Parent.parser)
local parser = parserModule.parser
local operationName = parserModule.operationName
local _ = require(script.Parent.Parent.types.types)
local t_1 = {}
t_1.__index = t_1

function t_1.new(p1, p2)
	-- upvalues: boolean (ref), t_1 (ref)
	return setmetatable({
		options = if boolean.toJSBoolean(p1) then p1 else {},
		context = if boolean.toJSBoolean(p2) then p2 else {}
	}, t_1)
end

function t_1:getOptions()
	return self.options
end

function t_1:setOptions(p1, p2)
	-- upvalues: equalModule (ref)
	if p2 == nil then
		p2 = false
	end
	if p2 and not equalModule(self.options, p1) then
		self.previousOptions = self.options
	end
	self.options = p1
end

function t_1:unmount()
	self.isMounted = false
end

function t_1:refreshClient()
	-- upvalues: boolean (ref), invariant (ref)
	local var1 = boolean.toJSBoolean(if boolean.toJSBoolean(self.options) then self.options.client else self.options) and (if boolean.toJSBoolean(self.options) then self.options.client else self.options) or (if boolean.toJSBoolean(self.context) then self.context.client else self.context)
	invariant(boolean.toJSBoolean(var1), "Could not find \"client\" in the context or passed in as an option. Wrap the root component in an <ApolloProvider>, or pass an ApolloClient instance in via options.")
	local var2 = false
	
	if var1 ~= self.client then
		var2 = true
		self.client = var1
		self:cleanup()
	end
	return { client = self.client, isNew = var2 }
end

function t_1.verifyDocumentType(_, p1, p2)
	-- upvalues: parser (ref), operationName (ref), invariant (ref)
	local var1 = parser(p1)
	local var2 = operationName(p2)
	invariant(var1.type == p2, ("Running a %s requires a graphql "):format(var2) .. ("%s, but a %s was used instead."):format(var2, operationName(var1.type)))
end

t.OperationData = t_1

return t