local Parent = script.Parent.Parent.Parent
local Object = require(Parent.LuauPolyfill).Object
local v1 = require(Parent.SafeFlags).createGetFFlag("MemoizeVirtualizedListContext")()
local ReactModule = require(Parent.React)
local UseMemoFunction = ReactModule.useMemo
local UseContextFunction = ReactModule.useContext
local Context = ReactModule.createContext(nil)
local VirtualizedListContextModule = { VirtualizedListContext = Context }

if _G.__DEV__ then
	Context.displayName = "VirtualizedListContext"
end
function VirtualizedListContextModule.VirtualizedListContextResetter(p1) --[[ Line: 96 ]]
	-- upvalues: ReactModule (copy), Context (copy)
	return ReactModule.createElement(Context.Provider, { value = nil }, p1.children)
end

function VirtualizedListContextModule.VirtualizedListContextProvider(p1) --[[ Line: 109 ]]
	-- upvalues: UseMemoFunction (copy), ReactModule (copy), Context (copy)
	local Value = p1.value
	
	return ReactModule.createElement(Context.Provider, {
		value = UseMemoFunction(function() --[[ Line: 116 ]]
			-- upvalues: Value (copy)
			return {
				cellKey = nil,
				getScrollMetrics = Value.getScrollMetrics,
				horizontal = Value.horizontal,
				getOutermostParentListRef = Value.getOutermostParentListRef,
				getNestedChildState = Value.getNestedChildState,
				registerAsNestedChild = Value.registerAsNestedChild,
				unregisterAsNestedChild = Value.unregisterAsNestedChild,
				debugInfo = {
					cellKey = Value.debugInfo.cellKey,
					horizontal = Value.debugInfo.horizontal,
					listKey = Value.debugInfo.listKey,
					parent = Value.debugInfo.parent
				}
			}
		end, {
			Value.getScrollMetrics, Value.horizontal, Value.getOutermostParentListRef,
			Value.getNestedChildState, Value.registerAsNestedChild,
			Value.unregisterAsNestedChild, Value.debugInfo.cellKey,
			Value.debugInfo.horizontal, Value.debugInfo.listKey, Value.debugInfo.parent
		})
	}, p1.children)
end

function VirtualizedListContextModule.VirtualizedListCellContextProvider(p1) --[[ Line: 156 ]]
	-- upvalues: UseContextFunction (copy), Context (copy), v1 (copy), UseMemoFunction (copy), Object (copy), ReactModule (copy)
	local CellKey = p1.cellKey
	local Children = p1.children
	local UseContextResult = UseContextFunction(Context)
	local UseMemoResult = if v1 then UseMemoFunction(function() --[[ Line: 164 ]]
		-- upvalues: UseContextResult (copy), Object (upval), CellKey (copy)
		return if UseContextResult == nil then nil else Object.assign(table.clone(UseContextResult), { cellKey = CellKey })
	end, { UseContextResult, CellKey }) else nil
	
	return ReactModule.createElement(Context.Provider, {
		value = if v1 then UseMemoResult elseif UseContextResult == nil then nil else Object.assign(table.clone(UseContextResult), { cellKey = CellKey })
	}, Children)
end

return VirtualizedListContextModule