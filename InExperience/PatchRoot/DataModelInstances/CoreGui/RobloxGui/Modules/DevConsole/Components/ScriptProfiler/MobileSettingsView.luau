local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local _ = game:GetService("ScriptContext")
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local dropDownModule = require(script.Parent.Parent.Parent.Components.DropDown)
local setScriptProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local var7 = constantsModule.GeneralFormatting.MainRowPadding * 2
local smallFrameHeight = constantsModule.UtilityBarFormatting.SmallFrameHeight
local mainWindowHeader = constantsModule.Font.MainWindowHeader
local mainWindow = constantsModule.Font.MainWindow
local buttonTextSize = constantsModule.MicroProfilerFormatting.ButtonTextSize
local text = constantsModule.Color.Text
local _ = constantsModule.Color.UnselectedGray
local unselectedGray = constantsModule.Color.UnselectedGray
local selectedBlue = constantsModule.Color.SelectedBlue
local unselectedGray_1 = constantsModule.Color.UnselectedGray
local buttonWidth = constantsModule.MicroProfilerFormatting.ButtonWidth
local dropDownArrowHeight = constantsModule.GeneralFormatting.DropDownArrowHeight
local var8 = dropDownArrowHeight / 2
local downArrow = constantsModule.Image.DownArrow
local scriptProfilerShowPlugins2 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)

local function _(p0, p1) --[[ line: 43 | named "makeFormattedStringTable" ]]
	local list = table.create(#p0)
	
	for i, v in p0 do
		table.insert(list, p1(v))
	end
	return list
end

local function formatTimeSelection(p2) --[[ line: 53 ]]
	-- upvalues: profilerUtilModule (ref)
	return if p2 == 0 then "Off" else profilerUtilModule.formatTimer(p2)
end

local list = { "Callgraph", "Functions" }
local list_1 = {
	0,
	1,
	60,
	300,
	600
}
local list_2 = table.create(#list_1)

for i, v in list_1 do
	table.insert(list_2, formatTimeSelection(v))
end
local list_3 = { 1000, 10000 }
local formatFrequency = profilerUtilModule.formatFrequency
local list_4 = table.create(#list_3)

for i_1, v_1 in list_3 do
	table.insert(list_4, formatFrequency(v_1))
end
local list_5 = { 0, 60, 300, 600 }
local list_6 = table.create(#list_5)

for i_2, v_2 in list_5 do
	table.insert(list_6, formatTimeSelection(v_2))
end
local mobileSettingsView = roactModule.PureComponent:extend("MobileSettingsView")

function mobileSettingsView.init(_) --[[ line: 74 ]] end

function mobileSettingsView.didMount(_) --[[ line: 76 ]] end

function mobileSettingsView.didUpdate(_) --[[ line: 78 ]] end

function mobileSettingsView.GetState(p3, p4) --[[ line: 80 ]]
	return (if p3.props.isClientView then p3.props.client else p3.props.server)[p4]
end

function mobileSettingsView.UpdateState(p5, p6, p7) --[[ line: 86 ]]
	local cloned = table.clone(if p5.props.isClientView then p5.props.client else p5.props.server)
	cloned[p6] = p7
	p5.props.dispatchSetScriptProfilerState(p5.props.isClientView, cloned)
end

function mobileSettingsView.renderToggle(_, p8, p9, p10) --[[ line: 95 ]]
	-- upvalues: roactModule (ref), smallFrameHeight (ref), buttonWidth (ref), mainWindowHeader (ref), buttonTextSize (ref), constantsModule (ref), unselectedGray_1 (ref), unselectedGray (ref), selectedBlue (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, smallFrameHeight)
	}, {
		Label = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = p8,
			Font = mainWindowHeader,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray_1
		}),
		ToggleButton = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth * 2, 0, smallFrameHeight),
			Position = UDim2.new(0.9, -buttonWidth * 2, 0, 0)
		}, {
			OffButton = roactModule.createElement("TextButton", {
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = "Off",
				Font = mainWindowHeader,
				TextSize = buttonTextSize,
				TextColor3 = constantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = if p9 then unselectedGray else selectedBlue,
				[roactModule.Event.Activated] = function() --[[ line: 129 ]]
					-- upvalues: p10 (ref)
					p10(false)
				end
			}),
			OnButton = roactModule.createElement("TextButton", {
				Size = UDim2.new(0.5, 0, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Text = "On",
				Font = mainWindowHeader,
				TextSize = buttonTextSize,
				TextColor3 = constantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = if p9 then selectedBlue else unselectedGray,
				[roactModule.Event.Activated] = function() --[[ line: 145 ]]
					-- upvalues: p10 (ref)
					p10(true)
				end
			})
		})
	})
end

function mobileSettingsView.renderStateToggle(p11, p12, p13, _) --[[ line: 153 ]]
	return p11:renderToggle(p12, p11:GetState(p13), function(p14) --[[ line: 156 ]]
		-- upvalues: p11 (ref), p13 (ref)
		p11:UpdateState(p13, p14)
	end)
