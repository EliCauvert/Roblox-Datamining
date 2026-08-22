local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local restoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local versionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var9 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local checkbox = foundationModule.Checkbox
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

local function VersionHistoryContent(p0) --[[ line: 48 ]]
	-- upvalues: fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var9 (ref), reactModule (ref), sheet (ref)
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var9("LuaApp_Build_VersionHistory_Scroll", p0.scrollingFrameRef)
	end
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p0.scrollingFrameRef }, p0.children)
end

return function(p1) --[[ line: 62 | named "VersionHistoryBottomSheet" ]]
	-- upvalues: reactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), versionHistoryUtilsModule (ref), versionHistoryCardModule (ref), sheet (ref), text (ref), VersionHistoryContent (ref), view (ref), checkbox (ref), restoreVersionDialogModule (ref)
	local VERSION_HISTORY_HIDE_AUTOSAVED, VERSION_HISTORY_TITLE
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var13, var14 = reactModule.useState(nil)
	local var15, var16 = reactModule.useState(true)
	local var17 = if fFlagBuildLocalization then useLocalization({
		hideAutosaved = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		title = localizationStringsModule.VERSION_HISTORY_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_HIDE_AUTOSAVED = var17.hideAutosaved
		VERSION_HISTORY_TITLE = var17.title
	else
		VERSION_HISTORY_HIDE_AUTOSAVED = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED
		VERSION_HISTORY_TITLE = localizationStringsModule.VERSION_HISTORY_TITLE
	end
	local var18 = reactModule.useCallback(function(p2) --[[ line: 89 ]]
		-- upvalues: var14 (ref)
		var14(p2)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = reactModule.useCallback(function() --[[ line: 84 ]]
				-- upvalues: var14 (ref), p1 (ref)
				var14(nil)
				p1.onClose()
			end, { p1.onClose }),
			testId = testId
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = VERSION_HISTORY_TITLE
				})
			}),
			Content = reactModule.createElement(VersionHistoryContent, { scrollingFrameRef = scrollingFrameRef }, {
				AutosaveFilter = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
					Checkbox = reactModule.createElement(checkbox, {
						label = VERSION_HISTORY_HIDE_AUTOSAVED,
						isChecked = var15,
						onActivated = var16,
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
				}, reactModule.useMemo(function() --[[ line: 105 ]]
					-- upvalues: p1 (ref), fFlagBuildLocalization (copy), var15 (ref), versionHistoryUtilsModule (copy), testId (ref), reactModule (copy), versionHistoryCardModule (copy), var18 (ref)
					local t = {}
					
					for i, v in p1.entries do
						local _ = nil
						
						if if fFlagBuildLocalization then if var15 then not v.isAutosaved else not var15 else versionHistoryUtilsModule.shouldShowEntry(v.badgeText, var15) then
							t[v.id] = reactModule.createElement(versionHistoryCardModule, {
								layoutOrder = i,
								versionLabel = v.versionLabel,
								title = v.title,
								description = v.description,
								badgeText = v.badgeText,
								isRestoreDisabled = p1.isRestoreDisabled,
								onRestore = function() --[[ line: 123 ]]
									-- upvalues: var18 (copy), v (ref)
									var18(v)
								end,
								testId = `{testId}-card-{v.id}`
							})
						end
					end
					return t
				end, {
					p1.entries,
					p1.isRestoreDisabled,
					var15,
					var18,
					testId
				}))
			})
		}),
		RestoreDialog = if var13 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var13.versionLabel,
			description = var13.description,
			onRestore = reactModule.useCallback(function() --[[ line: 97 ]]
				-- upvalues: var13 (ref), p1 (ref), var14 (ref)
				if var13 and not p1.isRestoreDisabled then
					p1.onRestore(var13)
				end
				var14(nil)
			end, { var13, p1.isRestoreDisabled, p1.onRestore }),
			onCancel = reactModule.useCallback(function() --[[ line: 93 ]]
				-- upvalues: var14 (ref)
				var14(nil)
			end, {})
		}) else nil
	})
end