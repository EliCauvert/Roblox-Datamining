local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local _ = game:GetService("ScriptContext")
local ProfilerUtilModule = require(script.Parent.ProfilerUtil)
local DropDownModule = require(script.Parent.Parent.Parent.Components.DropDown)
local SetScriptProfilerStateModule = require(script.Parent.Parent.Parent.Actions.SetScriptProfilerState)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local ScaledMainRowPadding = ConstantsModule.GeneralFormatting.MainRowPadding * 2
local SmallFrameHeight = ConstantsModule.UtilityBarFormatting.SmallFrameHeight
local MainWindowHeader = ConstantsModule.Font.MainWindowHeader
local MainWindow = ConstantsModule.Font.MainWindow
local ButtonTextSize = ConstantsModule.MicroProfilerFormatting.ButtonTextSize
local Text = ConstantsModule.Color.Text
local _ = ConstantsModule.Color.UnselectedGray
local UnselectedGray = ConstantsModule.Color.UnselectedGray
local SelectedBlue = ConstantsModule.Color.SelectedBlue
local UnselectedGray1 = ConstantsModule.Color.UnselectedGray
local ButtonWidth = ConstantsModule.MicroProfilerFormatting.ButtonWidth
local DropDownArrowHeight: number = ConstantsModule.GeneralFormatting.DropDownArrowHeight
local DropDownArrowHeightRatio = DropDownArrowHeight / 2
local DownArrow = ConstantsModule.Image.DownArrow
local ScriptProfilerShowPlugins2 = game:DefineFastFlag("ScriptProfilerShowPlugins2", false)

local function _(List, Callback) --[[ Line: 43 | Named "makeFormattedStringTable" ]]
	local Buffer = table.create(#List)
	
	for _, value in List do
		table.insert(Buffer, Callback(value))
	end
	return Buffer
end

local function formatTimeSelection(p1) --[[ Line: 53 ]]
	-- upvalues: ProfilerUtilModule (copy)
	return if p1 == 0 then "Off" else ProfilerUtilModule.formatTimer(p1)
end

local DropDownList = { "Callgraph", "Functions" }
local List = {
	0,
	1,
	60,
	300,
	600
}
local Buffer = table.create(#List)

for _, value in List do
	table.insert(Buffer, formatTimeSelection(value))
end
local List1 = { 1000, 10000 }
local FormatFrequencyFunction = ProfilerUtilModule.formatFrequency
local Buffer1 = table.create(#List1)

for _, value1 in List1 do
	table.insert(Buffer1, FormatFrequencyFunction(value1))
end
local List2 = { 0, 60, 300, 600 }
local Buffer2 = table.create(#List2)

for _, value2 in List2 do
	table.insert(Buffer2, formatTimeSelection(value2))
end
local MobileSettingsView = RoactModule.PureComponent:extend("MobileSettingsView")

function MobileSettingsView:init() --[[ Line: 74 ]] end

function MobileSettingsView:didMount() --[[ Line: 76 ]] end

function MobileSettingsView:didUpdate() --[[ Line: 78 ]] end

function MobileSettingsView.GetState(p1, p2) --[[ Line: 80 ]]
	return (if p1.props.isClientView then p1.props.client else p1.props.server)[p2]
end

function MobileSettingsView.UpdateState(p1, Key, State) --[[ Line: 86 ]]
	local Copy = table.clone(if p1.props.isClientView then p1.props.client else p1.props.server)
	Copy[Key] = State
	p1.props.dispatchSetScriptProfilerState(p1.props.isClientView, Copy)
end

function MobileSettingsView:renderToggle(Text, State, Callback) --[[ Line: 95 ]]
	-- upvalues: RoactModule (copy), SmallFrameHeight (copy), ButtonWidth (copy), MainWindowHeader (copy), ButtonTextSize (copy), ConstantsModule (copy), UnselectedGray1 (copy), UnselectedGray (copy), SelectedBlue (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = UDim2.new(1, 0, 0, SmallFrameHeight)
	}, {
		Label = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth, 0, SmallFrameHeight),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = Text,
			Font = MainWindowHeader,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray1
		}),
		ToggleButton = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth * 2, 0, SmallFrameHeight),
			Position = UDim2.new(0.9, -ButtonWidth * 2, 0, 0)
		}, {
			OffButton = RoactModule.createElement("TextButton", {
				Size = UDim2.new(0.5, 0, 1, 0),
				Text = "Off",
				Font = MainWindowHeader,
				TextSize = ButtonTextSize,
				TextColor3 = ConstantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = State and UnselectedGray or SelectedBlue,
				[RoactModule.Event.Activated] = function() --[[ Line: 129 ]]
					-- upvalues: Callback (copy)
					Callback(false)
				end
			}),
			OnButton = RoactModule.createElement("TextButton", {
				Size = UDim2.new(0.5, 0, 1, 0),
				Position = UDim2.new(0.5, 0, 0, 0),
				Text = "On",
				Font = MainWindowHeader,
				TextSize = ButtonTextSize,
				TextColor3 = ConstantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Center,
				BackgroundColor3 = State and SelectedBlue or UnselectedGray,
				[RoactModule.Event.Activated] = function() --[[ Line: 145 ]]
					-- upvalues: Callback (copy)
					Callback(true)
				end
			})
		})
	})
