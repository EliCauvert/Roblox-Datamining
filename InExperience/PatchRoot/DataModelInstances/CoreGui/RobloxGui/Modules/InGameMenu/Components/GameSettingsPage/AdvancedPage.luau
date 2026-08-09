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
local withStyle = UIBlox.Core.Style.withStyle
local withSelectionCursorProvider = UIBlox.App.SelectionImage.withSelectionCursorProvider
local cursorKind = UIBlox.App.SelectionImage.CursorKind
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

function advancedPage.init(p0) --[[ line: 53 ]]
	-- upvalues: userGameSettingsService (ref), roact (ref)
	p0:setState({
		microProfilerEnabled = userGameSettingsService.OnScreenProfilerEnabled,
		performanceStatsEnabled = userGameSettingsService.PerformanceStatsVisible
	})
	p0.backButtonRef = roact.createRef()
	p0.performanceToggleRef = roact.createRef()
end

if not getFFlagIGMGamepadSelectionHistoryModule() then
	function advancedPage.didUpdate(p1, p2) --[[ line: 64 ]]
		-- upvalues: guiService (ref)
		if p1.props.canCaptureFocus and not p2.canCaptureFocus then
			guiService.SelectedCoreObject = p1.performanceToggleRef:getValue()
		end
	end
end
function advancedPage.renderWithSelectionCursor(p3, p4) --[[ line: 71 ]]
	-- upvalues: withStyle (ref), roact (ref), pageModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref), focusHandlerModule (ref), constantsModule (ref), guiService (ref), categoryHeaderModule (ref), toggleEntryModule (ref), userGameSettingsService (ref), sendAnalyticsModule (ref), withLocalizationModule (ref), cursorKind (ref), devConsoleMasterModule (ref), dividerModule (ref), versionReporterModule (ref), externalEventConnectionModule (ref), onScreenProfilerEnabledPropertyChangedSignal (ref)
	return withStyle(function(p5) --[[ line: 72 ]]
		-- upvalues: roact (copy), pageModule (copy), p3 (ref), getFFlagIGMGamepadSelectionHistoryModule (copy), focusHandlerModule (copy), constantsModule (copy), guiService (copy), categoryHeaderModule (copy), toggleEntryModule (copy), userGameSettingsService (copy), sendAnalyticsModule (copy), withLocalizationModule (copy), p4 (ref), cursorKind (copy), devConsoleMasterModule (copy), dividerModule (copy), versionReporterModule (copy), externalEventConnectionModule (copy), onScreenProfilerEnabledPropertyChangedSignal (copy)
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
				didFocus = function(p6) --[[ line: 85 ]]
					-- upvalues: guiService (copy), p3 (copy)
					guiService.SelectedCoreObject = p6 or p3.performanceToggleRef:getValue()
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
				onToggled = function() --[[ line: 103 ]]
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
				onToggled = function() --[[ line: 114 ]]
					-- upvalues: userGameSettingsService (copy), sendAnalyticsModule (copy), constantsModule (copy)
					userGameSettingsService.OnScreenProfilerEnabled = not userGameSettingsService.OnScreenProfilerEnabled
					sendAnalyticsModule(constantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			}),
			DeveloperConsole = withLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
			})(function(p7) --[[ line: 121 ]]
				-- upvalues: roact (copy), p5 (ref), p4 (copy), cursorKind (copy), devConsoleMasterModule (copy), p3 (copy)
				return roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 54),
					Text = p7.text,
					TextColor3 = p5.Theme.TextEmphasis.Color,
					Font = p5.Font.Header2.Font,
					TextSize = p5.Font.Header2.RelativeSize * p5.Font.BaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					LayoutOrder = 4,
					SelectionImageObject = p4(cursorKind.Square),
					[roact.Event.Activated] = function() --[[ line: 132 ]]
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
				callback = function() --[[ line: 152 ]]
					-- upvalues: p3 (copy), userGameSettingsService (copy)
					p3:setState({
						microProfilerEnabled = userGameSettingsService.OnScreenProfilerEnabled
					})
				end
			}),
			PerformanceStatsVisibilityListener = roact.createElement(externalEventConnectionModule, {
				event = userGameSettingsService.PerformanceStatsVisibleChanged,
				callback = function() --[[ line: 160 ]]
					-- upvalues: p3 (copy), userGameSettingsService (copy)
					p3:setState({
						performanceStatsEnabled = userGameSettingsService.PerformanceStatsVisible
					})
				end
			})
		})
	end)
end

function advancedPage.render(p8) --[[ line: 170 ]]
	-- upvalues: withSelectionCursorProvider (ref)
	return withSelectionCursorProvider(function(p9) --[[ line: 171 ]]
		-- upvalues: p8 (ref)
		return p8:renderWithSelectionCursor(p9)
	end)
end

return roactRodux.UNSTABLE_connect2(function(p10) --[[ line: 176 ]]
	-- upvalues: constantsModule (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return {
		canCaptureFocus = p10.menuPage == "AdvancedGameSettings" and (p10.displayOptions.inputType == constantsModule.InputType.Gamepad and (not p10.respawn.dialogOpen and p10.currentZone == 1)),
		currentPage = if getFFlagIGMGamepadSelectionHistoryModule() then p10.menuPage else nil,
		currentZone = if getFFlagIGMGamepadSelectionHistoryModule() then p10.currentZone else nil
	}
end, function(p11) --[[ line: 192 ]]
	-- upvalues: closeMenuModule (ref)
	return {
		closeMenu = function() --[[ line: 194 ]]
			-- upvalues: p11 (ref), closeMenuModule (copy)
			p11(closeMenuModule)
		end
	}
end)(advancedPage)