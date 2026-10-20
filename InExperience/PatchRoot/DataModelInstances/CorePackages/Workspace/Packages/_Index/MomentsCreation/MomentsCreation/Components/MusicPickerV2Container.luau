local MomentsCreation = script:FindFirstAncestor("MomentsCreation")
local Parent = MomentsCreation.Parent
local BuilderIconsModule = require(Parent.BuilderIcons)
local MusicPickerModule = require(Parent.MusicPicker)
local MomentsCommonModule = require(Parent.MomentsCommon)
local ReactModule = require(Parent.React)
local SignalsModule = require(Parent.Signals)
local UseAudioPlaybackModule = require(MomentsCreation.Hooks.useAudioPlayback)
local MusicEditorModule = require(MomentsCreation.Components.MusicEditor)
local GetMusicStoreModule = require(MomentsCreation.Stores.GetMusicStore)
local UseCreationFlowStringsModule = require(MomentsCreation.Hooks.useCreationFlowStrings)
local _ = require(MomentsCreation.Types.CreationFlowTypes)
local _ = require(MomentsCreation.Types.Music)
local _ = require(Parent.MomentsTypes)
local FireAnalyticsEventModule = require(MomentsCreation.Analytics.fireAnalyticsEvent)
local MakeCreationEventFieldsModule = require(MomentsCreation.Analytics.makeCreationEventFields)
local FFlagMomentsCreationMusicPickerTabsModule = require(MomentsCreation.Flags.FFlagMomentsCreationMusicPickerTabs)
local FFlagMomentsAudioSaveButton = MomentsCommonModule.Flags.FFlagMomentsAudioSaveButton
local EventNames = MomentsCommonModule.Analytics.EventNames
local SessionManager = MomentsCommonModule.Analytics.SessionManager
local FunnelEventNames = MomentsCommonModule.Analytics.FunnelEventNames
local UseDeviceInsetsFunction = MomentsCommonModule.Hooks.useDeviceInsets
local MusicPicker = MusicPickerModule.MusicPicker
local MusicPickerContext = MusicPickerModule.MusicPickerContext
local UseCallbackFunction = ReactModule.useCallback
local UseEffectFunction = ReactModule.useEffect
local UseMemoFunction = ReactModule.useMemo
local UseStateFunction = ReactModule.useState

local function _(p1)
	return {
		id = p1.AssetId,
		title = p1.Title,
		artist = p1.Artist,
		thumbnailAssetId = p1.AssetId
	}
end

local _ = function(p1): string
	return if p1 == "loading" then "loading" elseif p1 == "error" then "error" else "success"
end

local function useStoreContent()
	-- upvalues: GetMusicStoreModule (copy), UseCreationFlowStringsModule (copy), UseStateFunction (copy), UseEffectFunction (copy), SignalsModule (copy), UseMemoFunction (copy)
	local MusicStoreModule = GetMusicStoreModule()
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local UseStateResult, UseStateResult2 = UseStateFunction(MusicStoreModule.getResults(false))
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(MusicStoreModule.getSearchStatus(false))
	local UseStateResult3, UseStateResult2_2 = UseStateFunction(false)
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2 (copy), MusicStoreModule (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy)
		return SignalsModule.createEffect(function(p1)
			-- upvalues: UseStateResult2 (upval), MusicStoreModule (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval)
			UseStateResult2(MusicStoreModule.getResults(p1))
			UseStateResult2_1(MusicStoreModule.getSearchStatus(p1))
			UseStateResult2_2(MusicStoreModule.getIsLoadingMore(p1))
		end)
	end, {})
	
	return UseMemoFunction(function()
		-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseCreationFlowStringsModuleResult (copy), MusicStoreModule (copy), UseStateResult3 (copy)
		local Items = {}
		
		for i, value in UseStateResult do
			Items[i] = {
				id = value.AssetId,
				title = value.Title,
				artist = value.Artist,
				thumbnailAssetId = value.AssetId
			}
		end
		return {
			items = Items,
			status = if UseStateResult1 == "loading" then "loading" elseif UseStateResult1 == "error" then "error" else "success",
			emptyText = UseCreationFlowStringsModuleResult.MusicNoResults,
			errorText = UseCreationFlowStringsModuleResult.MusicSearchError,
			retryText = UseCreationFlowStringsModuleResult.GeneralCtaRetry,
			onRetry = MusicStoreModule.retry,
			onLoadMore = MusicStoreModule.loadMore,
			isLoadingMore = UseStateResult3
		}
	end, {
		UseStateResult,
		UseStateResult1,
		UseCreationFlowStringsModuleResult,
		MusicStoreModule,
		UseStateResult3
	})
