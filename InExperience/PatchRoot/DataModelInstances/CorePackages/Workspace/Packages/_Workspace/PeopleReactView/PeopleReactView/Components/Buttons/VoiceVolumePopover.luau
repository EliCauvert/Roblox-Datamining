local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local peopleServiceModule = require(parent.PeopleService)
local signalsModule = require(parent.Signals)
local signalsReactModule = require(parent.SignalsReact)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local view = foundationModule.View
local text = foundationModule.Text
local popover = foundationModule.Popover
local popoverSide = foundationModule.Enums.PopoverSide
local popoverAlign = foundationModule.Enums.PopoverAlign
local radius = foundationModule.Enums.Radius
local useScaledValue = foundationModule.Hooks.useScaledValue
local useTokens = foundationModule.Hooks.useTokens
local useSignalState = signalsReactModule.useSignalState
local fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule = require(peopleReactView.Flags.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted)
local fFlagVoiceChatVolumePerUserMuteVolumeSyncModule = require(peopleReactView.Flags.FFlagVoiceChatVolumePerUserMuteVolumeSync)
local fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = peopleServiceModule.getService("Flags").FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local useDismissWhenOutOfViewModule = require(peopleReactView.Hooks.useDismissWhenOutOfView)
local fFlagPeoplePageFlipVolumePopoverToFitViewport = peopleServiceModule.getService("Flags").FFlagPeoplePageFlipVolumePopoverToFitViewport
local usePopoverSideToFitScrollingViewportModule = require(peopleReactView.Hooks.usePopoverSideToFitScrollingViewport)
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = peopleServiceModule.getService("Flags").FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local VOICE_VOLUME = peopleServiceModule.getService("Constants").VOICE_CHAT.VOICE_VOLUME
local ENTRY_POINT = peopleServiceModule.getService("Constants").ANALYTICS.ENTRY_POINT
local var12 = signalsModule.createSignal(false)

