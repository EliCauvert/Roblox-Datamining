local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
local fFlagBuildVersionHistoryUpdatesModule = require(buildExperience.Flags.FFlagBuildVersionHistoryUpdates)
local latestVersionCardViewModule = require(script.Parent.LatestVersionCard.LatestVersionCardView)
local liveVersionCardViewModule = require(script.Parent.LiveVersionCard.LiveVersionCardView)
local restoreVersionDialogModule = require(script.Parent.RestoreVersionDialog)
local versionHistoryCardModule = require(script.Parent.VersionHistoryCard)
local versionHistorySectionModule = require(script.Parent.VersionHistorySection)
local useScrollPerformanceTrackerModule = require(buildExperience.Telemetry.useScrollPerformanceTracker)
local checkbox = foundationModule.Checkbox
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local useScaledValue = foundationModule.Hooks.useScaledValue
local var1 = if fFlagBuildVersionHistoryUpdatesModule then localizationStringsModule.VERSION_HISTORY_VERSIONS_TITLE else localizationStringsModule.VERSION_HISTORY_TITLE

local function VersionHistoryContent(p1)
	-- upvalues: useScrollPerformanceTrackerModule (ref), reactModule (ref), sheet (ref)
	useScrollPerformanceTrackerModule("LuaApp_Build_VersionHistory_Scroll", p1.scrollingFrameRef)
	
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), localizationStringsModule (ref), var1 (ref), fFlagBuildAgentRollbackModule (ref), fFlagBuildVersionHistoryUpdatesModule (ref), latestVersionCardViewModule (ref), versionHistoryCardModule (ref), view (ref), checkbox (ref), text (ref), useScaledValue (ref), versionHistorySectionModule (ref), liveVersionCardViewModule (ref), sheet (ref), VersionHistoryContent (ref), restoreVersionDialogModule (ref)
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var2, var3 = reactModule.useState(nil)
	local var4, var5 = reactModule.useState(false)
	local var6, var7 = reactModule.useState(true)
	local var8 = useLocalization({
		allVersions = localizationStringsModule.VERSION_HISTORY_ALL_VERSIONS,
		hideAutosaved = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		published = localizationStringsModule.VERSION_HISTORY_PUBLISHED,
		title = var1
	})
	local hideAutosaved = var8.hideAutosaved
	local title = var8.title
	local var9 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), p1 (ref)
		var3(nil)
		p1.onClose()
	end, { p1.onClose })
	local var10 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref)
		var3(p2)
	end, {})
	local t = {
		AutosaveFilter = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
			Checkbox = reactModule.createElement(checkbox, {
				label = hideAutosaved,
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
			-- upvalues: fFlagBuildVersionHistoryUpdatesModule (copy), p1 (ref), reactModule (copy), latestVersionCardViewModule (copy), var6 (ref), testId (ref), versionHistoryCardModule (copy), var10 (ref)
			local t = {}
			local var11 = fFlagBuildVersionHistoryUpdatesModule and p1.latestVersion ~= nil
			
			if var11 then
				t.LatestVersionCard = reactModule.createElement(latestVersionCardViewModule, p1.latestVersion)
			end
			for i, v in p1.entries do
				if (not var11 or i ~= 1) and (not var6 or not v.isAutosaved) then
					t[v.id] = reactModule.createElement(versionHistoryCardModule, {
						layoutOrder = i,
						versionLabel = v.versionLabel,
						title = v.title,
						description = v.description,
						badgeText = v.badgeText,
						isRestoreDisabled = p1.isRestoreDisabled,
						onRestore = function()
							-- upvalues: var10 (copy), v (ref)
							var10(v)
						end,
						testId = `{testId}-card-{v.id}`
					})
				end
			end
			return t
		end, {
			p1.entries, p1.isRestoreDisabled, p1.latestVersion, var6, var10, testId
		}))
	}
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = var9,
			testId = testId
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = title,
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
						title = var8.published,
						testId = `{testId}-published`
					}, {
						LiveVersionCard = reactModule.createElement(liveVersionCardViewModule, p1.liveVersion)
					}) else nil,
					AllVersions = reactModule.createElement(versionHistorySectionModule, {
						layoutOrder = 2,
						title = var8.allVersions,
						testId = `{testId}-all-versions`
					}, t)
				})
			} else t)
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
					local var12 = p1.onRestore(var2)
					
					if var12 == nil then
						var5(false)
						
						return
					end
					var12:andThen(function()
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
					p1.onRestore(var2)
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