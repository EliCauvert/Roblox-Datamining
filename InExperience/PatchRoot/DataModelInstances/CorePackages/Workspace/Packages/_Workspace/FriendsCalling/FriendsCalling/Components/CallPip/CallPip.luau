local parent = script:FindFirstAncestor("FriendsCalling").Parent
local floatingWindowModule = require(parent.FloatingWindow)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local roactUtilsModule = require(parent.RoactUtils)
local responsiveModule = require(parent.Responsive)
local robloxAppEnumsModule = require(parent.RobloxAppEnums)
local robloxAppHooksModule = require(parent.RobloxAppHooks)
local placeholderCollapsedModule = require(script.Parent.PlaceholderCollapsed)
local placeholderExpandedModule = require(script.Parent.PlaceholderExpanded)
local resolveGeometryModule = require(script.Parent.resolveGeometry)
local colorMode = foundationModule.Enums.ColorMode
local deviceOrientationMode = robloxAppEnumsModule.DeviceOrientationMode
local foundationProvider = foundationModule.FoundationProvider
local useSelectedTheme = roactUtilsModule.Hooks.useSelectedTheme
local useDeviceInsets = responsiveModule.useDeviceInsets
local useDeviceOrientation = robloxAppHooksModule.useDeviceOrientation
local useTokens = foundationModule.Hooks.useTokens
local uDim2 = UDim2.fromOffset(120, 160)
local frozen = table.freeze({ Compact = "Compact", Expanded = "Expanded" })

local function CallPipWindow(p1)
	-- upvalues: useTokens (ref), useDeviceInsets (ref), useDeviceOrientation (ref), deviceOrientationMode (ref), reactModule (ref), frozen (ref), resolveGeometryModule (ref), placeholderExpandedModule (ref), placeholderCollapsedModule (ref), floatingWindowModule (ref), uDim2 (ref)
	local host = p1.host
	local var1 = useTokens()
	local var2 = useDeviceInsets()
	local var3 = useDeviceOrientation() ~= deviceOrientationMode.Landscape
	local var4, var5 = reactModule.useState(p1.initialPresentation or frozen.Compact)
	local var6, var7 = reactModule.useState(nil)
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var7 (ref)
		var7(p2)
	end, {})
	local var9 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), frozen (copy)
		var5(frozen.Expanded)
	end, {})
	local var10 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), frozen (copy)
		var5(frozen.Compact)
	end, {})
	local var11 = var4 == frozen.Expanded
	local var12 = resolveGeometryModule({
		deviceInsets = var2,
		exposesTopSafeArea = host.exposesTopSafeArea,
		isPortrait = var3,
		margin = var1.Padding.Medium
	})
	
	return reactModule.createElement(floatingWindowModule.Window, {
		testId = "friends-calling-pip",
		behavior = floatingWindowModule.Behaviors.Contained,
		boundsInsets = if var11 then var12.expanded.boundsInsets else var12.collapsed.boundsInsets,
		children = if var11 then reactModule.createElement(placeholderExpandedModule, {
			hasRoundedCorners = var12.expanded.hasRoundedCorners,
			onCollapse = var10,
			onDragInputTarget = var8,
			topPadding = var12.expanded.topPadding
		}) else reactModule.createElement(placeholderCollapsedModule, { onDragInputTarget = var8 }),
		displayOrder = host.displayOrder,
		dragInputTarget = var6,
		draggable = not (var11 and var3),
		initialCenter = UDim2.fromScale(0.85, 0.2),
		onActivated = if var11 then nil else var9,
		screenInsets = host.screenInsets,
		size = if var11 then var12.expanded.size else uDim2
	})
end

return function(p1)
	-- upvalues: useSelectedTheme (ref), colorMode (ref), reactModule (ref), foundationProvider (ref), CallPipWindow (ref)
	return reactModule.createElement(foundationProvider, {
		colorMode = if p1.host.followsAppColorMode and useSelectedTheme() == "light" then colorMode.Light else colorMode.Dark
	}, { Window = reactModule.createElement(CallPipWindow, p1) })
end