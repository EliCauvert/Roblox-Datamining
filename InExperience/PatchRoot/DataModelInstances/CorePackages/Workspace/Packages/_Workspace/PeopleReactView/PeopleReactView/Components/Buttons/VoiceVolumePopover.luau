local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local PeopleServiceModule = require(Parent.PeopleService)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local View = FoundationModule.View
local Text = FoundationModule.Text
local Popover = FoundationModule.Popover
local PopoverSide = FoundationModule.Enums.PopoverSide
local PopoverAlign = FoundationModule.Enums.PopoverAlign
local Radius = FoundationModule.Enums.Radius
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule = require(PeopleReactView.Flags.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted)
local FFlagVoiceChatVolumePerUserMuteVolumeSyncModule = require(PeopleReactView.Flags.FFlagVoiceChatVolumePerUserMuteVolumeSync)
local FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView = PeopleServiceModule.getService("Flags").FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView
local UseDismissWhenOutOfViewModule = require(PeopleReactView.Hooks.useDismissWhenOutOfView)
local FFlagPeoplePageFlipVolumePopoverToFitViewport = PeopleServiceModule.getService("Flags").FFlagPeoplePageFlipVolumePopoverToFitViewport
local UsePopoverSideToFitScrollingViewportModule = require(PeopleReactView.Hooks.usePopoverSideToFitScrollingViewport)
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = PeopleServiceModule.getService("Flags").FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")
local VOICEVOLUME = PeopleServiceModule.getService("Constants").VOICE_CHAT.VOICE_VOLUME
local ENTRYPOINT = PeopleServiceModule.getService("Constants").ANALYTICS.ENTRY_POINT
local Signal = require(Parent.Signals).createSignal(false)

