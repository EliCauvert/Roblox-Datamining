local corePackagesService = game:GetService("CorePackages")
local roactModule = require(corePackagesService.Packages.Roact)
local linkingProtocol = require(corePackagesService.Workspace.Packages.LinkingProtocol).LinkingProtocol
local components = script.Parent.Parent.Parent.Components
local bannerButtonModule = require(components.BannerButton)
local boxButtonModule = require(components.BoxButton)
local cellCheckboxModule = require(components.CellCheckbox)
local cellLabelModule = require(components.CellLabel)
local dataConsumerModule = require(components.DataConsumer)
local dropDownModule = require(components.DropDown)
local headerButtonModule = require(components.HeaderButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local generalFormatting = constantsModule.GeneralFormatting
local lineWidth = generalFormatting.LineWidth
local lineColor = generalFormatting.LineColor
local debugVisualizationsFormatting = constantsModule.DebugVisualizationsFormatting
local chartHeaderNames = debugVisualizationsFormatting.ChartHeaderNames
local chartCellWidths = debugVisualizationsFormatting.ChartCellWidths
local headerFrameHeight = debugVisualizationsFormatting.HeaderFrameHeight
local entryFrameHeight = debugVisualizationsFormatting.EntryFrameHeight
local cellPadding = debugVisualizationsFormatting.CellPadding
local minFrameWidth = debugVisualizationsFormatting.MinFrameWidth
local learnMoreWidth = debugVisualizationsFormatting.LearnMoreWidth
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local mainWindow_1 = constantsModule.Font.MainWindow
local slimDevConsole2 = game:DefineFastFlag("SlimDevConsole2", false)
local textService = slimDevConsole2 and game:GetService("TextService") or nil

local function _(p1, p2)
	-- upvalues: learnMoreWidth (ref), cellPadding (ref)
	return if p2 == nil then p1 - cellPadding * 2 else p1 - learnMoreWidth - cellPadding * 2
end

local _ = function(p1, p2)
	-- upvalues: textService (ref), mainWindow (ref), mainWindow_1 (ref), entryFrameHeight (ref)
	return math.max(textService:GetTextSize(p1, mainWindow, mainWindow_1, Vector2.new(p2, 1e999)).Y, entryFrameHeight)
end

local var1 = 0

for i, v in ipairs(chartCellWidths) do
	var1 += v
end
local var2 = -var1
local t = {}
local t_1 = {}
local t_2 = {}
var2 /= 2
table.insert(t, UDim2.fromOffset(cellPadding, 0))
table.insert(t_1, UDim2.new(0.5, var2 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, var2 - cellPadding, 0, entryFrameHeight))

for i_1, v_1 in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(0.5, var2 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.fromOffset(v_1 - cellPadding, headerFrameHeight))
	table.insert(t_2, UDim2.fromOffset(v_1 - cellPadding, entryFrameHeight))
	var2 += v_1
end
table.insert(t, UDim2.new(0.5, var2 + cellPadding, 0, 0))
table.insert(t_1, UDim2.new(0.5, -var1 / 2 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, -var1 / 2 - cellPadding, 0, entryFrameHeight))
assert(#chartCellWidths == 2, "DebugVisualizationsChart expected DebugVisualizationsFormatting CELL_WIDTHS to have a length of 2")
assert(#t == 4, "DebugVisualizationsChart expected cellOffset to have length " .. 4)
assert(#t_1 == 4, "DebugVisualizationsChart expected headerCellSize to have length " .. 4)
assert(#t_2 == 4, "DebugVisualizationsChart expected entryCellSize to have length " .. 4)
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local debugVisualizationsChart = roactModule.Component:extend("DebugVisualizationsChart")

local function constructHeader(p1, p2)
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref)
	local t_2 = {}
	
	for i, v in ipairs(chartHeaderNames) do
		t_2[v] = roactModule.createElement(headerButtonModule, { text = v, size = t_1[i], pos = t[i], sortfunction = p1 })
	end
	t_2.upperHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 0, 0),
		BackgroundColor3 = lineColor
	})
	t_2.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, -lineWidth),
		BackgroundColor3 = lineColor
	})
	
	for i_1 = 2, #t_3 do
		t_2[string.format("VerticalLine_%d", i_1)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i_1],
			BackgroundColor3 = lineColor
		})
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p2, 0, headerFrameHeight)
	}, t_2)
end

