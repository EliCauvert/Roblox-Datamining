local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local dataHydrationModule = require(parent.DataHydration)
local localizationModule = require(parent.Localization)
local navigationModule = require(parent.Navigation)
local placeVersionHistoryModule = require(parent.DataHydration.PlaceVersionHistory)
local reactModule = require(parent.React)
local signalsReactModule = require(parent.SignalsReact)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local launchPlaytestWithLoadingStateModule = require(parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)
local getPlaytestLoadingStoreModule = require(parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local versionHistoryUtilsModule = require(script.Parent.Parent.VersionHistoryUtils)
local _ = require(script.Parent.LatestVersionCardView)
local dataStatus = dataHydrationModule.DataStatus
local useLocalization = localizationModule.Hooks.useLocalization
local useNavigation = navigationModule.useNavigation

return function(p1)
	-- upvalues: placeVersionHistoryModule (ref), reactModule (ref), signalsReactModule (ref), getPlaytestLoadingStoreModule (ref), useLocalization (ref), localizationStringsModule (ref), useNavigation (ref), sendBuildExperienceEventModule (ref), launchPlaytestWithLoadingStateModule (ref), versionHistoryUtilsModule (ref), dataStatus (ref)
	local placeVersionHistoryStore = placeVersionHistoryModule.getPlaceVersionHistoryStore()
	local var1 = reactModule.useMemo(function()
		-- upvalues: placeVersionHistoryStore (ref), p1 (ref)
		return placeVersionHistoryStore.getLiveVersion(p1.placeId)
	end, { p1.placeId, placeVersionHistoryStore })
	local var2 = signalsReactModule.useSignalState(var1.data)
	local var3 = signalsReactModule.useSignalState(var1.status)
	reactModule.useEffect(function()
		-- upvalues: placeVersionHistoryStore (ref), p1 (ref)
		placeVersionHistoryStore.fetchLiveVersion(p1.placeId)
	end, { p1.placeId, placeVersionHistoryStore })
	local var4 = signalsReactModule.useSignalState(reactModule.useCallback(function(p2)
		-- upvalues: getPlaytestLoadingStoreModule (copy), p1 (ref)
		return getPlaytestLoadingStoreModule(p2).getIsPlaytestLoadingForPlaceId(p1.placeId)(p2)
	end, { p1.placeId }))
	local var5 = useLocalization({
		playtest = localizationStringsModule.BUILD_MENU_PLAYTEST,
		publish = localizationStringsModule.BUILD_MENU_PUBLISH
	})
	local var6 = useNavigation()
	local var7 = reactModule.useCallback(function()
		-- upvalues: sendBuildExperienceEventModule (copy), p1 (ref), launchPlaytestWithLoadingStateModule (copy)
		sendBuildExperienceEventModule("PLAYTEST_CLICK", { universeId = p1.universeId, placeId = p1.placeId }, { context = "LatestVersionCard" })
		launchPlaytestWithLoadingStateModule(p1.placeId, "LatestVersionCard", true)
	end, { p1.placeId, p1.universeId })
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), sendBuildExperienceEventModule (copy), p1 (ref)
		if var6 == nil then return end
		sendBuildExperienceEventModule("PUBLISH_CLICK", { universeId = p1.universeId, placeId = p1.placeId }, { context = "LatestVersionCard" })
		
		if p1.onClose then
			p1.onClose()
		end
		var6.navigate("BuildPublish", {
			target = var6.getParam("target") or { universeId = p1.universeId, placeId = p1.placeId }
		})
	end, { p1.placeId, p1.universeId, p1.onClose, var6 })
	local entry = p1.entry
	
	if entry == nil then
		return nil
	end
	local var9 = if var2 then var2.placeVersion else nil
	
	return {
		versionLabel = entry.versionLabel,
		title = entry.title,
		description = entry.description,
		playtestText = var5.playtest,
		publishText = var5.publish,
		isPlaytestDisabled = var4,
		isPublishDisabled = var3 == dataStatus.NotReady or (if var9 then versionHistoryUtilsModule.getVersionNumber(var9) else nil) == entry.versionNumber,
		onPlaytestActivated = var7,
		onPublishActivated = var8,
		layoutOrder = p1.layoutOrder,
		testId = p1.testId
	}
end