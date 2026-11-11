local Parent = script:FindFirstAncestor("DebugPanel").Parent
local _ = require(Parent.React)

local function _()
	return {
		title = "root",
		leafId = nil,
		component = nil,
		order = 0,
		defaultCollapsed = nil,
		children = {}
	}
end

local function deepCloneNode(EmptyRoot)
	-- upvalues: deepCloneNode (copy)
	local config = {
		title = EmptyRoot.title,
		children = {},
		leafId = EmptyRoot.leafId,
		component = EmptyRoot.component,
		order = EmptyRoot.order,
		defaultCollapsed = EmptyRoot.defaultCollapsed
	}
	
	for i, child in EmptyRoot.children do
		config.children[i] = deepCloneNode(child)
	end
	return config
end

local function pruneEmptyAncestors(Child, Path)
	for i = #Path - 1, 1, -1 do
		local Child1 = Child
		
		for i1 = 1, i - 1 do
			Child1 = Child1.children[Path[i1]]
			
			if Child1 == nil then break end
		end
		local Child2 = Child1.children[Path[i]]
		
		if not Child2 or Child2.component ~= nil or next(Child2.children) then break end
		Child1.children[Path[i]] = nil
	end
end

local Root, Root2 = require(Parent.Signals).createSignal({
	title = "root",
	leafId = nil,
	component = nil,
	order = 0,
	defaultCollapsed = nil,
	children = {}
})

local function registerSection(EmptyRoot)
	-- upvalues: Root2 (copy), deepCloneNode (copy), pruneEmptyAncestors (copy)
	assert(EmptyRoot.id and #EmptyRoot.id > 0, "[DebugPanel] registerSection: id is required")
	assert(EmptyRoot.path and #EmptyRoot.path > 0, "[DebugPanel] registerSection: path must have at least one segment")
	assert(EmptyRoot.component ~= nil, "[DebugPanel] registerSection: component is required")
	local Order = EmptyRoot.order or 0
	Root2(function(p1)
		-- upvalues: deepCloneNode (upval), EmptyRoot (copy), Order (copy)
		local DeepCloneNodeResult = deepCloneNode(p1)
		local Child = DeepCloneNodeResult
		
		for i = 1, #EmptyRoot.path - 1 do
			local PathEntry = EmptyRoot.path[i]
			
			if Child.children[PathEntry] == nil then
				Child.children[PathEntry] = {
					leafId = nil,
					component = nil,
					defaultCollapsed = nil,
					title = PathEntry,
					children = {},
					order = Order
				}
			elseif Order < Child.children[PathEntry].order then
				Child.children[PathEntry].order = Order
			end
			Child = Child.children[PathEntry]
		end
		local PathEntry1 = EmptyRoot.path[#EmptyRoot.path]
		local Child1 = Child.children[PathEntry1]
		
		if Child1 then
			if Child1.leafId ~= nil and Child1.leafId ~= EmptyRoot.id then
				warn(string.format("[DebugPanel] registerSection: path '%s' is already claimed by id '%s', rejecting id '%s'", table.concat(EmptyRoot.path, " > "), Child1.leafId, EmptyRoot.id))
				
				return DeepCloneNodeResult
			end
			Child1.leafId = EmptyRoot.id
			Child1.component = EmptyRoot.component
			Child1.defaultCollapsed = EmptyRoot.defaultCollapsed
			
			if Order < Child1.order then
				Child1.order = Order
				
				return DeepCloneNodeResult
			end
		else
			Child.children[PathEntry1] = {
				title = PathEntry1,
				children = {},
				leafId = EmptyRoot.id,
				component = EmptyRoot.component,
				order = Order,
				defaultCollapsed = EmptyRoot.defaultCollapsed
			}
		end
		return DeepCloneNodeResult
	end)
	
	return function()
		-- upvalues: Root2 (upval), deepCloneNode (upval), EmptyRoot (copy), pruneEmptyAncestors (upval)
		Root2(function(p2)
			-- upvalues: deepCloneNode (upval), EmptyRoot (upval), pruneEmptyAncestors (upval)
			local DeepCloneNodeResult = deepCloneNode(p2)
			local Child = DeepCloneNodeResult
			
			for i = 1, #EmptyRoot.path - 1 do
				local PathEntry = EmptyRoot.path[i]
				
				if Child.children[PathEntry] == nil then
					return DeepCloneNodeResult
				end
				Child = Child.children[PathEntry]
			end
			local PathEntry1 = EmptyRoot.path[#EmptyRoot.path]
			local Child1 = Child.children[PathEntry1]
			
			if Child1 == nil or Child1.leafId ~= EmptyRoot.id then
				return DeepCloneNodeResult
			elseif next(Child1.children) then
				Child1.leafId = nil
				Child1.component = nil
				
				return DeepCloneNodeResult
			else
				Child.children[PathEntry1] = nil
				pruneEmptyAncestors(DeepCloneNodeResult, EmptyRoot.path)
				
				return DeepCloneNodeResult
			end
		end)
	end
end

return {
	registerSection = registerSection,
	registerSections = function(List)
		-- upvalues: registerSection (copy)
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, (registerSection(value)))
		end
		return function()
			-- upvalues: List1 (copy)
			for _, value in List1 do
				value()
			end
		end
	end,
	getRootSignal = Root
}