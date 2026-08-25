local peopleReactView = script:FindFirstAncestor("PeopleReactView")
local parent = peopleReactView.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local peopleServiceModule = require(parent.PeopleService)
local inputSize = foundationModule.Enums.InputSize
local popover = foundationModule.Popover
local radius = foundationModule.Enums.Radius
local text = foundationModule.Text
local view = foundationModule.View
local baseMenu = foundationModule.UNSTABLE.BaseMenu
local useTokens = foundationModule.Hooks.useTokens
local fFlagVoiceChatVolumePerUserMuteVolumeSyncModule = require(peopleReactView.Flags.FFlagVoiceChatVolumePerUserMuteVolumeSync)
local fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule = require(peopleReactView.Flags.FFlagVoiceChatVolumePerUserDisableInteractionWhenMuted)
local fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry = peopleServiceModule.getService("Flags").FFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry
local ENTRY_POINT = peopleServiceModule.getService("Constants").ANALYTICS.ENTRY_POINT
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local rbxAnalyticsServiceExposePlaySessionIdEngineFeature = game:GetEngineFeature("RbxAnalyticsServiceExposePlaySessionId")

local function VoiceVolumeSlider(p0)
	-- upvalues: useLocalization (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), reactModule (ref), peopleServiceModule (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (ref), ENTRY_POINT (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (ref), view (ref), text (ref), foundationModule (ref)
	local var9 = useLocalization({
		volumeLabel = "CoreScripts.InGameMenu.GameSettings.Volume"
	})
	local var10 = nil
	local var11 = nil
	
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		var10 = reactModule.useMemo(function()
			-- upvalues: peopleServiceModule (copy)
			return peopleServiceModule.getService("PeopleAnalyticsManager")
		end, {})
		var11 = reactModule.useRef(nil)
	end
	local var12 = fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule and p0.isMutedByLocalUser == true
	local var13 = reactModule.useRef(false)
	local var14, var15 = reactModule.useBinding(p0.getPlayerVoiceVolume(p0.userId))
	reactModule.useEffect(function()
		-- upvalues: p0 (ref), var13 (ref), var15 (ref)
		return p0.subscribePlayerVoiceVolume(p0.userId, function(p1)
			-- upvalues: var13 (copy), var15 (copy)
			if not var13.current then
				var15(p1)
			end
		end)
	end, { p0.userId, p0.subscribePlayerVoiceVolume })
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-x-medium padding-y-small",
		LayoutOrder = p0.layoutOrder
	}, {
		Title = reactModule.createElement(text, {
			Text = var9.volumeLabel,
			tag = {
				["auto-xy text-body-medium content-muted"] = var12,
				["auto-xy text-body-medium content-emphasis"] = not var12
			}
		}),
		VolumeSlider = reactModule.createElement(foundationModule.Slider, {
			isContained = true,
			step = 0.1,
			key = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then if var12 then "disabled" else "enabled" else nil,
			value = var14,
			range = NumberRange.new(p0.voiceVolumeMin, p0.voiceVolumeMax),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			width = UDim.new(1, 0),
			isDisabled = var12,
			onValueChanged = reactModule.useCallback(function(p2)
				-- upvalues: var15 (ref), p0 (ref)
				var15(p2)
				p0.setPlayerVoiceVolume(p0.userId, p2)
			end, { p0.userId, p0.setPlayerVoiceVolume }),
			onDragStarted = reactModule.useCallback(function()
				-- upvalues: var13 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var10 (write), var11 (write), p0 (ref), ENTRY_POINT (copy)
				var13.current = true
				
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var10 and var11 then
					var11.current = {
						oldVolume = p0.getPlayerVoiceVolume(p0.userId),
						wasMutedAtStart = if p0.getPlayerIsLocalMuted then p0.getPlayerIsLocalMuted(p0.userId) else p0.isMutedByLocalUser == true,
						startTimestampMs = DateTime.now().UnixTimestampMillis
					}
					var10:trackPerUserVoiceVolumeSliderTouch(ENTRY_POINT.PEOPLE_CARD)
				end
			end, {
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p0.userId else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p0.getPlayerVoiceVolume else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p0.getPlayerIsLocalMuted else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p0.isMutedByLocalUser else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var10 else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var11 else nil
			}),
			onDragEnded = reactModule.useCallback(function()
				-- upvalues: var13 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var10 (write), var11 (write), p0 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), ENTRY_POINT (copy), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), var15 (ref)
				var13.current = false
				
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var10 and var11 then
					local current = var11.current
					var11.current = nil
					
					if current then
						var10:trackPerUserVoiceVolumeChanged({
							entryPoint = ENTRY_POINT.PEOPLE_CARD,
							targetUserId = p0.userId,
							oldVolume = current.oldVolume,
							newVolume = p0.getPlayerVoiceVolume(p0.userId),
							wasMutedAtStart = current.wasMutedAtStart,
							playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil,
							voiceSessionId = if p0.getVoiceSessionId then p0.getVoiceSessionId() else nil,
							dragDurationMs = math.max(0, DateTime.now().UnixTimestampMillis - current.startTimestampMs)
						})
					end
				end
				if fFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
					return
				end
				var15(p0.getPlayerVoiceVolume(p0.userId))
			end, {
				p0.userId,
				p0.getPlayerVoiceVolume,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p0.getVoiceSessionId else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var10 else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var11 else nil
			})
		})
	})
