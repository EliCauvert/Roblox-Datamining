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

function Module.getInstance()
	-- upvalues: T (ref), Module (copy)
	if not T then
		T = {}
		setmetatable(T, Module)
		T:initialize()
	end
	return T
end

function Module.initialize(p1)
	-- upvalues: GetDrawerVisibleStoreFunction (copy), SignalsModule (copy)
	p1.flyoutVisibleStore = GetDrawerVisibleStoreFunction(false)
	p1.disposeFlyoutVisibleEffect = SignalsModule.createEffect(function(p2)
		-- upvalues: p1 (copy)
		p1.flyoutVisible = p1.flyoutVisibleStore.getDrawerVisible(p2)
		p1:updateScrollAwayState()
	end)
end

function Module.updateScrollAwayState(p1)
	-- upvalues: VisibilityControl (copy)
	VisibilityControl.setEnabled(p1.scrollAwayEnabled and (not p1.flyoutVisible and not p1.contextualMenuVisible))
end

function Module.setScrollAwayEnabled(p1, ScrollAwayEnabled)
	p1.scrollAwayEnabled = ScrollAwayEnabled
	p1:updateScrollAwayState()
end

function Module.setContextualMenuVisible(p1, ContextualMenuVisible)
	p1.contextualMenuVisible = ContextualMenuVisible
	p1:updateScrollAwayState()
end

return {
	setScrollAwayEnabled = function(p1)
		-- upvalues: Module (copy)
		return Module.getInstance():setScrollAwayEnabled(p1)
	end,
	setContextualMenuVisible = function(p1)
		-- upvalues: Module (copy)
		return Module.getInstance():setContextualMenuVisible(p1)
	end
}