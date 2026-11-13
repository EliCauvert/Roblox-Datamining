local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local CallingService = game:GetService("CallingService")
local FriendsCallingService = game:GetService("FriendsCallingService")
local FloatingWindowModule = require(Parent.FloatingWindow)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local RoactUtilsModule = require(Parent.RoactUtils)
local ResponsiveModule = require(Parent.Responsive)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local FFlagFriendsCallingServiceLuaMigrationModule = require(Parent.SharedFlags.FFlagFriendsCallingServiceLuaMigration)
local _ = require(FriendsCalling.Components.CallParticipant.CallParticipantCard)
local CollapsedCallOverlayModule = require(script.Parent.CollapsedCallOverlay)
local ExpandedCallOverlayModule = require(script.Parent.ExpandedCallOverlay)
local ResolveGeometryModule = require(script.Parent.resolveGeometry)
local UseCallPipViewModelModule = require(script.Parent.useCallPipViewModel)
local ColorMode = FoundationModule.Enums.ColorMode
local DeviceOrientationMode = RobloxAppEnumsModule.DeviceOrientationMode
local FoundationProvider = FoundationModule.FoundationProvider
local UseSelectedThemeFunction = RoactUtilsModule.Hooks.useSelectedTheme
local UseDeviceInsetsFunction = ResponsiveModule.useDeviceInsets
local UseDeviceOrientationFunction = RobloxAppHooksModule.useDeviceOrientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.fromOffset(120, 160)

local function noop() end

local Frozen = table.freeze({ Compact = "Compact", Expanded = "Expanded" })

local function CallPipSession(p1)
	-- upvalues: UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseDeviceOrientationFunction (copy), DeviceOrientationMode (copy), ReactModule (copy), Frozen (copy), FFlagFriendsCallingServiceLuaMigrationModule (copy), FriendsCallingService (copy), CallingService (copy), ResolveGeometryModule (copy), ExpandedCallOverlayModule (copy), noop (copy), CollapsedCallOverlayModule (copy), FloatingWindowModule (copy), _UDim2 (copy)
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
	local UseRefResult = ReactModule.useRef(p1.expandCount)
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult (copy), UseResult1 (copy)
		if UseRefResult.current < p1.expandCount then
			UseRefResult.current = p1.expandCount
			UseResult1()
		end
	end, { p1.expandCount, UseResult1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), Frozen (upval)
		UseStateResult2(Frozen.Compact)
	end, {})
	local UseResult3 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), FFlagFriendsCallingServiceLuaMigrationModule (upval), FriendsCallingService (upval), CallingService (upval)
		local CallId = p1.callId or ""
		
		if FFlagFriendsCallingServiceLuaMigrationModule then
			FriendsCallingService:EndCall(CallId, "LuaEndAction")
			
			return
		else
			CallingService:EndCall(CallId, "LuaEndAction")
		end
	end, { p1.callId })
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
		children = if IsUseStateResultMatch then ReactModule.createElement(ExpandedCallOverlayModule, {
			connectedAt = p1.connectedAt,
			participant = p1.participant,
			hasRoundedCorners = ResolveGeometryModuleResult.expanded.hasRoundedCorners,
			isMicrophoneMuted = p1.isMicrophoneMuted,
			onCollapse = UseResult2,
			onDragInputTarget = UseResult,
			onEndCall = UseResult3,
			onOpenChat = noop,
			onToggleConversationAudio = noop,
			onToggleMicrophone = noop,
			topPadding = ResolveGeometryModuleResult.expanded.topPadding
		}) else ReactModule.createElement(CollapsedCallOverlayModule, {
			participant = p1.participant,
			isMicrophoneMuted = p1.isMicrophoneMuted,
			onDragInputTarget = UseResult,
			onToggleConversationAudio = noop,
			onToggleMicrophone = noop
		}),
		displayOrder = Host.displayOrder,
		dragInputTarget = UseStateResult1,
		enabled = p1.enabled,
		draggable = not (IsUseStateResultMatch and IsNotUseDeviceOrientationResultMatch),
		initialCenter = UDim2.fromScale(0.85, 0.2),
		onActivated = if IsUseStateResultMatch then nil else UseResult1,
		screenInsets = Host.screenInsets,
		size = if IsUseStateResultMatch then ResolveGeometryModuleResult.expanded.size else _UDim2
	})
end

local function CallPipWindow(p1)
	-- upvalues: UseCallPipViewModelModule (copy), ReactModule (copy), CallPipSession (copy)
	local UseCallPipViewModelModuleResult = UseCallPipViewModelModule()
	
	return ReactModule.createElement(CallPipSession, {
		key = tostring(UseCallPipViewModelModuleResult.session),
		callId = UseCallPipViewModelModuleResult.callId,
		connectedAt = UseCallPipViewModelModuleResult.connectedAt,
		enabled = UseCallPipViewModelModuleResult.enabled,
		expandCount = UseCallPipViewModelModuleResult.expandCount,
		host = p1.host,
		participant = UseCallPipViewModelModuleResult.participant,
		isMicrophoneMuted = p1.isMicrophoneMuted,
		initialPresentation = p1.initialPresentation
	})
end

return function(p1)
	-- upvalues: UseSelectedThemeFunction (copy), ColorMode (copy), ReactModule (copy), FoundationProvider (copy), CallPipWindow (copy)
	local UseSelectedThemeResult = UseSelectedThemeFunction()
	
	return ReactModule.createElement(FoundationProvider, {
		colorMode = if p1.host.followsAppColorMode and UseSelectedThemeResult == "light" then ColorMode.Light else ColorMode.Dark
	}, { Window = ReactModule.createElement(CallPipWindow, p1) })
end