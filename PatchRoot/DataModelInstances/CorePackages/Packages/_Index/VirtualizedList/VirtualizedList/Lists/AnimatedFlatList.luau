-- Decompiled using LunaUX-Decompiler V1.4.1 (The rewrite version) (discord.gg/2mJUD4XDDT)
-- Decompiled at Fri Aug 7 0:33:10 2026 Pacific Standard Time.

local parent = script.Parent.Parent.Parent
local reactModule = require(parent.React)
local object = require(parent.LuauPolyfill).Object
local flatListModule = require(script.Parent.FlatList)
local useFocusNavigationScrolling = require(script.Parent.Hooks).useFocusNavigationScrolling

return function(p0) --[[ line: 38 | named "AnimatedFlatList" ]]
	-- upvalues: reactModule (ref), useFocusNavigationScrolling (ref), object (ref), flatListModule (ref)
	local var2 = reactModule.useRef(nil)
	local var3, var4 = useFocusNavigationScrolling({
		listRef = p0.listRef or var2,
		onSelectedIndexChanged = p0.onSelectedIndexChanged,
		initialIndex = p0.initialScrollIndex,
		cellRendererKey = p0.cellRendererKey,
		viewOffset = p0.viewOffset,
		animated = p0.animated,
		data = p0.data
	})
	
	return reactModule.createElement(flatListModule, object.assign(table.clone(p0), {
		viewOffset = object.None,
		animated = object.None,
		onSelectedIndexChanged = object.None,
		ref = p0.listRef or var2,
		onScrollToIndexFailed = if p0.getItemLayout then nil else var4,
		onSelectionChanged = var3
	}))
end