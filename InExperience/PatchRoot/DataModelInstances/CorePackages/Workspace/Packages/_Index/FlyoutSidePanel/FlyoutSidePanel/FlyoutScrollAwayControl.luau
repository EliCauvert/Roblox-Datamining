local parent = script:FindFirstAncestor("FlyoutSidePanel").Parent
local signalsModule = require(parent.Signals)
local visibilityControl = require(parent.AppNavBar).VisibilityControl
local getDrawerVisibleStore = require(parent.Drawer).Stores.GetDrawerVisibleStore
local t = {
	scrollAwayEnabled = false,
	flyoutVisible = false,
	contextualMenuVisible = false,
	flyoutVisibleStore = nil,
	disposeFlyoutVisibleEffect = nil
}
t.__index = t
local var1 = nil

function t.getInstance()
	-- upvalues: var1 (write), t (ref)
	if not var1 then
		var1 = {}
		setmetatable(var1, t)
		var1:initialize()
	end
	return var1
end

function t.initialize(p1)
	-- upvalues: getDrawerVisibleStore (ref), signalsModule (ref)
	p1.flyoutVisibleStore = getDrawerVisibleStore(false)
	p1.disposeFlyoutVisibleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: p1 (ref)
		p1.flyoutVisible = p1.flyoutVisibleStore.getDrawerVisible(p2)
		p1:updateScrollAwayState()
	end)
end

function t.updateScrollAwayState(p1)
	-- upvalues: visibilityControl (ref)
	visibilityControl.setEnabled(p1.scrollAwayEnabled and (not p1.flyoutVisible and not p1.contextualMenuVisible))
end

function t.setScrollAwayEnabled(value, p1)
	value.scrollAwayEnabled = p1
	value:updateScrollAwayState()
end

function t.setContextualMenuVisible(value, p1)
	value.contextualMenuVisible = p1
	value:updateScrollAwayState()
end

return {
	setScrollAwayEnabled = function(value)
		-- upvalues: t (ref)
		return t.getInstance():setScrollAwayEnabled(value)
	end,
	setContextualMenuVisible = function(value)
		-- upvalues: t (ref)
		return t.getInstance():setContextualMenuVisible(value)
	end
}