end

function MobileSettingsView.renderStateToggle(Humanoid: Humanoid, p1, p2, _) --[[ Line: 153 ]]
	return Humanoid:renderToggle(p1, Humanoid:GetState(p2), function(p3) --[[ Line: 156 ]]
		-- upvalues: Humanoid (copy), p2 (copy)
		Humanoid:UpdateState(p2, p3)
	end)
end

function MobileSettingsView.renderDropDown(Humanoid: Humanoid, Text1, p1, DropDownList, p2, FoundIndex, IsProfilingState) --[[ Line: 161 ]]
	-- upvalues: RoactModule (copy), ButtonWidth (copy), SmallFrameHeight (copy), ButtonTextSize (copy), Text (copy), MainWindow (copy), ConstantsModule (copy), DownArrow (copy), DropDownArrowHeight (copy), DropDownArrowHeightRatio (copy), DropDownModule (copy), MainWindowHeader (copy), UnselectedGray1 (copy)
	return RoactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, SmallFrameHeight)
	}, {
		Label = RoactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, ButtonWidth, 0, SmallFrameHeight),
			Position = UDim2.new(0.1, 0, 0, 0),
			Text = Text1,
			Font = MainWindowHeader,
			TextSize = ButtonTextSize,
			TextColor3 = ConstantsModule.Color.Text,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center,
			BackgroundColor3 = UnselectedGray1
		}),
		DropDown = if IsProfilingState then RoactModule.createElement("TextButton", {
			AutoButtonColor = true,
			BackgroundTransparency = 0,
			Position = UDim2.new(0.9, -ButtonWidth, 0, 0),
			Size = UDim2.new(0, ButtonWidth, 0, SmallFrameHeight),
			Text = DropDownList[FoundIndex],
			TextSize = ButtonTextSize,
			TextColor3 = Text,
			Font = MainWindow,
			BackgroundColor3 = ConstantsModule.Color.InactiveBox
		}, {
			arrow = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = DownArrow,
				Size = UDim2.new(0, DropDownArrowHeight, 0, DropDownArrowHeight),
				Position = UDim2.new(1, -DropDownArrowHeight - DropDownArrowHeightRatio, 0.5, -DropDownArrowHeightRatio)
			})
		}) else RoactModule.createElement("Frame", {
			Position = UDim2.new(0.9, -ButtonWidth, 0, 0),
			Size = UDim2.new(0, ButtonWidth, 0, SmallFrameHeight)
		}, {
			Selection = RoactModule.createElement(DropDownModule, {
				buttonSize = UDim2.new(1, 0, 0, SmallFrameHeight),
				dropDownList = DropDownList,
				selectedIndex = FoundIndex,
				onSelection = function(p3) --[[ Line: 193 ]]
					-- upvalues: Humanoid (copy), p1 (copy), p2 (copy)
					local State = Humanoid:GetState(p1)
					
					if typeof(State) == "boolean" then
						State = p3 == 2
					elseif typeof(State) == "number" then
						State = p2[p3]
					end
					Humanoid:UpdateState(p1, State)
				end
			})
		})
	})
