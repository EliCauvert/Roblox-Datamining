local PeopleReactView = script:FindFirstAncestor("PeopleReactView")
local Parent = PeopleReactView.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local PeopleServiceModule = require(Parent.PeopleService)
local InputSize = FoundationModule.Enums.InputSize
local Popover = FoundationModule.Popover
local Radius = FoundationModule.Enums.Radius
local Text = FoundationModule.Text
local View = FoundationModule.View
local BaseMenu = FoundationModule.UNSTABLE.BaseMenu
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FFlagVoiceChatVolumePerUserMuteVolumeSyncModule = require(PeopleReactView.Flags.FFlagVoiceChatVolumePerUserMuteVolumeSync)
local FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule = require(PeopleReactView.Flags.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted)
local FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = PeopleServiceModule.getService("Flags").FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local ENTRYPOINT = PeopleServiceModule.getService("Constants").ANALYTICS.ENTRY_POINT
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")

local function VoiceVolumeSlider(p1) --[[ Line: 74 ]]
	-- upvalues: UseLocalizationFunction (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), ReactModule (copy), PeopleServiceModule (copy), FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (copy), ENTRYPOINT (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), RbxAnalyticsService (copy), FFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), View (copy), Text (copy), FoundationModule (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		volumeLabel = "CoreScripts.InGameMenu.GameSettings.Volume"
	})
	local UseMemoResult = nil
	local UseRefResult = nil
	
	if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		UseMemoResult = ReactModule.useMemo(function() --[[ Line: 82 ]]
			-- upvalues: PeopleServiceModule (upval)
			return PeopleServiceModule.getService("PeopleAnalyticsManager")
		end, {})
		UseRefResult = ReactModule.useRef(nil)
	end
	local IsIsMutedByLocalUser: boolean = FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule and p1.isMutedByLocalUser == true
	local UseRefResult1 = ReactModule.useRef(false)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(p1.getPlayerVoiceVolume(p1.userId))
	ReactModule.useEffect(function() --[[ Line: 94 ]]
		-- upvalues: p1 (copy), UseRefResult1 (copy), UseBindingResult2 (copy)
		return p1.subscribePlayerVoiceVolume(p1.userId, function(p2) --[[ Line: 95 ]]
			-- upvalues: UseRefResult1 (upval), UseBindingResult2 (upval)
			if not UseRefResult1.current then
				UseBindingResult2(p2)
			end
		end)
	end, { p1.userId, p1.subscribePlayerVoiceVolume })
	
	return ReactModule.createElement(View, {
		tag = "col gap-small size-full-0 auto-y padding-x-medium padding-y-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = ReactModule.createElement(Text, {
			Text = UseLocalizationResult.volumeLabel,
			tag = {
				["auto-xy text-body-medium content-muted"] = IsIsMutedByLocalUser,
				["auto-xy text-body-medium content-emphasis"] = not IsIsMutedByLocalUser
			}
		}),
		VolumeSlider = ReactModule.createElement(FoundationModule.Slider, {
			isContained = true,
			step = 0.1,
			key = if FFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then if IsIsMutedByLocalUser then "disabled" else "enabled" else nil,
			value = UseBindingResult,
			range = NumberRange.new(p1.voiceVolumeMin, p1.voiceVolumeMax),
			knobVisibility = FoundationModule.Enums.Visibility.Always,
			width = UDim.new(1, 0),
			isDisabled = IsIsMutedByLocalUser,
			onValueChanged = ReactModule.useCallback(function(p2) --[[ Line: 102 ]]
				-- upvalues: UseBindingResult2 (copy), p1 (copy)
				UseBindingResult2(p2)
				p1.setPlayerVoiceVolume(p1.userId, p2)
			end, { p1.userId, p1.setPlayerVoiceVolume }),
			onDragStarted = ReactModule.useCallback(function() --[[ Line: 108 ]]
				-- upvalues: UseRefResult1 (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (upval), UseMemoResult (ref), UseRefResult (ref), p1 (copy), ENTRYPOINT (upval)
				UseRefResult1.current = true
				
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and UseMemoResult and UseRefResult then
					UseRefResult.current = {
						oldVolume = p1.getPlayerVoiceVolume(p1.userId),
						wasMutedAtStart = if p1.getPlayerIsLocalMuted then p1.getPlayerIsLocalMuted(p1.userId) else p1.isMutedByLocalUser == true,
						startTimestampMs = DateTime.now().UnixTimestampMillis
					}
					UseMemoResult:trackPerUserVoiceVolumeSliderTouch(ENTRYPOINT.PEOPLE_CARD)
				end
			end, {
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.userId else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.getPlayerVoiceVolume else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.getPlayerIsLocalMuted else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.isMutedByLocalUser else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then UseMemoResult else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then UseRefResult else nil
			}),
			onDragEnded = ReactModule.useCallback(function() --[[ Line: 139 ]]
				-- upvalues: UseRefResult1 (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (upval), UseMemoResult (ref), UseRefResult (ref), p1 (copy), RbxAnalyticsServiceExposePlaySessionIdEngineFeature (upval), RbxAnalyticsService (upval), ENTRYPOINT (upval), FFlagVoiceChatVolumePerUserMuteVolumeSyncModule (upval), UseBindingResult2 (copy)
				UseRefResult1.current = false
				
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and UseMemoResult and UseRefResult then
					local Current = UseRefResult.current
					UseRefResult.current = nil
					
					if Current then
						UseMemoResult:trackPerUserVoiceVolumeChanged({
							entryPoint = ENTRYPOINT.PEOPLE_CARD,
							targetUserId = p1.userId,
							oldVolume = Current.oldVolume,
							newVolume = p1.getPlayerVoiceVolume(p1.userId),
							wasMutedAtStart = Current.wasMutedAtStart,
							playSessionId = if RbxAnalyticsServiceExposePlaySessionIdEngineFeature then RbxAnalyticsService:GetPlaySessionId() else nil,
							voiceSessionId = if p1.getVoiceSessionId then p1.getVoiceSessionId() else nil,
							dragDurationMs = math.max(0, DateTime.now().UnixTimestampMillis - Current.startTimestampMs)
						})
					end
				end
				if not FFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
					UseBindingResult2(p1.getPlayerVoiceVolume(p1.userId))
					
					return
				end
			end, {
				p1.userId,
				p1.getPlayerVoiceVolume,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.getVoiceSessionId else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then UseMemoResult else nil,
				if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then UseRefResult else nil
			})
		})
	})
