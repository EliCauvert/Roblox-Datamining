local ReactModule = require(script:FindFirstAncestor("DebugPanel").Parent.React)
local Parent = script.Parent
local DebugPanelSectionModule = require(Parent.DebugPanelSection)
local _ = require(Parent.DebugPanelSectionRegistry)

local function getSortedChildren(Node)
	local List = {}
	
	for _, child in Node.children do
		table.insert(List, child)
	end
	table.sort(List, function(A, B): boolean
		return if A.order == B.order then A.title < B.title else A.order < B.order
	end)
	
	return List
end

local function collapseChain(p1)
	local Title = p1.title
	local v1 = p1
	while v1.component == nil do
		local Key, Value = next(v1.children)
		
		if Key == nil or next(v1.children, Key) ~= nil or Value.component ~= nil or next(Value.children) == nil then break end
		Title ..= " / " .. Value.title
		v1 = Value
	end
	return v1, Title
end

local function DebugPanelTree(p2)
	-- upvalues: getSortedChildren (copy), collapseChain (copy), ReactModule (copy), DebugPanelTree (copy), DebugPanelSectionModule (copy)
	local Elements = {}
	
	for LayoutOrder, value in ipairs((getSortedChildren(p2.node))) do
		local CollapseChainResult, CollapseChainResult2 = collapseChain(value)
		local t = {}
		
		if CollapseChainResult.component then
			t.Content = ReactModule.createElement(CollapseChainResult.component)
		end
		if next(CollapseChainResult.children) ~= nil then
			t.SubTree = ReactModule.createElement(DebugPanelTree, { node = CollapseChainResult, depth = p2.depth + 1 })
		end
		Elements[CollapseChainResult.leafId or CollapseChainResult2] = ReactModule.createElement(DebugPanelSectionModule, {
			title = CollapseChainResult2,
			layoutOrder = LayoutOrder,
			depth = p2.depth,
			defaultCollapsed = CollapseChainResult.defaultCollapsed
		}, t)
	end
	return ReactModule.createElement(ReactModule.Fragment, nil, Elements)
end

return DebugPanelTree