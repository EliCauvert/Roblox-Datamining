local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local DashModule = require(Parent.Dash)
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local Icon = FoundationModule.Icon
local ScrollBarVisibility = FoundationModule.Enums.ScrollBarVisibility
local ScrollView = FoundationModule.ScrollView
local Text = FoundationModule.Text
local TextInput = FoundationModule.TextInput
local View = FoundationModule.View
local MagnifyingGlass = require(Parent.BuilderIcons).Icon.MagnifyingGlass
local UseAudioPlaybackModule = require(MomentsCreation.Hooks.useAudioPlayback)
local MusicEditorModule = require(MomentsCreation.Components.MusicEditor)
local MusicPreviewItemModule = require(MomentsCreation.Components.MusicPreviewItem)
local GetMusicStoreModule = require(MomentsCreation.Stores.GetMusicStore)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseStateFunction = ReactModule.useState
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(Parent.MomentsTypes)

return function(p1)
	-- upvalues: UseDeviceInsetsFunction (copy), UseTokensFunction (copy), UseCreationFlowStringsModule (copy), GetMusicStoreModule (copy), UseStateFunction (copy), UseEffectFunction (copy), SignalsModule (copy), UseAudioPlaybackModule (copy), UseCallbackFunction (copy), MakeCreationEventFieldsModule (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), ReactModule (copy), MusicEditorModule (copy), View (copy), FoundationModule (copy), Text (copy), Icon (copy), TextInput (copy), MagnifyingGlass (copy), ScrollView (copy), ScrollBarVisibility (copy), DashModule (copy), MusicPreviewItemModule (copy)
	local Controller = p1.controller
	local Playback = Controller.preview.playback
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseTokensResult = UseTokensFunction()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local MusicStoreModule = GetMusicStoreModule()
	local UseStateResult, UseStateResult2 = UseStateFunction("")
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(nil)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(false)
	local UseStateResult4, UseStateResult2_3 = UseStateFunction(Playback.getTimeLength(false))
	local UseStateResult5, UseStateResult2_4 = UseStateFunction(MusicStoreModule.getResults(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_3 (copy), Playback (copy), UseStateResult2_4 (copy), MusicStoreModule (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_3 (upval), Playback (upval), UseStateResult2_4 (upval), MusicStoreModule (upval)
			UseStateResult2_3(Playback.getTimeLength(p2))
			UseStateResult2_4(MusicStoreModule.getResults(p2))
		end)
	end, { Playback, MusicStoreModule })
	local UseStateResult6, UseStateResult2_5 = UseStateFunction(nil)
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy), UseStateResult2_5 (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Controller (upval), UseStateResult2_5 (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			UseStateResult2_5(if ActiveSession == nil then nil else ActiveSession.getDraft(p2))
		end)
	end, { Controller })
	local UseAudioPlaybackModuleResult = UseAudioPlaybackModule(UseStateResult1 ~= nil, UseStateResult1, { autoplay = true, looping = false })
	UseEffectFunction(function()
		-- upvalues: Playback (copy), MusicStoreModule (copy), UseStateResult4 (copy)
		Playback.pause()
		MusicStoreModule.search("", UseStateResult4)
	end, { UseStateResult4 })
	UseEffectFunction(function()
		-- upvalues: UseAudioPlaybackModuleResult (copy), UseStateResult2_1 (copy)
		if not UseAudioPlaybackModuleResult.playback.isPlaying then
			UseStateResult2_1(nil)
		end
	end, { UseAudioPlaybackModuleResult.playback.isPlaying })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: Playback (copy), Controller (copy)
		Playback.play()
		Playback.setMuted(false)
		Controller.discardActiveTool()
	end, { Controller, Playback })
	local UseCallbackResult1 = UseCallbackFunction(function(AssetId)
		-- upvalues: Controller (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), MakeCreationEventFieldsModule (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil then
			ActiveSession.update({ startTime = 0, assetId = AssetId })
		end
		UseStateResult2_1(nil)
		UseStateResult2_2(true)
		local config = { musicAssetId = tostring(AssetId) }
		
		for i, value in MakeCreationEventFieldsModule.makeToolFieldFromKind("music") do
			config[i] = value
		end
		for i1, value1 in MakeCreationEventFieldsModule.makeCreationBaseFields((SessionManager.getSessionId(FunnelEventNames.FunnelTypes.CreationFlow))) do
			config[i1] = value1
		end
		FireAnalyticsEventModule(EventNames.EditingFlowMusicSelected, config)
	end, { Controller })
	local UseCallbackResult2 = UseCallbackFunction(function()
		-- upvalues: Controller (copy), UseStateResult2_2 (copy), Playback (copy)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil then
			ActiveSession.update(nil)
		end
		UseStateResult2_2(false)
		Playback.pause()
	end, { Controller, Playback })
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_2 (copy), Playback (copy), Controller (copy)
		UseStateResult2_2(false)
		Playback.play()
		Playback.setMuted(false)
		Controller.commitActiveTool()
	end, { Controller, Playback })
	local UseCallbackResult4 = UseCallbackFunction(function(StartTime)
		-- upvalues: Controller (copy)
		local ActiveSession = Controller.getActiveSession(false)
		local Draft = if ActiveSession == nil then nil else ActiveSession.getDraft(false)
		
		if ActiveSession ~= nil and Draft ~= nil then
			ActiveSession.update({ assetId = Draft.assetId, startTime = StartTime })
		end
	end, { Controller })
	local UseCallbackResult5 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), UseAudioPlaybackModuleResult (copy)
		if UseStateResult1 == p2 then
			UseStateResult2_1(nil)
			
			return
		else
			UseStateResult2_1(p2)
			UseAudioPlaybackModuleResult.playback.play()
		end
	end, { UseStateResult1 })
	local UseCallbackResult6 = UseCallbackFunction(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2_1 (copy), MusicStoreModule (copy), UseStateResult (copy), UseStateResult4 (copy)
		if UseStateResult1 ~= nil then
			UseStateResult2_1(nil)
		end
		MusicStoreModule.search(UseStateResult, UseStateResult4)
	end, { UseStateResult1, UseStateResult, UseStateResult4 })
	
	if UseStateResult3 and UseStateResult6 ~= nil then
		return ReactModule.createElement(MusicEditorModule, {
			controller = Controller,
			musicEdit = UseStateResult6,
			onBack = UseCallbackResult2,
			onDone = UseCallbackResult3,
			onStartTimeChanged = UseCallbackResult4
		})
	else
		local Duration: number = UseAudioPlaybackModuleResult.timeline.duration
		local ElapsedRatio = if Duration > 0 then UseAudioPlaybackModuleResult.timeline.elapsed / Duration else 0
		
		return ReactModule.createElement(View, {
			tag = "col align-x-center align-y-top gap-small position-bottom-center anchor-bottom-center size-full-0 radius-medium bg-surface-100",
			ZIndex = 5,
			onActivated = function() end,
			Size = UDim2.fromScale(1, 0.6666666666666666),
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			padding = {
				top = UDim.new(0, UseTokensResult.Padding.Medium),
				left = UDim.new(0, (math.max(UseDeviceInsetsResult.left, UseTokensResult.Padding.XLarge))),
				right = UDim.new(0, (math.max(UseDeviceInsetsResult.right, UseTokensResult.Padding.XLarge)))
			}
		}, {
			ModalHeaderBar = ReactModule.createElement(View, {
				LayoutOrder = 1,
				tag = "row flex-x-between align-x-center align-y-center size-full-0 auto-y"
			}, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					tag = "auto-xy text-heading-small text-align-x-left text-align-y-top text-truncate-end content-action-emphasis",
					Text = UseCreationFlowStringsModuleResult.EditingCtaMusic
				}),
				CloseButton = ReactModule.createElement(View, {
					tag = "auto-xy padding-medium radius-medium",
					LayoutOrder = 2,
					onActivated = UseCallbackResult
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
			SearchBar = ReactModule.createElement(TextInput, {
				label = "",
				LayoutOrder = 2,
				iconLeading = MagnifyingGlass,
				text = UseStateResult,
				placeholder = UseCreationFlowStringsModuleResult.GeneralSearchPlaceholder,
				onChanged = UseStateResult2,
				onReturnPressed = UseCallbackResult6,
				onFocusLost = UseCallbackResult6,
				width = UDim.new(1, 0)
			}),
			ScrollView = ReactModule.createElement(ScrollView, {
				LayoutOrder = 3,
				tag = "col align-x-left align-y-top size-full",
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
			}, if #UseStateResult5 > 0 then DashModule.map(UseStateResult5, function(p2, LayoutOrder)
				-- upvalues: ReactModule (upval), MusicPreviewItemModule (upval), UseCallbackResult1 (copy), UseCallbackResult5 (copy), UseStateResult1 (copy), ElapsedRatio (copy)
				return ReactModule.createElement(MusicPreviewItemModule, {
					key = p2.AssetId,
					layoutOrder = LayoutOrder,
					musicAssetId = p2.AssetId,
					onMusicSelected = UseCallbackResult1,
					togglePreviewMusic = UseCallbackResult5,
					progress = if UseStateResult1 == p2.AssetId then ElapsedRatio else nil,
					isPreviewing = UseStateResult1 == p2.AssetId
				})
			end) else {
				NoResults = ReactModule.createElement(Text, {
					tag = "text-body-medium text-align-x-center content-action-emphasis",
					Text = UseCreationFlowStringsModuleResult.MusicNoResults
				})
			})
		})
	end
end