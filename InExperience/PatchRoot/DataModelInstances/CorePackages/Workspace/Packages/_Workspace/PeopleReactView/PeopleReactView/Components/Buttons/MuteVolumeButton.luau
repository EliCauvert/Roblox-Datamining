local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local PeopleServiceModule = require(Parent.PeopleService)
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = PeopleServiceModule.getService("Flags").FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local ENTRYPOINT = PeopleServiceModule.getService("Constants").ANALYTICS.ENTRY_POINT
local View = FoundationModule.View
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local ControlState = FoundationModule.Enums.ControlState
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local VoiceVolumePopoverModule = require(PeopleReactView.Components.Buttons.VoiceVolumePopover)
local Signal = SignalsModule.createSignal("")
local Signal1 = SignalsModule.createSignal(false)
local MemoResult = ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), UseSignalStateFunction (copy), Signal (copy), Signal1 (copy), ReactModule (copy), FoundationModule (copy), IconSize (copy)
	local UseTokensResult = UseTokensFunction()
	local UseSignalStateResult = UseSignalStateFunction(p1.animatedIcon or Signal)
	local UseSignalStateResult1 = UseSignalStateFunction(p1.isGrayedOut or Signal1)
	
	return if UseSignalStateResult == "" then nil else ReactModule.createElement(FoundationModule.Icon, {
		name = UseSignalStateResult,
		size = IconSize.Medium,
		style = {
			Transparency = if UseSignalStateResult1 then UseTokensResult.Color.Common.Shadow.Transparency else nil
		}
	})
end)

return function(Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), ControlState (copy), UseCursorFunction (copy), PeopleServiceModule (copy), ENTRYPOINT (copy), View (copy), StateLayerAffordance (copy), MemoResult (copy), FoundationModule (copy), IconName (copy), IconSize (copy), VoiceVolumePopoverModule (copy)
	local UseTokensResult = UseTokensFunction()
	local XXSmall: number = UseTokensResult.Gap.XXSmall
	local Config = Frame.config
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseRefResult = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then ReactModule.useRef(false) else nil
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(ControlState.Initialize)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(ControlState.Initialize)
	local UseCursorResult = UseCursorFunction({
		radius = UDim.new(0, UseTokensResult.Radius.Medium),
		offset = UseTokensResult.Size.Size_150,
		borderWidth = UseTokensResult.Stroke.Thicker
	})
	local HasUserId: boolean = UseStateResult and Frame.userId ~= nil
	local Size1000: number = UseTokensResult.Size.Size_1000
	local LayoutOrder = Frame.LayoutOrder or Config.layoutOrder
	
	local function _(Hover)
		-- upvalues: ControlState (upval), UseTokensResult (copy)
		return if Hover == ControlState.Pressed then UseTokensResult.Color.State.Press elseif Hover == ControlState.Hover then UseTokensResult.Color.State.Hover else nil
	end
	
	local Press = if UseStateResult1 == ControlState.Pressed then UseTokensResult.Color.State.Press elseif UseStateResult1 == ControlState.Hover then UseTokensResult.Color.State.Hover else nil
	local Press1 = if UseStateResult3 == ControlState.Pressed then UseTokensResult.Color.State.Press elseif UseStateResult3 == ControlState.Hover then UseTokensResult.Color.State.Hover else nil
	
	return ReactModule.createElement(VoiceVolumePopoverModule, {
		userId = Frame.userId,
		isOpen = HasUserId,
		onClose = ReactModule.useCallback(function()
			-- upvalues: FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (upval), UseRefResult (ref), UseStateResult2 (copy)
			if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and UseRefResult then
				UseRefResult.current = false
			end
			UseStateResult2(false)
		end, {}),
		layoutOrder = LayoutOrder,
		muteHalf = ReactModule.createElement(View, {
			tag = "size-1000-1000",
			onActivated = ReactModule.useCallback(function()
				-- upvalues: Config (copy), Frame (copy)
				Config.onActivated(Frame.entryPoint)
			end, { Config.onActivated, Frame.entryPoint }),
			onStateChanged = ReactModule.useCallback(function(p1)
				-- upvalues: UseStateResult2_1 (copy)
				UseStateResult2_1(p1)
			end, {}),
			selection = { SelectionImageObject = UseCursorResult },
			LayoutOrder = LayoutOrder,
			ref = ReactModule.useCallback(function(p1)
				-- upvalues: Frame (copy)
				if Frame.onButtonMount then
					Frame.onButtonMount(p1, Frame.muteButtonName)
				end
			end, { Frame.onButtonMount, Frame.muteButtonName }),
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Background = ReactModule.createElement(View, {
				tag = "radius-left-medium size-1000-1000 bg-action-standard"
			}, {
				StateOverlay = if Press then ReactModule.createElement(View, {
					tag = "radius-left-medium size-full",
					backgroundStyle = Press
				}) else nil
			}),
			IconOverlay = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center size-full",
				ZIndex = 2,
				Active = false
			}, {
				Icon = ReactModule.createElement(MemoResult, {
					animatedIcon = Config.animatedIcon,
					isGrayedOut = Config.isGrayedOut
				})
			})
		}),
		chevronHalf = ReactModule.createElement(View, {
			tag = "size-1000-1000",
			onActivated = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then ReactModule.useCallback(function()
				-- upvalues: Frame (copy), UseRefResult (ref), PeopleServiceModule (upval), ENTRYPOINT (upval), UseStateResult2 (copy)
				if Frame.userId == nil or not UseRefResult then return end
				local NoCurrent = not UseRefResult.current
				UseRefResult.current = NoCurrent
				
				if NoCurrent then
					PeopleServiceModule.getService("PeopleAnalyticsManager"):recordPerUserVoiceVolumeUiOpened(Frame.entryPoint or ENTRYPOINT.PEOPLE_LIST)
				end
				UseStateResult2(NoCurrent)
			end, { Frame.entryPoint, Frame.userId }) else ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(function(p1): boolean
					return not p1
				end)
			end, {}),
			onStateChanged = ReactModule.useCallback(function(p1)
				-- upvalues: UseStateResult2_2 (copy)
				UseStateResult2_2(p1)
			end, {}),
			selection = { SelectionImageObject = UseCursorResult },
			LayoutOrder = LayoutOrder + 1,
			ref = ReactModule.useCallback(function(p1)
				-- upvalues: Frame (copy)
				if Frame.onButtonMount then
					Frame.onButtonMount(p1, Frame.volumeButtonName)
				end
			end, { Frame.onButtonMount, Frame.volumeButtonName }),
			stateLayer = { affordance = StateLayerAffordance.None }
		}, {
			Background = ReactModule.createElement(View, {
				tag = "radius-right-medium size-1000-1000 bg-action-standard"
			}, {
				StateOverlay = if Press1 then ReactModule.createElement(View, {
					tag = "radius-right-medium size-full",
					backgroundStyle = Press1
				}) else nil
			}),
			IconOverlay = ReactModule.createElement(View, {
				tag = "row align-x-center align-y-center size-full padding-right-xxsmall",
				ZIndex = 2,
				Active = false
			}, {
				ChevronIcon = ReactModule.createElement(FoundationModule.Icon, {
					name = if HasUserId then IconName.ChevronSmallUp else IconName.ChevronSmallDown,
					size = IconSize.Large
				})
			})
		}),
		pillWidth = Size1000 * 2 + XXSmall,
		pillHeight = UseTokensResult.Size.Size_1000,
		alignOffset = Size1000 + XXSmall,
		isMutedByLocalUser = Config.isGrayedOut,
		entryPoint = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then Frame.entryPoint else nil
	})
end