end

return reactModule.memo(function(p3)
	-- upvalues: useTokens (ref), reactModule (ref), baseMenu (ref), view (ref), text (ref), VoiceVolumeSlider (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), popover (ref), foundationModule (ref), radius (ref), inputSize (ref)
	local var16 = useTokens()
	local standard = var16.Stroke.Standard
	local t = {
		left = UDim.new(0, var16.Size.Size_250),
		right = UDim.new(0, var16.Size.Size_250),
		top = UDim.new(0, var16.Padding.XSmall),
		bottom = UDim.new(0, var16.Padding.XSmall)
	}
	local t_1 = {}
	
	for i, v in p3.menuGroups do
		local t_2 = {}
		
		for i_1, v_1 in v.items do
			t_2[tostring(v_1.id)] = reactModule.createElement(baseMenu.Item, {
				LayoutOrder = i_1,
				id = v_1.id,
				text = v_1.text,
				icon = v_1.icon,
				onActivated = v_1.onActivated
			})
		end
		if v.title ~= nil then
			t_2.SectionTitle = reactModule.createElement(view, {
				LayoutOrder = 0,
				tag = "row align-y-center size-full-0 auto-y",
				padding = t
			}, {
				Label = reactModule.createElement(text, {
					tag = "fill auto-xy text-align-x-left text-truncate-end text-caption-small content-muted",
					Text = v.title
				})
			})
		end
		if v.showVolumeSlider then
			t_2.VoiceVolumeSlider = reactModule.createElement(VoiceVolumeSlider, {
				userId = p3.userId,
				voiceVolumeMin = p3.voiceVolumeMin,
				voiceVolumeMax = p3.voiceVolumeMax,
				getPlayerVoiceVolume = p3.getPlayerVoiceVolume,
				subscribePlayerVoiceVolume = p3.subscribePlayerVoiceVolume,
				setPlayerVoiceVolume = p3.setPlayerVoiceVolume,
				isMutedByLocalUser = p3.isMutedByLocalUser,
				getPlayerIsLocalMuted = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p3.getPlayerIsLocalMuted else nil,
				getVoiceSessionId = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p3.getVoiceSessionId else nil,
				layoutOrder = #v.items + 1
			})
		end
		t_1[`Group_{i}`] = reactModule.createElement(baseMenu.Group, { LayoutOrder = i }, t_2)
	end
	return reactModule.createElement(popover.Root, { testId = "--foundation-menu", isOpen = p3.isOpen }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, p3.children),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = false,
			side = {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = standard + var16.Padding.Small
			},
			align = foundationModule.Enums.PopoverAlign.Start,
			onPressedOutside = p3.onPressedOutside,
			backgroundStyle = var16.Color.Surface.Surface_200,
			radius = radius.Medium
		}, {
			Menu = reactModule.createElement(baseMenu.Root, {
				size = inputSize.Medium,
				onNestedLeafActivated = p3.onPressedOutside,
				radius = radius.Medium
			}, t_1)
		})
	})
end)