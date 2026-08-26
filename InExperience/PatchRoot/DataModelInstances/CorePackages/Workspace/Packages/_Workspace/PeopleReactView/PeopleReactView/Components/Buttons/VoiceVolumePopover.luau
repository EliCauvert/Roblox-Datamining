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
local var1 = signalsModule.createSignal(false)

return function(p1)
	-- upvalues: useTokens (ref), useLocalization (ref), reactModule (ref), peopleServiceModule (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), ENTRY_POINT (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (ref), useSignalState (ref), var1 (ref), useScaledValue (ref), fFlagPeoplePageFlipVolumePopoverToFitViewport (ref), VOICE_VOLUME (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (ref), fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (ref), useDismissWhenOutOfViewModule (ref), usePopoverSideToFitScrollingViewportModule (ref), popoverSide (ref), popover (ref), view (ref), popoverAlign (ref), radius (ref), text (ref), foundationModule (ref)
	local var2 = useTokens()
	local var3 = useLocalization({
		voiceChatVolume = "CoreScripts.InGameMenu.VoiceChatVolumeLower"
	})
	local var4 = reactModule.useMemo(function()
		-- upvalues: peopleServiceModule (copy)
		return peopleServiceModule.getService("PeopleVoiceChatStore")
	end, {})
	local var5 = nil
	local entryPoint = nil
	local var6 = nil
	local var7 = nil
	
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		var5 = reactModule.useMemo(function()
			-- upvalues: peopleServiceModule (copy)
			return peopleServiceModule.getService("PeopleAnalyticsManager")
		end, {})
		entryPoint = p1.entryPoint or ENTRY_POINT.PEOPLE_LIST
		local getPlayerIsLocalMuted = var4.getPlayerIsLocalMuted
		var6 = reactModule.useCallback(function()
			-- upvalues: p1 (ref), getPlayerIsLocalMuted (ref)
			return if p1.userId and getPlayerIsLocalMuted then getPlayerIsLocalMuted(p1.userId)(false) else false
		end, { p1.userId, getPlayerIsLocalMuted })
		var7 = reactModule.useRef(nil)
	end
	local var8 = false
	
	if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then
		var8 = useSignalState(p1.isMutedByLocalUser or var1)
	end
	local var9 = fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule and var8
	local var10 = useScaledValue(260)
	local var11 = if fFlagPeoplePageFlipVolumePopoverToFitViewport then var2.Size.Size_2800 else nil
	local var12 = reactModule.useRef(false)
	local var13 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref), VOICE_VOLUME (copy)
		return if p1.userId and var4.getPlayerVoiceVolume then var4.getPlayerVoiceVolume(p1.userId) else VOICE_VOLUME.DEFAULT
	end, { p1.userId, var4 })
	local var14, var15 = reactModule.useBinding(var13())
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var12 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var7 (write), var15 (ref), var13 (ref), var4 (ref)
		if p1.isOpen and p1.userId then
			var15(var13())
			
			if var4.subscribePlayerVoiceVolume then
				return var4.subscribePlayerVoiceVolume(p1.userId, function(p2)
					-- upvalues: var12 (copy), var15 (copy)
					if not var12.current then
						var15(p2)
					end
				end)
			end
			return
		else
			var12.current = false
			
			if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var7 then
				var7.current = nil
			end
		end
	end, { p1.isOpen, p1.userId, var13, var4 })
	local var16 = reactModule.useCallback(function(p2)
		-- upvalues: var15 (ref), p1 (ref), var4 (ref)
		var15(p2)
		
		if p1.userId and var4.setPlayerVoiceVolume then
			var4.setPlayerVoiceVolume(p1.userId, p2)
		end
	end, { p1.userId, var4 })
	local var17 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useCallback(function()
		-- upvalues: var12 (ref), var5 (write), var7 (write), var6 (write), entryPoint (write), var13 (ref)
		var12.current = true
		
		if var5 and var7 and (var6 and entryPoint) then
			var7.current = {
				oldVolume = var13(),
				wasMutedAtStart = var6(),
				startTimestampMs = DateTime.now().UnixTimestampMillis
			}
			var5:trackPerUserVoiceVolumeSliderTouch(entryPoint)
		end
	end, {
		var13,
		var6,
		var5,
		entryPoint,
		var7
	}) else reactModule.useCallback(function()
		-- upvalues: var12 (ref)
		var12.current = true
	end, {})
	local var18 = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then reactModule.useCallback(function()
		-- upvalues: var12 (ref), var5 (write), p1 (ref), var7 (write), entryPoint (write), var13 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), var4 (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), var15 (ref)
		var12.current = false
		
		if var5 and p1.userId and (var7 and entryPoint) then
			local current = var7.current
			var7.current = nil
			
			if current then
				var5:trackPerUserVoiceVolumeChanged({
					entryPoint = entryPoint,
					targetUserId = p1.userId,
					oldVolume = current.oldVolume,
					newVolume = var13(),
					wasMutedAtStart = current.wasMutedAtStart,
					playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil,
					voiceSessionId = if var4.getVoiceSessionId then var4.getVoiceSessionId() else nil,
					dragDurationMs = math.max(0, DateTime.now().UnixTimestampMillis - current.startTimestampMs)
				})
			end
		end
		if fFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
			return
		end
		var15(var13())
	end, {
		var13, var5, p1.userId, entryPoint, var7, var4
	}) else reactModule.useCallback(function()
		-- upvalues: var12 (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), var15 (ref), var13 (ref)
		var12.current = false
		
		if fFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
			return
		end
		var15(var13())
	end, { var13 })
	local var19 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	local var20 = if fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or fFlagPeoplePageFlipVolumePopoverToFitViewport then reactModule.useRef(nil) else nil
	
	if fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView then
		useDismissWhenOutOfViewModule(p1.isOpen, var19, var20)
	end
	local _ = nil
	local _ = nil
	local _ = nil
	local var21 = nil
	local var22 = nil
	
	if fFlagPeoplePageFlipVolumePopoverToFitViewport then
		local var23 = reactModule.useRef(nil)
		local var24, var25 = reactModule.useState(0)
		local var26 = var24
		local var27 = var25
		var21 = reactModule.useCallback(function(p2)
			-- upvalues: var23 (write), var27 (write)
			if var23.current then
				var23.current:Disconnect()
				var23.current = nil
			end
			if p2 == nil then
				var27(0)
				
				return
			end
			var27(p2.AbsoluteSize.Y)
			var23.current = p2:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
				-- upvalues: var27 (ref), p2 (ref)
				var27(p2.AbsoluteSize.Y)
			end)
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var23 (write)
			return function()
				-- upvalues: var23 (copy)
				if var23.current then
					var23.current:Disconnect()
					var23.current = nil
				end
			end
		end, {})
		var22 = usePopoverSideToFitScrollingViewportModule(p1.isOpen, popoverSide.Top, var20, math.max(var11, var26), var2.Stroke.Standard + var2.Padding.Small)
	end
	return reactModule.createElement(popover.Root, { isOpen = p1.isOpen }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, {
			Pill = reactModule.createElement(view, {
				tag = "row gap-xxsmall",
				Size = UDim2.fromOffset(p1.pillWidth, p1.pillHeight),
				LayoutOrder = p1.layoutOrder,
				ref = if fFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or fFlagPeoplePageFlipVolumePopoverToFitViewport then var20 else nil
			}, { MuteHalf = p1.muteHalf, ChevronHalf = p1.chevronHalf })
		}),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = false,
			side = {
				position = if fFlagPeoplePageFlipVolumePopoverToFitViewport then var22 else popoverSide.Top,
				offset = var2.Stroke.Standard + var2.Padding.Small
			},
			align = {
				position = popoverAlign.Start,
				offset = p1.alignOffset or 0
			},
			onPressedOutside = var19,
			backgroundStyle = {
				Transparency = 1,
				Color3 = var2.Color.Surface.Surface_100.Color3
			},
			radius = radius.Medium
		}, {
			Container = reactModule.createElement(view, {
				tag = "col gap-medium auto-y padding-large stroke-standard stroke-default radius-medium bg-surface-100",
				Size = UDim2.new(0, var10, 0, 0),
				ref = if fFlagPeoplePageFlipVolumePopoverToFitViewport then var21 else nil
			}, {
				Content = reactModule.createElement(view, {
					tag = "col gap-medium size-full-0 auto-y padding-x-medium padding-y-small"
				}, {
					Title = reactModule.createElement(text, {
						Text = var3.voiceChatVolume,
						tag = {
							["auto-xy text-body-medium content-muted"] = var9,
							["auto-xy text-body-medium content-emphasis"] = not var9
						}
					}),
					VolumeSlider = reactModule.createElement(foundationModule.Slider, {
						isContained = true,
						step = 0.1,
						key = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then if var9 then "disabled" else "enabled" else nil,
						value = var14,
						range = NumberRange.new(VOICE_VOLUME.MIN, VOICE_VOLUME.MAX),
						knobVisibility = foundationModule.Enums.Visibility.Always,
						isDisabled = var9,
						onValueChanged = var16,
						onDragStarted = var17,
						onDragEnded = var18
					})
				})
			})
		})
	})
end