local _ = require(script.Parent.ViewRecycler)
local _ = require(script.ReactAdapter.ItemHooks)
local _ = require(script.ReactAdapter.RecyclableViewReadiness)
local _ = require(script.ReactAdapter.RecyclableViewSwitch)
local _ = require(script.ReactAdapter.RecyclingScope)
local _ = require(script.ReactAdapter.RecyclingViewport)
local _ = require(script.ReactAdapter.VirtualList)
local _ = require(script.ReactAdapter.createPinnedItem)
local _ = require(script.ReactAdapter.createRecyclableComponent)
local _ = require(script.ReactAdapter.createRecyclableView)
local _ = require(script.ReactAdapter.createVirtualList)

return require(script.ReactAdapter.Private.createReactAdapter)({
	createPortal = require(script.Parent.ReactRoblox).createPortal
})