end

function MobileSettingsView.render(Humanoid: Humanoid) --[[ Line: 229 ]]
	-- upvalues: RoactModule (copy), ConstantsModule (copy), ScaledMainRowPadding (copy), ScriptProfilerShowPlugins2 (copy), Buffer (copy), List (copy), Buffer1 (copy), List1 (copy), ProfilerUtilModule (copy), Buffer2 (copy), List2 (copy), DropDownList (copy)
	local IsProfilingState = Humanoid:GetState("isProfiling")
	
	return RoactModule.createElement("ScrollingFrame", {
		BackgroundTransparency = 1,
		LayoutOrder = 2,
		Size = Humanoid.props.size,
		BackgroundColor3 = ConstantsModule.Color.BaseGray,
		AutomaticCanvasSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = RoactModule.createElement("UIListLayout", {
			Padding = UDim.new(0, ScaledMainRowPadding),
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		Percentages = Humanoid:renderToggle("Percentages", Humanoid.props.usePercentages, function(p1) --[[ Line: 245 ]]
			-- upvalues: Humanoid (copy)
			Humanoid.props.dispatchSetScriptProfilerUsePercentages(p1)
		end),
		LiveToggle = Humanoid:renderStateToggle("Live Update", "liveUpdate"),
		PluginsToggle = if ScriptProfilerShowPlugins2 then Humanoid:renderStateToggle("Show Plugins", "showPlugins") else nil,
		GCToggle = Humanoid:renderStateToggle("GC Overhead", "showGc"),
		AverageDropDown = Humanoid:renderDropDown("Average", "average", Buffer, List, table.find(List, Humanoid:GetState("average")) or 1),
		FrequencyDropDown = Humanoid:renderDropDown("Frequency", "frequency", Buffer1, List1, table.find(List1, Humanoid:GetState("frequency")) or 1, IsProfilingState),
		TimerDropDown = Humanoid:renderDropDown("Timer" .. (if IsProfilingState then ": " .. ProfilerUtilModule.formatTimer(Humanoid:GetState("timedProfilingCountdown")) else ""), "timedProfilingDuration", Buffer2, List2, table.find(List2, Humanoid:GetState("timedProfilingDuration")) or 1, IsProfilingState),
		ViewDropDown = Humanoid:renderDropDown("View", "isFunctionsView", DropDownList, nil, if Humanoid:GetState("isFunctionsView") then 2 else 1)
	})
end

return RoactRoduxModule.UNSTABLE_connect2(function(p1, _) --[[ Line: 296 | Named "mapStateToProps" ]]
	return {
		usePercentages = p1.ScriptProfiler.usePercentages,
		isClientView = p1.ScriptProfiler.isClientView,
		client = p1.ScriptProfiler.client,
		server = p1.ScriptProfiler.server
	}
end, function(Callback) --[[ Line: 305 | Named "mapDispatchToProps" ]]
	-- upvalues: SetScriptProfilerStateModule (copy)
	return {
		dispatchSetScriptProfilerState = function(p1, p2) --[[ Line: 307 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			if p1 then
				Callback(SetScriptProfilerStateModule(p1, nil, p2, nil))
				
				return
			else
				Callback(SetScriptProfilerStateModule(p1, nil, nil, p2))
			end
		end,
		dispatchSetScriptProfilerUsePercentages = function(p1) --[[ Line: 315 ]]
			-- upvalues: Callback (copy), SetScriptProfilerStateModule (upval)
			Callback(SetScriptProfilerStateModule(nil, p1))
		end
	}
end)(MobileSettingsView)