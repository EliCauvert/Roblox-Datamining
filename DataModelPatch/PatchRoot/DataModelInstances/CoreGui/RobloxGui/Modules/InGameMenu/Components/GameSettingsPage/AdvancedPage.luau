local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local OnScreenProfilerEnabledPropertyChangedSignal = UserGameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled")
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local UIBlox = InGameMenuDependenciesModule.UIBlox
local WithFoundationOrUIBloxStyleFunction = require(CorePackages.Workspace.Packages.CoreGuiCommon).withFoundationOrUIBloxStyle
local WithSelectionCursorProviderFunction = UIBlox.App.SelectionImage.withSelectionCursorProvider
local CursorKind = UIBlox.App.SelectionImage.CursorKind
local DevConsoleMasterModule = require(game:GetService("CoreGui").RobloxGui.Modules.DevConsoleMaster)
local Parent = script.Parent.Parent.Parent
local DividerModule = require(Parent.Components.Divider)
local ExternalEventConnectionModule = require(Parent.Utility.ExternalEventConnection)
local PageModule = require(script.Parent.Parent.Page)
local CategoryHeaderModule = require(script.Parent.CategoryHeader)
local ToggleEntryModule = require(script.Parent.ToggleEntry)
local VersionReporterModule = require(script.Parent.VersionReporter)
local CloseMenuModule = require(Parent.Thunks.CloseMenu)
local FocusHandlerModule = require(script.Parent.Parent.Connection.FocusHandler)
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SendAnalyticsModule = require(Parent.Utility.SendAnalytics)
local ConstantsModule = require(Parent.Resources.Constants)
local GetFFlagIGMGamepadSelectionHistoryModule = require(Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local AdvancedPage = Roact.PureComponent:extend("AdvancedPage")
AdvancedPage.validateProps = T.strictInterface({
	canCaptureFocus = T.boolean,
	closeMenu = T.callback,
	pageTitle = T.string,
	currentPage = GetFFlagIGMGamepadSelectionHistoryModule() and T.string or nil,
	currentZone = GetFFlagIGMGamepadSelectionHistoryModule() and T.optional(T.number) or nil
})

function AdvancedPage.init(p1)
	-- upvalues: UserGameSettings (copy), Roact (copy)
	p1:setState({
		microProfilerEnabled = UserGameSettings.OnScreenProfilerEnabled,
		performanceStatsEnabled = UserGameSettings.PerformanceStatsVisible
	})
	p1.backButtonRef = Roact.createRef()
	p1.performanceToggleRef = Roact.createRef()
end

if not GetFFlagIGMGamepadSelectionHistoryModule() then
	function AdvancedPage.didUpdate(p1, p2)
		-- upvalues: GuiService (copy)
		if p1.props.canCaptureFocus and not p2.canCaptureFocus then
			GuiService.SelectedCoreObject = p1.performanceToggleRef:getValue()
		end
	end
end
function AdvancedPage.renderWithSelectionCursor(p1, Callback)
	-- upvalues: WithFoundationOrUIBloxStyleFunction (copy), Roact (copy), PageModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy), FocusHandlerModule (copy), ConstantsModule (copy), GuiService (copy), CategoryHeaderModule (copy), ToggleEntryModule (copy), UserGameSettings (copy), SendAnalyticsModule (copy), WithLocalizationModule (copy), CursorKind (copy), DevConsoleMasterModule (copy), DividerModule (copy), VersionReporterModule (copy), ExternalEventConnectionModule (copy), OnScreenProfilerEnabledPropertyChangedSignal (copy)
	return WithFoundationOrUIBloxStyleFunction(function(p2)
		return {
			Theme = {
				TextEmphasis = {
					Color = p2.Color.Content.Emphasis.Color3,
					Transparency = p2.Color.Content.Emphasis.Transparency
				}
			},
			Font = {
				BaseSize = 1,
				Header2 = {
					Font = p2.Typography.TitleLarge.Font,
					RelativeSize = p2.Typography.TitleLarge.FontSize
				}
			}
		}
	end, function(p2)
		-- upvalues: Roact (upval), PageModule (upval), p1 (copy), GetFFlagIGMGamepadSelectionHistoryModule (upval), FocusHandlerModule (upval), ConstantsModule (upval), GuiService (upval), CategoryHeaderModule (upval), ToggleEntryModule (upval), UserGameSettings (upval), SendAnalyticsModule (upval), WithLocalizationModule (upval), Callback (copy), CursorKind (upval), DevConsoleMasterModule (upval), DividerModule (upval), VersionReporterModule (upval), ExternalEventConnectionModule (upval), OnScreenProfilerEnabledPropertyChangedSignal (upval)
		return Roact.createElement(PageModule, {
			zIndex = 2,
			pageTitle = p1.props.pageTitle,
			position = p1.props.position,
			buttonRef = p1.backButtonRef,
			NextSelectionDown = p1.performanceToggleRef
		}, {
			FocusHandler = GetFFlagIGMGamepadSelectionHistoryModule() and Roact.createElement(FocusHandlerModule, {
				isFocused = p1.props.canCaptureFocus,
				shouldForgetPreviousSelection = p1.props.currentPage ~= ConstantsModule.advancedSettingsPageKey or p1.props.currentZone == 0,
				didFocus = function(p3)
					-- upvalues: GuiService (upval), p1 (upval)
					GuiService.SelectedCoreObject = p3 or p1.performanceToggleRef:getValue()
				end
			}) or nil,
			Layout = Roact.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Top
			}),
			AdvancedHeader = Roact.createElement(CategoryHeaderModule, {
				LayoutOrder = 1,
				localizationKey = "CoreScripts.InGameMenu.GameSettings.AdvancedSettingsTitle"
			}),
			PerformanceStats = Roact.createElement(ToggleEntryModule, {
				LayoutOrder = 2,
				labelKey = "CoreScripts.InGameMenu.GameSettings.ShowPerfStats",
				checked = p1.state.performanceStatsEnabled,
				onToggled = function()
					-- upvalues: UserGameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
					UserGameSettings.PerformanceStatsVisible = not UserGameSettings.PerformanceStatsVisible
					SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end,
				buttonRef = p1.performanceToggleRef,
				NextSelectionUp = p1.backButtonRef
			}),
			MicroProfiler = Roact.createElement(ToggleEntryModule, {
				LayoutOrder = 3,
				labelKey = "CoreScripts.InGameMenu.GameSettings.ShowMicroProfiler",
				checked = p1.state.microProfilerEnabled,
				onToggled = function()
					-- upvalues: UserGameSettings (upval), SendAnalyticsModule (upval), ConstantsModule (upval)
					UserGameSettings.OnScreenProfilerEnabled = not UserGameSettings.OnScreenProfilerEnabled
					SendAnalyticsModule(ConstantsModule.AnalyticsSettingsChangeName, nil, {}, true)
				end
			}),
			DeveloperConsole = WithLocalizationModule({
				text = "CoreScripts.InGameMenu.GameSettings.DeveloperConsole"
			})(function(p3)
				-- upvalues: Roact (upval), p2 (copy), Callback (upval), CursorKind (upval), DevConsoleMasterModule (upval), p1 (upval)
				return Roact.createElement("TextButton", {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 54),
					Text = p3.text,
					TextColor3 = p2.Theme.TextEmphasis.Color,
					Font = p2.Font.Header2.Font,
					TextSize = p2.Font.Header2.RelativeSize * p2.Font.BaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					LayoutOrder = 4,
					SelectionImageObject = Callback(CursorKind.Square),
					[Roact.Event.Activated] = function()
						-- upvalues: DevConsoleMasterModule (upval), p1 (upval)
						DevConsoleMasterModule:SetVisibility(true)
						p1.props.closeMenu()
					end
				}, {
					Padding = Roact.createElement("UIPadding", { PaddingLeft = UDim.new(0, 24) })
				})
			end),
			Divider = Roact.createElement(DividerModule, { LayoutOrder = 5, Size = UDim2.new(1, -24, 0, 1) }),
			VersionReporter = Roact.createElement(VersionReporterModule, { LayoutOrder = 6 }),
			MicroProfilerVisibilityListener = Roact.createElement(ExternalEventConnectionModule, {
				event = OnScreenProfilerEnabledPropertyChangedSignal,
				callback = function()
					-- upvalues: p1 (upval), UserGameSettings (upval)
					p1:setState({
						microProfilerEnabled = UserGameSettings.OnScreenProfilerEnabled
					})
				end
			}),
			PerformanceStatsVisibilityListener = Roact.createElement(ExternalEventConnectionModule, {
				event = UserGameSettings.PerformanceStatsVisibleChanged,
				callback = function()
					-- upvalues: p1 (upval), UserGameSettings (upval)
					p1:setState({
						performanceStatsEnabled = UserGameSettings.PerformanceStatsVisible
					})
				end
			})
		})
	end)
end

function AdvancedPage.render(p1)
	-- upvalues: WithSelectionCursorProviderFunction (copy)
	return WithSelectionCursorProviderFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithSelectionCursor(p2)
	end)
end

return RoactRodux.UNSTABLE_connect2(function(p1)
	-- upvalues: ConstantsModule (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy)
	return {
		canCaptureFocus = p1.menuPage == "AdvancedGameSettings" and p1.displayOptions.inputType == ConstantsModule.InputType.Gamepad and (not p1.respawn.dialogOpen and p1.currentZone == 1),
		currentPage = GetFFlagIGMGamepadSelectionHistoryModule() and p1.menuPage or nil,
		currentZone = if GetFFlagIGMGamepadSelectionHistoryModule() then p1.currentZone else nil
	}
end, function(Callback)
	-- upvalues: CloseMenuModule (copy)
	return {
		closeMenu = function()
			-- upvalues: Callback (copy), CloseMenuModule (upval)
			Callback(CloseMenuModule)
		end
	}
end)(AdvancedPage)