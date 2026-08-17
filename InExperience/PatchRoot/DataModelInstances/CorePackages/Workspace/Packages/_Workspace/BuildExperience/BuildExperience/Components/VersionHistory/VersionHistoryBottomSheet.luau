local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local restoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local versionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local versionHistoryUtilsModule = require(script.Parent.VersionHistoryUtils)
local fFlagEnableBuildExperienceScrollPerformanceTrackingModule = require(buildExperience.Flags.FFlagEnableBuildExperienceScrollPerformanceTracking)
local var8 = if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then require(buildExperience.Telemetry.useScrollPerformanceTracker) else nil
local checkbox = foundationModule.Checkbox
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View

local function VersionHistoryContent(p0) --[[ line: 44 ]]
	-- upvalues: fFlagEnableBuildExperienceScrollPerformanceTrackingModule (ref), var8 (ref), reactModule (ref), sheet (ref)
	if fFlagEnableBuildExperienceScrollPerformanceTrackingModule then
		var8("LuaApp_Build_VersionHistory_Scroll", p0.scrollingFrameRef)
	end
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p0.scrollingFrameRef }, p0.children)
end

return function(p1) --[[ line: 58 | named "VersionHistoryBottomSheet" ]]
	-- upvalues: reactModule (ref), versionHistoryUtilsModule (ref), versionHistoryCardModule (ref), sheet (ref), text (ref), localizationStringsModule (ref), VersionHistoryContent (ref), view (ref), checkbox (ref), restoreVersionDialogModule (ref)
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var12, var13 = reactModule.useState(nil)
	local var14, var15 = reactModule.useState(true)
	local var16 = reactModule.useCallback(function(p2) --[[ line: 70 ]]
		-- upvalues: var13 (ref)
		var13(p2)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = reactModule.useCallback(function() --[[ line: 65 ]]
				-- upvalues: var13 (ref), p1 (ref)
				var13(nil)
				p1.onClose()
			end, { p1.onClose }),
			testId = testId
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					tag = "shrink auto-xy text-heading-small text-wrap text-align-x-left content-emphasis",
					Text = localizationStringsModule.VERSION_HISTORY_TITLE
				})
			}),
			Content = reactModule.createElement(VersionHistoryContent, { scrollingFrameRef = scrollingFrameRef }, {
				AutosaveFilter = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
					Checkbox = reactModule.createElement(checkbox, {
						label = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
						isChecked = var14,
						onActivated = var15,
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
				}, reactModule.useMemo(function() --[[ line: 86 ]]
					-- upvalues: p1 (ref), versionHistoryUtilsModule (copy), var14 (ref), testId (ref), reactModule (copy), versionHistoryCardModule (copy), var16 (ref)
					local t = {}
					
					for i, v in p1.entries do
						if versionHistoryUtilsModule.shouldShowEntry(v.badgeText, var14) then
							t[v.id] = reactModule.createElement(versionHistoryCardModule, {
								layoutOrder = i,
								versionLabel = v.versionLabel,
								title = v.title,
								description = v.description,
								badgeText = v.badgeText,
								isRestoreDisabled = p1.isRestoreDisabled,
								onRestore = function() --[[ line: 98 ]]
									-- upvalues: var16 (copy), v (ref)
									var16(v)
								end,
								testId = `{testId}-card-{v.id}`
							})
						end
					end
					return t
				end, {
					p1.entries,
					p1.isRestoreDisabled,
					var14,
					var16,
					testId
				}))
			})
		}),
		RestoreDialog = if var12 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var12.versionLabel,
			description = var12.description,
			onRestore = reactModule.useCallback(function() --[[ line: 78 ]]
				-- upvalues: var12 (ref), p1 (ref), var13 (ref)
				if var12 and not p1.isRestoreDisabled then
					p1.onRestore(var12)
				end
				var13(nil)
			end, { var12, p1.isRestoreDisabled, p1.onRestore }),
			onCancel = reactModule.useCallback(function() --[[ line: 74 ]]
				-- upvalues: var13 (ref)
				var13(nil)
			end, {})
		}) else nil
	})
end