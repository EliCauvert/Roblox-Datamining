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
	-- upvalues: getMusicStoreModule (ref), useCreationFlowStringsModule (ref), useState (ref), useEffect (ref), signalsModule (ref), useMemo (ref)
	local var1 = getMusicStoreModule()
	local var2 = useCreationFlowStringsModule()
	local var3, var4 = useState(var1.getResults(false))
	local var5, var6 = useState(var1.getSearchStatus(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var4 (ref), var1 (ref), var6 (ref)
		return signalsModule.createEffect(function(p1)
			-- upvalues: var4 (copy), var1 (copy), var6 (copy)
			var4(var1.getResults(p1))
			var6(var1.getSearchStatus(p1))
		end)
	end, {})
	
	return useMemo(function()
		-- upvalues: var3 (ref), var5 (ref), var2 (ref), var1 (ref)
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
			onRetry = var1.retry
		}
	end, { var3, var5, var2, var1 })
end

local _ = function()
	-- upvalues: useCreationFlowStringsModule (ref), useMemo (ref), builderIconsModule (ref)
	local var7 = useCreationFlowStringsModule()
	
	return useMemo(function()
		-- upvalues: var7 (ref), builderIconsModule (copy)
		return {
			status = "success",
			items = {},
			emptyState = {
				title = var7.MusicSavedEmptyTitle,
				subtitle = var7.MusicSavedEmptySubtitle,
				icon = builderIconsModule.Icon.Bookmark
			}
		}
	end, { var7 })
end

