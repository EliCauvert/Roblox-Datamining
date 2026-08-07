local corePackagesService = game:GetService("CorePackages")
local runService = game:GetService("RunService")
local telemetryService = game:GetService("TelemetryService")
local gameSettings = UserSettings().GameSettings
local boxButtonModule = require(script.Parent.Parent.BoxButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local checkboxModule = require(script.Parent.Parent.Checkbox)
local microProfilerPanelModule = require(script.Parent.MicroProfilerPanel)
local roactModule = require(corePackagesService.Packages.Roact)
local localActionsView = roactModule.Component:extend("LocalActionsView")
local devConsoleMpEnableOpenDumpsFolderButton = game:DefineFastFlag("DevConsoleMpEnableOpenDumpsFolderButton", false)
local t = {
	eventName = "DevConsoleMpToggleOnScreenMpCounter",
	description = "\t\tCounter to track toggling the on-screen MicroProfiler on or off via the Developer Console.\n\t",
	backends = { "RobloxTelemetryCounter" },
	lastUpdated = { 2025, 11, 17 }
}

function localActionsView.init(p0) --[[ line: 28 ]]
	-- upvalues: gameSettings (ref)
	p0:setState({
		OnScreenMicroProfilerVisible = gameSettings.OnScreenProfilerEnabled
	})
	p0.onScreenMpToggledConn = gameSettings:GetPropertyChangedSignal("OnScreenProfilerEnabled"):Connect(function() --[[ line: 33 ]]
		-- upvalues: p0 (ref), gameSettings (copy)
		p0:setState({
			OnScreenMicroProfilerVisible = gameSettings.OnScreenProfilerEnabled
		})
	end)
end

function localActionsView.willUnmount(p1) --[[ line: 40 ]]
	if p1.onScreenMpToggledConn then
		if p1.onScreenMpToggledConn.Connected then
			p1.onScreenMpToggledConn:Disconnect()
		end
		p1.onScreenMpToggledConn = nil
	end
end

function localActionsView.toggleOnScreenMicroProfiler(_, p2) --[[ line: 49 ]]
	-- upvalues: gameSettings (ref), telemetryService (ref), t (ref)
	gameSettings.OnScreenProfilerEnabled = p2
	telemetryService:LogCounter(t, { customFields = { visible = `{p2}` } }, 1)
end

function localActionsView.render(p3) --[[ line: 59 ]]
	-- upvalues: roactModule (ref), microProfilerPanelModule (ref), constantsModule (ref), checkboxModule (ref), devConsoleMpEnableOpenDumpsFolderButton (ref), runService (ref), boxButtonModule (ref)
	return roactModule.createElement(microProfilerPanelModule, {
		Title = "Local actions",
		LayoutOrder = p3.props.LayoutOrder,
		Sections = {
			{
				Name = "LocalActions",
				Rows = {
					{
						UIListLayout = roactModule.createElement("UIListLayout", {
							FillDirection = Enum.FillDirection.Horizontal,
							SortOrder = Enum.SortOrder.LayoutOrder
						}),
						UIPadding = roactModule.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, constantsModule.MicroProfilerFormatting.OptionTextPadding)
						}),
						OptionLabel = roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = "On-screen MicroProfiler visible",
							LayoutOrder = 1,
							Size = UDim2.fromScale(0, 1),
							Position = UDim2.new(0, 8, 0, 0),
							TextXAlignment = Enum.TextXAlignment.Left,
							Font = constantsModule.Font.MainWindow,
							TextSize = constantsModule.MicroProfilerFormatting.OptionTextSize,
							TextColor3 = Color3.new(1, 1, 1)
						}, {
							roactModule.createElement("UIFlexItem", { FlexMode = Enum.UIFlexMode.Grow })
						}),
						CheckboxFrame = roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							LayoutOrder = 2,
							Size = UDim2.fromOffset(constantsModule.MicroProfilerFormatting.OptionRowHeight, constantsModule.MicroProfilerFormatting.OptionRowHeight)
						}, {
							OnScreenMicroProfilerVisibleCheckbox = roactModule.createElement(checkboxModule, {
								Name = "OnScreenMicroProfilerVisibleCheckbox",
								IsSelected = p3.state.OnScreenMicroProfilerVisible,
								Size = UDim2.fromOffset(constantsModule.MicroProfilerFormatting.OptionCheckboxSize, constantsModule.MicroProfilerFormatting.OptionCheckboxSize),
								Position = UDim2.fromOffset((constantsModule.MicroProfilerFormatting.OptionRowHeight - constantsModule.MicroProfilerFormatting.OptionCheckboxSize) / 2, (constantsModule.MicroProfilerFormatting.OptionRowHeight - constantsModule.MicroProfilerFormatting.OptionCheckboxSize) / 2),
								OnSelectedStateChanged = function(_, p4) --[[ line: 115 ]]
									-- upvalues: p3 (ref)
									p3:toggleOnScreenMicroProfiler(p4)
								end
							})
						})
					},
					if devConsoleMpEnableOpenDumpsFolderButton and game:GetEngineFeature("OpenLogsFolderApi") and not runService:IsStudio() then {
						UIPadding = roactModule.createElement("UIPadding", {
							PaddingBottom = UDim.new(0, 2),
							PaddingLeft = UDim.new(0, 2),
							PaddingRight = UDim.new(0, 2),
							PaddingTop = UDim.new(0, 2)
						}),
						Button = roactModule.createElement(boxButtonModule, {
							text = "Open dump folder",
							size = UDim2.fromScale(1, 1),
							pos = UDim2.new(0, 0, 0, 0),
							onClicked = function() --[[ line: 135 ]]
								game:OpenLogsFolder()
							end
						})
					} else nil
				}
			}
		}
	})
end

return localActionsView