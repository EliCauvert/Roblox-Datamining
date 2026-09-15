local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local useLocalization = require(parent.Localization).Hooks.useLocalization
local localizationStringsModule = require(buildExperience.LocalizationStrings)
local fFlagBuildAgentRollbackModule = require(buildExperience.Flags.FFlagBuildAgentRollback)
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
local VERSION_HISTORY_VERSIONS_TITLE = localizationStringsModule.VERSION_HISTORY_VERSIONS_TITLE

local function VersionHistoryContent(p1)
	-- upvalues: useScrollPerformanceTrackerModule (ref), reactModule (ref), sheet (ref)
	useScrollPerformanceTrackerModule("LuaApp_Build_VersionHistory_Scroll", p1.scrollingFrameRef)
	
	return reactModule.createElement(sheet.Content, { scrollingFrameRef = p1.scrollingFrameRef }, p1.children)
end

return function(p1)
	-- upvalues: reactModule (ref), useLocalization (ref), localizationStringsModule (ref), VERSION_HISTORY_VERSIONS_TITLE (ref), fFlagBuildAgentRollbackModule (ref), latestVersionCardViewModule (ref), versionHistoryCardModule (ref), view (ref), checkbox (ref), text (ref), useScaledValue (ref), versionHistorySectionModule (ref), liveVersionCardViewModule (ref), sheet (ref), VersionHistoryContent (ref), restoreVersionDialogModule (ref)
	local testId = p1.testId or "version-history-bottom-sheet"
	local scrollingFrameRef = p1.scrollingFrameRef or reactModule.useRef(nil)
	local var1, var2 = reactModule.useState(nil)
	local var3, var4 = reactModule.useState(false)
	local var5, var6 = reactModule.useState(true)
	local var7 = useLocalization({
		allVersions = localizationStringsModule.VERSION_HISTORY_ALL_VERSIONS,
		hideAutosaved = localizationStringsModule.VERSION_HISTORY_HIDE_AUTOSAVED,
		published = localizationStringsModule.VERSION_HISTORY_PUBLISHED,
		title = VERSION_HISTORY_VERSIONS_TITLE
	})
	local var8 = reactModule.useCallback(function(p2)
		-- upvalues: var2 (ref)
		var2(p2)
	end, {})
	
	return reactModule.createElement(reactModule.Fragment, nil, {
		Sheet = reactModule.createElement(sheet.Root, {
			defaultSnapPointIndex = 2,
			isOpen = p1.isOpen == nil or p1.isOpen,
			snapPoints = { 0.5, 1 },
			onClose = reactModule.useCallback(function()
				-- upvalues: var2 (ref), p1 (ref)
				var2(nil)
				p1.onClose()
			end, { p1.onClose }),
			testId = testId
		}, {
			Header = reactModule.createElement(sheet.Header, { hasCloseAffordance = true }, {
				Title = reactModule.createElement(text, {
					LayoutOrder = 1,
					Text = var7.title,
					tag = {
						["shrink auto-xy text-wrap text-align-x-left content-emphasis"] = true,
						["text-heading-medium"] = true
					}
				})
			}),
			Content = reactModule.createElement(VersionHistoryContent, { scrollingFrameRef = scrollingFrameRef }, {
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
						title = var7.published,
						testId = `{testId}-published`
					}, {
						LiveVersionCard = reactModule.createElement(liveVersionCardViewModule, p1.liveVersion)
					}) else nil,
					AllVersions = reactModule.createElement(versionHistorySectionModule, {
						layoutOrder = 2,
						title = var7.allVersions,
						testId = `{testId}-all-versions`
					}, {
						AutosaveFilter = reactModule.createElement(view, { LayoutOrder = 1, tag = "row size-full-0 auto-y" }, {
							Checkbox = reactModule.createElement(checkbox, {
								label = var7.hideAutosaved,
								isChecked = var5,
								onActivated = var6,
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
							-- upvalues: p1 (ref), reactModule (copy), latestVersionCardViewModule (copy), var5 (ref), testId (ref), versionHistoryCardModule (copy), var8 (ref)
							local t = {}
							local var9 = p1.latestVersion ~= nil
							
							if var9 then
								t.LatestVersionCard = reactModule.createElement(latestVersionCardViewModule, p1.latestVersion)
							end
							for i, v in p1.entries do
								if (not var9 or i ~= 1) and (not var5 or not v.isAutosaved) then
									t[v.id] = reactModule.createElement(versionHistoryCardModule, {
										layoutOrder = i,
										versionLabel = v.versionLabel,
										title = v.title,
										description = v.description,
										badgeText = v.badgeText,
										isRestoreDisabled = p1.isRestoreDisabled,
										onRestore = function()
											-- upvalues: var8 (copy), v (ref)
											var8(v)
										end,
										testId = `{testId}-card-{v.id}`
									})
								end
							end
							return t
						end, {
							p1.entries, p1.isRestoreDisabled, p1.latestVersion, var5, var8, testId
						}))
					})
				})
			})
		}),
		RestoreDialog = if var1 then reactModule.createElement(restoreVersionDialogModule, {
			isOpen = true,
			title = var1.versionLabel,
			description = var1.description,
			isLoading = if fFlagBuildAgentRollbackModule then var3 else nil,
			onRestore = reactModule.useCallback(function()
				-- upvalues: var1 (ref), fFlagBuildAgentRollbackModule (copy), var2 (ref), p1 (ref), var3 (ref), var4 (ref)
				if var1 == nil then return end
				if fFlagBuildAgentRollbackModule then
					if p1.isRestoreDisabled or var3 then return end
					var4(true)
					local var10 = p1.onRestore(var1)
					
					if var10 == nil then
						var4(false)
						
						return
					end
					var10:andThen(function()
						-- upvalues: var4 (copy), var2 (copy), p1 (copy)
						var4(false)
						var2(nil)
						
						if p1.onRestoreStarted ~= nil then
							p1.onRestoreStarted()
						end
					end):catch(function()
						-- upvalues: var4 (copy)
						var4(false)
					end)
					
					return
				else
					var2(nil)
					
					if p1.isRestoreDisabled then
						return
					end
					p1.onRestore(var1)
				end
			end, {
				var1,
				p1.isRestoreDisabled,
				p1.onRestore,
				p1.onRestoreStarted,
				var3
			}),
			onCancel = reactModule.useCallback(function()
				-- upvalues: var3 (ref), var2 (ref)
				if var3 then
					return
				end
				var2(nil)
			end, { var3 })
		}) else nil
	})
end