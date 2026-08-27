local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildVersionHistoryUpdatesModule = require(buildExperience.Flags.FFlagBuildVersionHistoryUpdates)
local latestVersionCardViewModule = require(script.Parent.LatestVersionCard.LatestVersionCardView)
local liveVersionCardViewModule = require(script.Parent.LiveVersionCard.LiveVersionCardView)
local restoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local versionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local versionHistorySectionModule = require(script.Parent.VersionHistorySection)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var1 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local checkbox = foundationModule.Checkbox
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useScaledValue = foundationModule.Hooks.useScaledValue
local var2 = if fFlagBuildVersionHistoryUpdatesModule then localizationStringsModule.VERSION_HISTORY_VERSIONS_TITLE else localizationStringsModule.VERSION_HISTORY_TITLE

local function VersionHistoryContent(p1)
	-- upvalues: fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var1 (ref), reactModule (ref), sheet (ref)
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var1("LuaApp_Build_VersionHistory_Scroll", p1.scrollingFrameRef)
	end
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), var2 (ref), fFlagBuildAgentRollbackModule (ref), fFlagBuildVersionHistoryUpdatesModule (ref), latestVersionCardViewModule (ref), versionHistoryUtilsModule (ref), versionHistoryCardModule (ref), view (ref), checkbox (ref), text (ref), useScaledValue (ref), versionHistorySectionModule (ref), liveVersionCardViewModule (ref), sheet (ref), VersionHistoryContent (ref), restoreVersionDialogModule (ref)
	local VERSION_HISTORY_HIDE_AUTOSAVED, var3
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var4, var5 = reactModule.useState(nil)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = reactModule.useState(true)
	local var10 = if fFlagBuildLocalization then useLocalization({
		allVersions = localizationStringsModule.VERSION_HISTORY_ALL_VERSIONS,
		hideAutosaved = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		published = localizationStringsModule.VERSION_HISTORY_PUBLISHED,
		title = var2
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_HIDE_AUTOSAVED = var10.hideAutosaved
		var3 = var10.title
	else
		VERSION_HISTORY_HIDE_AUTOSAVED = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED
		var3 = var2
	end
	local var11 = reactModule.useCallback(function()
		-- upvalues: var5 (ref), p1 (ref)
		var5(nil)
		p1.onClose()
	end, { p1.onClose })
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: var5 (ref)
		var5(p2)
	end, {})
	local t = {
		AutosaveFilter = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Checkbox = reactModule.createElement(checkbox, {
				label = VERSION_HISTORY_HIDE_AUTOSAVED,
				isChecked = var8,
				onActivated = var9,
				testId = `{testId}-autosave-filter`
			})
		}),
		Status = if p1.statusText then reactModule.createElement(text, {
			LayoutOrder = 2,
			tag = "size-full-0 auto-y padding-bottom-medium text-body-medium text-wrap text-align-x-left content-default",
			Text = p1.statusText
		}) else nil,
		Cards = reactModule.createElement(view, {
			LayoutOrder = 3,
			tag = "col gap-medium size-full-0 auto-y padding-bottom-large"
		}, reactModule.useMemo(function()
			-- upvalues: fFlagBuildVersionHistoryUpdatesModule (copy), p1 (ref), reactModule (copy), latestVersionCardViewModule (copy), fFlagBuildLocalization (copy), var8 (ref), versionHistoryUtilsModule (copy), testId (ref), versionHistoryCardModule (copy), var12 (ref)
			local t = {}
			local var13 = fFlagBuildVersionHistoryUpdatesModule and p1.latestVersion ~= nil
			
			if var13 then
				t.LatestVersionCard = reactModule.createElement(latestVersionCardViewModule, p1.latestVersion)
			end
			for i, v in p1.entries do
				if not var13 or i ~= 1 then
					local _ = nil
					
					if if fFlagBuildLocalization then if var8 then not v.isAutosaved else not var8 else versionHistoryUtilsModule.shouldShowEntry(v.badgeText, var8) then
						t[v.id] = reactModule.createElement(versionHistoryCardModule, {
							layoutOrder = i,
							versionLabel = v.versionLabel,
							title = v.title,
							description = v.description,
							badgeText = v.badgeText,
							isRestoreDisabled = p1.isRestoreDisabled,
							onRestore = function()
								-- upvalues: var12 (copy), v (ref)
								var12(v)
							end,
							testId = `{testId}-card-{v.id}`
						})
					end
				end
			end
			return t
		end, {
			p1.entries, p1.isRestoreDisabled, p1.latestVersion, var8, var12, testId
		}))
	}
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = var11,
			testId = testId
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = var3,
					tag = {
						["shrink auto-xy text-wrap text-align-x-left content-emphasis"] = true,
						["text-heading-small"] = not fFlagBuildVersionHistoryUpdatesModule,
						["text-heading-medium"] = fFlagBuildVersionHistoryUpdatesModule
					}
				})
			}),
			Content = reactModule.createElement(VersionHistoryContent, { scrollingFrameRef = scrollingFrameRef }, if fFlagBuildVersionHistoryUpdatesModule then {
				Sections = reactModule.createElement(view, {
					tag = "col size-full-0 auto-y",
					layout = {
						FillDirection = Enum.FillDirection.Vertical,
						Padding = UDim.new(0, useScaledValue(32))
					},
					testId = `{testId}-sections`
				}, {
					Published = if p1.liveVersion then reactModule.createElement(versionHistorySectionModule, {
						layoutOrder = 1,
						title = if fFlagBuildLocalization then var10.published else localizationStringsModule.VERSION_HISTORY_PUBLISHED,
						testId = `{testId}-published`
					}, {
						LiveVersionCard = reactModule.createElement(liveVersionCardViewModule, p1.liveVersion)
					}) else nil,
					AllVersions = reactModule.createElement(versionHistorySectionModule, {
						layoutOrder = 2,
						title = if fFlagBuildLocalization then var10.allVersions else localizationStringsModule.VERSION_HISTORY_ALL_VERSIONS,
						testId = `{testId}-all-versions`
					}, t)
				})
			} else t)
		}),
		RestoreDialog = if var4 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var4.versionLabel,
			description = var4.description,
			isLoading = if fFlagBuildAgentRollbackModule then var6 else nil,
			onRestore = reactModule.useCallback(function()
				-- upvalues: var4 (ref), fFlagBuildAgentRollbackModule (copy), var5 (ref), p1 (ref), var6 (ref), var7 (ref)
				if var4 == nil then return end
				if fFlagBuildAgentRollbackModule then
					if p1.isRestoreDisabled or var6 then return end
					var7(true)
					local var14 = p1.onRestore(var4)
					
					if var14 == nil then
						var7(false)
						
						return
					end
					var14:andThen(function()
						-- upvalues: var7 (copy), var5 (copy), p1 (copy)
						var7(false)
						var5(nil)
						
						if p1.onRestoreStarted ~= nil then
							p1.onRestoreStarted()
						end
					end):catch(function()
						-- upvalues: var7 (copy)
						var7(false)
					end)
					
					return
				else
					var5(nil)
					
					if p1.isRestoreDisabled then
						return
					end
					p1.onRestore(var4)
				end
			end, {
				var4,
				p1.isRestoreDisabled,
				p1.onRestore,
				p1.onRestoreStarted,
				var6
			}),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var6 (ref), var5 (ref)
				if var6 then
					return
				end
				var5(nil)
			end, { var6 })
		}) else nil
	})
end