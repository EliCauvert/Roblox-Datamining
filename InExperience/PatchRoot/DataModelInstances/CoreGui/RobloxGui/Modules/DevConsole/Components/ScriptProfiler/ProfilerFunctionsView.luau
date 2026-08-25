local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local _ = require(script.Parent.ProfilerDataFormatV2)
local profilerUtilModule = require(script.Parent.ProfilerUtil)
local getDurations = profilerUtilModule.getDurations
local formatSessionLength = profilerUtilModule.formatSessionLength
local getPluginFlag = profilerUtilModule.getPluginFlag
local headerButtonModule = require(script.Parent.Parent.Parent.Components.HeaderButton)
local profilerFunctionViewEntryModule = require(script.Parent.ProfilerFunctionViewEntry)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local lineWidth = constantsModule.GeneralFormatting.LineWidth
local lineColor = constantsModule.GeneralFormatting.LineColor
local headerFrameHeight = constantsModule.GeneralFormatting.HeaderFrameHeight
local _ = constantsModule.GeneralFormatting.EntryFrameHeight
local _ = constantsModule.GeneralFormatting.NoResultSearchStr
local headerNames = constantsModule.ScriptProfilerFormatting.HeaderNames
local valueCellWidth = constantsModule.ScriptProfilerFormatting.ValueCellWidth
local cellPadding = constantsModule.ScriptProfilerFormatting.CellPadding
local valuePadding = constantsModule.ScriptProfilerFormatting.ValuePadding
local profilerView = roactModule.PureComponent:extend("ProfilerView")

function profilerView.renderChildren(p0)
	-- upvalues: getDurations (ref), getPluginFlag (ref), roactModule (ref), profilerFunctionViewEntryModule (ref)
	local data = p0.props.data
	assert(data.Version == 2)
	local var6 = getDurations(data, 0)
	local t = {}
	local searchFilter = p0.props.searchFilter
	local showPlugins = p0.props.showPlugins
	local showGC = p0.props.showGC
	local gcFunctionOffsets = p0.props.gcFunctionOffsets
	local var8 = if p0.props.average > 0 and p0.props.sessionLength then p0.props.sessionLength / 1000 / p0.props.average else 1
	
	for i, v in ipairs(data.Functions) do
		if (#searchFilter <= 0 or searchFilter[i]) and (showPlugins or not getPluginFlag(data, v)) then
			t[i] = roactModule.createElement(profilerFunctionViewEntryModule, {
				layoutOrder = (var6 - v.TotalDuration) * 1000000,
				data = data,
				functionId = i,
				nodeName = v.Name,
				average = var8,
				gcOffset = if not showGC then gcFunctionOffsets[i] else nil,
				percentageRatio = if p0.props.showAsPercentages then var6 / 100 else nil
			})
		end
	end
	return t
end

function profilerView.render(p1)
	-- upvalues: roactModule (ref), constantsModule (ref), formatSessionLength (ref), headerFrameHeight (ref), headerButtonModule (ref), valueCellWidth (ref), valuePadding (ref), cellPadding (ref), lineColor (ref), headerNames (ref), lineWidth (ref)
	local layoutOrder = p1.props.layoutOrder
	local size = p1.props.size
	local textLabel = nil
	
	if p1.props.profiling and not p1.props.data then
		textLabel = roactModule.createElement("TextLabel", {
			Text = "Press Stop to Finish Profiling",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	elseif not p1.props.data then
		textLabel = roactModule.createElement("TextLabel", {
			Text = "Start Profiling to View Data",
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0),
			TextColor3 = constantsModule.Color.Text,
			LayoutOrder = layoutOrder
		})
	end
	local var10 = formatSessionLength(p1.props.sessionLength)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = size,
		LayoutOrder = layoutOrder
	}, {
		SessionInfo = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight)
		}, {
			Name = roactModule.createElement(headerButtonModule, {
				text = var10 and "Session Duration: " .. var10 or "Session Info",
				size = UDim2.new(1 - valueCellWidth * 2, (-valuePadding) - cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(0, cellPadding, 0, 0)
			}),
			TopHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = lineColor
			})
		}),
		Header = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, headerFrameHeight),
			Position = UDim2.new(0, 0, 0, headerFrameHeight)
		}, {
			Name = roactModule.createElement(headerButtonModule, {
				text = headerNames[1],
				size = UDim2.new(1 - valueCellWidth * 2, (-valuePadding) - cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(0, cellPadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			Inclusive = roactModule.createElement(headerButtonModule, {
				text = headerNames[2],
				size = UDim2.new(valueCellWidth, -cellPadding, 0, headerFrameHeight),
				pos = UDim2.new(1 - valueCellWidth * 1, valuePadding, 0, 0),
				sortfunction = p1.onSortChanged
			}),
			TopHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 1),
				BackgroundColor3 = lineColor
			}),
			LowerHorizontal = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, lineWidth),
				Position = UDim2.new(0, 0, 1, 0),
				BackgroundColor3 = lineColor
			}),
			Vertical1 = roactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, lineWidth, 1, 0),
				Position = UDim2.new(1 - valueCellWidth, 0, 0, 0),
				BackgroundColor3 = lineColor
			})
		}),
		Entries = roactModule.createElement("ScrollingFrame", {
			BackgroundTransparency = 1,
			ScrollBarThickness = 5,
			Size = UDim2.new(1, 0, 1, -headerFrameHeight * 2),
			Position = UDim2.new(0, 0, 0, headerFrameHeight * 2),
			VerticalScrollBarInset = Enum.ScrollBarInset.None,
			CanvasSize = UDim2.fromScale(0, 0),
			AutomaticCanvasSize = Enum.AutomaticSize.Y
		}, {
			Layout = roactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			Children = textLabel or roactModule.createFragment(p1:renderChildren())
		})
	})
end

return profilerView