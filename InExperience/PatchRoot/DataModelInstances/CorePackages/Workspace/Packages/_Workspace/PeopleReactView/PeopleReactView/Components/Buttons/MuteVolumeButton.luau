local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local signalsModule = require(parent.Signals)
local peopleServiceModule = require(parent.PeopleService)
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = peopleServiceModule.getService("Flags").FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local ENTRY_POINT = peopleServiceModule.getService("Constants").ANALYTICS.ENTRY_POINT
local view = foundationModule.View
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local controlState = foundationModule.Enums.ControlState
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local useSignalState = signalsReactModule.useSignalState
local voiceVolumePopoverModule = require(peopleReactView.Components.Buttons.VoiceVolumePopover)
local var7 = signalsModule.createSignal("")
local var8 = signalsModule.createSignal(false)
local var9 = reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), useSignalState (ref), var7 (ref), var8 (ref), reactModule (ref), foundationModule (ref), iconSize (ref)
	local var10 = useSignalState(p0.animatedIcon or var7)
	
	return if var10 == "" then nil else reactModule.createElement(foundationModule.Icon, {
		name = var10,
		size = iconSize.Medium,
		style = {
			Transparency = if useSignalState(p0.isGrayedOut or var8) then useTokens().Color.Common.Shadow.Transparency else nil
		}
	})
end)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), controlState (ref), useCursor (ref), peopleServiceModule (ref), ENTRY_POINT (ref), view (ref), stateLayerAffordance (ref), var9 (ref), foundationModule (ref), iconName (ref), iconSize (ref), voiceVolumePopoverModule (ref)
	local var11 = useTokens()
	local XXSmall = var11.Gap.XXSmall
	local config = p1.config
	local var12, var13 = reactModule.useState(false)
	local var14 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useRef(false) else nil
	local var15, var16 = reactModule.useState(controlState.Initialize)
	local var17, var18 = reactModule.useState(controlState.Initialize)
	local var19 = useCursor({
		radius = UDim.new(0, var11.Radius.Medium),
		offset = var11.Size.Size_150,
		borderWidth = var11.Stroke.Thicker
	})
	local var20 = reactModule.useCallback(function()
		-- upvalues: config (ref), p1 (ref)
		config.onActivated(p1.entryPoint)
	end, { config.onActivated, p1.entryPoint })
	local var21 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useCallback(function()
		-- upvalues: p1 (ref), var14 (write), peopleServiceModule (copy), ENTRY_POINT (copy), var13 (ref)
		if p1.userId == nil or not var14 then return end
		local var31 = not var14.current
		var14.current = var31
		
		if var31 then
			peopleServiceModule.getService("PeopleAnalyticsManager"):recordPerUserVoiceVolumeUiOpened(p1.entryPoint or ENTRY_POINT.PEOPLE_LIST)
		end
		var13(var31)
	end, { p1.entryPoint, p1.userId }) else reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		var13(function(p2)
			return not p2
		end)
	end, {})
	local var22 = reactModule.useCallback(function()
		-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var14 (write), var13 (ref)
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var14 then
			var14.current = false
		end
		var13(false)
	end, {})
	local var23 = reactModule.useCallback(function(p3)
		-- upvalues: p1 (ref)
		if p1.onButtonMount then
			p1.onButtonMount(p3, p1.muteButtonName)
		end
	end, { p1.onButtonMount, p1.muteButtonName })
	local var24 = reactModule.useCallback(function(p4)
		-- upvalues: p1 (ref)
		if p1.onButtonMount then
			p1.onButtonMount(p4, p1.volumeButtonName)
		end
	end, { p1.onButtonMount, p1.volumeButtonName })
	local var25 = reactModule.useCallback(function(p5)
		-- upvalues: var16 (ref)
		var16(p5)
	end, {})
	local var26 = reactModule.useCallback(function(p6)
		-- upvalues: var18 (ref)
		var18(p6)
	end, {})
	local var27 = var12 and p1.userId ~= nil
	local size1000 = var11.Size.Size_1000
	local size1000_1 = var11.Size.Size_1000
	local layoutOrder = p1.LayoutOrder or config.layoutOrder
	
	local function _(p7)
		-- upvalues: controlState (copy), var11 (ref)
		return if p7 == controlState.Pressed then var11.Color.State.Press elseif p7 == controlState.Hover then var11.Color.State.Hover else nil
	end
	
	local var29 = if var15 == controlState.Pressed then var11.Color.State.Press elseif var15 == controlState.Hover then var11.Color.State.Hover else nil
	local var30 = if var17 == controlState.Pressed then var11.Color.State.Press elseif var17 == controlState.Hover then var11.Color.State.Hover else nil
	
	return reactModule.createElement(voiceVolumePopoverModule, {
		userId = p1.userId,
		isOpen = var27,
		onClose = var22,
		layoutOrder = layoutOrder,
		muteHalf = reactModule.createElement(view, {
			tag = "size-1000-1000",
			onActivated = var20,
			onStateChanged = var25,
			selection = { SelectionImageObject = var19 },
			LayoutOrder = layoutOrder,
			ref = var23,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Background = reactModule.createElement(view, {
				tag = "radius-left-medium size-1000-1000 bg-action-standard"
			}, {
				StateOverlay = if var29 then reactModule.createElement(view, {
					tag = "radius-left-medium size-full",
					backgroundStyle = var29
				}) else nil
			}),
			IconOverlay = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center size-full",
				ZIndex = 2,
				Active = false
			}, {
				Icon = reactModule.createElement(var9, {
					animatedIcon = config.animatedIcon,
					isGrayedOut = config.isGrayedOut
				})
			})
		}),
		chevronHalf = reactModule.createElement(view, {
			tag = "size-1000-1000",
			onActivated = var21,
			onStateChanged = var26,
			selection = { SelectionImageObject = var19 },
			LayoutOrder = layoutOrder + 1,
			ref = var24,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Background = reactModule.createElement(view, {
				tag = "radius-right-medium size-1000-1000 bg-action-standard"
			}, {
				StateOverlay = if var30 then reactModule.createElement(view, {
					tag = "radius-right-medium size-full",
					backgroundStyle = var30
				}) else nil
			}),
			IconOverlay = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center size-full padding-right-xxsmall",
				ZIndex = 2,
				Active = false
			}, {
				ChevronIcon = reactModule.createElement(foundationModule.Icon, {
					name = if var27 then iconName.ChevronSmallUp else iconName.ChevronSmallDown,
					size = iconSize.Large
				})
			})
		}),
		pillWidth = size1000 * 2 + XXSmall,
		pillHeight = size1000_1,
		alignOffset = size1000 + XXSmall,
		isMutedByLocalUser = config.isGrayedOut,
		entryPoint = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.entryPoint else nil
	})
end