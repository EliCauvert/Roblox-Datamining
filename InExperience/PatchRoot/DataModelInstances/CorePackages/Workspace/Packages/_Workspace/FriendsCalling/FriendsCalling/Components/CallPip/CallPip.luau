local Parent = script:FindFirstAncestor("FriendsCalling").Parent
local FloatingWindowModule = require(Parent.FloatingWindow)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PlaceholderCollapsedModule = require(script.Parent.PlaceholderCollapsed)
local PlaceholderExpandedModule = require(script.Parent.PlaceholderExpanded)
local ResolveGeometryModule = require(script.Parent.resolveGeometry)
local ColorMode = FoundationModule.Enums.ColorMode
local DeviceOrientationMode = require(Parent.RobloxAppEnums).DeviceOrientationMode
local FoundationProvider = FoundationModule.FoundationProvider
local UseSelectedThemeFunction = require(Parent.RoactUtils).Hooks.useSelectedTheme
local UseDeviceInsetsFunction = require(Parent.Responsive).useDeviceInsets
local UseDeviceOrientationFunction = require(Parent.RobloxAppHooks).useDeviceOrientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.fromOffset(120, 160)
local Frozen = table.freeze({ Compact = "Compact", Expanded = "Expanded" })

local function CallPipWindow(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseDeviceOrientationFunction (copy), DeviceOrientationMode (copy), ReactModule (copy), Frozen (copy), ResolveGeometryModule (copy), PlaceholderExpandedModule (copy), PlaceholderCollapsedModule (copy), FloatingWindowModule (copy), _UDim2 (copy)
	local Host = p1.host
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local IsNotUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() ~= DeviceOrientationMode.Landscape
	local UseStateResult, UseStateResult2 = ReactModule.useState(p1.initialPresentation or Frozen.Compact)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), Frozen (upval)
		UseStateResult2(Frozen.Expanded)
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), Frozen (upval)
		UseStateResult2(Frozen.Compact)
	end, {})
	local IsUseStateResultMatch = UseStateResult == Frozen.Expanded
	local ResolveGeometryModuleResult = ResolveGeometryModule({
		deviceInsets = UseDeviceInsetsResult,
		exposesTopSafeArea = Host.exposesTopSafeArea,
		isPortrait = IsNotUseDeviceOrientationResultMatch,
		margin = UseTokensResult.Padding.Medium
	})
	
	return ReactModule.createElement(FloatingWindowModule.Window, {
		testId = "friends-calling-pip",
		behavior = FloatingWindowModule.Behaviors.Contained,
		boundsInsets = if IsUseStateResultMatch then ResolveGeometryModuleResult.expanded.boundsInsets else ResolveGeometryModuleResult.collapsed.boundsInsets,
		children = if IsUseStateResultMatch then ReactModule.createElement(PlaceholderExpandedModule, {
			hasRoundedCorners = ResolveGeometryModuleResult.expanded.hasRoundedCorners,
			onCollapse = UseResult2,
			onDragInputTarget = UseResult,
			topPadding = ResolveGeometryModuleResult.expanded.topPadding
		}) else ReactModule.createElement(PlaceholderCollapsedModule, { onDragInputTarget = UseResult }),
		displayOrder = Host.displayOrder,
		dragInputTarget = UseStateResult1,
		draggable = not (IsUseStateResultMatch and IsNotUseDeviceOrientationResultMatch),
		initialCenter = UDim2.fromScale(0.85, 0.2),
		onActivated = if IsUseStateResultMatch then nil else UseResult1,
		screenInsets = Host.screenInsets,
		size = if IsUseStateResultMatch then ResolveGeometryModuleResult.expanded.size else _UDim2
	})
end

return function(p1)
	-- upvalues: UseSelectedThemeFunction (copy), ColorMode (copy), ReactModule (copy), FoundationProvider (copy), CallPipWindow (copy)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	
	return ReactModule.createElement(FoundationProvider, {
		colorMode = if p1.host.followsAppColorMode and UseSelectedThemeResult == "light" then ColorMode.Light else ColorMode.Dark
	}, { Window = ReactModule.createElement(CallPipWindow, p1) })
end