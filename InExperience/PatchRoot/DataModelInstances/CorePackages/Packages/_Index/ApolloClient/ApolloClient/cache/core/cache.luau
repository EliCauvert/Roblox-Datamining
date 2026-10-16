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

function Module.new() --[[ Line: 207 ]]
	-- upvalues: Module (copy), WrapFunction (copy), GetFragmentQueryDocument (copy)
	local self = setmetatable({}, Module)
	self.getFragmentDoc = WrapFunction(GetFragmentQueryDocument)
	
	return self
end

function Module:read(_) --[[ Line: 217 ]]
	error("not implemented abstract method")
end

function Module:write(_) --[[ Line: 220 ]]
	error("not implemented abstract method")
end

function Module:diff(_) --[[ Line: 223 ]]
	error("not implemented abstract method")
end

function Module:watch(_) --[[ Line: 226 ]]
	error("not implemented abstract method")
end

function Module:reset() --[[ Line: 229 ]]
	error("not implemented abstract method")
end

function Module:evict(_) --[[ Line: 233 ]]
	error("not implemented abstract method")
end

function Module:restore(_) --[[ Line: 237 ]]
	error("not implemented abstract method")
end

function Module:extract(_) --[[ Line: 241 ]]
	error("not implemented abstract method")
end

function Module:removeOptimistic(_) --[[ Line: 245 ]]
	error("not implemented abstract method")
end

function Module:batch(p1) --[[ Line: 249 ]]
	self:performTransaction(p1.update, if typeof(p1.optimistic) == "string" then p1.optimistic elseif p1.optimistic == false then nil else nil)
end

function Module:performTransaction(_, _) --[[ Line: 263 ]]
	error("not implemented abstract method")
end

function Module:recordOptimisticTransaction(p1, p2) --[[ Line: 277 ]]
	self:performTransaction(p1, p2)
end

function Module:transformDocument(p1) --[[ Line: 281 ]]
	return p1
end

function Module:identify(_) --[[ Line: 285 ]] end

function Module:gc() --[[ Line: 289 ]]
	return {}
end

function Module:modify(_): boolean --[[ Line: 293 ]]
	return false
end

function Module:transformForLink(p1) --[[ Line: 297 ]]
	return p1
end

function Module:readQuery(Tbl, Optimistic: boolean) --[[ Line: 301 ]]
	-- upvalues: Object (copy), Boolean (copy)
	if Optimistic == nil then
		Optimistic = not not Tbl.optimistic
	end
	return self:read(Object.assign(table.clone(Tbl), {
		rootId = Boolean.toJSBoolean(Tbl.id) and Tbl.id or "ROOT_QUERY",
		optimistic = Optimistic
	}))
end

function Module:readFragment(p1, Optimistic: boolean) --[[ Line: 320 ]]
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

function Module:writeQuery(Tbl) --[[ Line: 338 ]]
	-- upvalues: Object (copy)
	return self:write(Object.assign(Object.assign(table.clone(Tbl), { id = Object.None, data = Object.None }), { dataId = Tbl.id or "ROOT_QUERY", result = Tbl.data }))
end

function Module:writeFragment(Tbl) --[[ Line: 350 ]]
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