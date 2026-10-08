local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local musicPickerModule = require(parent.MusicPicker)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local signalsModule = require(parent.Signals)
local useAudioPlaybackModule = require(momentsCreation.Hooks.useAudioPlayback)
local musicEditorModule = require(momentsCreation.Components.MusicEditor)
local getMusicStoreModule = require(momentsCreation.Stores.GetMusicStore)
local useCreationFlowStringsModule = require(momentsCreation.Hooks.useCreationFlowStrings)
local _ = require(momentsCreation.Types.CreationFlowTypes)
local _ = require(momentsCreation.Types.Music)
local _ = require(parent.MomentsTypes)
local fireAnalyticsEventModule = require(momentsCreation.Analytics.fireAnalyticsEvent)
local makeCreationEventFieldsModule = require(momentsCreation.Analytics.makeCreationEventFields)
local fFlagMomentsCreationMusicPickerTabsModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicPickerTabs)
local fFlagMomentsCreationMusicPickerPaginationModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicPickerPagination)
local fFlagMomentsCreationMusicPickerRetainSearchModule = require(momentsCreation.Flags.FFlagMomentsCreationMusicPickerRetainSearch)
local eventNames = momentsCommonModule.Analytics.EventNames
local sessionManager = momentsCommonModule.Analytics.SessionManager
local funnelEventNames = momentsCommonModule.Analytics.FunnelEventNames
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local musicPicker = musicPickerModule.MusicPicker
local musicPickerContext = musicPickerModule.MusicPickerContext
local useCallback = reactModule.useCallback
local useEffect = reactModule.useEffect
local useMemo = reactModule.useMemo
local useState = reactModule.useState

local function _(p1)
	return {
		id = p1.AssetId,
		title = p1.Title,
		artist = p1.Artist,
		thumbnailAssetId = p1.AssetId
	}
end

local _ = function(p1)
	return if p1 == "loading" then "loading" elseif p1 == "error" then "error" else "success"
end

local function useStoreContent()
	-- upvalues: getMusicStoreModule (ref), useCreationFlowStringsModule (ref), useState (ref), fFlagMomentsCreationMusicPickerPaginationModule (ref), useEffect (ref), signalsModule (ref), useMemo (ref)
	local var1 = getMusicStoreModule()
	local var2 = useCreationFlowStringsModule()
	local var3, var4 = useState(var1.getResults(false))
	local var5, var6 = useState(var1.getSearchStatus(false))
	local var7 = nil
	local var8 = nil
	
	if fFlagMomentsCreationMusicPickerPaginationModule then
		local var9, var10 = useState(false)
		var7 = var9
		var8 = var10
	end
	useEffect(function()
		-- upvalues: signalsModule (copy), var4 (ref), var1 (ref), var6 (ref), fFlagMomentsCreationMusicPickerPaginationModule (copy), var8 (write)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var4 (copy), var1 (copy), var6 (copy), fFlagMomentsCreationMusicPickerPaginationModule (copy), var8 (copy)
			var4(var1.getResults(p1))
			var6(var1.getSearchStatus(p1))
			
			if fFlagMomentsCreationMusicPickerPaginationModule and var8 ~= nil then
				var8(var1.getIsLoadingMore(p1))
			end
		end)
	end, {})
	
	return useMemo(function()
		-- upvalues: var3 (ref), var5 (ref), var2 (ref), var1 (ref), fFlagMomentsCreationMusicPickerPaginationModule (copy), var7 (write)
		local t = {}
		
		for i, v in var3 do
			t[i] = {
				id = v.AssetId,
				title = v.Title,
				artist = v.Artist,
				thumbnailAssetId = v.AssetId
			}
		end
		return {
			items = t,
			status = if var5 == "loading" then "loading" elseif var5 == "error" then "error" else "success",
			emptyText = var2.MusicNoResults,
			errorText = var2.MusicSearchError,
			retryText = var2.GeneralCtaRetry,
			onRetry = var1.retry,
			onLoadMore = if fFlagMomentsCreationMusicPickerPaginationModule then var1.loadMore else nil,
			isLoadingMore = if fFlagMomentsCreationMusicPickerPaginationModule then var7 else nil
		}
	end, {
		var3,
		var5,
		var2,
		var1,
		var7
	})
end

local _ = function()
	-- upvalues: useCreationFlowStringsModule (ref), useMemo (ref), builderIconsModule (ref)
	local var11 = useCreationFlowStringsModule()
	
	return useMemo(function()
		-- upvalues: var11 (ref), builderIconsModule (copy)
		return {
			status = "success",
			items = {},
			emptyState = {
				title = var11.MusicSavedEmptyTitle,
				subtitle = var11.MusicSavedEmptySubtitle,
				icon = builderIconsModule.Icon.Bookmark
			}
		}
	end, { var11 })
end

