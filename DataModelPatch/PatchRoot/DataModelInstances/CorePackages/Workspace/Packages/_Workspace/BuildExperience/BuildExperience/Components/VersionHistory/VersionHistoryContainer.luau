local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local PlaceVersionHistoryModule = require(Parent.DataHydration.PlaceVersionHistory)
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local GetPlaytestLoadingStoreModule = require(BuildExperience.Stores.GetPlaytestLoadingStore)
local RollbackPlaceWithRetryModule = require(BuildExperience.utils.rollbackPlaceWithRetry)
local VersionHistoryBottomSheetModule = require(script.Parent.VersionHistoryBottomSheet)
local UseScrollToTopAfterRestoreModule = require(script.Parent.useScrollToTopAfterRestore)
local DataStatus = require(Parent.DataHydration).DataStatus
local DateHelper = require(Parent.Time).DateHelper
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SaveType = PlaceVersionHistoryModule.SaveType
local PublishStatus = PlaceVersionHistoryModule.PublishStatus

local function _(p1)
	return if type(p1) == "number" then p1 elseif type(p1) == "string" then tonumber(p1) else nil
end

local _ = function(p1)
	local Version = p1.version
	
	return assert(if type(Version) == "number" then Version elseif type(Version) == "string" then tonumber(Version) else nil, `Place version must be numeric: {p1.version}`)
end

local _ = function(p1, p2)
	assert(type(p1) == "string" and p1 ~= "", `Place version {p2} must not be empty`)
	
	return p1
end

local _ = function(p1: number): string
	return if p1 < 10 then `v0{p1}` else `v{p1}`
end

local function formatCreatedDate(Text: string, p1): string
	assert(type(Text) == "string" and Text ~= "", "Place version createdTime must not be empty")
	local Match, Match2, Match3 = string.match(Text, "^(%d%d%d%d)%-(%d%d)%-(%d%d)")
	local Number = if Match2 then tonumber(Match2) else nil
	local Number1 = if Match3 then tonumber(Match3) else nil
	assert(Match ~= nil and (Number ~= nil and (Number1 ~= nil and p1[Number] ~= nil)), `Place version createdTime must be an ISO date: {Text}`)
	
	return `{p1[Number]} {Number1}, {Match}`
end

local _ = function(p1)
	-- upvalues: PublishStatus (copy), SaveType (copy)
	if p1.publishStatus == PublishStatus.Live then
		return "Published"
	elseif p1.publishStatus == PublishStatus.PreviouslyPublished then
		return "Previously Published"
	elseif p1.parentAssetVersionId == nil then
		return if p1.saveType == SaveType.AutoSave then "Autosave" else nil
	else
		local ParentAssetVersionId: number = p1.parentAssetVersionId
		
		return `Restored {if ParentAssetVersionId < 10 then `v0{ParentAssetVersionId}` else `v{ParentAssetVersionId}`}`
	end
end

local function mapVersionToEntry(p2, p3)
	-- upvalues: formatCreatedDate (copy), PublishStatus (copy), SaveType (copy)
	local Version = p2.version
	local VersionNumber: number = assert(if type(Version) == "number" then Version elseif type(Version) == "string" then tonumber(Version) else nil, `Place version must be numeric: {p2.version}`)
	local config = {
		id = tostring(VersionNumber),
		versionNumber = VersionNumber,
		versionLabel = `{if VersionNumber < 10 then `v0{VersionNumber}` else `v{VersionNumber}`} · {formatCreatedDate(p2.createdTime, p3)}`,
		title = if p2.title == nil or p2.title == "" then `Version {VersionNumber}` else p2.title,
		description = if p2.description == nil or p2.description == "" then "No description provided." else p2.description,
		noteTitle = p2.title,
		noteDescription = p2.description
	}
	local Autosave = nil
	
	if p2.publishStatus == PublishStatus.Live then
		Autosave = "Published"
	elseif p2.publishStatus == PublishStatus.PreviouslyPublished then
		Autosave = "Previously Published"
	elseif p2.parentAssetVersionId == nil then
		Autosave = if p2.saveType == SaveType.AutoSave then "Autosave" else nil
	else
		local ParentAssetVersionId: number = p2.parentAssetVersionId
		Autosave = `Restored {if ParentAssetVersionId < 10 then `v0{ParentAssetVersionId}` else `v{ParentAssetVersionId}`}`
	end
	config.badgeText = Autosave
	
	return config
end