return function(p0)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), peopleServiceModule (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), ENTRY_POINT (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (ref), useSignalState (ref), var12 (ref), useScaledValue (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), VOICE_VOLUME (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), useDismissWhenOutOfViewModule (ref), usePopoverSideToFitScrollingViewportModule (ref), popoverSide (ref), popover (ref), view (ref), popoverAlign (ref), radius (ref), text (ref), foundationModule (ref)
	local var13 = useTokens()
	local var14 = useLocalization({
		voiceChatVolume = "CoreScripts.InGameMenu.VoiceChatVolumeLower"
	})
	local var15 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleVoiceChatStore")
	end, {})
	local var16 = nil
	local entryPoint = nil
	local var18 = nil
	local var19 = nil
	
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		var16 = reactModule.useMemo(function()
			-- upvalues: peopleServiceModule (copy)
			return peopleServiceModule.getService("PeopleAnalyticsManager")
		end, {})
		entryPoint = p0.entryPoint or ENTRY_POINT.PEOPLE_LIST
		local getPlayerIsLocalMuted = var15.getPlayerIsLocalMuted
		var18 = reactModule.useCallback(function()
			-- upvalues: p0 (ref), getPlayerIsLocalMuted (ref)
			return if p0.userId and getPlayerIsLocalMuted then getPlayerIsLocalMuted(p0.userId)(false) else false
		end, { p0.userId, getPlayerIsLocalMuted })
		var19 = reactModule.useRef(nil)
	end
	local var20 = false
	
	if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then
		var20 = useSignalState(p0.isMutedByLocalUser or var12)
	end
	local var20_1 = fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule and var20
	local var22 = useScaledValue(260)
	local var23 = if fFlagPeoplePageFlipVolumePopoverToFitViewport then var13.Size.Size_2800 else nil
	local var24 = reactModule.useRef(false)
	local var25 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var15 (ref), VOICE_VOLUME (copy)
		return if p0.userId and var15.getPlayerVoiceVolume then var15.getPlayerVoiceVolume(p0.userId) else VOICE_VOLUME.DEFAULT
	end, { p0.userId, var15 })
	local var26, var27 = reactModule.useBinding(var25())
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var24 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var19 (write), var27 (ref), var25 (ref), var15 (ref)
		if p0.isOpen and p0.userId then
			var27(var25())
			
			if var15.subscribePlayerVoiceVolume then
				return var15.subscribePlayerVoiceVolume(p0.userId, function(p1)
					-- upvalues: var24 (copy), var27 (copy)
					if not var24.current then
						var27(p1)
					end
				end)
			end
			return
		else
			var24.current = false
			
			if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var19 then
				var19.current = nil
			end
		end
	end, { p0.isOpen, p0.userId, var25, var15 })
	local var28 = reactModule.useCallback(function(p2)
		-- upvalues: var27 (ref), p0 (ref), var15 (ref)
		var27(p2)
		
		if p0.userId and var15.setPlayerVoiceVolume then
			var15.setPlayerVoiceVolume(p0.userId, p2)
		end
	end, { p0.userId, var15 })
	local var29 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useCallback(function()
		-- upvalues: var24 (ref), var16 (write), var19 (write), var18 (write), entryPoint (write), var25 (ref)
		var24.current = true
		
		if var16 and var19 and (var18 and entryPoint) then
			var19.current = {
				oldVolume = var25(),
				wasMutedAtStart = var18(),
				startTimestampMs = DateTime.now().UnixTimestampMillis
			}
			var16:trackPerUserVoiceVolumeSliderTouch(entryPoint)
		end
	end, {
		var25,
		var18,
		var16,
		entryPoint,
		var19
	}) else reactModule.useCallback(function()
		-- upvalues: var24 (ref)
		var24.current = true
	end, {})
	local var30 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useCallback(function()
		-- upvalues: var24 (ref), var16 (write), p0 (ref), var19 (write), entryPoint (write), var25 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var15 (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), var27 (ref)
		var24.current = false
		
		if var16 and p0.userId and (var19 and entryPoint) then
			local current = var19.current
			var19.current = nil
			
			if current then
				var16:trackPerUserVoiceVolumeChanged({
					entryPoint = entryPoint,
					targetUserId = p0.userId,
					oldVolume = current.oldVolume,
					newVolume = var25(),
					wasMutedAtStart = current.wasMutedAtStart,
					playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil,
					voiceSessionId = if var15.getVoiceSessionId then var15.getVoiceSessionId() else nil,
					dragDurationMs = math.max(0, DateTime.now().UnixTimestampMillis - current.startTimestampMs)
				})
			end
		end
		if fFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
			return
		end
		var27(var25())
	end, {
		var25, var16, p0.userId, entryPoint, var19, var15
	}) else reactModule.useCallback(function()
		-- upvalues: var24 (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), var27 (ref), var25 (ref)
		var24.current = false
		
		if fFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
			return
		end
		var27(var25())
	end, { var25 })
	local var31 = reactModule.useCallback(function()
		-- upvalues: p0 (ref)
		if p0.onClose then
			p0.onClose()
		end
	end, { p0.onClose })
	local var32 = if fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or fFlagPeoplePageFlipVolumePopoverToFitViewport then reactModule.useRef(nil) else nil
	
	if fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView then
		useDismissWhenOutOfViewModule(p0.isOpen, var31, var32)
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local var33 = nil
	local var34 = nil
	
	if fFlagPeoplePageFlipVolumePopoverToFitViewport then
		local var35 = reactModule.useRef(nil)
		local var36, var37 = reactModule.useState(0)
		local var38 = var36
		local var39 = var37
		var33 = reactModule.useCallback(function(p3)
			-- upvalues: var35 (write), var39 (write)
			if var35.current then
				var35.current:Disconnect()
				var35.current = nil
			end
			if p3 == nil then
				var39(0)
				
				return
			end
			var39(p3.AbsoluteSize.Y)
			var35.current = p3:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var39 (ref), p3 (ref)
				var39(p3.AbsoluteSize.Y)
			end)
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var35 (write)
			return function()
				-- upvalues: var35 (copy)
				if var35.current then
					var35.current:Disconnect()
					var35.current = nil
				end
			end
		end, {})
		var34 = usePopoverSideToFitScrollingViewportModule(p0.isOpen, popoverSide.Top, var32, math.max(var23, var38), var13.Stroke.Standard + var13.Padding.Small)
	end
	return reactModule.createElement(popover.Root, { isOpen = p0.isOpen }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, {
			Pill = reactModule.createElement(view, {
				tag = "row gap-xxsmall",
				Size = UDim2.fromOffset(p0.pillWidth, p0.pillHeight),
				LayoutOrder = p0.layoutOrder,
				ref = if fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or fFlagPeoplePageFlipVolumePopoverToFitViewport then var32 else nil
			}, { MuteHalf = p0.muteHalf, ChevronHalf = p0.chevronHalf })
		}),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = false,
			side = {
				position = if fFlagPeoplePageFlipVolumePopoverToFitViewport then var34 else popoverSide.Top,
				offset = var13.Stroke.Standard + var13.Padding.Small
			},
			align = {
				position = popoverAlign.Start,
				offset = p0.alignOffset or 0
			},
			onPressedOutside = var31,
			backgroundStyle = {
				Transparency = 1,
				Color3 = var13.Color.Surface.Surface_100.Color3
			},
			radius = radius.Medium
		}, {
			Container = reactModule.createElement(view, {
				tag = "col gap-medium auto-y padding-large stroke-standard stroke-default radius-medium bg-surface-100",
				Size = UDim2.new(0, var22, 0, 0),
				ref = if fFlagPeoplePageFlipVolumePopoverToFitViewport then var33 else nil
			}, {
				Content = reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y padding-x-medium padding-y-small"
				}, {
					Title = reactModule.createElement(text, {
						Text = var14.voiceChatVolume,
						tag = {
							["auto-xy text-body-medium content-muted"] = var20_1,
							["auto-xy text-body-medium content-emphasis"] = not var20_1
						}
					}),
					VolumeSlider = reactModule.createElement(foundationModule.Slider, {
						isContained = true,
						step = 0.1,
						key = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then if var20_1 then "disabled" else "enabled" else nil,
						value = var26,
						range = NumberRange.new(VOICE_VOLUME.MIN, VOICE_VOLUME.MAX),
						knobVisibility = foundationModule.Enums.Visibility.Always,
						isDisabled = var20_1,
						onValueChanged = var28,
						onDragStarted = var29,
						onDragEnded = var30
					})
				})
			})
		})
	})
end