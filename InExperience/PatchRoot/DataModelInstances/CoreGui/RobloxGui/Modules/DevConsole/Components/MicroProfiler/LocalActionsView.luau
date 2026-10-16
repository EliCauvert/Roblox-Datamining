local RunService = game:GetService("RunService")
local TelemetryService = game:GetService("TelemetryService")
local GameSettings = UserSettings().GameSettings
local BoxButtonModule = require(script.Parent.Parent.BoxButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local CheckboxModule = require(script.Parent.Parent.Checkbox)
local MicroProfilerPanelModule = require(script.Parent.MicroProfilerPanel)
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local LocalActionsView = RoactModule.Component:extend("LocalActionsView")
local DevConsoleMpEnableOpenDumpsFolderButton = game:DefineFastFlag("DevConsoleMpEnableOpenDumpsFolderButton", false)
local config = {
	eventName = "DevConsoleMpToggleOnScreenMpCounter",
	description = "\t\tCounter to track toggling the on-screen MicroProfiler on or off via the Developer Console.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 11, 17 }
}

function LocalActionsView.init(p1) --[[ Line: 28 ]]
	-- upvalues: GameSettings (copy)
	p1:setState({
		OnScreenMicroProfilerVisible = GameSettings.OnScreenProfilerEnabled
	})
	p1.onScreenMpToggledConn = GameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ Line: 33 ]]
		-- upvalues: p1 (copy), GameSettings (upval)
		p1:setState({
			OnScreenMicroProfilerVisible = GameSettings.OnScreenProfilerEnabled
		})
	end)
end

function LocalActionsView.willUnmount(p1) --[[ Line: 40 ]]
	if p1.onScreenMpToggledConn then
		if p1.onScreenMpToggledConn.Connected then
			p1.onScreenMpToggledConn:Disconnect()
		end
		p1.onScreenMpToggledConn = nil
	end
end

function LocalActionsView:toggleOnScreenMicroProfiler(OnScreenProfilerEnabled) --[[ Line: 49 ]]
	-- upvalues: GameSettings (copy), TelemetryService (copy), config (copy)
	GameSettings.OnScreenProfilerEnabled = OnScreenProfilerEnabled
	TelemetryService:LogCounter(config, { customFields = { visible = `{OnScreenProfilerEnabled}` } }, 1)
end

function LocalActionsView.render(p1) --[[ Line: 59 ]]
	-- upvalues: RoactModule (copy), MicroProfilerPanelModule (copy), ConstantsModule (copy), CheckboxModule (copy), DevConsoleMpEnableOpenDumpsFolderButton (copy), RunService (copy), BoxButtonModule (copy)
	return RoactModule.createElement(MicroProfilerPanelModule, {
		Title = "Local actions",
		LayoutOrder = p1.props.LayoutOrder,
		Sections = {
			{
				Name = "LocalActions",
				Rows = {
					{
						UIListLayout = RoactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						UIPadding = RoactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, ConstantsModule.MicroProfilerFormatting.OptionTextPadding)
						}),
						OptionLabel = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = "On-screen MicroProfiler visible",
							LayoutOrder = 1,
							Size = UDim2.fromScale(0, 1),
							Position = UDim2.new(0, 8, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Left,
							Font = ConstantsModule.Font.MainWindow,
							TextSize = ConstantsModule.MicroProfilerFormatting.OptionTextSize,
							TextColor3 = Color3.new(1, 1, 1)
						}, {
							RoactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Grow })
						}),
						CheckboxFrame = RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.fromOffset(ConstantsModule.MicroProfilerFormatting.OptionRowHeight, ConstantsModule.MicroProfilerFormatting.OptionRowHeight)
						}, {
							OnScreenMicroProfilerVisibleCheckbox = RoactModule.createElement(CheckboxModule, {
								Name = "OnScreenMicroProfilerVisibleCheckbox",
								IsSelected = p1.state.OnScreenMicroProfilerVisible,
								Size = UDim2.fromOffset(ConstantsModule.MicroProfilerFormatting.OptionCheckboxSize, ConstantsModule.MicroProfilerFormatting.OptionCheckboxSize),
								Position = UDim2.fromOffset((ConstantsModule.MicroProfilerFormatting.OptionRowHeight - ConstantsModule.MicroProfilerFormatting.OptionCheckboxSize) / 2, (ConstantsModule.MicroProfilerFormatting.OptionRowHeight - ConstantsModule.MicroProfilerFormatting.OptionCheckboxSize) / 2),
								OnSelectedStateChanged = function(_, OnScreenProfilerEnabled) --[[ Line: 115 ]]
									-- upvalues: p1 (copy)
									p1:toggleOnScreenMicroProfiler(OnScreenProfilerEnabled)
								end
							})
						})
					},
					if DevConsoleMpEnableOpenDumpsFolderButton and game:GetEngineFeature("OpenLogsFolderApi") and not RunService:IsStudio() then {
						UIPadding = RoactModule.createElement("UIPadding", {
							PaddingBottom = UDim.new(0, 2),
							PaddingLeft = UDim.new(0, 2),
							PaddingRight = UDim.new(0, 2),
							PaddingTop = UDim.new(0, 2)
						}),
						Button = RoactModule.createElement(BoxButtonModule, {
							text = "Open dump folder",
							size = UDim2.fromScale(1, 1),
							pos = UDim2.new(0, 0, 0, 0),
							onClicked = function() --[[ Line: 135 ]]
								game:OpenLogsFolder()
							end
						})
					} else nil
				}
			}
		}
	})
end

return LocalActionsView