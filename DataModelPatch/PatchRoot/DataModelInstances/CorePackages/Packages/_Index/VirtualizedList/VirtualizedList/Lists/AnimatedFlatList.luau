local Parent = script.Parent.Parent.Parent
local ReactModule = require(Parent.React)
local Object = require(Parent.LuauPolyfill).Object
local FlatListModule = require(script.Parent.FlatList)
local UseFocusNavigationScrollingFunction = require(script.Parent.Hooks).useFocusNavigationScrolling

return function(Tbl)
	-- upvalues: ReactModule (copy), UseFocusNavigationScrollingFunction (copy), Object (copy), FlatListModule (copy)
	local UseRefResult = ReactModule.useRef(nil)
	local UseFocusNavigationScrollingResult, UseFocusNavigationScrollingResult2 = UseFocusNavigationScrollingFunction({
		listRef = Tbl.listRef or UseRefResult,
		onSelectedIndexChanged = Tbl.onSelectedIndexChanged,
		initialIndex = Tbl.initialScrollIndex,
		cellRendererKey = Tbl.cellRendererKey,
		viewOffset = Tbl.viewOffset,
		animated = Tbl.animated,
		data = Tbl.data
	})
	
	return ReactModule.createElement(FlatListModule, (Object.assign(table.clone(Tbl), {
		viewOffset = Object.None,
		animated = Object.None,
		onSelectedIndexChanged = Object.None,
		ref = Tbl.listRef or UseRefResult,
		onScrollToIndexFailed = if Tbl.getItemLayout then nil else UseFocusNavigationScrollingResult2,
		onSelectionChanged = UseFocusNavigationScrollingResult
	})))
end