end

function mobileSettingsView.renderDropDown(p15, p16, p17, p18, p19, p20, p21) --[[ line: 161 ]]
	-- upvalues: roactModule (ref), buttonWidth (ref), smallFrameHeight (ref), buttonTextSize (ref), text (ref), mainWindow (ref), constantsModule (ref), downArrow (ref), dropDownArrowHeight (ref), var8 (ref), dropDownModule (ref), mainWindowHeader (ref), unselectedGray_1 (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, smallFrameHeight)
	}, {
		Label = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = p16,
			Font = mainWindowHeader,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray_1
		}),
		DropDown = if p21 then roactModule.createElement("TextButton", {
			AutoButtonColor = true,
			BackgroundTransparency = 0,
			Position = UDim2.new(0.9, -buttonWidth, 0, 0),
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight),
			Text = p18[p20],
			TextSize = buttonTextSize,
			TextColor3 = text,
			Font = mainWindow,
			BackgroundColor3 = constantsModule.Color.InactiveBox
		}, {
			arrow = roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = downArrow,
				Size = UDim2.new(0, dropDownArrowHeight, 0, dropDownArrowHeight),
				Position = UDim2.new(1, (-dropDownArrowHeight) - var8, 0.5, -var8)
			})
		}) else roactModule.createElement("Frame", {
			Position = UDim2.new(0.9, -buttonWidth, 0, 0),
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight)
		}, {
			Selection = roactModule.createElement(dropDownModule, {
				buttonSize = UDim2.new(1, 0, 0, smallFrameHeight),
				dropDownList = p18,
				selectedIndex = p20,
				onSelection = function(p22) --[[ line: 193 ]]
					-- upvalues: p15 (ref), p17 (ref), p19 (ref)
					local var21 = p15:GetState(p17)
					
					if typeof(var21) == "boolean" then
						var21 = p22 == 2
						var21 = nil
					elseif typeof(var21) == "number" then
						var21 = p19[p22]
					end
					p15:UpdateState(p17, var21)
				end
			})
		})
	})
end

function mobileSettingsView.render(p23) --[[ line: 229 ]]
	-- upvalues: roactModule (ref), constantsModule (ref), var7 (ref), scriptProfilerShowPlugins2 (ref), list_2 (ref), list_1 (ref), list_4 (ref), list_3 (ref), profilerUtilModule (ref), list_6 (ref), list_5 (ref), list (ref)
	local isProfilingState = p23:GetState("isProfiling")
	
	return roactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = p23.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray,
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var7),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Percentages = p23:renderToggle("Percentages", p23.props.usePercentages, function(p24) --[[ line: 245 ]]
			-- upvalues: p23 (ref)
			p23.props.dispatchSetScriptProfilerUsePercentages(p24)
		end),
		LiveToggle = p23:renderStateToggle("Live Update", "liveUpdate"),
		PluginsToggle = if not scriptProfilerShowPlugins2 then nil else p23:renderStateToggle("Show Plugins", "showPlugins"),
		GCToggle = p23:renderStateToggle("GC Overhead", "showGc"),
		AverageDropDown = p23:renderDropDown("Average", "average", list_2, list_1, table.find(list_1, p23:GetState("average")) or 1),
		FrequencyDropDown = p23:renderDropDown("Frequency", "frequency", list_4, list_3, table.find(list_3, p23:GetState("frequency")) or 1, isProfilingState),
		TimerDropDown = p23:renderDropDown("Timer" .. (if isProfilingState then ": " .. profilerUtilModule.formatTimer(p23:GetState("timedProfilingCountdown")) else ""), "timedProfilingDuration", list_6, list_5, table.find(list_5, p23:GetState("timedProfilingDuration")) or 1, isProfilingState),
		ViewDropDown = p23:renderDropDown("View", "isFunctionsView", list, nil, if p23:GetState("isFunctionsView") then 2 else 1)
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p25, _) --[[ line: 296 | named "mapStateToProps" ]]
	return {
		usePercentages = p25.ScriptProfiler.usePercentages,
		isClientView = p25.ScriptProfiler.isClientView,
		client = p25.ScriptProfiler.client,
		server = p25.ScriptProfiler.server
	}
end, function(p26) --[[ line: 305 | named "mapDispatchToProps" ]]
	-- upvalues: setScriptProfilerStateModule (ref)
	return {
		dispatchSetScriptProfilerState = function(value, p27) --[[ line: 307 ]]
			-- upvalues: p26 (ref), setScriptProfilerStateModule (copy)
			if value then
				p26(setScriptProfilerStateModule(value, nil, p27, nil))
				
				return
			end
			p26(setScriptProfilerStateModule(value, nil, nil, p27))
		end,
		dispatchSetScriptProfilerUsePercentages = function(value) --[[ line: 315 ]]
			-- upvalues: p26 (ref), setScriptProfilerStateModule (copy)
			p26(setScriptProfilerStateModule(nil, value))
		end
	}
end)(mobileSettingsView)