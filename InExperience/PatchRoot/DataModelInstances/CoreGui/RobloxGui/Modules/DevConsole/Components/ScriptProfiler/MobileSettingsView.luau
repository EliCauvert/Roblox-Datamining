local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local _ = game:GetService("ScriptContext")
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local dropDownModule = require(script.Parent.Parent.Parent.Components.DropDown)
local setScriptProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local var1 = constantsModule.GeneralFormatting.MainRowPadding * 2
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
local var2 = dropDownArrowHeight / 2
local downArrow = constantsModule.Image.DownArrow
local scriptProfilerShowPlugins2 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)

local function _(p1, p2)
	local list = table.create(#p1)
	
	for i, v in p1 do
		table.insert(list, p2(v))
	end
	return list
end

local function formatTimeSelection(p3)
	-- upvalues: profilerUtilModule (ref)
	return if p3 == 0 then "Off" else profilerUtilModule.formatTimer(p3)
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

function mobileSettingsView.init(_) end

function mobileSettingsView.didMount(_) end

function mobileSettingsView.didUpdate(_) end

function mobileSettingsView.GetState(p3, p4)
	return (if p3.props.isClientView then p3.props.client else p3.props.server)[p4]
end

function mobileSettingsView.UpdateState(p3, p4, p5)
	local cloned = table.clone(if p3.props.isClientView then p3.props.client else p3.props.server)
	cloned[p4] = p5
	p3.props.dispatchSetScriptProfilerState(p3.props.isClientView, cloned)
end

function mobileSettingsView.renderToggle(_, p3, p4, p5)
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
			Text = p3,
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
				BackgroundColor3 = if p4 then unselectedGray else selectedBlue,
				[roactModule.Event.Activated] = function()
					-- upvalues: p5 (ref)
					p5(false)
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
				BackgroundColor3 = if p4 then selectedBlue else unselectedGray,
				[roactModule.Event.Activated] = function()
					-- upvalues: p5 (ref)
					p5(true)
				end
			})
		})
	})
end

function mobileSettingsView.renderStateToggle(p3, p4, p5, _)
	return p3:renderToggle(p4, p3:GetState(p5), function(p6)
		-- upvalues: p3 (ref), p5 (ref)
		p3:UpdateState(p5, p6)
	end)
end

function mobileSettingsView.renderDropDown(p3, p4, p5, p6, p7, p8, p9)
	-- upvalues: roactModule (ref), buttonWidth (ref), smallFrameHeight (ref), buttonTextSize (ref), text (ref), mainWindow (ref), constantsModule (ref), downArrow (ref), dropDownArrowHeight (ref), var2 (ref), dropDownModule (ref), mainWindowHeader (ref), unselectedGray_1 (ref)
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, smallFrameHeight)
	}, {
		Label = roactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = p4,
			Font = mainWindowHeader,
			TextSize = buttonTextSize,
			TextColor3 = constantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = unselectedGray_1
		}),
		DropDown = if p9 then roactModule.createElement("TextButton", {
			AutoButtonColor = true,
			BackgroundTransparency = 0,
			Position = UDim2.new(0.9, -buttonWidth, 0, 0),
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight),
			Text = p6[p8],
			TextSize = buttonTextSize,
			TextColor3 = text,
			Font = mainWindow,
			BackgroundColor3 = constantsModule.Color.InactiveBox
		}, {
			arrow = roactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = downArrow,
				Size = UDim2.new(0, dropDownArrowHeight, 0, dropDownArrowHeight),
				Position = UDim2.new(1, (-dropDownArrowHeight) - var2, 0.5, -var2)
			})
		}) else roactModule.createElement("Frame", {
			Position = UDim2.new(0.9, -buttonWidth, 0, 0),
			Size = UDim2.new(0, buttonWidth, 0, smallFrameHeight)
		}, {
			Selection = roactModule.createElement(dropDownModule, {
				buttonSize = UDim2.new(1, 0, 0, smallFrameHeight),
				dropDownList = p6,
				selectedIndex = p8,
				onSelection = function(p10)
					-- upvalues: p3 (ref), p5 (ref), p7 (ref)
					local var3 = p3:GetState(p5)
					
					if typeof(var3) == "boolean" then
						var3 = p10 == 2
						var3 = nil
					elseif typeof(var3) == "number" then
						var3 = p7[p10]
					end
					p3:UpdateState(p5, var3)
				end
			})
		})
	})
end

function mobileSettingsView.render(p3)
	-- upvalues: roactModule (ref), constantsModule (ref), var1 (ref), scriptProfilerShowPlugins2 (ref), list_2 (ref), list_1 (ref), list_4 (ref), list_3 (ref), profilerUtilModule (ref), list_6 (ref), list_5 (ref), list (ref)
	local isProfilingState = p3:GetState("isProfiling")
	
	return roactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = p3.props.size,
		BackgroundColor3 = constantsModule.Color.BaseGray,
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = roactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, var1),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Percentages = p3:renderToggle("Percentages", p3.props.usePercentages, function(p4)
			-- upvalues: p3 (ref)
			p3.props.dispatchSetScriptProfilerUsePercentages(p4)
		end),
		LiveToggle = p3:renderStateToggle("Live Update", "liveUpdate"),
		PluginsToggle = if not scriptProfilerShowPlugins2 then nil else p3:renderStateToggle("Show Plugins", "showPlugins"),
		GCToggle = p3:renderStateToggle("GC Overhead", "showGc"),
		AverageDropDown = p3:renderDropDown("Average", "average", list_2, list_1, table.find(list_1, p3:GetState("average")) or 1),
		FrequencyDropDown = p3:renderDropDown("Frequency", "frequency", list_4, list_3, table.find(list_3, p3:GetState("frequency")) or 1, isProfilingState),
		TimerDropDown = p3:renderDropDown("Timer" .. (if isProfilingState then ": " .. profilerUtilModule.formatTimer(p3:GetState("timedProfilingCountdown")) else ""), "timedProfilingDuration", list_6, list_5, table.find(list_5, p3:GetState("timedProfilingDuration")) or 1, isProfilingState),
		ViewDropDown = p3:renderDropDown("View", "isFunctionsView", list, nil, if p3:GetState("isFunctionsView") then 2 else 1)
	})
end

return roactRoduxModule.UNSTABLE_connect2(function(p3, _)
	return {
		usePercentages = p3.ScriptProfiler.usePercentages,
		isClientView = p3.ScriptProfiler.isClientView,
		client = p3.ScriptProfiler.client,
		server = p3.ScriptProfiler.server
	}
end, function(p3)
	-- upvalues: setScriptProfilerStateModule (ref)
	return {
		dispatchSetScriptProfilerState = function(value, p4)
			-- upvalues: p3 (ref), setScriptProfilerStateModule (copy)
			if value then
				p3(setScriptProfilerStateModule(value, nil, p4, nil))
				
				return
			end
			p3(setScriptProfilerStateModule(value, nil, nil, p4))
		end,
		dispatchSetScriptProfilerUsePercentages = function(value)
			-- upvalues: p3 (ref), setScriptProfilerStateModule (copy)
			p3(setScriptProfilerStateModule(nil, value))
		end
	}
end)(mobileSettingsView)