return function(p1)
	-- upvalues: useCreationFlowStringsModule (ref), getMusicStoreModule (ref), useDeviceInsets (ref), useStoreContent (ref), useMemo (ref), builderIconsModule (ref), useState (ref), useEffect (ref), signalsModule (ref), useAudioPlaybackModule (ref), useCallback (ref), makeCreationEventFieldsModule (ref), sessionManager (ref), funnelEventNames (ref), fireAnalyticsEventModule (ref), eventNames (ref), reactModule (ref), musicEditorModule (ref), musicPickerContext (ref), musicPicker (ref), fFlagMomentsCreationMusicPickerTabsModule (ref)
	local controller = p1.controller
	local playback = controller.preview.playback
	local var7 = useCreationFlowStringsModule()
	local var8 = getMusicStoreModule()
	local var9 = useDeviceInsets()
	local var10 = useStoreContent()
	local var11 = useCreationFlowStringsModule()
	local var12 = useMemo(function()
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
	local var13, var14 = useState(nil)
	local var15, var16 = useState(false)
	local var17, var18 = useState({})
	local var19, var20 = useState(playback.getTimeLength(false))
	useEffect(function()
		-- upvalues: signalsModule (copy), var20 (ref), playback (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: var20 (copy), playback (copy)
			var20(playback.getTimeLength(p2))
		end)
	end, { playback })
	local var21, var22 = useState(nil)
	useEffect(function()
		-- upvalues: signalsModule (copy), controller (ref), var22 (ref)
		return signalsModule.createEffect(function(p2)
			-- upvalues: controller (copy), var22 (copy)
			local activeSession = controller.getActiveSession(p2)
			var22(if activeSession ~= nil then nil else activeSession.getDraft(p2))
		end)
	end, { controller })
	local var23 = useAudioPlaybackModule(var13 ~= nil, var13, { autoplay = true, looping = false })
	useEffect(function()
		-- upvalues: playback (ref), var8 (ref), var19 (ref)
		playback.pause()
		var8.search("", var19)
	end, { var19 })
	useEffect(function()
		-- upvalues: var23 (ref), var14 (ref)
		if not var23.playback.isPlaying then
			var14(nil)
		end
	end, { var23.playback.isPlaying })
	local var24 = useCallback(function()
		-- upvalues: playback (ref), controller (ref)
		playback.play()
		playback.setMuted(false)
		controller.discardActiveTool()
	end, { controller, playback })
	local var25 = useCallback(function(p2)
		-- upvalues: controller (ref), var14 (ref), var16 (ref), makeCreationEventFieldsModule (copy), sessionManager (copy), funnelEventNames (copy), fireAnalyticsEventModule (copy), eventNames (copy)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update({ startTime = 0, assetId = p2 })
		end
		var14(nil)
		var16(true)
		local t = { musicAssetId = tostring(p2) }
		
		for i, v in makeCreationEventFieldsModule.makeToolFieldFromKind("music") do
			t[i] = v
		end
		for i_1, v_1 in makeCreationEventFieldsModule.makeCreationBaseFields(sessionManager.getSessionId(funnelEventNames.FunnelTypes.CreationFlow)) do
			t[i_1] = v_1
		end
		fireAnalyticsEventModule(eventNames.EditingFlowMusicSelected, t)
	end, { controller })
	local var26 = useCallback(function()
		-- upvalues: controller (ref), var16 (ref), playback (ref), var8 (ref), var19 (ref)
		local activeSession = controller.getActiveSession(false)
		
		if activeSession ~= nil then
			activeSession.update(nil)
		end
		var16(false)
		playback.pause()
		var8.search("", var19)
	end, { controller, playback, var8, var19 })
	local var27 = useCallback(function()
		-- upvalues: var16 (ref), playback (ref), controller (ref)
		var16(false)
		playback.play()
		playback.setMuted(false)
		controller.commitActiveTool()
	end, { controller, playback })
	local var28 = useCallback(function(p3)
		-- upvalues: controller (ref)
		local activeSession = controller.getActiveSession(false)
		local var29 = if activeSession ~= nil then nil else activeSession.getDraft(false)
		
		if activeSession ~= nil and var29 ~= nil then
			activeSession.update({ assetId = var29.assetId, startTime = p3 })
		end
	end, { controller })
	local var29 = useCallback(function(p3)
		-- upvalues: var13 (ref), var14 (ref), var23 (ref)
		if var13 == p3 then
			var14(nil)
			
			return
		end
		var14(p3)
		var23.playback.play()
	end, { var13 or 0 })
	local var30 = useCallback(function(p3)
		-- upvalues: var18 (ref)
		var18(function(p4)
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
	
	return if var15 and var21 ~= nil then reactModule.createElement(musicEditorModule, {
		controller = controller,
		musicEdit = var21,
		onBack = var26,
		onDone = var27,
		onStartTimeChanged = var28
	}) else reactModule.createElement(musicPickerContext.Provider, {
		value = useMemo(function()
			-- upvalues: var13 (ref), var29 (ref), var17 (ref), var30 (ref)
			return {
				previewingId = var13,
				togglePreview = var29,
				savedIds = var17,
				toggleSaved = var30
			}
		end, { var13 or 0, var17, var29, var30 })
	}, {
		Picker = reactModule.createElement(musicPicker, {
			source = "moments",
			titleText = var7.EditingCtaMusic,
			searchPlaceholder = var7.GeneralSearchPlaceholder,
			showTabs = fFlagMomentsCreationMusicPickerTabsModule,
			tabs = useMemo(function()
				-- upvalues: var7 (ref), var10 (ref), var12 (ref)
				return {
					{
						id = "trending",
						label = var7.MusicTabTrending,
						content = var10
					},
					{ id = "saved", label = "Saved", content = var12 }
				}
			end, { var7, var10, var12 }),
			searchContent = var10,
			onQueryChanged = useCallback(function(p4)
				-- upvalues: var14 (ref), var8 (ref), var19 (ref)
				var14(nil)
				var8.search(p4, var19)
			end, { var8, var19 }),
			onTabChanged = useCallback(function(_)
				-- upvalues: var14 (ref)
				var14(nil)
			end, {}),
			onSelect = var25,
			onClose = var24,
			safeAreaInsets = { left = var9.left, right = var9.right }
		})
	})
end