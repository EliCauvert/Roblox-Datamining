local parent = script:FindFirstAncestor("FriendsCalling").Parent
local floatingWindowModule = require(parent.FloatingWindow)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local placeholderCollapsedModule = require(script.Parent.PlaceholderCollapsed)
local colorMode = foundationModule.Enums.ColorMode
local foundationProvider = foundationModule.FoundationProvider
local useSelectedTheme = roactUtilsModule.Hooks.useSelectedTheme
local uDim2 = UDim2.fromOffset(120, 160)

local function CallPipWindow(p1)
	-- upvalues: reactModule (ref), floatingWindowModule (ref), placeholderCollapsedModule (ref), uDim2 (ref)
	local var1, var2 = reactModule.useState(nil)
	
	return reactModule.createElement(floatingWindowModule.Window, {
		testId = "friends-calling-pip",
		behavior = floatingWindowModule.Behaviors.Contained,
		children = reactModule.createElement(placeholderCollapsedModule, {
			onDragInputTarget = reactModule.useCallback(function(p2)
				-- upvalues: var2 (ref)
				var2(p2)
			end, {})
		}),
		displayOrder = p1.host.displayOrder,
		dragInputTarget = var1,
		initialCenter = UDim2.fromScale(0.85, 0.2),
		size = uDim2
	})
end

return function(p1)
	-- upvalues: useSelectedTheme (ref), colorMode (ref), reactModule (ref), foundationProvider (ref), CallPipWindow (ref)
	return reactModule.createElement(foundationProvider, {
		colorMode = if p1.host.followsAppColorMode and useSelectedTheme() == "light" then colorMode.Light else colorMode.Dark
	}, { Window = reactModule.createElement(CallPipWindow, p1) })
end