end

local _ = function()
	-- upvalues: UseCreationFlowStringsModule (copy), UseMemoFunction (copy), BuilderIconsModule (copy)
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	
	return UseMemoFunction(function()
		-- upvalues: UseCreationFlowStringsModuleResult (copy), BuilderIconsModule (upval)
		return {
			status = "success",
			items = {},
			emptyState = {
				title = UseCreationFlowStringsModuleResult.MusicSavedEmptyTitle,
				subtitle = UseCreationFlowStringsModuleResult.MusicSavedEmptySubtitle,
				icon = BuilderIconsModule.Icon.Bookmark
			}
		}
	end, { UseCreationFlowStringsModuleResult })
end

return function(p1)
	-- upvalues: UseCreationFlowStringsModule (copy), GetMusicStoreModule (copy), UseDeviceInsetsFunction (copy), useStoreContent (copy), UseMemoFunction (copy), BuilderIconsModule (copy), UseStateFunction (copy), UseEffectFunction (copy), SignalsModule (copy), UseAudioPlaybackModule (copy), UseCallbackFunction (copy), MakeCreationEventFieldsModule (copy), SessionManager (copy), FunnelEventNames (copy), FireAnalyticsEventModule (copy), EventNames (copy), FFlagMomentsAudioSaveButton (copy), ReactModule (copy), MusicEditorModule (copy), MusicPickerContext (copy), MusicPicker (copy), FFlagMomentsCreationMusicPickerTabsModule (copy)
	local Controller = p1.controller
	local Playback = Controller.preview.playback
	local UseCreationFlowStringsModuleResult = UseCreationFlowStringsModule()
	local MusicStoreModule = GetMusicStoreModule()
	local UseDeviceInsetsResult = UseDeviceInsetsFunction()
	local UseStoreContentResult = useStoreContent()
	local UseCreationFlowStringsModuleResult1 = UseCreationFlowStringsModule()
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseCreationFlowStringsModuleResult1 (copy), BuilderIconsModule (upval)
		return {
			status = "success",
			items = {},
			emptyState = {
				title = UseCreationFlowStringsModuleResult1.MusicSavedEmptyTitle,
				subtitle = UseCreationFlowStringsModuleResult1.MusicSavedEmptySubtitle,
				icon = BuilderIconsModule.Icon.Bookmark
			}
		}
	end, { UseCreationFlowStringsModuleResult1 })
	local UseStateResult, UseStateResult2 = UseStateFunction(nil)
	local UseStateResult1, UseStateResult2_1 = UseStateFunction(false)
	local UseStateResult3, UseStateResult2_2 = UseStateFunction({})
	local UseStateResult4, UseStateResult2_3 = UseStateFunction("")
	local UseStateResult5, UseStateResult2_4 = UseStateFunction(Playback.getTimeLength(false))
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), UseStateResult2_4 (copy), Playback (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: UseStateResult2_4 (upval), Playback (upval)
			UseStateResult2_4(Playback.getTimeLength(p2))
		end)
	end, { Playback })
	local UseStateResult6, UseStateResult2_5 = UseStateFunction(nil)
	UseEffectFunction(function()
		-- upvalues: SignalsModule (upval), Controller (copy), UseStateResult2_5 (copy)
		return SignalsModule.createEffect(function(p2)
			-- upvalues: Controller (upval), UseStateResult2_5 (upval)
			local ActiveSession = Controller.getActiveSession(p2)
			UseStateResult2_5(if ActiveSession == nil then nil else ActiveSession.getDraft(p2))
		end)
	end, { Controller })
	local UseAudioPlaybackModuleResult = UseAudioPlaybackModule(UseStateResult ~= nil, UseStateResult, { autoplay = true, looping = false })
	UseEffectFunction(function()
		-- upvalues: Playback (copy), MusicStoreModule (copy), UseStateResult5 (copy)
		Playback.pause()
		MusicStoreModule.search("", UseStateResult5)
	end, { UseStateResult5 })
	UseEffectFunction(function()
		-- upvalues: UseAudioPlaybackModuleResult (copy), UseStateResult2 (copy)
		if not UseAudioPlaybackModuleResult.playback.isPlaying then
			UseStateResult2(nil)
		end
	end, { UseAudioPlaybackModuleResult.playback.isPlaying })
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: Playback (copy), Controller (copy)
		Playback.play()
		Playback.setMuted(false)
		Controller.discardActiveTool()
	end, { Controller, Playback })
	local UseCallbackResult1 = UseCallbackFunction(function(AssetId)
		-- upvalues: Controller (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), MakeCreationEventFieldsModule (upval), SessionManager (upval), FunnelEventNames (upval), FireAnalyticsEventModule (upval), EventNames (upval)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil then
			ActiveSession.update({ startTime = 0, assetId = AssetId })
		end
		UseStateResult2(nil)
		UseStateResult2_1(true)
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
		-- upvalues: Controller (copy), UseStateResult2_1 (copy), Playback (copy)
		local ActiveSession = Controller.getActiveSession(false)
		
		if ActiveSession ~= nil then
			ActiveSession.update(nil)
		end
		UseStateResult2_1(false)
		Playback.pause()
	end, { Controller, Playback })
	local UseCallbackResult3 = UseCallbackFunction(function()
		-- upvalues: UseStateResult2_1 (copy), Playback (copy), Controller (copy)
		UseStateResult2_1(false)
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
	local UseCallbackResult5 = UseCallbackFunction(function(PreviewingId)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy), UseAudioPlaybackModuleResult (copy)
		if UseStateResult == PreviewingId then
			UseStateResult2(nil)
			
			return
		else
			UseStateResult2(PreviewingId)
			UseAudioPlaybackModuleResult.playback.play()
		end
	end, { UseStateResult or 0 })
	local UseCallbackResult6 = UseCallbackFunction(function(p2)
		-- upvalues: UseStateResult2_2 (copy)
		UseStateResult2_2(function(List)
			-- upvalues: p2 (copy)
			local t = {}
			
			for i, value in List do
				if i ~= p2 then
					t[i] = value
				end
			end
			if not List[p2] then
				t[p2] = true
			end
			return t
		end)
	end, {})
	local UseCallbackResult7 = UseCallbackFunction(function(p3)
		-- upvalues: UseStateResult2 (copy), UseStateResult2_3 (copy), MusicStoreModule (copy), UseStateResult5 (copy)
		UseStateResult2(nil)
		UseStateResult2_3(p3)
		MusicStoreModule.search(p3, UseStateResult5)
	end, { MusicStoreModule, UseStateResult5 })
	local UseCallbackResult8 = UseCallbackFunction(function(_)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(nil)
	end, {})
	local UseMemoResult1 = UseMemoFunction(function()
		-- upvalues: UseCreationFlowStringsModuleResult (copy), UseStoreContentResult (copy), FFlagMomentsAudioSaveButton (upval), UseMemoResult (copy)
		local List = {
			{
				id = "trending",
				label = UseCreationFlowStringsModuleResult.MusicTabTrending,
				content = UseStoreContentResult
			}
		}
		
		if FFlagMomentsAudioSaveButton then
			table.insert(List, { id = "saved", label = "Saved", content = UseMemoResult })
		end
		return List
	end, {
		UseCreationFlowStringsModuleResult,
		UseStoreContentResult,
		UseMemoResult
	})
	local UseMemoResult2 = UseMemoFunction(function()
		-- upvalues: UseStateResult (copy), UseCallbackResult5 (copy), UseStateResult3 (copy), UseCallbackResult6 (copy), FFlagMomentsAudioSaveButton (upval)
		return {
			previewingId = UseStateResult,
			togglePreview = UseCallbackResult5,
			savedIds = UseStateResult3,
			toggleSaved = UseCallbackResult6,
			showSaveButton = FFlagMomentsAudioSaveButton
		}
	end, {
		UseStateResult or 0,
		UseStateResult3,
		UseCallbackResult5,
		UseCallbackResult6
	})
	
	return if UseStateResult1 and UseStateResult6 ~= nil then ReactModule.createElement(MusicEditorModule, {
		controller = Controller,
		musicEdit = UseStateResult6,
		onBack = UseCallbackResult2,
		onDone = UseCallbackResult3,
		onStartTimeChanged = UseCallbackResult4
	}) else ReactModule.createElement(MusicPickerContext.Provider, { value = UseMemoResult2 }, {
		Picker = ReactModule.createElement(MusicPicker, {
			source = "moments",
			titleText = UseCreationFlowStringsModuleResult.EditingCtaMusic,
			searchPlaceholder = UseCreationFlowStringsModuleResult.GeneralSearchPlaceholder,
			showTabs = FFlagMomentsCreationMusicPickerTabsModule and FFlagMomentsAudioSaveButton,
			tabs = UseMemoResult1,
			searchContent = UseStoreContentResult,
			onQueryChanged = UseCallbackResult7,
			initialQuery = UseStateResult4,
			onTabChanged = UseCallbackResult8,
			onSelect = UseCallbackResult1,
			onClose = UseCallbackResult,
			safeAreaInsets = {
				left = UseDeviceInsetsResult.left,
				right = UseDeviceInsetsResult.right
			}
		})
	})
end