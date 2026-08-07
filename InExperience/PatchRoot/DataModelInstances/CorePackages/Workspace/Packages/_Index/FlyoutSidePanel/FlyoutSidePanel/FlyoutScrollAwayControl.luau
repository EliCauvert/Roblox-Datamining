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
local var2 = nil

function t.getInstance() --[[ line: 40 ]]
	-- upvalues: var2 (write), t (ref)
	if not var2 then
		var2 = {}
		setmetatable(var2, t)
		var2:initialize()
	end
	return var2
end

function t.initialize(p0) --[[ line: 49 ]]
	-- upvalues: getDrawerVisibleStore (ref), signalsModule (ref)
	p0.flyoutVisibleStore = getDrawerVisibleStore(false)
	p0.disposeFlyoutVisibleEffect = signalsModule.createEffect(function(p1) --[[ line: 51 ]]
		-- upvalues: p0 (ref)
		p0.flyoutVisible = p0.flyoutVisibleStore.getDrawerVisible(p1)
		p0:updateScrollAwayState()
	end)
end

function t.updateScrollAwayState(p2) --[[ line: 58 ]]
	-- upvalues: visibilityControl (ref)
	visibilityControl.setEnabled(p2.scrollAwayEnabled and (not p2.flyoutVisible and not p2.contextualMenuVisible))
end

function t.setScrollAwayEnabled(value, p3) --[[ line: 63 ]]
	value.scrollAwayEnabled = p3
	value:updateScrollAwayState()
end

function t.setContextualMenuVisible(value, p4) --[[ line: 68 ]]
	value.contextualMenuVisible = p4
	value:updateScrollAwayState()
end

return {
	setScrollAwayEnabled = function(value) --[[ line: 74 ]]
		-- upvalues: t (ref)
		return t.getInstance():setScrollAwayEnabled(value)
	end,
	setContextualMenuVisible = function(value) --[[ line: 77 ]]
		-- upvalues: t (ref)
		return t.getInstance():setContextualMenuVisible(value)
	end
}