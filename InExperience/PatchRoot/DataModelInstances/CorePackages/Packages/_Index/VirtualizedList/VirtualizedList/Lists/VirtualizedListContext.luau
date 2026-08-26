local parent = script.Parent.Parent.Parent
local object = require(parent.LuauPolyfill).Object
local reactModule = require(parent.React)
local useMemo = reactModule.useMemo
local useContext = reactModule.useContext
local t = {}
local var1 = reactModule.createContext(nil)
t.VirtualizedListContext = var1

if _G.__DEV__ then
	var1.displayName = "VirtualizedListContext"
end
function t.VirtualizedListContextResetter(value)
	-- upvalues: reactModule (ref), var1 (ref)
	return reactModule.createElement(var1.Provider, { value = nil }, value.children)
end

function t.VirtualizedListContextProvider(p1)
	-- upvalues: useMemo (ref), reactModule (ref), var1 (ref)
	local value = p1.value
	
	return reactModule.createElement(var1.Provider, {
		value = useMemo(function()
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
	}, p1.children)
end

function t.VirtualizedListCellContextProvider(p1)
	-- upvalues: useContext (ref), var1 (ref), reactModule (ref), object (ref)
	local var2 = useContext(var1)
	
	return reactModule.createElement(var1.Provider, {
		value = if var2 == nil then nil else object.assign(table.clone(var2), { cellKey = p1.cellKey })
	}, p1.children)
end

return t