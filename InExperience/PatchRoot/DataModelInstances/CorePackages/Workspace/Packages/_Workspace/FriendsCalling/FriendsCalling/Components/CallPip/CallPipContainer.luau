local FriendsCalling = script:FindFirstAncestor("FriendsCalling")
local Parent = FriendsCalling.Parent
local FriendsCallingService = game:GetService("FriendsCallingService")
local FloatingWindowModule = require(Parent.FloatingWindow)
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local ResponsiveModule = require(Parent.Responsive)
local RobloxAppEnumsModule = require(Parent.RobloxAppEnums)
local RobloxAppHooksModule = require(Parent.RobloxAppHooks)
local _ = require(FriendsCalling.Stores.GetFriendsCallingStore)
local CollapsedCallOverlayModule = require(script.Parent.CollapsedCallOverlay)
local ExpandedCallOverlayModule = require(script.Parent.ExpandedCallOverlay)
local ResolveCardLayoutModule = require(script.Parent.resolveCardLayout)
local UseCallPipViewModelModule = require(script.Parent.useCallPipViewModel)
local DeviceOrientationMode = RobloxAppEnumsModule.DeviceOrientationMode
local UseDeviceInsetsFunction = ResponsiveModule.useDeviceInsets
local UseDeviceOrientationFunction = RobloxAppHooksModule.useDeviceOrientation
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _UDim2 = UDim2.fromOffset(120, 160)

local function noop() end

local function toggleMicrophone(Muted)
	-- upvalues: FriendsCallingService (copy)
	FriendsCallingService:SetMuted(Muted)
end

local function toggleConversationAudio(p1)
	-- upvalues: FriendsCallingService (copy)
	FriendsCallingService:SetVolume(if p1 then 0 else 0.5)
end

return function(p1)
	-- upvalues: UseCallPipViewModelModule (copy), UseTokensFunction (copy), UseDeviceInsetsFunction (copy), UseDeviceOrientationFunction (copy), DeviceOrientationMode (copy), ReactModule (copy), FriendsCallingService (copy), ResolveCardLayoutModule (copy), ExpandedCallOverlayModule (copy), noop (copy), toggleConversationAudio (copy), toggleMicrophone (copy), CollapsedCallOverlayModule (copy), FloatingWindowModule (copy), _UDim2 (copy)
	local Host = p1.host
	local UseCallPipViewModelModuleResult = UseCallPipViewModelModule(p1.call)
	local IsExpanded = UseCallPipViewModelModuleResult.isExpanded
	local IsRinging = UseCallPipViewModelModuleResult.isRinging
	local Participants = UseCallPipViewModelModuleResult.participants
	local UseTokensResult = UseTokensFunction()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local IsNotUseDeviceOrientationResultMatch = UseDeviceOrientationFunction() ~= DeviceOrientationMode.Landscape
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local CallId = p1.call.callId
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: FriendsCallingService (upval), CallId (copy)
		FriendsCallingService:EndCall(CallId, "LuaEndAction")
	end, { CallId })
	local Volume = p1.call.volume
	local ResolveCardLayoutModuleResult = ResolveCardLayoutModule({
		deviceBounds = UseDeviceInsetsResult,
		topStaysOpen = Host.isInExperience,
		isPortrait = IsNotUseDeviceOrientationResultMatch,
		edgeMargin = UseTokensResult.Padding.Medium
	})
	
	return ReactModule.createElement(FloatingWindowModule.Window, {
		testId = "friends-calling-pip",
		behavior = FloatingWindowModule.Behaviors.Contained,
		boundsInsets = if IsExpanded then ResolveCardLayoutModuleResult.expanded.boundsInsets else ResolveCardLayoutModuleResult.collapsed.boundsInsets,
		children = if IsExpanded then ReactModule.createElement(ExpandedCallOverlayModule, {
			connectedAt = UseCallPipViewModelModuleResult.connectedAt,
			hasRoundedCorners = ResolveCardLayoutModuleResult.expanded.hasRoundedCorners,
			isRinging = IsRinging,
			onCollapse = UseCallPipViewModelModuleResult.onCollapse,
			onDragInputTarget = UseResult,
			onEndCall = UseResult1,
			onOpenChat = noop,
			onToggleConversationAudio = toggleConversationAudio,
			onToggleMicrophone = toggleMicrophone,
			participants = Participants,
			selfParticipant = UseCallPipViewModelModuleResult.selfParticipant,
			callVolume = Volume,
			topPadding = ResolveCardLayoutModuleResult.expanded.topPadding
		}) else ReactModule.createElement(CollapsedCallOverlayModule, {
			isRinging = IsRinging,
			onDragInputTarget = UseResult,
			onToggleConversationAudio = toggleConversationAudio,
			onToggleMicrophone = toggleMicrophone,
			participant = Participants[1],
			selfParticipant = UseCallPipViewModelModuleResult.selfParticipant,
			callVolume = Volume
		}),
		displayOrder = Host.displayOrder,
		dragInputTarget = UseStateResult,
		draggable = not (IsExpanded and IsNotUseDeviceOrientationResultMatch),
		initialCenter = UDim2.fromScale(0.85, 0.2),
		onActivated = if IsExpanded then nil else UseCallPipViewModelModuleResult.onExpand,
		screenInsets = Enum.ScreenInsets.None,
		size = if IsExpanded then ResolveCardLayoutModuleResult.expanded.size else _UDim2
	})
end