end

return ReactModule.memo(function(p2) --[[ Line: 210 | Named "CardMenuWithVoiceVolume" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), BaseMenu (copy), View (copy), Text (copy), VoiceVolumeSlider (copy), FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), Popover (copy), FoundationModule (copy), Radius (copy), InputSize (copy)
	local UseTokensResult = UseTokensFunction()
	local Standard = UseTokensResult.Stroke.Standard
	local Padding = {
		left = UDim.new(0, UseTokensResult.Size.Size_250),
		right = UDim.new(0, UseTokensResult.Size.Size_250),
		top = UDim.new(0, UseTokensResult.Padding.XSmall),
		bottom = UDim.new(0, UseTokensResult.Padding.XSmall)
	}
	local Elements = {}
	
	for LayoutOrder, menuGroup in p2.menuGroups do
		local Elements1 = {}
		
		for LayoutOrder1, item in menuGroup.items do
			Elements1[tostring(item.id)] = ReactModule.createElement(BaseMenu.Item, {
				LayoutOrder = LayoutOrder1,
				id = item.id,
				text = item.text,
				icon = item.icon,
				onActivated = item.onActivated
			})
		end
		if menuGroup.title ~= nil then
			Elements1.SectionTitle = ReactModule.createElement(View, {
				LayoutOrder = 0,
				tag = "row align-y-center size-full-0 auto-y",
				padding = Padding
			}, {
				Label = ReactModule.createElement(Text, {
					tag = "fill auto-xy text-align-x-left text-truncate-end text-caption-small content-muted",
					Text = menuGroup.title
				})
			})
		end
		if menuGroup.showVolumeSlider then
			Elements1.VoiceVolumeSlider = ReactModule.createElement(VoiceVolumeSlider, {
				userId = p2.userId,
				voiceVolumeMin = p2.voiceVolumeMin,
				voiceVolumeMax = p2.voiceVolumeMax,
				getPlayerVoiceVolume = p2.getPlayerVoiceVolume,
				subscribePlayerVoiceVolume = p2.subscribePlayerVoiceVolume,
				setPlayerVoiceVolume = p2.setPlayerVoiceVolume,
				isMutedByLocalUser = p2.isMutedByLocalUser,
				getPlayerIsLocalMuted = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p2.getPlayerIsLocalMuted else nil,
				getVoiceSessionId = if FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p2.getVoiceSessionId else nil,
				layoutOrder = #menuGroup.items + 1
			})
		end
		Elements[`Group_{LayoutOrder}`] = ReactModule.createElement(BaseMenu.Group, { LayoutOrder = LayoutOrder }, Elements1)
	end
	return ReactModule.createElement(Popover.Root, { testId = "--foundation-menu", isOpen = p2.isOpen }, {
		Anchor = ReactModule.createElement(Popover.Anchor, nil, p2.children),
		Content = ReactModule.createElement(Popover.Content, {
			hasArrow = false,
			side = {
				position = FoundationModule.Enums.PopoverSide.Bottom,
				offset = Standard + UseTokensResult.Padding.Small
			},
			align = FoundationModule.Enums.PopoverAlign.Start,
			onPressedOutside = p2.onPressedOutside,
			backgroundStyle = UseTokensResult.Color.Surface.Surface_200,
			radius = Radius.Medium
		}, {
			Menu = ReactModule.createElement(BaseMenu.Root, {
				size = InputSize.Medium,
				onNestedLeafActivated = p2.onPressedOutside,
				radius = Radius.Medium
			}, Elements)
		})
	})
end)