local function mapHistoryToEntries(UseSignalStateResult, p4)
	-- upvalues: mapVersionToEntry (copy)
	if UseSignalStateResult == nil or UseSignalStateResult.placeVersions == nil then
		return {}
	end
	local List = {}
	
	for _, placeVersion in UseSignalStateResult.placeVersions do
		table.insert(List, (mapVersionToEntry(placeVersion, p4)))
	end
	return List
end

local _ = function(Failed, p5, p6)
	-- upvalues: DataStatus (copy)
	return if p6 == nil then if Failed == DataStatus.NotReady then "Loading version history..." elseif Failed == DataStatus.Failed then "Version history couldn't load." elseif #p5 == 0 then "No version history yet." else nil else p6
end

return function(p5)
	-- upvalues: UseLocalizationFunction (copy), DateHelper (copy), ReactModule (copy), PlaceVersionHistoryModule (copy), SignalsReactModule (copy), UseScrollToTopAfterRestoreModule (copy), GetPlaytestLoadingStoreModule (copy), mapHistoryToEntries (copy), DataStatus (copy), RollbackPlaceWithRetryModule (copy), VersionHistoryBottomSheetModule (copy)
	local UseLocalizationResult = UseLocalizationFunction(DateHelper.MonthsLocalizationKeys)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p5 (copy), PlaceVersionHistoryModule (upval)
		return p5.store or PlaceVersionHistoryModule.getPlaceVersionHistoryStore()
	end, { p5.store })
	local UseMemoResult1 = ReactModule.useMemo(function()
		-- upvalues: UseMemoResult (copy), p5 (copy)
		return UseMemoResult.getAndFetchHistory(p5.placeId)
	end, { UseMemoResult, p5.placeId })
	local UseSignalStateResult = SignalsReactModule.useSignalState(UseMemoResult1.data)
	local UseSignalStateResult1 = SignalsReactModule.useSignalState(UseMemoResult1.status)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseScrollToTopAfterRestoreModuleResult = UseScrollToTopAfterRestoreModule()
	local UseSignalStateResult2 = SignalsReactModule.useSignalState((ReactModule.useCallback(function(p6): boolean
		-- upvalues: GetPlaytestLoadingStoreModule (upval), p5 (copy)
		return GetPlaytestLoadingStoreModule(p6).getAgentStatusForPlaceId(p5.placeId)(p6) == "Loading"
	end, { p5.placeId })))
	local UseMemoResult2 = ReactModule.useMemo(function()
		-- upvalues: mapHistoryToEntries (upval), UseSignalStateResult (copy), UseLocalizationResult (copy)
		return (mapHistoryToEntries(UseSignalStateResult, UseLocalizationResult))
	end, { UseSignalStateResult, UseLocalizationResult })
	
	return ReactModule.createElement(VersionHistoryBottomSheetModule, {
		isOpen = p5.isOpen,
		entries = UseMemoResult2,
		statusText = if UseStateResult1 == nil then if UseSignalStateResult1 == DataStatus.NotReady then "Loading version history..." elseif UseSignalStateResult1 == DataStatus.Failed then "Version history couldn't load." elseif #UseMemoResult2 == 0 then "No version history yet." else nil else UseStateResult1,
		isRestoreDisabled = UseStateResult or UseSignalStateResult2,
		onClose = p5.onClose,
		onRestore = ReactModule.useCallback(function(p6)
			-- upvalues: UseStateResult (copy), UseSignalStateResult2 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), RollbackPlaceWithRetryModule (upval), p5 (copy), UseScrollToTopAfterRestoreModuleResult (copy)
			if not UseStateResult and not UseSignalStateResult2 then
				UseStateResult2(true)
				UseStateResult2_1(nil)
				RollbackPlaceWithRetryModule(p5.placeId, p6.versionNumber, {
					debugSource = "version_history restore",
					note = { title = p6.noteTitle, description = p6.noteDescription }
				}):andThen(function()
					-- upvalues: UseScrollToTopAfterRestoreModuleResult (upval)
					UseScrollToTopAfterRestoreModuleResult.scrollToTopAfterRestore()
				end):catch(function(_)
					-- upvalues: UseStateResult2_1 (upval)
					UseStateResult2_1("Couldn't restore this version. Try again.")
				end):finally(function()
					-- upvalues: UseStateResult2 (upval)
					UseStateResult2(false)
				end)
				
				return
			end
		end, {
			UseStateResult,
			UseSignalStateResult2,
			UseScrollToTopAfterRestoreModuleResult,
			UseMemoResult,
			p5.placeId
		}),
		scrollingFrameRef = UseScrollToTopAfterRestoreModuleResult.scrollingFrameRef,
		testId = p5.testId
	})
end