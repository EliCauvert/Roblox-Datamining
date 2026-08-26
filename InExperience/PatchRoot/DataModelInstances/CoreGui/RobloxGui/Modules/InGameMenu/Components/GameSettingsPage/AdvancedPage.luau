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
local var1 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.UNSTABLE.withCursorMigration else UIBlox.App.SelectionImage.withSelectionCursorProvider
local var2 = if fFlagCoreUiMigrateUIBloxToFoundation then foundationModule.Enums.CursorType else UIBlox.App.SelectionImage.CursorKind
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

function advancedPage.init(p1)
	-- upvalues: userGameSettingsService (ref), roact (ref)
	p1:setState({
		microProfilerEnabled = userGameSettingsService.OnScreenProfilerEnabled,
		performanceStatsEnabled = userGameSettingsService.PerformanceStatsVisible
	})
	p1.backButtonRef = roact.createRef()
	p1.performanceToggleRef = roact.createRef()
end

if not getFFlagIGMGamepadSelectionHistoryModule() then
	function advancedPage.didUpdate(p1, p2)
		-- upvalues: guiService (ref)
		if p1.props.canCaptureFocus and not p2.canCaptureFocus then
			guiService.SelectedCoreObject = p1.performanceToggleRef:getValue()
		end
	end
end
function advancedPage.renderWithSelectionCursor(p1, p2)
	-- upvalues: withFoundationOrUIBloxStyle (ref), roact (ref), pageModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), categoryHeaderModule (ref), toggleEntryModule (ref), userGameSettingsService (ref), sendAnalyticsModule (ref), withLocalizationModule (ref), var2 (ref), devConsoleMasterModule (ref), dividerModule (ref), versionReporterModule (ref), externalEventConnectionModule (ref), onScreenProfilerEnabledPropertyChangedSignal (ref)
	return withFoundationOrUIBloxStyle(function(p3)
		return {
			Theme = {
				TextEmphasis = {
					Color = p3.Color.Content.Emphasis.Color3,
					Transparency = p3.Color.Content.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Header2 = {
					Font = p3.Typography.TitleLarge.Font,
					RelativeSize = p3.Typography.TitleLarge.FontSize
				}
			}
		}
	end, function(p3)
		-- upvalues: roact (copy), pageModule (copy), p1 (ref), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), constantsModule (copy), guiService (copy), categoryHeaderModule (copy), toggleEntryModule (copy), userGameSettingsService (copy), sendAnalyticsModule (copy), withLocalizationModule (copy), p2 (ref), var2 (copy), devConsoleMasterModule (copy), dividerModule (copy), versionReporterModule (copy), externalEventConnectionModule (copy), onScreenProfilerEnabledPropertyChangedSignal (copy)
		return roact.createElement(pageModule, {
			zIndex = 2,
			pageTitle = p1.props.pageTitle,
			position = p1.props.position,
			buttonRef = p1.backButtonRef,
			NextSelectionDown = p1.performanceToggleRef
		}, {
			FocusHandler = getFFlagIGMGamepadSelectionHistoryModule() and (roact.createElement(focusHandlerModule, {
				isFocused = p1.props.canCaptureFocus,
				shouldForgetPreviousSelection = if p1.props.currentPage == constantsModule.advancedSettingsPageKey then p1.props.currentZone == 0 else true,
				didFocus = function(p4)
					-- upvalues: guiService (copy), p1 (copy)
					guiService.SelectedCoreObject = p4 or p1.performanceToggleRef:getValue()
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
				checked = p1.state.performanceStatsEnabled,
				onToggled = function()
					-- upvalues: userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.PerformanceStatsVisible = not userGameSettingsService.PerformanceStatsVisible
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end,
				buttonRef = p1.performanceToggleRef,
				NextSelectionUp = p1.backButtonRef
			}),
			MicroProfiler = roact.createElement(toggleEntryModule, {
				LayoutOrder = 3,
				labelKey = "CoreScripts.InGameMenu.GameSettings.ShowMicroProfiler",
				checked = p1.state.microProfilerEnabled,
				onToggled = function()
					-- upvalues: userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.OnScreenProfilerEnabled = not userGameSettingsService.OnScreenProfilerEnabled
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			}),
			DeveloperConsole = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
			})(function(p4)
				-- upvalues: roact (copy), p3 (ref), p2 (copy), var2 (copy), devConsoleMasterModule (copy), p1 (copy)
				return roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 54),
					Text = p4.text,
					TextColor3 = p3.Theme.TextEmphasis.Color,
					Font = p3.Font.Header2.Font,
					TextSize = p3.Font.Header2.RelativeSize * p3.Font.BaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					LayoutOrder = 4,
					SelectionImageObject = p2(var2.Square),
					[roact.Event.Activated] = function()
						-- upvalues: devConsoleMasterModule (copy), p1 (copy)
						devConsoleMasterModule:SetVisibility(true)
						p1.props.closeMenu()
					end
				}, {
					Padding = roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) })
				})
			end),
			Divider = roact.createElement(dividerModule, { LayoutOrder = 5, Size = UDim2.new(1, -24, 0, 1) }),
			VersionReporter = roact.createElement(versionReporterModule, { LayoutOrder = 6 }),
			MicroProfilerVisibilityListener = roact.createElement(externalEventConnectionModule, {
				event = onScreenProfilerEnabledPropertyChangedSignal,
				callback = function()
					-- upvalues: p1 (copy), userGameSettingsService (copy)
					p1:setState({
						microProfilerEnabled = userGameSettingsService.OnScreenProfilerEnabled
					})
				end
			}),
			PerformanceStatsVisibilityListener = roact.createElement(externalEventConnectionModule, {
				event = userGameSettingsService.PerformanceStatsVisibleChanged,
				callback = function()
					-- upvalues: p1 (copy), userGameSettingsService (copy)
					p1:setState({
						performanceStatsEnabled = userGameSettingsService.PerformanceStatsVisible
					})
				end
			})
		})
	end)
end

function advancedPage.render(p1)
	-- upvalues: var1 (ref)
	return var1(function(p2)
		-- upvalues: p1 (ref)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return roactRodux.UNSTABLE_connect2(function(p1)
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p1.menuPage == "AdvancedGameSettings" and (p1.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p1.respawn.dialogOpen and p1.currentZone == 1)),
		currentPage = if getFFlagIGMGamepadSelectionHistoryModule() then p1.menuPage else nil,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil
	}
end, function(p1)
	-- upvalues: closeMenuModule (ref)
	return {
		closeMenu = function()
			-- upvalues: p1 (ref), closeMenuModule (copy)
			p1(closeMenuModule)
		end
	}
end)(advancedPage)