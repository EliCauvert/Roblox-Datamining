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

function t_1:batch(p0)
	self:performTransaction(p0.update, if typeof(p0.optimistic) == "string" then p0.optimistic elseif p0.optimistic == false then nil else nil)
end

function t_1.performTransaction(_, _, _)
	error("not implemented abstract method")
end

function t_1:recordOptimisticTransaction(p1, p2)
	self:performTransaction(p1, p2)
end

function t_1.transformDocument(_, p3)
	return p3
end

function t_1.identify(_, _) end

function t_1.gc(_)
	return {}
end

function t_1.modify(_, _)
	return false
end

function t_1.transformForLink(_, p4)
	return p4
end

function t_1:readQuery(p5, p6)
	-- upvalues: object (ref), boolean (ref)
	if p6 == nil then
		p6 = not not p5.optimistic
	end
	return self:read(object.assign(table.clone(p5), {
		rootId = if boolean.toJSBoolean(p5.id) then p5.id else "ROOT_QUERY",
		optimistic = p6
	}))
end

function t_1:readFragment(p7, p8)
	-- upvalues: object (ref)
	if p8 == nil then
		p8 = not not p7.optimistic
	end
	return self:read(object.assign({}, p7, {
		query = self.getFragmentDoc(p7.fragment, p7.fragmentName),
		rootId = p7.id,
		optimistic = p8
	}))
end

function t_1:writeQuery(p9)
	-- upvalues: object (ref)
	return self:write(object.assign(object.assign(table.clone(p9), { id = object.None, data = object.None }), { dataId = p9.id or "ROOT_QUERY", result = p9.data }))
end

function t_1:writeFragment(p10)
	-- upvalues: object (ref)
	return self:write(object.assign(object.assign(table.clone(p10), {
		id = object.None,
		data = object.None,
		fragment = object.None,
		fragmentName = object.None
	}), {
		query = self.getFragmentDoc(p10.fragment, p10.fragmentName),
		dataId = p10.id,
		result = p10.data
	}))
end

t.ApolloCache = t_1

return t