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

local function VoiceVolumeSlider(p1)
	-- upvalues: useLocalization (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), reactModule (ref), peopleServiceModule (ref), fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule (ref), ENTRY_POINT (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (ref), rbxAnalyticsService (ref), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (ref), view (ref), text (ref), foundationModule (ref)
	local var1 = useLocalization({
		volumeLabel = "CoreScripts.InGameMenu.GameSettings.Volume"
	})
	local var2 = nil
	local var3 = nil
	
	if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then
		var2 = reactModule.useMemo(function()
			-- upvalues: peopleServiceModule (copy)
			return peopleServiceModule.getService("PeopleAnalyticsManager")
		end, {})
		var3 = reactModule.useRef(nil)
	end
	local var4 = fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule and p1.isMutedByLocalUser == true
	local var5 = reactModule.useRef(false)
	local var6, var7 = reactModule.useBinding(p1.getPlayerVoiceVolume(p1.userId))
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var5 (ref), var7 (ref)
		return p1.subscribePlayerVoiceVolume(p1.userId, function(p2)
			-- upvalues: var5 (copy), var7 (copy)
			if not var5.current then
				var7(p2)
			end
		end)
	end, { p1.userId, p1.subscribePlayerVoiceVolume })
	
	return reactModule.createElement(view, {
		tag = "col gap-small size-full-0 auto-y padding-x-medium padding-y-small",
		LayoutOrder = p1.layoutOrder
	}, {
		Title = reactModule.createElement(text, {
			Text = var1.volumeLabel,
			tag = {
				["auto-xy text-body-medium content-muted"] = var4,
				["auto-xy text-body-medium content-emphasis"] = not var4
			}
		}),
		VolumeSlider = reactModule.createElement(foundationModule.Slider, {
			isContained = true,
			step = 0.1,
			key = if fFlagVoiceChatVolumePerUserDisableInteractionWhenMutedModule then if var4 then "disabled" else "enabled" else nil,
			value = var6,
			range = NumberRange.new(p1.voiceVolumeMin, p1.voiceVolumeMax),
			knobVisibility = foundationModule.Enums.Visibility.Always,
			width = UDim.new(1, 0),
			isDisabled = var4,
			onValueChanged = reactModule.useCallback(function(p2)
				-- upvalues: var7 (ref), p1 (ref)
				var7(p2)
				p1.setPlayerVoiceVolume(p1.userId, p2)
			end, { p1.userId, p1.setPlayerVoiceVolume }),
			onDragStarted = reactModule.useCallback(function()
				-- upvalues: var5 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var2 (write), var3 (write), p1 (ref), ENTRY_POINT (copy)
				var5.current = true
				
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var2 and var3 then
					var3.current = {
						oldVolume = p1.getPlayerVoiceVolume(p1.userId),
						wasMutedAtStart = if p1.getPlayerIsLocalMuted then p1.getPlayerIsLocalMuted(p1.userId) else p1.isMutedByLocalUser == true,
						startTimestampMs = DateTime.now().UnixTimestampMillis
					}
					var2:trackPerUserVoiceVolumeSliderTouch(ENTRY_POINT.PEOPLE_CARD)
				end
			end, {
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.userId else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.getPlayerVoiceVolume else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.getPlayerIsLocalMuted else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.isMutedByLocalUser else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var2 else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var3 else nil
			}),
			onDragEnded = reactModule.useCallback(function()
				-- upvalues: var5 (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (copy), var2 (write), var3 (write), p1 (ref), rbxAnalyticsServiceExposePlaySessionIdEngineFeature (copy), rbxAnalyticsService (copy), ENTRY_POINT (copy), fFlagVoiceChatVolumePerUserMuteVolumeSyncModule (copy), var7 (ref)
				var5.current = false
				
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry and var2 and var3 then
					local current = var3.current
					var3.current = nil
					
					if current then
						var2:trackPerUserVoiceVolumeChanged({
							entryPoint = ENTRY_POINT.PEOPLE_CARD,
							targetUserId = p1.userId,
							oldVolume = current.oldVolume,
							newVolume = p1.getPlayerVoiceVolume(p1.userId),
							wasMutedAtStart = current.wasMutedAtStart,
							playSessionId = if rbxAnalyticsServiceExposePlaySessionIdEngineFeature then rbxAnalyticsService:GetPlaySessionId() else nil,
							voiceSessionId = if p1.getVoiceSessionId then p1.getVoiceSessionId() else nil,
							dragDurationMs = math.max(0, DateTime.now().UnixTimestampMillis - current.startTimestampMs)
						})
					end
				end
				if fFlagVoiceChatVolumePerUserMuteVolumeSyncModule then
					return
				end
				var7(p1.getPlayerVoiceVolume(p1.userId))
			end, {
				p1.userId,
				p1.getPlayerVoiceVolume,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p1.getVoiceSessionId else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var2 else nil,
				if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then var3 else nil
			})
		})
	})
end

return reactModule.memo(function(p2)
	-- upvalues: useTokens (ref), reactModule (ref), baseMenu (ref), view (ref), text (ref), VoiceVolumeSlider (ref), fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry (ref), popover (ref), foundationModule (ref), radius (ref), inputSize (ref)
	local var8 = useTokens()
	local standard = var8.Stroke.Standard
	local t = {
		left = UDim.new(0, var8.Size.Size_250),
		right = UDim.new(0, var8.Size.Size_250),
		top = UDim.new(0, var8.Padding.XSmall),
		bottom = UDim.new(0, var8.Padding.XSmall)
	}
	local t_1 = {}
	
	for i, v in p2.menuGroups do
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
				userId = p2.userId,
				voiceVolumeMin = p2.voiceVolumeMin,
				voiceVolumeMax = p2.voiceVolumeMax,
				getPlayerVoiceVolume = p2.getPlayerVoiceVolume,
				subscribePlayerVoiceVolume = p2.subscribePlayerVoiceVolume,
				setPlayerVoiceVolume = p2.setPlayerVoiceVolume,
				isMutedByLocalUser = p2.isMutedByLocalUser,
				getPlayerIsLocalMuted = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p2.getPlayerIsLocalMuted else nil,
				getVoiceSessionId = if fFlagVoiceVolumeControlsEnablePerUserVolumeInteractionTelemetry then p2.getVoiceSessionId else nil,
				layoutOrder = #v.items + 1
			})
		end
		t_1[`Group_{i}`] = reactModule.createElement(baseMenu.Group, { LayoutOrder = i }, t_2)
	end
	return reactModule.createElement(popover.Root, { testId = "--foundation-menu", isOpen = p2.isOpen }, {
		Anchor = reactModule.createElement(popover.Anchor, nil, p2.children),
		Content = reactModule.createElement(popover.Content, {
			hasArrow = false,
			side = {
				position = foundationModule.Enums.PopoverSide.Bottom,
				offset = standard + var8.Padding.Small
			},
			align = foundationModule.Enums.PopoverAlign.Start,
			onPressedOutside = p2.onPressedOutside,
			backgroundStyle = var8.Color.Surface.Surface_200,
			radius = radius.Medium
		}, {
			Menu = reactModule.createElement(baseMenu.Root, {
				size = inputSize.Medium,
				onNestedLeafActivated = p2.onPressedOutside,
				radius = radius.Medium
			}, t_1)
		})
	})
end)