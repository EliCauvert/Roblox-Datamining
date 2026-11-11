local MomentsCreationFlow = script:FindFirstAncestor("MomentsCreationFlow")
local Parent = MomentsCreationFlow.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local Icon = FoundationModule.Icon
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local MagnifyingGlass = require(Parent.BuilderIcons).Icon.MagnifyingGlass
local MusicEditorModule = require(MomentsCreationFlow.Components.MusicEditor)
local MusicPreviewItemModule = require(MomentsCreationFlow.Components.MusicPreviewItem)
local SearchMusicModule = require(MomentsCreationFlow.Thunks.SearchMusic)
local UseAudioPlaybackFunction = MomentsCommonModule.Hooks.useAudioPlayback
local UseCallbackFunction = ReactModule.useCallback
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseDispatchFunction = MomentsCommonModule.Hooks.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseSelectorFunction = MomentsCommonModule.Hooks.useSelector
local UseTokensFunction = FoundationModule.Hooks.useTokens
local CreationFlowContextModule = require(MomentsCreationFlow.Context.CreationFlowContext)
local ConstantsModule = require(MomentsCreationFlow.Constants)
local CreationFlowLocalizationModule = require(MomentsCreationFlow.Enums.CreationFlowLocalization)
local EventNamesModule = require(MomentsCreationFlow.Analytics.EventNames)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseDispatchFunction (copy), UseTokensFunction (copy), ReactModule (copy), CreationFlowContextModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseMemoFunction (copy), UseAudioPlaybackFunction (copy), UseEffectFunction (copy), SearchMusicModule (copy), UseCallbackFunction (copy), EventNamesModule (copy), MusicEditorModule (copy), View (copy), FoundationModule (copy), Text (copy), CreationFlowLocalizationModule (copy), Icon (copy), TextInput (copy), MagnifyingGlass (copy), ScrollView (copy), ScrollBarVisibility (copy), DashModule (copy), MusicPreviewItemModule (copy)
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseContextResult = ReactModule.useContext(CreationFlowContextModule)
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CreationFlow.musicList
	end)
	local UseAudioPlaybackResult = UseAudioPlaybackFunction(UseStateResult3 ~= nil, UseMemoFunction(function()
		-- upvalues: UseStateResult3 (copy)
		return if UseStateResult3 then tostring(UseStateResult3) else nil
	end, { UseStateResult3 }), { autoplay = true, looping = false })
	UseEffectFunction(function()
		-- upvalues: p1 (copy), UseDispatchResult (copy), SearchMusicModule (upval)
		p1.playbackController.playback.pause()
		UseDispatchResult(SearchMusicModule("", p1.playbackController.timeline.timeLength))
	end, { p1.playbackController.timeline.timeLength })
	UseEffectFunction(function()
		-- upvalues: UseAudioPlaybackResult (copy), UseStateResult2_2 (copy)
		if not UseAudioPlaybackResult.playback.isPlaying then
			UseStateResult2_2(nil)
		end
	end, { UseAudioPlaybackResult.playback.isPlaying })
	local UseCallbackResult = UseCallbackFunction(function(AssetId)
		-- upvalues: p1 (copy), UseStateResult2_2 (copy), UseStateResult2_1 (copy), UseContextResult (copy), EventNamesModule (upval)
		p1.onMusicUpdate({ startTime = 0, assetId = AssetId })
		p1.playbackController.timeline.seek(0)
		UseStateResult2_2(nil)
		UseStateResult2_1(true)
		UseContextResult.fireEvent(EventNamesModule.EditingFlowMusicSelected, { musicAssetId = tostring(AssetId) })
	end, { p1.onMusicUpdate })
	local UseCallbackResult1 = UseCallbackFunction(function()
		-- upvalues: p1 (copy)
		p1.onMusicDiscard()
		p1.playbackController.playback.play()
		p1.playbackController.volume.unmute()
	end, { p1.onMusicDiscard })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy)
		p1.onMusicUpdate(nil)
		UseStateResult2_1(false)
		p1.playbackController.playback.pause()
	end, { p1.onMusicUpdate })
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: p1 (copy), UseStateResult2_1 (copy)
		p1.onMusicSave()
		UseStateResult2_1(false)
		p1.playbackController.playback.play()
		p1.playbackController.volume.unmute()
	end, { p1.onMusicSave })
	local UseCallbackResult4 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), UseAudioPlaybackResult (copy)
		if UseStateResult3 and UseStateResult3 == p2 then
			UseStateResult2_2(nil)
			
			return
		else
			UseStateResult2_2(p2)
			UseAudioPlaybackResult.playback.play()
		end
	end, { UseStateResult3 })
	local UseCallbackResult5 = UseCallbackFunction(function()
		-- upvalues: UseStateResult3 (copy), UseStateResult2_2 (copy), UseDispatchResult (copy), SearchMusicModule (upval), UseStateResult (copy), p1 (copy)
		if UseStateResult3 then
			UseStateResult2_2(nil)
		end
		UseDispatchResult(SearchMusicModule(UseStateResult, p1.playbackController.timeline.timeLength))
	end, {
		UseStateResult3,
		UseStateResult,
		p1.playbackController.timeline.timeLength
	})
	local UseCallbackResult6 = UseCallbackFunction(function(StartTime)
		-- upvalues: p1 (copy)
		if p1.musicEdit then
			p1.onMusicUpdate({ assetId = p1.musicEdit.assetId, startTime = StartTime })
			
			return
		end
	end, { p1.musicEdit, p1.onMusicUpdate })
	
	return if UseStateResult1 then ReactModule.createElement(MusicEditorModule, {
		playbackController = p1.playbackController,
		musicEdit = p1.musicEdit,
		onBack = UseCallbackResult2,
		onStartTimeChanged = UseCallbackResult6,
		onDone = UseCallbackResult3
	}) else ReactModule.createElement(View, {
		tag = "align-x-center align-y-top anchor-bottom-center bg-surface-100 col gap-small position-bottom-center radius-medium size-full-0",
		ZIndex = 5,
		onActivated = function() end,
		Size = UDim2.fromScale(1, 0.6666666666666666),
		stateLayer = {
			affordance = FoundationModule.Enums.StateLayerAffordance.None
		}
	}, {
		Padding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseTokensResult.Padding.Medium),
			PaddingLeft = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
			PaddingRight = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
		}),
		ModalHeaderBar = ReactModule.createElement(View, {
			LayoutOrder = 1,
			tag = "align-x-center align-y-center auto-y flex-between row size-full-0"
		}, {
			InspectTitle = ReactModule.createElement(Text, {
				LayoutOrder = 1,
				tag = "text-heading-small content-action-emphasis text-truncate-end text-align-x-left text-align-y-top auto-xy",
				Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.EditingCtaMusic)
			}),
			CloseButton = ReactModule.createElement(View, {
				tag = "auto-xy padding-medium radius-medium",
				LayoutOrder = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				onActivated = UseCallbackResult1,
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				CloseIcon = ReactModule.createElement(Icon, {
					name = "icons/navigation/close",
					ZIndex = 2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					style = UseTokensResult.Color.ActionEmphasis.Foreground
				})
			})
		}),
		SearchBar = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "align-x-center align-y-center col gap-small size-full-0 auto-y"
		}, {
			Input = ReactModule.createElement(TextInput, {
				label = "",
				LayoutOrder = 1,
				iconLeading = MagnifyingGlass,
				text = UseStateResult,
				placeholder = UseContextResult.getLocalization(CreationFlowLocalizationModule.GeneralSearchPlaceholder),
				onChanged = UseStateResult2,
				onReturnPressed = UseCallbackResult5,
				onFocusLost = UseCallbackResult5,
				width = UDim.new(1, 0)
			})
		}),
		ScrollView = ReactModule.createElement(ScrollView, {
			LayoutOrder = 3,
			tag = "align-x-left align-y-top col size-full",
			flexItem = { FlexMode = Enum.UIFlexMode.Shrink },
			layout = {
				FillDirection = Enum.FillDirection.Vertical,
				VerticalAlignment = Enum.VerticalAlignment.Top,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, UseTokensResult.Gap.Small)
			},
			scroll = {
				AutomaticCanvasSize = Enum.AutomaticSize.Y,
				scrollBarVisibility = ScrollBarVisibility.None,
				ScrollingDirection = Enum.ScrollingDirection.Y
			}
		}, if UseSelectorResult and #UseSelectorResult > 0 then DashModule.map(UseSelectorResult, function(Key, LayoutOrder)
			-- upvalues: ReactModule (upval), MusicPreviewItemModule (upval), UseCallbackResult (copy), UseCallbackResult4 (copy), UseStateResult3 (copy), UseAudioPlaybackResult (copy)
			return ReactModule.createElement(MusicPreviewItemModule, {
				key = Key,
				layoutOrder = LayoutOrder,
				musicAssetId = Key,
				onMusicSelected = UseCallbackResult,
				togglePreviewMusic = UseCallbackResult4,
				progress = if UseStateResult3 == Key then UseAudioPlaybackResult.timeline.elapsed / UseAudioPlaybackResult.timeline.duration else nil,
				isPreviewing = UseStateResult3 == Key
			})
		end) else {
			NoResults = ReactModule.createElement(Text, {
				tag = "text-body-medium content-action-emphasis text-align-x-center",
				Text = UseContextResult.getLocalization(CreationFlowLocalizationModule.MusicNoResults)
			})
		})
	})
end