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
local var1 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local checkbox = foundationModule.Checkbox
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

local function VersionHistoryContent(p1)
	-- upvalues: fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var1 (ref), reactModule (ref), sheet (ref)
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var1("LuaApp_Build_VersionHistory_Scroll", p1.scrollingFrameRef)
	end
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: reactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), versionHistoryUtilsModule (ref), versionHistoryCardModule (ref), sheet (ref), text (ref), VersionHistoryContent (ref), view (ref), checkbox (ref), restoreVersionDialogModule (ref)
	local VERSION_HISTORY_HIDE_AUTOSAVED, VERSION_HISTORY_TITLE
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(true)
	local var6 = if fFlagBuildLocalization then useLocalization({
		hideAutosaved = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		title = localizationStringsModule.VERSION_HISTORY_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_HIDE_AUTOSAVED = var6.hideAutosaved
		VERSION_HISTORY_TITLE = var6.title
	else
		VERSION_HISTORY_HIDE_AUTOSAVED = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED
		VERSION_HISTORY_TITLE = localizationStringsModule.VERSION_HISTORY_TITLE
	end
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = reactModule.useCallback(function()
				-- upvalues: var3 (ref), p1 (ref)
				var3(nil)
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
						isChecked = var4,
						onActivated = var5,
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
					-- upvalues: p1 (ref), fFlagBuildLocalization (copy), var4 (ref), versionHistoryUtilsModule (copy), testId (ref), reactModule (copy), versionHistoryCardModule (copy), var7 (ref)
					local t = {}
					
					for i, v in p1.entries do
						local _ = nil
						
						if if fFlagBuildLocalization then if var4 then not v.isAutosaved else not var4 else versionHistoryUtilsModule.shouldShowEntry(v.badgeText, var4) then
							t[v.id] = reactModule.createElement(versionHistoryCardModule, {
								layoutOrder = i,
								versionLabel = v.versionLabel,
								title = v.title,
								description = v.description,
								badgeText = v.badgeText,
								isRestoreDisabled = p1.isRestoreDisabled,
								onRestore = function()
									-- upvalues: var7 (copy), v (ref)
									var7(v)
								end,
								testId = `{testId}-card-{v.id}`
							})
						end
					end
					return t
				end, {
					p1.entries,
					p1.isRestoreDisabled,
					var4,
					var7,
					testId
				}))
			})
		}),
		RestoreDialog = if var2 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var2.versionLabel,
			description = var2.description,
			onRestore = reactModule.useCallback(function()
				-- upvalues: var2 (ref), p1 (ref), var3 (ref)
				if var2 and not p1.isRestoreDisabled then
					p1.onRestore(var2)
				end
				var3(nil)
			end, { var2, p1.isRestoreDisabled, p1.onRestore }),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var3 (ref)
				var3(nil)
			end, {})
		}) else nil
	})
end