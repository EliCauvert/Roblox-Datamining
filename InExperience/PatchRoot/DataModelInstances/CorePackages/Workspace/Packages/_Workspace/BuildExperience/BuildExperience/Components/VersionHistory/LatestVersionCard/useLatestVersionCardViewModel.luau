local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local LaunchPlaytestWithLoadingStateModule = require(Parent.BuildExperiencePlaytestLaunch.launchPlaytestWithLoadingState)
local SendBuildExperienceEventModule = require(BuildExperience.Telemetry.sendBuildExperienceEvent)
local GetPlaytestLoadingStoreModule = require(Parent.BuildExperiencePlaytestLaunch.GetPlaytestLoadingStore)
local VersionHistoryUtilsModule = require(script.Parent.Parent.VersionHistoryUtils)
local _ = require(script.Parent.LatestVersionCardView)
local _ = require(BuildExperience.useGamePermissions)
local FFlagBuildCheckGamePermissionsModule = require(BuildExperience.Flags.FFlagBuildCheckGamePermissions)
local DataStatus = require(Parent.DataHydration).DataStatus
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local UseNavigationFunction = require(Parent.Navigation).useNavigation

return function(p1)
	-- upvalues: PlaceVersionHistoryModule (copy), ReactModule (copy), SignalsReactModule (copy), GetPlaytestLoadingStoreModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), UseNavigationFunction (copy), SendBuildExperienceEventModule (copy), LaunchPlaytestWithLoadingStateModule (copy), VersionHistoryUtilsModule (copy), DataStatus (copy), FFlagBuildCheckGamePermissionsModule (copy)
	local PlaceVersionHistoryStore = PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: PlaceVersionHistoryStore (copy), p1 (copy)
		return PlaceVersionHistoryStore.getLiveVersion(p1.placeId)
	end, { p1.placeId, PlaceVersionHistoryStore })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult.status)
	ReactModule.useEffect(function()
		-- upvalues: PlaceVersionHistoryStore (copy), p1 (copy)
		PlaceVersionHistoryStore.fetchLiveVersion(p1.placeId)
	end, { p1.placeId, PlaceVersionHistoryStore })
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p2)
		-- upvalues: GetPlaytestLoadingStoreModule (upval), p1 (copy)
		return GetPlaytestLoadingStoreModule(p2).getIsPlaytestLoadingForPlaceId(p1.placeId)(p2)
	end, { p1.placeId })))
	local UseLocalizationResult = UseLocalizationFunction({
		playtest = LocalizationStringsModule.BUILD_MENU_PLAYTEST,
		publish = LocalizationStringsModule.BUILD_MENU_PUBLISH
	})
	local UseNavigationResult = UseNavigationFunction()
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: SendBuildExperienceEventModule (upval), p1 (copy), LaunchPlaytestWithLoadingStateModule (upval)
		SendBuildExperienceEventModule("PLAYTEST_CLICK", { universeId = p1.universeId, placeId = p1.placeId }, { context = "LatestVersionCard" })
		LaunchPlaytestWithLoadingStateModule(p1.placeId, "LatestVersionCard", true)
	end, { p1.placeId, p1.universeId })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseNavigationResult (copy), SendBuildExperienceEventModule (upval), p1 (copy)
		if UseNavigationResult == nil then return end
		SendBuildExperienceEventModule("PUBLISH_CLICK", { universeId = p1.universeId, placeId = p1.placeId }, { context = "LatestVersionCard" })
		
		if p1.onClose then
			p1.onClose()
		end
		UseNavigationResult.navigate("BuildPublish", {
			target = UseNavigationResult.getParam("target") or { universeId = p1.universeId, placeId = p1.placeId }
		})
	end, {
		p1.placeId,
		p1.universeId,
		p1.onClose,
		UseNavigationResult
	})
	local Entry = p1.entry
	
	if Entry == nil then
		return nil
	else
		local PlaceVersion = if UseSignalStateResult then UseSignalStateResult.placeVersion else nil
		local VersionNumber = if PlaceVersion then VersionHistoryUtilsModule.getVersionNumber(PlaceVersion) else nil
		local NoFFlagBuildCheckGamePermissionsModule = not FFlagBuildCheckGamePermissionsModule or p1.permissions.canEdit
		local NoFFlagBuildCheckGamePermissionsModule1 = not FFlagBuildCheckGamePermissionsModule or p1.permissions.canPublish
		
		return {
			versionLabel = Entry.versionLabel,
			title = Entry.title,
			description = Entry.description,
			playtestText = UseLocalizationResult.playtest,
			publishText = UseLocalizationResult.publish,
			isPlaytestDisabled = UseSignalStateResult2 or not NoFFlagBuildCheckGamePermissionsModule,
			isPublishDisabled = UseSignalStateResult1 == DataStatus.NotReady or (VersionNumber == Entry.versionNumber or not NoFFlagBuildCheckGamePermissionsModule1),
			onPlaytestActivated = UseResult,
			onPublishActivated = UseResult1,
			layoutOrder = p1.layoutOrder,
			testId = p1.testId
		}
	end
end