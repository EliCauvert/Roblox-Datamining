local CorePackages = game:GetService("CorePackages")
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MicroProfilerPanelModule = require(script.Parent.MicroProfilerPanel)
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RecentlyCapturedDumpsView = RoactModule.Component:extend("RecentlyCapturedDumpsView")

function RecentlyCapturedDumpsView.render(p1)
	-- upvalues: RoactModule (copy), ConstantsModule (copy), MicroProfilerPanelModule (copy)
	if p1.props.RecentDumpPaths then
	end
	local List = {}
	
	for _, recentDumpPath in ipairs(p1.props.RecentDumpPaths) do
		table.insert(List, {
			DumpPathLabel = RoactModule.createElement("TextBox", {
				TextSize = 14,
				BackgroundTransparency = 1,
				TextEditable = false,
				ClearTextOnFocus = false,
				ClipsDescendants = true,
				Font = ConstantsModule.Font.Log,
				Text = recentDumpPath,
				TextColor3 = ConstantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, ConstantsModule.MicroProfilerFormatting.RecentDumpPathPadding),
					PaddingRight = UDim.new(0, ConstantsModule.MicroProfilerFormatting.RecentDumpPathPadding)
				})
			})
		})
	end
	if #List == 0 then
		table.insert(List, {
			NoDumpsLabel = RoactModule.createElement("TextLabel", {
				Text = "No recently captured MicroProfiler dumps.",
				BackgroundTransparency = 1,
				Font = ConstantsModule.Font.MainWindow,
				TextColor3 = ConstantsModule.Color.Text,
				TextSize = ConstantsModule.MicroProfilerFormatting.OptionTextSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, ConstantsModule.MicroProfilerFormatting.OptionTextPadding)
				})
			})
		})
	end
	return RoactModule.createElement(MicroProfilerPanelModule, {
		Title = "Recently captured MicroProfiler dumps",
		LayoutOrder = p1.props.LayoutOrder,
		Sections = { { Name = "RecentlyCapturedDumps", Rows = List } }
	})
end

return RoactRoduxModule.connect(function(p2, _)
	return { RecentDumpPaths = p2.MicroProfiler.recentDumpPaths }
end, nil)(RecentlyCapturedDumpsView)