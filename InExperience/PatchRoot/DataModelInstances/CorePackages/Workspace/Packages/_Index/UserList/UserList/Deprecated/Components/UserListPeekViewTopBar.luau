local parent = script:FindFirstAncestor("UserList").Parent
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local foundationModule = require(parent.Foundation)
local useTopBarHeight = require(parent.RobloxAppHooks).useTopBarHeight
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local view = foundationModule.View
local iconButton = foundationModule.IconButton

return function(p1)
	-- upvalues: useSelector (ref), useTopBarHeight (ref), reactModule (ref), view (ref), iconButton (ref)
	return reactModule.createElement(view, {
		tag = "bg-surface-100",
		Active = true,
		BorderSizePixel = 0,
		Position = UDim2.new(0, 0, 0, 0),
		Size = UDim2.new(0, 0, 0, useTopBarHeight())
	}, {
		LeftNavigationButton = reactModule.createElement(iconButton, {
			BackgroundTransparency = 1,
			icon = "icons/navigation/close",
			Position = UDim2.new(0, 15, 0, useSelector(function(p2)
				return p2.TopBar.statusBarHeight
			end)),
			onActivated = reactModule.useCallback(function()
				-- upvalues: p1 (ref)
				p1.navigateBack()
			end, { p1.navigateBack })
		})
	})
end