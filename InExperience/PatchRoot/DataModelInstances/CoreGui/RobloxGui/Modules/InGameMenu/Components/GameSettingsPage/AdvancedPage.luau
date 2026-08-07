local coreGuiService = game:GetService("CoreGui")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local onScreenProfilerEnabledPropertyChangedSignal = userGameSettingsService:GetPropertyChangedSignal("OnScreenProfilerEnabled")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local withFoundationOrUIBloxStyle = require(corePackagesService.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local foundationModule = require(corePackagesService.Packages.Foundation)
local fFlagCoreUiMigrateUIBloxToFoundation = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagCoreUiMigrateUIBloxToFoundation
local var7 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var8 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
local devConsoleMasterModule = require(coreGuiService.RobloxGui.Modules.DevConsoleMaster)
local parent = script.Parent.Parent.Parent
local dividerModule = require(parent.Components.Divider)
local externalEventConnectionModule = require(parent.Utility.ExternalEventConnection)
local pageModule = require(script.Parent.Parent.Page)
local categoryHeaderModule = require(script.Parent.CategoryHeader)
local toggleEntryModule = require(script.Parent.ToggleEntry)
local versionReporterModule = require(script.Parent.VersionReporter)
local closeMenuModule = require(parent.Thunks.CloseMenu)
local focusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local withLocalizationModule = require(parent.Localization.withLocalization)
local sendAnalyticsModule = require(parent.Utility.SendAnalytics)
local constantsModule = require(parent.Resources.Constants)
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local advancedPage = roact.PureComponent:extend("AdvancedPage")
advancedPage.validateProps = t.strictInterface({
	canCaptureFocus = t.boolean,
	closeMenu = t.callback,
	pageTitle = t.string,
	currentPage = if getFFlagIGMGamepadSelectionHistoryModule() then t.string else nil,
	currentZone = getFFlagIGMGamepadSelectionHistoryModule() and t.optional(t.number) or nil
})

function advancedPage.init(p0) --[[ line: 60 ]]
	-- upvalues: userGameSettingsService (ref), roact (ref)
	p0:setState({
		microProfilerEnabled = userGameSettingsService.OnScreenProfilerEnabled,
		performanceStatsEnabled = userGameSettingsService.PerformanceStatsVisible
	})
	p0.backButtonRef = roact.createRef()
	p0.performanceToggleRef = roact.createRef()
end

if not getFFlagIGMGamepadSelectionHistoryModule() then
	function advancedPage.didUpdate(p1, p2) --[[ line: 71 ]]
		-- upvalues: guiService (ref)
		if p1.props.canCaptureFocus and not p2.canCaptureFocus then
			guiService.SelectedCoreObject = p1.performanceToggleRef:getValue()
		end
	end
end
function advancedPage.renderWithSelectionCursor(p3, p4) --[[ line: 78 ]]
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), pageModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), categoryHeaderModule (ref), toggleEntryModule (ref), userGameSettingsService (ref), sendAnalyticsModule (ref), withLocalizationModule (ref), var8 (ref), devConsoleMasterModule (ref), dividerModule (ref), versionReporterModule (ref), externalEventConnectionModule (ref), onScreenProfilerEnabledPropertyChangedSignal (ref)
	return withFoundationOrUIBloxStyle(function(p5) --[[ line: 79 ]]
		return {
			Theme = {
				TextEmphasis = {
					Color = p5.Color.Content.Emphasis.Color3,
					Transparency = p5.Color.Content.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Header2 = {
					Font = p5.Typography.TitleLarge.Font,
					RelativeSize = p5.Typography.TitleLarge.FontSize
				}
			}
		}
	end, function(p6) --[[ line: 89 ]]
		-- upvalues: roact (copy), pageModule (copy), p3 (ref), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), constantsModule (copy), guiService (copy), categoryHeaderModule (copy), toggleEntryModule (copy), userGameSettingsService (copy), sendAnalyticsModule (copy), withLocalizationModule (copy), p4 (ref), var8 (copy), devConsoleMasterModule (copy), dividerModule (copy), versionReporterModule (copy), externalEventConnectionModule (copy), onScreenProfilerEnabledPropertyChangedSignal (copy)
		return roact.createElement(pageModule, {
			zIndex = 2,
			pageTitle = p3.props.pageTitle,
			position = p3.props.position,
			buttonRef = p3.backButtonRef,
			NextSelectionDown = p3.performanceToggleRef
		}, {
			FocusHandler = getFFlagIGMGamepadSelectionHistoryModule() and (roact.createElement(focusHandlerModule, {
				isFocused = p3.props.canCaptureFocus,
				shouldForgetPreviousSelection = if p3.props.currentPage == constantsModule.advancedSettingsPageKey then p3.props.currentZone == 0 else true,
				didFocus = function(p7) --[[ line: 102 ]]
					-- upvalues: guiService (copy), p3 (copy)
					guiService.SelectedCoreObject = p7 or p3.performanceToggleRef:getValue()
				end
			}) or nil),
			Layout = roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			AdvancedHeader = roact.createElement(categoryHeaderModule, {
				LayoutOrder = 1,
				localizationKey = "CoreScripts.InGameMenu.GameSettings.AdvancedSettingsTitle"
			}),
			PerformanceStats = roact.createElement(toggleEntryModule, {
				LayoutOrder = 2,
				labelKey = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
				checked = p3.state.performanceStatsEnabled,
				onToggled = function() --[[ line: 120 ]]
					-- upvalues: userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.PerformanceStatsVisible = not userGameSettingsService.PerformanceStatsVisible
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end,
				buttonRef = p3.performanceToggleRef,
				NextSelectionUp = p3.backButtonRef
			}),
			MicroProfiler = roact.createElement(toggleEntryModule, {
				LayoutOrder = 3,
				labelKey = "CoreScripts.InGameMenu.GameSettings.ShowMicroProfiler",
				checked = p3.state.microProfilerEnabled,
				onToggled = function() --[[ line: 131 ]]
					-- upvalues: userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.OnScreenProfilerEnabled = not userGameSettingsService.OnScreenProfilerEnabled
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			}),
			DeveloperConsole = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
			})(function(p8) --[[ line: 138 ]]
				-- upvalues: roact (copy), p6 (ref), p4 (copy), var8 (copy), devConsoleMasterModule (copy), p3 (copy)
				return roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 54),
					Text = p8.text,
					TextColor3 = p6.Theme.TextEmphasis.Color,
					Font = p6.Font.Header2.Font,
					TextSize = p6.Font.Header2.RelativeSize * p6.Font.BaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					LayoutOrder = 4,
					SelectionImageObject = p4(var8.Square),
					[roact.Event.Activated] = function() --[[ line: 149 ]]
						-- upvalues: devConsoleMasterModule (copy), p3 (copy)
						devConsoleMasterModule:SetVisibility(true)
						p3.props.closeMenu()
					end
				}, {
					Padding = roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) })
				})
			end),
			Divider = roact.createElement(dividerModule, { LayoutOrder = 5, Size = UDim2.new(1, -24, 0, 1) }),
			VersionReporter = roact.createElement(versionReporterModule, { LayoutOrder = 6 }),
			MicroProfilerVisibilityListener = roact.createElement(externalEventConnectionModule, {
				event = onScreenProfilerEnabledPropertyChangedSignal,
				callback = function() --[[ line: 169 ]]
					-- upvalues: p3 (copy), userGameSettingsService (copy)
					p3:setState({
						microProfilerEnabled = userGameSettingsService.OnScreenProfilerEnabled
					})
				end
			}),
			PerformanceStatsVisibilityListener = roact.createElement(externalEventConnectionModule, {
				event = userGameSettingsService.PerformanceStatsVisibleChanged,
				callback = function() --[[ line: 177 ]]
					-- upvalues: p3 (copy), userGameSettingsService (copy)
					p3:setState({
						performanceStatsEnabled = userGameSettingsService.PerformanceStatsVisible
					})
				end
			})
		})
	end)
end

function advancedPage.render(p9) --[[ line: 187 ]]
	-- upvalues: var7 (ref)
	return var7(function(p10) --[[ line: 188 ]]
		-- upvalues: p9 (ref)
		return p9:renderWithSelectionCursor(p10)
	end)
end

return roactRodux.UNSTABLE_connect2(function(p11) --[[ line: 193 ]]
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p11.menuPage == "AdvancedGameSettings" and (p11.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p11.respawn.dialogOpen and p11.currentZone == 1)),
		currentPage = if getFFlagIGMGamepadSelectionHistoryModule() then p11.menuPage else nil,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p11.currentZone else nil
	}
end, function(p12) --[[ line: 209 ]]
	-- upvalues: closeMenuModule (ref)
	return {
		closeMenu = function() --[[ line: 211 ]]
			-- upvalues: p12 (ref), closeMenuModule (copy)
			p12(closeMenuModule)
		end
	}
end)(advancedPage)