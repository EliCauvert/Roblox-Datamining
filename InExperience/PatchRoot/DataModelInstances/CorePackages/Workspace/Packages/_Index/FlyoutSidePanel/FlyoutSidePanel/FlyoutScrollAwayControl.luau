local Parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local SignalsModule = require(Parent.Signals)
local VisibilityControl = require(Parent.AppNavBar).VisibilityControl
local GetDrawerVisibleStoreFunction = require(Parent.Drawer).Stores.GetDrawerVisibleStore
local Module = {
	scrollAwayEnabled = false,
	flyoutVisible = false,
	contextualMenuVisible = false,
	flyoutVisibleStore = nil,
	disposeFlyoutVisibleEffect = nil
}
Module.__index = Module
local T = nil

function Module.getInstance() --[[ Line: 40 ]]
	-- upvalues: T (ref), Module (copy)
	if not T then
		T = {}
		setmetatable(T, Module)
		T:initialize()
	end
	return T
end

function Module.initialize(p1) --[[ Line: 49 ]]
	-- upvalues: GetDrawerVisibleStoreFunction (copy), SignalsModule (copy)
	p1.flyoutVisibleStore = GetDrawerVisibleStoreFunction(false)
	p1.disposeFlyoutVisibleEffect = SignalsModule.createEffect(function(p2) --[[ Line: 51 ]]
		-- upvalues: p1 (copy)
		p1.flyoutVisible = p1.flyoutVisibleStore.getDrawerVisible(p2)
		p1:updateScrollAwayState()
	end)
end

function Module.updateScrollAwayState(p1) --[[ Line: 58 ]]
	-- upvalues: VisibilityControl (copy)
	VisibilityControl.setEnabled(p1.scrollAwayEnabled and (not p1.flyoutVisible and not p1.contextualMenuVisible))
end

function Module.setScrollAwayEnabled(p1, ScrollAwayEnabled) --[[ Line: 63 ]]
	p1.scrollAwayEnabled = ScrollAwayEnabled
	p1:updateScrollAwayState()
end

function Module.setContextualMenuVisible(p1, ContextualMenuVisible) --[[ Line: 68 ]]
	p1.contextualMenuVisible = ContextualMenuVisible
	p1:updateScrollAwayState()
end

return {
	setScrollAwayEnabled = function(p1) --[[ Line: 74 ]]
		-- upvalues: Module (copy)
		return Module.getInstance():setScrollAwayEnabled(p1)
	end,
	setContextualMenuVisible = function(p1) --[[ Line: 77 ]]
		-- upvalues: Module (copy)
		return Module.getInstance():setContextualMenuVisible(p1)
	end
}