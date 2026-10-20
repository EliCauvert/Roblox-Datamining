local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local LuauPolyfillModule = require(Parent1.LuauPolyfill)
local Object = LuauPolyfillModule.Object
local Boolean = LuauPolyfillModule.Boolean
local _ = require(Parent1.GraphQL)
local WrapFunction = require(Parent.optimism).wrap
local GetFragmentQueryDocument = require(script.Parent.Parent.Parent.utilities).getFragmentQueryDocument
local _ = require(script.Parent.types.DataProxy)
local _ = require(script.Parent.types.Cache)
local Module = {}
Module.__index = Module

function Module.new()
	-- upvalues: Module (copy), WrapFunction (copy), GetFragmentQueryDocument (copy)
	local self = setmetatable({}, Module)
	self.getFragmentDoc = WrapFunction(GetFragmentQueryDocument)
	
	return self
end

function Module:read(_)
	error("not implemented abstract method")
end

function Module:write(_)
	error("not implemented abstract method")
end

function Module:diff(_)
	error("not implemented abstract method")
end

function Module:watch(_)
	error("not implemented abstract method")
end

function Module:reset()
	error("not implemented abstract method")
end

function Module:evict(_)
	error("not implemented abstract method")
end

function Module:restore(_)
	error("not implemented abstract method")
end

function Module:extract(_)
	error("not implemented abstract method")
end

function Module:removeOptimistic(_)
	error("not implemented abstract method")
end

function Module:batch(p1)
	self:performTransaction(p1.update, if typeof(p1.optimistic) == "string" then p1.optimistic elseif p1.optimistic == false then nil else nil)
end

function Module:performTransaction(_, _)
	error("not implemented abstract method")
end

function Module:recordOptimisticTransaction(p1, p2)
	self:performTransaction(p1, p2)
end

function Module:transformDocument(p1)
	return p1
end

function Module:identify(_) end

function Module:gc()
	return {}
end

function Module:modify(_): boolean
	return false
end

function Module:transformForLink(p1)
	return p1
end

function Module:readQuery(Tbl, Optimistic: boolean)
	-- upvalues: Object (copy), Boolean (copy)
	if Optimistic == nil then
		Optimistic = not not Tbl.optimistic
	end
	return self:read(Object.assign(table.clone(Tbl), {
		rootId = Boolean.toJSBoolean(Tbl.id) and Tbl.id or "ROOT_QUERY",
		optimistic = Optimistic
	}))
end

function Module:readFragment(p1, Optimistic: boolean)
	-- upvalues: Object (copy)
	if Optimistic == nil then
		Optimistic = not not p1.optimistic
	end
	return self:read(Object.assign({}, p1, {
		query = self.getFragmentDoc(p1.fragment, p1.fragmentName),
		rootId = p1.id,
		optimistic = Optimistic
	}))
end

function Module:writeQuery(Tbl)
	-- upvalues: Object (copy)
	return self:write(Object.assign(Object.assign(table.clone(Tbl), { id = Object.None, data = Object.None }), { dataId = Tbl.id or "ROOT_QUERY", result = Tbl.data }))
end

function Module:writeFragment(Tbl)
	-- upvalues: Object (copy)
	return self:write(Object.assign(Object.assign(table.clone(Tbl), {
		id = Object.None,
		data = Object.None,
		fragment = Object.None,
		fragmentName = Object.None
	}), {
		query = self.getFragmentDoc(Tbl.fragment, Tbl.fragmentName),
		dataId = Tbl.id,
		result = Tbl.data
	}))
end

return { ApolloCache = Module }