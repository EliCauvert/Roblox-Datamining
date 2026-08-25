local corePackagesService = game:GetService("CorePackages")
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local microProfilerPanelModule = require(script.Parent.MicroProfilerPanel)
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local recentlyCapturedDumpsView = roactModule.Component:extend("RecentlyCapturedDumpsView")

function recentlyCapturedDumpsView.render(p0)
	-- upvalues: roactModule (ref), constantsModule (ref), microProfilerPanelModule (ref)
	local _ = p0.props.RecentDumpPaths or {}
	local t = {}
	
	for i, v in ipairs(p0.props.RecentDumpPaths) do
		table.insert(t, {
			DumpPathLabel = roactModule.createElement("TextBox", {
				TextSize = 14,
				BackgroundTransparency = 1,
				TextEditable = false,
				ClearTextOnFocus = false,
				ClipsDescendants = true,
				Font = constantsModule.Font.Log,
				Text = v,
				TextColor3 = constantsModule.Color.Text,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, constantsModule.MicroProfilerFormatting.RecentDumpPathPadding),
					PaddingRight = UDim.new(0, constantsModule.MicroProfilerFormatting.RecentDumpPathPadding)
				})
			})
		})
	end
	if #t == 0 then
		table.insert(t, {
			NoDumpsLabel = roactModule.createElement("TextLabel", {
				Text = "No recently captured MicroProfiler dumps.",
				BackgroundTransparency = 1,
				Font = constantsModule.Font.MainWindow,
				TextColor3 = constantsModule.Color.Text,
				TextSize = constantsModule.MicroProfilerFormatting.OptionTextSize,
				TextXAlignment = Enum.TextXAlignment.Left,
				Size = UDim2.fromScale(1, 1)
			}, {
				UIPadding = roactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, constantsModule.MicroProfilerFormatting.OptionTextPadding)
				})
			})
		})
	end
	return roactModule.createElement(microProfilerPanelModule, {
		Title = "Recently captured MicroProfiler dumps",
		LayoutOrder = p0.props.LayoutOrder,
		Sections = { { Name = "RecentlyCapturedDumps", Rows = t } }
	})
end

return roactRoduxModule.connect(function(p1, _)
	return { RecentDumpPaths = p1.MicroProfiler.recentDumpPaths }
end, nil)(recentlyCapturedDumpsView)