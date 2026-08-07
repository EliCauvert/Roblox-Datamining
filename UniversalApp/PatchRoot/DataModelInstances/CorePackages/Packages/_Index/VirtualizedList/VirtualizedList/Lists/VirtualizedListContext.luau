local parent = script.Parent.Parent.Parent
local object = require(parent.LuauPolyfill).Object
local reactModule = require(parent.React)
local useMemo = reactModule.useMemo
local useContext = reactModule.useContext
local t = {}
local var2 = reactModule.createContext(nil)
t.VirtualizedListContext = var2

if _G.__DEV__ then
	var2.displayName = "VirtualizedListContext"
end
function t.VirtualizedListContextResetter(value) --[[ line: 96 ]]
	-- upvalues: reactModule (ref), var2 (ref)
	return reactModule.createElement(var2.Provider, { value = nil }, value.children)
end

function t.VirtualizedListContextProvider(p0) --[[ line: 109 ]]
	-- upvalues: useMemo (ref), reactModule (ref), var2 (ref)
	local value = p0.value
	
	return reactModule.createElement(var2.Provider, {
		value = useMemo(function() --[[ line: 116 ]]
			-- upvalues: value (ref)
			return {
				cellKey = nil,
				getScrollMetrics = value.getScrollMetrics,
				horizontal = value.horizontal,
				getOutermostParentListRef = value.getOutermostParentListRef,
				getNestedChildState = value.getNestedChildState,
				registerAsNestedChild = value.registerAsNestedChild,
				unregisterAsNestedChild = value.unregisterAsNestedChild,
				debugInfo = {
					cellKey = value.debugInfo.cellKey,
					horizontal = value.debugInfo.horizontal,
					listKey = value.debugInfo.listKey,
					parent = value.debugInfo.parent
				}
			}
		end, {
			value.getScrollMetrics, value.horizontal, value.getOutermostParentListRef,
			value.getNestedChildState, value.registerAsNestedChild,
			value.unregisterAsNestedChild, value.debugInfo.cellKey,
			value.debugInfo.horizontal, value.debugInfo.listKey, value.debugInfo.parent
		})
	}, p0.children)
end

function t.VirtualizedListCellContextProvider(p1) --[[ line: 156 ]]
	-- upvalues: useContext (ref), var2 (ref), reactModule (ref), object (ref)
	local var3 = useContext(var2)
	
	return reactModule.createElement(var2.Provider, {
		value = if var3 == nil then nil else object.assign(table.clone(var3), { cellKey = p1.cellKey })
	}, p1.children)
end

return t