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

function t_1.new(p0, p1) --[[ line: 39 ]]
	-- upvalues: boolean (ref), t_1 (ref)
	return setmetatable({
		options = if boolean.toJSBoolean(p0) then p0 else {},
		context = if boolean.toJSBoolean(p1) then p1 else {}
	}, t_1)
end

function t_1:getOptions() --[[ line: 46 ]]
	return self.options
end

function t_1:setOptions(p2, p3) --[[ line: 50 ]]
	-- upvalues: equalModule (ref)
	if p3 == nil then
		p3 = false
	end
	if p3 and not equalModule(self.options, p2) then
		self.previousOptions = self.options
	end
	self.options = p2
end

function t_1:unmount() --[[ line: 60 ]]
	self.isMounted = false
end

function t_1:refreshClient() --[[ line: 64 ]]
	-- upvalues: boolean (ref), invariant (ref)
	local var4 = boolean.toJSBoolean(if boolean.toJSBoolean(self.options) then self.options.client else self.options) and (if boolean.toJSBoolean(self.options) then self.options.client else self.options) or (if boolean.toJSBoolean(self.context) then self.context.client else self.context)
	invariant(boolean.toJSBoolean(var4), "Could not find \"client\" in the context or passed in as an option. Wrap the root component in an <ApolloProvider>, or pass an ApolloClient instance in via options.")
	local var5 = false
	
	if var4 ~= self.client then
		var5 = true
		self.client = var4
		self:cleanup()
	end
	return { client = self.client, isNew = var5 }
end

function t_1.verifyDocumentType(_, p4, p5) --[[ line: 99 ]]
	-- upvalues: parser (ref), operationName (ref), invariant (ref)
	local var6 = parser(p4)
	local var7 = operationName(p5)
	invariant(var6.type == p5, ("Running a %s requires a graphql "):format(var7) .. ("%s, but a %s was used instead."):format(var7, operationName(var6.type)))
end

t.OperationData = t_1

return t