local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local LocalizationStringsModule = require(BuildExperience.LocalizationStrings)
local FIntBuildExperienceVersionHistoryLoadMoreViewportPercentModule = require(BuildExperience.Flags.FIntBuildExperienceVersionHistoryLoadMoreViewportPercent)
local LatestVersionCardViewModule = require(script.Parent.LatestVersionCard.LatestVersionCardView)
local LiveVersionCardViewModule = require(script.Parent.LiveVersionCard.LiveVersionCardView)
local RestoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local VersionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local VersionHistorySectionModule = require(script.Parent.VersionHistorySection)
local UseScrollEndReachedModule = require(script.Parent.useScrollEndReached)
local UseScrollPerformanceTrackerModule = require(BuildExperience.Telemetry.useScrollPerformanceTracker)
local Checkbox = FoundationModule.Checkbox
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseScaledValueFunction = FoundationModule.Hooks.useScaledValue
local VERSIONHISTORYVERSIONSTITLE = LocalizationStringsModule.VERSION_HISTORY_VERSIONS_TITLE

local function VersionHistoryContent(p1)
	-- upvalues: UseScrollPerformanceTrackerModule (copy), UseScrollEndReachedModule (copy), FIntBuildExperienceVersionHistoryLoadMoreViewportPercentModule (copy), ReactModule (copy), Sheet (copy)
	UseScrollPerformanceTrackerModule("LuaApp_Build_VersionHistory_Scroll", p1.scrollingFrameRef)
	UseScrollEndReachedModule(p1.scrollingFrameRef, FIntBuildExperienceVersionHistoryLoadMoreViewportPercentModule / 100, p1.onEndReached)
	
	return ReactModule.createElement(Sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), LocalizationStringsModule (copy), VERSIONHISTORYVERSIONSTITLE (copy), LatestVersionCardViewModule (copy), VersionHistoryCardModule (copy), View (copy), Checkbox (copy), Text (copy), UseScaledValueFunction (copy), VersionHistorySectionModule (copy), LiveVersionCardViewModule (copy), Sheet (copy), VersionHistoryContent (copy), RestoreVersionDialogModule (copy)
	local TestId = p1.testId or "version-history-bottom-sheet"
	local UseRefResult = ReactModule.useRef(nil)
	local ScrollingFrameRef = p1.scrollingFrameRef or UseRefResult
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
	local UseLocalizationResult = UseLocalizationFunction({
		allVersions = LocalizationStringsModule.VERSION_HISTORY_ALL_VERSIONS,
		hideAutosaved = LocalizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		published = LocalizationStringsModule.VERSION_HISTORY_PUBLISHED,
		title = VERSIONHISTORYVERSIONSTITLE
	})
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(p2)
	end, {})
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult1 (copy), UseStateResult2 (copy)
		if not UseStateResult1 then
			UseStateResult2(nil)
			
			return
		end
	end, { UseStateResult1 })
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseStateResult (copy), p1 (copy), UseStateResult1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy)
		if UseStateResult == nil then return end
		if p1.isRestoreDisabled or UseStateResult1 then return end
		UseStateResult2_1(true)
		local OnRestoreResult = p1.onRestore(UseStateResult)
		
		if OnRestoreResult == nil then
			UseStateResult2_1(false)
			
			return
		else
			OnRestoreResult:andThen(function()
				-- upvalues: UseStateResult2_1 (upval), UseStateResult2 (upval), p1 (upval)
				UseStateResult2_1(false)
				UseStateResult2(nil)
				
				if p1.onRestoreStarted ~= nil then
					p1.onRestoreStarted()
				end
			end):catch(function()
				-- upvalues: UseStateResult2_1 (upval)
				UseStateResult2_1(false)
			end)
		end
	end, {
		UseStateResult,
		p1.isRestoreDisabled,
		p1.onRestore,
		p1.onRestoreStarted,
		UseStateResult1
	})
	local Published = UseLocalizationResult.published
	
	return ReactModule.createElement(ReactModule.Fragment, nil, {
		Sheet = ReactModule.createElement(Sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = ReactModule.useCallback(function()
				-- upvalues: UseStateResult2 (copy), p1 (copy)
				UseStateResult2(nil)
				p1.onClose()
			end, { p1.onClose }),
			testId = TestId
		}, {
			Header = ReactModule.createElement(Sheet.Header, { hasCloseAffordance = true }, {
				Title = ReactModule.createElement(Text, {
					LayoutOrder = 1,
					Text = UseLocalizationResult.title,
					tag = {
						["shrink auto-xy text-wrap text-align-x-left content-emphasis"] = true,
						["text-heading-medium"] = true
					}
				})
			}),
			Content = ReactModule.createElement(VersionHistoryContent, {
				scrollingFrameRef = ScrollingFrameRef,
				onEndReached = p1.onEndReached
			}, {
				Sections = ReactModule.createElement(View, {
					tag = "col size-full-0 auto-y",
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, (UseScaledValueFunction(32)))
					},
					testId = `{TestId}-sections`
				}, {
					Published = if p1.liveVersion then ReactModule.createElement(VersionHistorySectionModule, {
						layoutOrder = 1,
						title = Published,
						testId = `{TestId}-published`
					}, {
						LiveVersionCard = ReactModule.createElement(LiveVersionCardViewModule, p1.liveVersion)
					}) else nil,
					AllVersions = ReactModule.createElement(VersionHistorySectionModule, {
						layoutOrder = 2,
						title = UseLocalizationResult.allVersions,
						testId = `{TestId}-all-versions`
					}, {
						AutosaveFilter = ReactModule.createElement(View, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
							Checkbox = ReactModule.createElement(Checkbox, {
								label = UseLocalizationResult.hideAutosaved,
								isChecked = UseStateResult3,
								onActivated = UseStateResult2_2,
								testId = `{TestId}-autosave-filter`
							})
						}),
						Status = if p1.statusText then ReactModule.createElement(Text, {
							LayoutOrder = 2,
							tag = "size-full-0 auto-y padding-bottom-medium text-body-medium text-wrap text-align-x-left content-default",
							Text = p1.statusText
						}) else nil,
						Cards = ReactModule.createElement(View, {
							LayoutOrder = 3,
							tag = "col gap-medium size-full-0 auto-y padding-bottom-large"
						}, (ReactModule.useMemo(function()
							-- upvalues: p1 (copy), ReactModule (upval), LatestVersionCardViewModule (upval), UseStateResult3 (copy), TestId (copy), VersionHistoryCardModule (upval), UseResult (copy)
							local Elements = {}
							local HasLatestVersion = p1.latestVersion ~= nil
							
							if HasLatestVersion then
								Elements.LatestVersionCard = ReactModule.createElement(LatestVersionCardViewModule, p1.latestVersion)
							end
							for LayoutOrder, entry in p1.entries do
								if (not HasLatestVersion or LayoutOrder ~= 1) and (not UseStateResult3 or not entry.isAutosaved) then
									Elements[entry.id] = ReactModule.createElement(VersionHistoryCardModule, {
										layoutOrder = LayoutOrder,
										versionLabel = entry.versionLabel,
										title = entry.title,
										description = entry.description,
										badgeText = entry.badgeText,
										isRestoreDisabled = p1.isRestoreDisabled,
										onRestore = function()
											-- upvalues: UseResult (upval), entry (copy)
											UseResult(entry)
										end,
										testId = `{TestId}-card-{entry.id}`
									})
								end
							end
							return Elements
						end, {
							p1.entries, p1.isRestoreDisabled, p1.latestVersion, UseStateResult3, UseResult,
							TestId
						})))
					})
				})
			})
		}),
		RestoreDialog = if UseStateResult then ReactModule.createElement(RestoreVersionDialogModule, {
			isOpen = true,
			title = UseStateResult.versionLabel,
			description = UseStateResult.description,
			isLoading = UseStateResult1,
			onRestore = UseResult2,
			onCancel = UseResult1
		}) else nil
	})
end