return function(p1)
	-- upvalues: UseTokensFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), PeopleServiceModule (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), ENTRYPOINT (copy), FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (copy), UseSignalStateFunction (copy), Signal (copy), UseScaledValueFunction (copy), FFlagPeoplePageFlipVolumePopoverToFitViewport (copy), VOICEVOLUME (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), FFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView (copy), UseDismissWhenOutOfViewModule (copy), UsePopoverSideToFitScrollingViewportModule (copy), PopoverSide (copy), Popover (copy), View (copy), PopoverAlign (copy), Radius (copy), Text (copy), FoundationModule (copy)
	local UseTokensResult = UseTokensFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		voiceChatVolume = "CoreScripts.InGameMenu.VoiceChatVolumeLower"
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PeopleServiceModule (upval)
		return PeopleServiceModule.getService("PeopleVoiceChatStore")
	end, {})
	local UseMemoResult1 = nil
	local EntryPoint = nil
	local Callback = nil
	local UseRefResult = nil
	
	if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		UseMemoResult1 = ReactModule.useMemo(function()
			-- upvalues: PeopleServiceModule (upval)
			return PeopleServiceModule.getService("PeopleAnalyticsManager")
		end, {})
		EntryPoint = p1.entryPoint or ENTRYPOINT.PEOPLE_LIST
		local GetPlayerIsLocalMutedFunction = UseMemoResult.getPlayerIsLocalMuted
		Callback = ReactModule.useCallback(function()
			-- upvalues: p1 (copy), GetPlayerIsLocalMutedFunction (copy)
			return if p1.userId and GetPlayerIsLocalMutedFunction then GetPlayerIsLocalMutedFunction(p1.userId)(false) else false
		end, { p1.userId, GetPlayerIsLocalMutedFunction })
		UseRefResult = ReactModule.useRef(nil)
	end
	local UseSignalStateResult = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then UseSignalStateFunction(p1.isMutedByLocalUser or Signal) else false
	local UseSignalStateResult1 = FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule and UseSignalStateResult
	local UseScaledValueResult = UseScaledValueFunction(260)
	local Size2800 = if FFlagPeoplePageFlipVolumePopoverToFitViewport then UseTokensResult.Size.Size_2800 else nil
	local UseRefResult1 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy), UseMemoResult (copy), VOICEVOLUME (upval)
		return if p1.userId and UseMemoResult.getPlayerVoiceVolume then UseMemoResult.getPlayerVoiceVolume(p1.userId) else VOICEVOLUME.DEFAULT
	end, { p1.userId, UseMemoResult })
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(UseResult())
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseRefResult1 (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (upval), UseRefResult (ref), UseBindingResult2 (copy), UseResult (copy), UseMemoResult (copy)
		if p1.isOpen and p1.userId then
			UseBindingResult2(UseResult())
			
			if not UseMemoResult.subscribePlayerVoiceVolume then return end
			return UseMemoResult.subscribePlayerVoiceVolume(p1.userId, function(p2)
				-- upvalues: UseRefResult1 (upval), UseBindingResult2 (upval)
				if not UseRefResult1.current then
					UseBindingResult2(p2)
				end
			end)
		else
			UseRefResult1.current = false
			
			if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and UseRefResult then
				UseRefResult.current = nil
			end
		end
	end, { p1.isOpen, p1.userId, UseResult, UseMemoResult })
	local UseResult1 = ReactModule.useCallback(function(p2)
		-- upvalues: UseBindingResult2 (copy), p1 (copy), UseMemoResult (copy)
		UseBindingResult2(p2)
		
		if p1.userId and UseMemoResult.setPlayerVoiceVolume then
			UseMemoResult.setPlayerVoiceVolume(p1.userId, p2)
		end
	end, { p1.userId, UseMemoResult })
	local UseResult2 = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseMemoResult1 (ref), UseRefResult (ref), Callback (ref), EntryPoint (ref), UseResult (copy)
		UseRefResult1.current = true
		
		if UseMemoResult1 and UseRefResult and Callback and EntryPoint then
			UseRefResult.current = {
				oldVolume = UseResult(),
				wasMutedAtStart = Callback(),
				startTimestampMs = DateTime.now().UnixTimestampMillis
			}
			UseMemoResult1:trackPerUserVoiceVolumeSliderTouch(EntryPoint)
		end
	end, {
		UseResult,
		Callback,
		UseMemoResult1,
		EntryPoint,
		UseRefResult
	}) else ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy)
		UseRefResult1.current = true
	end, {})
	local UseResult3 = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), UseMemoResult1 (ref), p1 (copy), UseRefResult (ref), EntryPoint (ref), UseResult (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval), UseMemoResult (copy), FFlagVoiceChatVolumePerUserMuteVolumeSyncModule (upval), UseBindingResult2 (copy)
		UseRefResult1.current = false
		
		if UseMemoResult1 and p1.userId and UseRefResult and EntryPoint then
			local Current = UseRefResult.current
			UseRefResult.current = nil
			
			if Current then
				UseMemoResult1:trackPerUserVoiceVolumeChanged({
					entryPoint = EntryPoint,
					targetUserId = p1.userId,
					oldVolume = Current.oldVolume,
					newVolume = UseResult(),
					wasMutedAtStart = Current.wasMutedAtStart,
					playSessionId = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil,
					voiceSessionId = if UseMemoResult.getVoiceSessionId then UseMemoResult.getVoiceSessionId() else nil,
					dragDurationMs = math.max(0, DateTime.now().UnixTimestampMillis - Current.startTimestampMs)
				})
			end
		end
		if not FFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
			UseBindingResult2(UseResult())
			
			return
		end
	end, {
		UseResult, UseMemoResult1, p1.userId, EntryPoint, UseRefResult, UseMemoResult
	}) else ReactModule.useCallback(function()
		-- upvalues: UseRefResult1 (copy), FFlagVoiceChatVolumePerUserMuteVolumeSyncModule (upval), UseBindingResult2 (copy), UseResult (copy)
		UseRefResult1.current = false
		
		if not FFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
			UseBindingResult2(UseResult())
			
			return
		end
	end, { UseResult })
	local UseResult4 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		if p1.onClose then
			p1.onClose()
		end
	end, { p1.onClose })
	local UseRefResult2 = if FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or FFlagPeoplePageFlipVolumePopoverToFitViewport then ReactModule.useRef(nil) else nil
	
	if FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView then
		UseDismissWhenOutOfViewModule(p1.isOpen, UseResult4, UseRefResult2)
	end
	local UseRefResult3 = nil
	local UseStateResult2 = nil
	local UseResult5 = nil
	local v1 = nil
	
	if FFlagPeoplePageFlipVolumePopoverToFitViewport then
		UseRefResult3 = ReactModule.useRef(nil)
		local UseStateResult
		UseStateResult, UseStateResult2 = ReactModule.useState(0)
		UseResult5 = ReactModule.useCallback(function(Frame: Frame)
			-- upvalues: UseRefResult3 (ref), UseStateResult2 (ref)
			local UseRefResult = UseRefResult3
			
			if UseRefResult.current then
				UseRefResult.current:Disconnect()
				UseRefResult.current = nil
			end
			local Callback: (any) -> () = UseStateResult2
			
			if Frame == nil then
				Callback(0)
				
				return
			else
				Callback(Frame.AbsoluteSize.Y)
				UseRefResult.current = Frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
					-- upvalues: Callback (copy), Frame (copy)
					Callback(Frame.AbsoluteSize.Y)
				end)
			end
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult3 (ref)
			return function()
				-- upvalues: UseRefResult3 (upval)
				local UseRefResult = UseRefResult3
				
				if UseRefResult.current then
					UseRefResult.current:Disconnect()
					UseRefResult.current = nil
				end
			end
		end, {})
		v1 = UsePopoverSideToFitScrollingViewportModule(p1.isOpen, PopoverSide.Top, UseRefResult2, math.max(Size2800, UseStateResult), UseTokensResult.Stroke.Standard + UseTokensResult.Padding.Small)
	end
	return ReactModule.createElement(Popover.Root, { isOpen = p1.isOpen }, {
		Anchor = ReactModule.createElement(Popover.Anchor, nil, {
			Pill = ReactModule.createElement(View, {
				tag = "row gap-xxsmall",
				Size = UDim2.fromOffset(p1.pillWidth, p1.pillHeight),
				LayoutOrder = p1.layoutOrder,
				ref = if FFlagPeoplePageDismissVolumePopoverOnScrollOutOfView or FFlagPeoplePageFlipVolumePopoverToFitViewport then UseRefResult2 else nil
			}, { MuteHalf = p1.muteHalf, ChevronHalf = p1.chevronHalf })
		}),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = false,
			side = {
				position = if FFlagPeoplePageFlipVolumePopoverToFitViewport then v1 else PopoverSide.Top,
				offset = UseTokensResult.Stroke.Standard + UseTokensResult.Padding.Small
			},
			align = {
				position = PopoverAlign.Start,
				offset = p1.alignOffset or 0
			},
			onPressedOutside = UseResult4,
			backgroundStyle = {
				Transparency = 1,
				Color3 = UseTokensResult.Color.Surface.Surface_100.Color3
			},
			radius = Radius.Medium
		}, {
			Container = ReactModule.createElement(View, {
				tag = "col gap-medium auto-y padding-large stroke-standard stroke-default radius-medium bg-surface-100",
				Size = UDim2.new(0, UseScaledValueResult, 0, 0),
				ref = if FFlagPeoplePageFlipVolumePopoverToFitViewport then UseResult5 else nil
			}, {
				Content = ReactModule.createElement(View, {
					tag = "col gap-medium size-full-0 auto-y padding-x-medium padding-y-small"
				}, {
					Title = ReactModule.createElement(Text, {
						Text = UseLocalizationResult.voiceChatVolume,
						tag = {
							["auto-xy text-body-medium content-muted"] = UseSignalStateResult1,
							["auto-xy text-body-medium content-emphasis"] = not UseSignalStateResult1
						}
					}),
					VolumeSlider = ReactModule.createElement(FoundationModule.Slider, {
						isContained = true,
						step = 0.1,
						key = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then if UseSignalStateResult1 then "disabled" else "enabled" else nil,
						value = UseBindingResult,
						range = NumberRange.new(VOICEVOLUME.MIN, VOICEVOLUME.MAX),
						knobVisibility = FoundationModule.Enums.Visibility.Always,
						isDisabled = UseSignalStateResult1,
						onValueChanged = UseResult1,
						onDragStarted = UseResult2,
						onDragEnded = UseResult3
					})
				})
			})
		})
	})
end