return function(p1)
	-- upvalues: useCreationFlowStringsModule (ref), getMusicStoreModule (ref), useDeviceInsets (ref), useStoreContent (ref), useMemo (ref), builderIconsModule (ref), useState (ref), fFlagMomentsCreationMusicPickerRetainSearchModule (ref), useEffect (ref), signalsModule (ref), useAudioPlaybackModule (ref), useCallback (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), reactModule (ref), musicEditorModule (ref), musicPickerContext (ref), musicPicker (ref), fFlagMomentsCreationMusicPickerTabsModule (ref)
	local controller = p1.controller
	local playback = controller.preview.playback
	local var11 = useCreationFlowStringsModule()
	local var12 = getMusicStoreModule()
	local var13 = useDeviceInsets()
	local var14 = useStoreContent()
	local var15 = useCreationFlowStringsModule()
	local var16 = useMemo(function()
		-- upvalues: var15 (ref), builderIconsModule (copy)
		return {
			status = "success",
			items = {},
			emptyState = {
				title = var15.MusicSavedEmptyTitle,
				subtitle = var15.MusicSavedEmptySubtitle,
				icon = builderIconsModule.Icon.Bookmark
			}
		}
	end, { var15 })
	local var17, var18 = useState(nil)
	local var19, var20 = useState(false)
	local var21, var22 = useState({})
	local var23 = nil
	local var24 = nil
	
	if fFlagMomentsCreationMusicPickerRetainSearchModule then
		local var25, var26 = useState("")
		var23 = var25
		var24 = var26
	end
	local var27, var28 = useState(playback.getTimeLength(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var28 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var28 (copy), playback (copy)
			var28(playback.getTimeLength(p2))
		end)
	end, { playback })
	local var29, var30 = useState(nil)
	useEffect(function()
		-- upvalues: signalsModule (copy), controller (ref), var30 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: controller (copy), var30 (copy)
			local activeSession = controller.getActiveSession(p2)
			var30(if activeSession ~= nil then nil else activeSession.getDraft(p2))
		end)
	end, { controller })
	local var31 = useAudioPlaybackModule(var17 ~= nil, var17, { autoplay = true, looping = false })
	useEffect(function()
		-- upvalues: playback (ref), var12 (ref), var27 (ref)
		playback.pause()
		var12.search("", var27)
	end, { var27 })
	useEffect(function()
		-- upvalues: var31 (ref), var18 (ref)
		if not var31.playback.isPlaying then
			var18(nil)
		end
	end, { var31.playback.isPlaying })
	local var32 = useCallback(function()
		-- upvalues: playback (ref), controller (ref)
		playback.play()
		playback.setMuted(false)
		controller.discardActiveTool()
	end, { controller, playback })
	local var33 = useCallback(function(p2)
		-- upvalues: controller (ref), var18 (ref), var20 (ref), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, assetId = p2 })
		end
		var18(nil)
		var20(true)
		local t = { musicAssetId = tostring(p2) }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("music") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowMusicSelected, t)
	end, { controller })
	local var34 = useCallback(function()
		-- upvalues: controller (ref), var20 (ref), playback (ref), fFlagMomentsCreationMusicPickerRetainSearchModule (copy), var12 (ref), var27 (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(nil)
		end
		var20(false)
		playback.pause()
		
		if fFlagMomentsCreationMusicPickerRetainSearchModule then
			return
		end
		var12.search("", var27)
	end, { controller, playback, var12, var27 })
	local var35 = useCallback(function()
		-- upvalues: var20 (ref), playback (ref), controller (ref)
		var20(false)
		playback.play()
		playback.setMuted(false)
		controller.commitActiveTool()
	end, { controller, playback })
	local var36 = useCallback(function(p3)
		-- upvalues: controller (ref)
		local activeSession = controller.getActiveSession(false)
		local var37 = if activeSession ~= nil then nil else activeSession.getDraft(false)
		
		if activeSession ~= nil and var37 ~= nil then
			activeSession.update({ assetId = var37.assetId, startTime = p3 })
		end
	end, { controller })
	local var37 = useCallback(function(p3)
		-- upvalues: var17 (ref), var18 (ref), var31 (ref)
		if var17 == p3 then
			var18(nil)
			
			return
		end
		var18(p3)
		var31.playback.play()
	end, { var17 or 0 })
	local var38 = useCallback(function(p3)
		-- upvalues: var22 (ref)
		var22(function(p4)
			-- upvalues: p3 (ref)
			local t = {}
			
			for i, v in p4 do
				if i ~= p3 then
					t[i] = v
				end
			end
			if not p4[p3] then
				t[p3] = true
			end
			return t
		end)
	end, {})
	
	return if var19 and var29 ~= nil then reactModule.createElement(musicEditorModule, {
		controller = controller,
		musicEdit = var29,
		onBack = var34,
		onDone = var35,
		onStartTimeChanged = var36
	}) else reactModule.createElement(musicPickerContext.Provider, {
		value = useMemo(function()
			-- upvalues: var17 (ref), var37 (ref), var21 (ref), var38 (ref)
			return {
				previewingId = var17,
				togglePreview = var37,
				savedIds = var21,
				toggleSaved = var38
			}
		end, { var17 or 0, var21, var37, var38 })
	}, {
		Picker = reactModule.createElement(musicPicker, {
			source = "moments",
			titleText = var11.EditingCtaMusic,
			searchPlaceholder = var11.GeneralSearchPlaceholder,
			showTabs = fFlagMomentsCreationMusicPickerTabsModule,
			tabs = useMemo(function()
				-- upvalues: var11 (ref), var14 (ref), var16 (ref)
				return {
					{
						id = "trending",
						label = var11.MusicTabTrending,
						content = var14
					},
					{ id = "saved", label = "Saved", content = var16 }
				}
			end, { var11, var14, var16 }),
			searchContent = var14,
			onQueryChanged = useCallback(function(p4)
				-- upvalues: var18 (ref), fFlagMomentsCreationMusicPickerRetainSearchModule (copy), var24 (write), var12 (ref), var27 (ref)
				var18(nil)
				
				if fFlagMomentsCreationMusicPickerRetainSearchModule and var24 ~= nil then
					var24(p4)
				end
				var12.search(p4, var27)
			end, { var12, var27 }),
			initialQuery = var23,
			onTabChanged = useCallback(function(_)
				-- upvalues: var18 (ref)
				var18(nil)
			end, {}),
			onSelect = var33,
			onClose = var32,
			safeAreaInsets = { left = var13.left, right = var13.right }
		})
	})
end