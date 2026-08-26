local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local sharedFlagsModule = require(parent.SharedFlags)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildLocalization = sharedFlagsModule.FFlagBuildLocalization
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
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
	-- upvalues: reactModule (ref), fFlagBuildLocalization (ref), useLocalization (ref), localizationStringsModule (ref), fFlagBuildAgentRollbackModule (ref), versionHistoryUtilsModule (ref), versionHistoryCardModule (ref), sheet (ref), text (ref), VersionHistoryContent (ref), view (ref), checkbox (ref), restoreVersionDialogModule (ref)
	local VERSION_HISTORY_HIDE_AUTOSAVED, VERSION_HISTORY_TITLE
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	local var8 = if fFlagBuildLocalization then useLocalization({
		hideAutosaved = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		title = localizationStringsModule.VERSION_HISTORY_TITLE
	}) else nil
	local _ = nil
	local _ = nil
	
	if fFlagBuildLocalization then
		VERSION_HISTORY_HIDE_AUTOSAVED = var8.hideAutosaved
		VERSION_HISTORY_TITLE = var8.title
	else
		VERSION_HISTORY_HIDE_AUTOSAVED = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED
		VERSION_HISTORY_TITLE = localizationStringsModule.VERSION_HISTORY_TITLE
	end
	local var9 = reactModule.useCallback(function(p2)
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
						isChecked = var6,
						onActivated = var7,
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
					-- upvalues: p1 (ref), fFlagBuildLocalization (copy), var6 (ref), versionHistoryUtilsModule (copy), testId (ref), reactModule (copy), versionHistoryCardModule (copy), var9 (ref)
					local t = {}
					
					for i, v in p1.entries do
						local _ = nil
						
						if if fFlagBuildLocalization then if var6 then not v.isAutosaved else not var6 else versionHistoryUtilsModule.shouldShowEntry(v.badgeText, var6) then
							t[v.id] = reactModule.createElement(versionHistoryCardModule, {
								layoutOrder = i,
								versionLabel = v.versionLabel,
								title = v.title,
								description = v.description,
								badgeText = v.badgeText,
								isRestoreDisabled = p1.isRestoreDisabled,
								onRestore = function()
									-- upvalues: var9 (copy), v (ref)
									var9(v)
								end,
								testId = `{testId}-card-{v.id}`
							})
						end
					end
					return t
				end, {
					p1.entries,
					p1.isRestoreDisabled,
					var6,
					var9,
					testId
				}))
			})
		}),
		RestoreDialog = if var2 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var2.versionLabel,
			description = var2.description,
			isLoading = if fFlagBuildAgentRollbackModule then var4 else nil,
			onRestore = reactModule.useCallback(function()
				-- upvalues: var2 (ref), fFlagBuildAgentRollbackModule (copy), var3 (ref), p1 (ref), var4 (ref), var5 (ref)
				if var2 == nil then return end
				if fFlagBuildAgentRollbackModule then
					if p1.isRestoreDisabled or var4 then return end
					var5(true)
					local var10 = p1.onRestore(var10)
					
					if var10 == nil then
						var5(false)
						
						return
					end
					var10:andThen(function()
						-- upvalues: var5 (copy), var3 (copy), p1 (copy)
						var5(false)
						var3(nil)
						
						if p1.onRestoreStarted ~= nil then
							p1.onRestoreStarted()
						end
					end):catch(function()
						-- upvalues: var5 (copy)
						var5(false)
					end)
					
					return
				else
					var3(nil)
					
					if p1.isRestoreDisabled then
						return
					end
					p1.onRestore(var10)
				end
			end, {
				var2,
				p1.isRestoreDisabled,
				p1.onRestore,
				p1.onRestoreStarted,
				var4
			}),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var4 (ref), var3 (ref)
				if var4 then
					return
				end
				var3(nil)
			end, { var4 })
		}) else nil
	})
end