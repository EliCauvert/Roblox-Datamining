local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local luauPolyfillModule = require(parent_1.LuauPolyfill)
local object = luauPolyfillModule.Object
local boolean = luauPolyfillModule.Boolean
local t = {}
local _ = require(parent_1.GraphQL)
local wrap = require(parent.optimism).wrap
local getFragmentQueryDocument = require(script.Parent.Parent.Parent.utilities).getFragmentQueryDocument
local _ = require(script.Parent.types.DataProxy)
local _ = require(script.Parent.types.Cache)
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), wrap (ref), getFragmentQueryDocument (ref)
	local tbl = setmetatable({}, t_1)
	tbl.getFragmentDoc = wrap(getFragmentQueryDocument)
	
	return tbl
end

function t_1.read(_, _)
	error("not implemented abstract method")
end

function t_1.write(_, _)
	error("not implemented abstract method")
end

function t_1.diff(_, _)
	error("not implemented abstract method")
end

function t_1.watch(_, _)
	error("not implemented abstract method")
end

function t_1.reset(_)
	error("not implemented abstract method")
end

function t_1.evict(_, _)
	error("not implemented abstract method")
end

function t_1.restore(_, _)
	error("not implemented abstract method")
end

function t_1.extract(_, _)
	error("not implemented abstract method")
end

function t_1.removeOptimistic(_, _)
	error("not implemented abstract method")
end

function t_1:batch(p1)
	self:performTransaction(p1.update, if typeof(p1.optimistic) == "string" then p1.optimistic elseif p1.optimistic == false then nil else nil)
end

function t_1.performTransaction(_, _, _)
	error("not implemented abstract method")
end

function t_1:recordOptimisticTransaction(p1, p2)
	self:performTransaction(p1, p2)
end

function t_1.transformDocument(_, p1)
	return p1
end

function t_1.identify(_, _) end

function t_1.gc(_)
	return {}
end

function t_1.modify(_, _)
	return false
end

function t_1.transformForLink(_, p1)
	return p1
end

function t_1:readQuery(p1, p2)
	-- upvalues: object (ref), boolean (ref)
	if p2 == nil then
		p2 = not not p1.optimistic
	end
	return self:read(object.assign(table.clone(p1), {
		rootId = if boolean.toJSBoolean(p1.id) then p1.id else "ROOT_QUERY",
		optimistic = p2
	}))
end

function t_1:readFragment(p1, p2)
	-- upvalues: object (ref)
	if p2 == nil then
		p2 = not not p1.optimistic
	end
	return self:read(object.assign({}, p1, {
		query = self.getFragmentDoc(p1.fragment, p1.fragmentName),
		rootId = p1.id,
		optimistic = p2
	}))
end

function t_1:writeQuery(p1)
	-- upvalues: object (ref)
	return self:write(object.assign(object.assign(table.clone(p1), { id = object.None, data = object.None }), { dataId = p1.id or "ROOT_QUERY", result = p1.data }))
end

function t_1:writeFragment(p1)
	-- upvalues: object (ref)
	return self:write(object.assign(object.assign(table.clone(p1), {
		id = object.None,
		data = object.None,
		fragment = object.None,
		fragmentName = object.None
	}), {
		query = self.getFragmentDoc(p1.fragment, p1.fragmentName),
		dataId = p1.id,
		result = p1.data
	}))
end

t.ApolloCache = t_1

return t