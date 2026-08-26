local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local object = require(parent.LuauPolyfill).Object
local flatListModule = require(script.Parent.FlatList)
local useFocusNavigationScrolling = require(script.Parent.Hooks).useFocusNavigationScrolling

return function(p1)
	-- upvalues: reactModule (ref), useFocusNavigationScrolling (ref), object (ref), flatListModule (ref)
	local var1 = reactModule.useRef(nil)
	local var2, var3 = useFocusNavigationScrolling({
		listRef = p1.listRef or var1,
		onSelectedIndexChanged = p1.onSelectedIndexChanged,
		initialIndex = p1.initialScrollIndex,
		cellRendererKey = p1.cellRendererKey,
		viewOffset = p1.viewOffset,
		animated = p1.animated,
		data = p1.data
	})
	
	return reactModule.createElement(flatListModule, object.assign(table.clone(p1), {
		viewOffset = object.None,
		animated = object.None,
		onSelectedIndexChanged = object.None,
		ref = p1.listRef or var1,
		onScrollToIndexFailed = if p1.getItemLayout then nil else var3,
		onSelectionChanged = var2
	}))
end