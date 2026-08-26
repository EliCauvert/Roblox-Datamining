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
local var1 = signalsModule.createSignal("")
local var2 = signalsModule.createSignal(false)
local var3 = reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), useSignalState (ref), var1 (ref), var2 (ref), reactModule (ref), foundationModule (ref), iconSize (ref)
	local var4 = useSignalState(p1.animatedIcon or var1)
	
	return if var4 == "" then nil else reactModule.createElement(foundationModule.Icon, {
		name = var4,
		size = iconSize.Medium,
		style = {
			Transparency = if useSignalState(p1.isGrayedOut or var2) then useTokens().Color.Common.Shadow.Transparency else nil
		}
	})
end)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), controlState (ref), useCursor (ref), peopleServiceModule (ref), ENTRY_POINT (ref), view (ref), stateLayerAffordance (ref), var3 (ref), foundationModule (ref), iconName (ref), iconSize (ref), voiceVolumePopoverModule (ref)
	local var4 = useTokens()
	local XXSmall = var4.Gap.XXSmall
	local config = p1.config
	local var5, var6 = reactModule.useState(false)
	local var7 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useRef(false) else nil
	local var8, var9 = reactModule.useState(controlState.Initialize)
	local var10, var11 = reactModule.useState(controlState.Initialize)
	local var12 = useCursor({
		radius = UDim.new(0, var4.Radius.Medium),
		offset = var4.Size.Size_150,
		borderWidth = var4.Stroke.Thicker
	})
	local var13 = reactModule.useCallback(function()
		-- upvalues: config (ref), p1 (ref)
		config.onActivated(p1.entryPoint)
	end, { config.onActivated, p1.entryPoint })
	local var14 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useCallback(function()
		-- upvalues: p1 (ref), var7 (write), peopleServiceModule (copy), ENTRY_POINT (copy), var6 (ref)
		if p1.userId == nil or not var7 then return end
		local var15 = not var7.current
		var7.current = var15
		
		if var15 then
			peopleServiceModule.getService("PeopleAnalyticsManager"):recordPerUserVoiceVolumeUiOpened(p1.entryPoint or ENTRY_POINT.PEOPLE_LIST)
		end
		var6(var15)
	end, { p1.entryPoint, p1.userId }) else reactModule.useCallback(function()
		-- upvalues: var6 (ref)
		var6(function(p2)
			return not p2
		end)
	end, {})
	local var15 = reactModule.useCallback(function()
		-- upvalues: fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var7 (write), var6 (ref)
		if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var7 then
			var7.current = false
		end
		var6(false)
	end, {})
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		if p1.onButtonMount then
			p1.onButtonMount(p2, p1.muteButtonName)
		end
	end, { p1.onButtonMount, p1.muteButtonName })
	local var17 = reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref)
		if p1.onButtonMount then
			p1.onButtonMount(p2, p1.volumeButtonName)
		end
	end, { p1.onButtonMount, p1.volumeButtonName })
	local var18 = reactModule.useCallback(function(p2)
		-- upvalues: var9 (ref)
		var9(p2)
	end, {})
	local var19 = reactModule.useCallback(function(p2)
		-- upvalues: var11 (ref)
		var11(p2)
	end, {})
	local var20 = var5 and p1.userId ~= nil
	local size1000 = var4.Size.Size_1000
	local size1000_1 = var4.Size.Size_1000
	local layoutOrder = p1.LayoutOrder or config.layoutOrder
	
	local function _(p2)
		-- upvalues: controlState (copy), var4 (ref)
		return if p2 == controlState.Pressed then var4.Color.State.Press elseif p2 == controlState.Hover then var4.Color.State.Hover else nil
	end
	
	local var21 = if var8 == controlState.Pressed then var4.Color.State.Press elseif var8 == controlState.Hover then var4.Color.State.Hover else nil
	local var22 = if var10 == controlState.Pressed then var4.Color.State.Press elseif var10 == controlState.Hover then var4.Color.State.Hover else nil
	
	return reactModule.createElement(voiceVolumePopoverModule, {
		userId = p1.userId,
		isOpen = var20,
		onClose = var15,
		layoutOrder = layoutOrder,
		muteHalf = reactModule.createElement(view, {
			tag = "size-1000-1000",
			onActivated = var13,
			onStateChanged = var18,
			selection = { SelectionImageObject = var12 },
			LayoutOrder = layoutOrder,
			ref = var16,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Background = reactModule.createElement(view, {
				tag = "radius-left-medium size-1000-1000 bg-action-standard"
			}, {
				StateOverlay = if var21 then reactModule.createElement(view, {
					tag = "radius-left-medium size-full",
					backgroundStyle = var21
				}) else nil
			}),
			IconOverlay = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center size-full",
				ZIndex = 2,
				Active = false
			}, {
				Icon = reactModule.createElement(var3, {
					animatedIcon = config.animatedIcon,
					isGrayedOut = config.isGrayedOut
				})
			})
		}),
		chevronHalf = reactModule.createElement(view, {
			tag = "size-1000-1000",
			onActivated = var14,
			onStateChanged = var19,
			selection = { SelectionImageObject = var12 },
			LayoutOrder = layoutOrder + 1,
			ref = var17,
			stateLayer = { affordance = stateLayerAffordance.None }
		}, {
			Background = reactModule.createElement(view, {
				tag = "radius-right-medium size-1000-1000 bg-action-standard"
			}, {
				StateOverlay = if var22 then reactModule.createElement(view, {
					tag = "radius-right-medium size-full",
					backgroundStyle = var22
				}) else nil
			}),
			IconOverlay = reactModule.createElement(view, {
				tag = "row align-x-center align-y-center size-full padding-right-xxsmall",
				ZIndex = 2,
				Active = false
			}, {
				ChevronIcon = reactModule.createElement(foundationModule.Icon, {
					name = if var20 then iconName.ChevronSmallUp else iconName.ChevronSmallDown,
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