local function constructEntry(p3, p4, p5, p6, p7, p8, p9, p10)
	-- upvalues: t_3 (ref), roactModule (ref), lineWidth (ref), lineColor (ref), cellLabelModule (ref), t_2 (ref), t (ref), slimDevConsole2 (ref), dropDownModule (ref), cellPadding (ref), entryFrameHeight (ref), cellCheckboxModule (ref), learnMoreWidth (ref), bannerButtonModule (ref), boxButtonModule (ref)
	local name = p3.name
	local settingInfo = p3.settingInfo
	local var3 = tostring(settingInfo.Name)
	local t_1 = {}
	
	for i = 2, #t_3 do
		t_1[string.format("line_%d", i)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i],
			BackgroundColor3 = lineColor
		})
	end
	t_1[name] = roactModule.createElement(cellLabelModule, { text = var3, size = t_2[1], pos = t[1] })
	
	if slimDevConsole2 and settingInfo.Kind == "Dropdown" then
		local enumItems = settingInfo.EnumItems
		local var4 = 1
		
		for i_1, v in ipairs(enumItems) do
			if v == settingInfo.Value then
				var4 = i_1
				break
			end
		end
		t_1.checkbox = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = t_2[2],
			Position = t[2]
		}, {
			DropDown = roactModule.createElement(dropDownModule, {
				buttonSize = UDim2.new(1, -cellPadding, 0, entryFrameHeight - 8),
				position = UDim2.new(0, 0, 0, 4),
				dropDownList = settingInfo.DropDownList,
				selectedIndex = var4,
				onSelection = function(p11)
					-- upvalues: p3 (ref), var3 (ref), enumItems (ref)
					p3.valueChangeCallback(var3, enumItems[p11])
				end
			})
		})
	else
		t_1.checkbox = roactModule.createElement(cellCheckboxModule, {
			name = var3,
			isSelected = settingInfo.Value,
			size = t_2[2],
			pos = t[2],
			OnCheckboxClicked = p3.valueChangeCallback
		})
	end
	local var5, uDim2
	t_1.visualType = roactModule.createElement(cellLabelModule, { text = settingInfo.Type, size = t_2[3], pos = t[3] })
	t_1.tags = roactModule.createElement(cellLabelModule, {
		text = tostring(settingInfo.Tagstring),
		size = t_2[4],
		pos = t[4]
	})
	t_1.lowerHorizontalLine = roactModule.createElement("Frame", {
		BorderSizePixel = 0,
		Size = UDim2.new(1, 0, 0, lineWidth),
		Position = UDim2.new(0, 0, 1, 0),
		BackgroundColor3 = lineColor
	})
	local learnMoreUrl = nil
	local _ = nil
	local _ = nil
	
	if slimDevConsole2 then
		learnMoreUrl = settingInfo.LearnMoreUrl
		var5 = learnMoreUrl ~= nil
		uDim2 = UDim2.new(0, if learnMoreUrl ~= nil then p4 - cellPadding * 2 else p4 - learnMoreWidth - cellPadding * 2, 0, p6)
	else
		var5 = true
		uDim2 = UDim2.new(0, p4 - learnMoreWidth - cellPadding * 2, 0, entryFrameHeight)
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p4, 0, p5),
		LayoutOrder = p7
	}, {
		Button = roactModule.createElement(bannerButtonModule, {
			size = UDim2.new(1, 0, 0, entryFrameHeight),
			pos = UDim2.new(),
			isExpanded = p8,
			onButtonPress = p9(name)
		}, t_1),
		DescriptionText = p8 and roactModule.createElement(cellLabelModule, {
			pos = UDim2.new(0, cellPadding, 0, entryFrameHeight + cellPadding),
			size = uDim2,
			text = tostring(settingInfo.Description)
		}),
		LearnMoreButton = p8 and (var5 and roactModule.createElement(boxButtonModule, {
			text = "Learn More",
			size = UDim2.new(0, learnMoreWidth, 0, entryFrameHeight),
			pos = UDim2.new(0, p4 - learnMoreWidth - cellPadding, 0, entryFrameHeight + cellPadding),
			onClicked = if slimDevConsole2 then p10(name, learnMoreUrl) else p10(name)
		}))
	})
end

function populateEntries(p11, p12, p13, p14, p15, p16, p17, p18, p19, p20)
	-- upvalues: roactModule (ref), entryFrameHeight (ref), slimDevConsole2 (ref), learnMoreWidth (ref), cellPadding (ref), textService (ref), mainWindow (ref), mainWindow_1 (ref), constructEntry (ref), lineColor (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local t_1 = {}
	
	for i, v in pairs(p12) do
		if v then
			table.insert(t_1, i)
		end
	end
	local p17Count = #p13
	local var6 = 0
	
	if p16 and p15 then
		local var7
		local var8 = -1
		local var9 = 0
		local var10 = 0
		
		for i_1, v_1 in ipairs(p13) do
			local var11 = false
			
			if p11 then
				var11 = if string.find(tostring(v_1.settingInfo.Name):lower(), p11:lower()) == nil then string.find(v_1.name:lower(), p11:lower()) ~= nil else string.find(tostring(v_1.settingInfo.Name):lower(), p11:lower()) ~= nil
			end
			if #t_1 <= 0 then
				if not p11 or var11 then
					local var12
					local var13 = p18 == v_1.name
					local _ = nil
					local var14 = entryFrameHeight
					
					if not slimDevConsole2 then
						var12 = if var13 then entryFrameHeight * 2 + cellPadding * 2 else entryFrameHeight
					elseif var13 then
						var14 = math.max(textService:GetTextSize(tostring(v_1.settingInfo.Description), mainWindow, mainWindow_1, Vector2.new(if v_1.settingInfo.LearnMoreUrl ~= nil then p17 - cellPadding * 2 else p17 - learnMoreWidth - cellPadding * 2, 1e999)).Y, entryFrameHeight)
						var12 = entryFrameHeight + var14 + cellPadding * 2
					else
						var12 = entryFrameHeight
					end
					if p15.Y <= var6 + entryFrameHeight then
						if var9 < p16.Y then
							t[i_1] = constructEntry(v_1, p17, var12, var14, (if p14 then p17Count - i_1 else i_1) + 1, var13, p19, p20)
						end
						if var8 < 0 then
							var8 = var6
						else
							var9 += entryFrameHeight
						end
						var10 += 1
					end
					var6 += var12
				end
			end
			var7 = false
			
			for i_2, v_2 in pairs(t_1) do
				if table.find(v_1.settingInfo.Tags, v_2) ~= nil then
					var7 = true
					break
				end
			end
			if p11 then
				var11 = var11 and var7
			else
				p11 = true
				var11 = var7
			end
		end
		if var10 == 0 then
			t.NoneFound = roactModule.createElement("TextLabel", {
				Text = "No DebugVisualizations Found",
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.fromScale(1, 1),
				TextColor3 = lineColor
			})
		else
			t.WindowingPadding = roactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, var8)
			})
		end
	end
	return t, var6
end

function debugVisualizationsChart.init(p21, p22)
	-- upvalues: linkingProtocol (ref), slimDevConsole2 (ref), roactModule (ref)
	local currentData = p22.DebugVisualizationsData:getCurrentData()
	
	function p25.getOnButtonPress(p23)
		-- upvalues: p21 (ref)
		return function(_, _)
			-- upvalues: p21 (copy), p23 (ref)
			p21:setState({ expandedEntry = p21.state.expandedEntry ~= p23 and p23 })
		end
	end
	
	function p25.getLearnMorePress(p23, p24)
		-- upvalues: linkingProtocol (copy), slimDevConsole2 (copy)
		return function(_, _)
			-- upvalues: linkingProtocol (copy), slimDevConsole2 (copy), p24 (ref), p23 (ref)
			linkingProtocol.default:openURL(if slimDevConsole2 then p24 else "https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. p28)
		end
	end
	
	function p25.onSortChanged(p23)
		-- upvalues: p22 (ref), p21 (ref)
		if p23 == p22.DebugVisualizationsData:getSortType() then
			p21:setState(function(p24)
				return { reverseSort = not p24.reverseSort }
			end)
			
			return
		end
		p22.DebugVisualizationsData:setSortType(p23)
		p21:setState({ reverseSort = false })
	end
	
	function p25.onCanvasPosChanged()
		-- upvalues: p21 (ref)
		p21:setState({ canvasPos = p21.scrollingRef.current.CanvasPosition })
	end
	
	p21.scrollingRef = roactModule.createRef()
	p21.state = {
		reverseSort = false,
		expandedEntry = nil,
		visualizationEntries = currentData
	}
end

function debugVisualizationsChart.didUpdate(p21)
	if p21.scrollingRef.current then
		local absoluteSize = p21.scrollingRef.current.AbsoluteSize
		
		if absoluteSize ~= p21.state.absScrollSize then
			p21:setState({ absScrollSize = absoluteSize })
		end
	end
end

function debugVisualizationsChart.didMount(p21)
	p21.visualizationsUpdated = p21.props.DebugVisualizationsData:Signal():Connect(function(p22)
		-- upvalues: p21 (ref)
		p21:setState({ visualizationEntries = p22 })
	end)
	
	if p21.scrollingRef.current then
		p21.canvasPosConnector = p21.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p21.onCanvasPosChanged)
		p21:setState({
			absScrollSize = p21.scrollingRef.current.AbsoluteSize,
			canvasPos = p21.scrollingRef.current.CanvasPosition
		})
	end
end

function debugVisualizationsChart.willUnmount(p21)
	p21.visualizationsUpdated:Disconnect()
	p21.visualizationsUpdated = nil
	p21.canvasPosConnector:Disconnect()
	p21.canvasPosConnector = nil
end

function debugVisualizationsChart.render(p21)
	-- upvalues: minFrameWidth (ref), roactModule (ref), constructHeader (ref), headerFrameHeight (ref), constantsModule (ref)
	local absScrollSize = p21.state.absScrollSize
	local x = absScrollSize and math.max(absScrollSize.X, minFrameWidth) or minFrameWidth
	local var15, var16 = populateEntries(p21.props.searchTerm, p21.props.typeFilters, p21.state.visualizationEntries, p21.state.reverseSort, p21.state.canvasPos, absScrollSize, x, p21.state.expandedEntry, p21.getOnButtonPress, p21.getLearnMorePress)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p21.props.size,
		LayoutOrder = p21.props.layoutOrder
	}, {
		Header = constructHeader(p21.onSortChanged, x),
		MainChart = roactModule.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			CanvasSize = UDim2.fromOffset(x, var16),
			ScrollBarThickness = 6,
			BackgroundColor3 = constantsModule.Color.BaseGray,
			BackgroundTransparency = 1,
			[roactModule.Ref] = p21.scrollingRef
		}, var15)
	})
end

return dataConsumerModule(debugVisualizationsChart, "DebugVisualizationsData")