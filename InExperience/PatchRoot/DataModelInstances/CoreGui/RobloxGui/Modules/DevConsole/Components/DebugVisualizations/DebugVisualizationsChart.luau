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

local function _(p0, p1) --[[ line: 37 | named "getDescriptionWidth" ]]
	-- upvalues: learnMoreWidth (ref), cellPadding (ref)
	return if p1 == nil then p0 - cellPadding * 2 else p0 - learnMoreWidth - cellPadding * 2
end

local _ = function(p2, p3) --[[ line: 43 | named "getDescriptionHeight" ]]
	-- upvalues: textService (ref), mainWindow (ref), mainWindow_1 (ref), entryFrameHeight (ref)
	return math.max(textService:GetTextSize(p2, mainWindow, mainWindow_1, Vector2.new(p3, 1e999)).Y, entryFrameHeight)
end

local var12 = 0

for i, v in ipairs(chartCellWidths) do
	var12 += v
end
local var13 = -var12
local t = {}
local t_1 = {}
local t_2 = {}
var13 /= 2
table.insert(t, UDim2.fromOffset(cellPadding, 0))
table.insert(t_1, UDim2.new(0.5, var13 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, var13 - cellPadding, 0, entryFrameHeight))

for i_1, v_1 in ipairs(chartCellWidths) do
	table.insert(t, UDim2.new(0.5, var13 + cellPadding, 0, 0))
	table.insert(t_1, UDim2.fromOffset(v_1 - cellPadding, headerFrameHeight))
	table.insert(t_2, UDim2.fromOffset(v_1 - cellPadding, entryFrameHeight))
	var13 += v_1
end
table.insert(t, UDim2.new(0.5, var13 + cellPadding, 0, 0))
table.insert(t_1, UDim2.new(0.5, -var12 / 2 - cellPadding, 0, headerFrameHeight))
table.insert(t_2, UDim2.new(0.5, -var12 / 2 - cellPadding, 0, entryFrameHeight))
assert(#chartCellWidths == 2, "DebugVisualizationsChart expected DebugVisualizationsFormatting CELL_WIDTHS to have a length of 2")
assert(#t == 4, "DebugVisualizationsChart expected cellOffset to have length " .. 4)
assert(#t_1 == 4, "DebugVisualizationsChart expected headerCellSize to have length " .. 4)
assert(#t_2 == 4, "DebugVisualizationsChart expected entryCellSize to have length " .. 4)
local t_3 = {}

for i_2, v_2 in ipairs(t) do
	t_3[i_2] = UDim2.new(v_2.X.Scale, v_2.X.Offset - cellPadding, v_2.Y.Scale, v_2.Y.Offset)
end
local debugVisualizationsChart = roactModule.Component:extend("DebugVisualizationsChart")

local function constructHeader(p4, p5) --[[ line: 106 ]]
	-- upvalues: chartHeaderNames (ref), roactModule (ref), headerButtonModule (ref), t_1 (ref), t (ref), lineWidth (ref), lineColor (ref), t_3 (ref), headerFrameHeight (ref)
	local t_2 = {}
	
	for i, v in ipairs(chartHeaderNames) do
		t_2[v] = roactModule.createElement(headerButtonModule, { text = v, size = t_1[i], pos = t[i], sortfunction = p4 })
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
		Size = UDim2.new(0, p5, 0, headerFrameHeight)
	}, t_2)
end

local function constructEntry(p6, p7, p8, p9, p10, p11, p12, p13) --[[ line: 148 ]]
	-- upvalues: t_3 (ref), roactModule (ref), lineWidth (ref), lineColor (ref), cellLabelModule (ref), t_2 (ref), t (ref), slimDevConsole2 (ref), dropDownModule (ref), cellPadding (ref), entryFrameHeight (ref), cellCheckboxModule (ref), learnMoreWidth (ref), bannerButtonModule (ref), boxButtonModule (ref)
	local name = p6.name
	local settingInfo = p6.settingInfo
	local var22 = tostring(settingInfo.Name)
	local t_1 = {}
	
	for i = 2, #t_3 do
		t_1[string.format("line_%d", i)] = roactModule.createElement("Frame", {
			BorderSizePixel = 0,
			Size = UDim2.new(0, lineWidth, 1, 0),
			Position = t_3[i],
			BackgroundColor3 = lineColor
		})
	end
	t_1[name] = roactModule.createElement(cellLabelModule, { text = var22, size = t_2[1], pos = t[1] })
	
	if slimDevConsole2 and settingInfo.Kind == "Dropdown" then
		local enumItems = settingInfo.EnumItems
		local var24 = 1
		
		for i_1, v in ipairs(enumItems) do
			if v == settingInfo.Value then
				var24 = i_1
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
				selectedIndex = var24,
				onSelection = function(p14) --[[ line: 193 ]]
					-- upvalues: p6 (ref), var22 (ref), enumItems (ref)
					p6.valueChangeCallback(var22, enumItems[p14])
				end
			})
		})
	else
		t_1.checkbox = roactModule.createElement(cellCheckboxModule, {
			name = var22,
			isSelected = settingInfo.Value,
			size = t_2[2],
			pos = t[2],
			OnCheckboxClicked = p6.valueChangeCallback
		})
	end
	local var25, uDim2
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
		var25 = learnMoreUrl ~= nil
		uDim2 = UDim2.new(0, if learnMoreUrl ~= nil then p7 - cellPadding * 2 else p7 - learnMoreWidth - cellPadding * 2, 0, p9)
	else
		var25 = true
		uDim2 = UDim2.new(0, p7 - learnMoreWidth - cellPadding * 2, 0, entryFrameHeight)
	end
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(0, p7, 0, p8),
		LayoutOrder = p10
	}, {
		Button = roactModule.createElement(bannerButtonModule, {
			size = UDim2.new(1, 0, 0, entryFrameHeight),
			pos = UDim2.new(),
			isExpanded = p11,
			onButtonPress = p12(name)
		}, t_1),
		DescriptionText = p11 and roactModule.createElement(cellLabelModule, {
			pos = UDim2.new(0, cellPadding, 0, entryFrameHeight + cellPadding),
			size = uDim2,
			text = tostring(settingInfo.Description)
		}),
		LearnMoreButton = p11 and (var25 and roactModule.createElement(boxButtonModule, {
			text = "Learn More",
			size = UDim2.new(0, learnMoreWidth, 0, entryFrameHeight),
			pos = UDim2.new(0, p7 - learnMoreWidth - cellPadding, 0, entryFrameHeight + cellPadding),
			onClicked = if slimDevConsole2 then p13(name, learnMoreUrl) else p13(name)
		}))
	})
end

function populateEntries(p15, p16, p17, p18, p19, p20, p21, p22, p23, p24) --[[ line: 269 ]]
	-- upvalues: roactModule (ref), entryFrameHeight (ref), slimDevConsole2 (ref), learnMoreWidth (ref), cellPadding (ref), textService (ref), mainWindow (ref), mainWindow_1 (ref), constructEntry (ref), lineColor (ref)
	local t = {
		UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder
		})
	}
	local t_1 = {}
	
	for i, v in pairs(p16) do
		if v then
			table.insert(t_1, i)
		end
	end
	local p17Count = #p17
	local var30 = 0
	
	if p20 and p19 then
		local var35
		local var31 = -1
		local var32 = 0
		local var33 = 0
		
		for i_1, v_1 in ipairs(p17) do
			local var34 = false
			
			if p15 then
				var34 = if string.find(tostring(v_1.settingInfo.Name):lower(), p15:lower()) == nil then string.find(v_1.name:lower(), p15:lower()) ~= nil else string.find(tostring(v_1.settingInfo.Name):lower(), p15:lower()) ~= nil
			end
			if #t_1 <= 0 then
				if not p15 or var34 then
					local var38
					local var36 = p22 == v_1.name
					local _ = nil
					local var37 = entryFrameHeight
					
					if not slimDevConsole2 then
						var38 = if var36 then entryFrameHeight * 2 + cellPadding * 2 else entryFrameHeight
					elseif var36 then
						var37 = math.max(textService:GetTextSize(tostring(v_1.settingInfo.Description), mainWindow, mainWindow_1, Vector2.new(if v_1.settingInfo.LearnMoreUrl ~= nil then p21 - cellPadding * 2 else p21 - learnMoreWidth - cellPadding * 2, 1e999)).Y, entryFrameHeight)
						var38 = entryFrameHeight + var37 + cellPadding * 2
					else
						var38 = entryFrameHeight
					end
					if p19.Y <= var30 + entryFrameHeight then
						if var32 < p20.Y then
							t[i_1] = constructEntry(v_1, p21, var38, var37, (if p18 then p17Count - i_1 else i_1) + 1, var36, p23, p24)
						end
						if var31 < 0 then
							var31 = var30
						else
							var32 += entryFrameHeight
						end
						var33 += 1
					end
					var30 += var38
				end
			end
			var35 = false
			
			for i_2, v_2 in pairs(t_1) do
				if table.find(v_1.settingInfo.Tags, v_2) ~= nil then
					var35 = true
					break
				end
			end
			if p15 then
				var34 = var34 and var35
			else
				p15 = true
				var34 = var35
			end
		end
		if var33 == 0 then
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
				Size = UDim2.new(1, 0, 0, var31)
			})
		end
	end
	return t, var30
end

function debugVisualizationsChart.init(p25, p26) --[[ line: 393 ]]
	-- upvalues: linkingProtocol (ref), slimDevConsole2 (ref), roactModule (ref)
	local currentData = p26.DebugVisualizationsData:getCurrentData()
	
	function p25.getOnButtonPress(p27) --[[ line: 396 ]]
		-- upvalues: p25 (ref)
		return function(_, _) --[[ line: 397 ]]
			-- upvalues: p25 (copy), p27 (ref)
			p25:setState({ expandedEntry = p25.state.expandedEntry ~= p27 and p27 })
		end
	end
	
	function p25.getLearnMorePress(p28, p29) --[[ line: 404 ]]
		-- upvalues: linkingProtocol (copy), slimDevConsole2 (copy)
		return function(_, _) --[[ line: 405 ]]
			-- upvalues: linkingProtocol (copy), slimDevConsole2 (copy), p29 (ref), p28 (ref)
			linkingProtocol.default:openURL(if slimDevConsole2 then p29 else "https://create.roblox.com/docs/reference/engine/classes/PhysicsSettings#" .. p28)
		end
	end
	
	function p25.onSortChanged(p30) --[[ line: 413 ]]
		-- upvalues: p26 (ref), p25 (ref)
		if p30 == p26.DebugVisualizationsData:getSortType() then
			p25:setState(function(p31) --[[ line: 416 ]]
				return { reverseSort = not p31.reverseSort }
			end)
			
			return
		end
		p26.DebugVisualizationsData:setSortType(p30)
		p25:setState({ reverseSort = false })
	end
	
	function p25.onCanvasPosChanged() --[[ line: 430 ]]
		-- upvalues: p25 (ref)
		p25:setState({ canvasPos = p25.scrollingRef.current.CanvasPosition })
	end
	
	p25.scrollingRef = roactModule.createRef()
	p25.state = {
		reverseSort = false,
		expandedEntry = nil,
		visualizationEntries = currentData
	}
end

function debugVisualizationsChart.didUpdate(p32) --[[ line: 446 ]]
	if p32.scrollingRef.current then
		local absoluteSize = p32.scrollingRef.current.AbsoluteSize
		
		if absoluteSize ~= p32.state.absScrollSize then
			p32:setState({ absScrollSize = absoluteSize })
		end
	end
end

function debugVisualizationsChart.didMount(p33) --[[ line: 458 ]]
	p33.visualizationsUpdated = p33.props.DebugVisualizationsData:Signal():Connect(function(p34) --[[ line: 459 ]]
		-- upvalues: p33 (ref)
		p33:setState({ visualizationEntries = p34 })
	end)
	
	if p33.scrollingRef.current then
		p33.canvasPosConnector = p33.scrollingRef.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p33.onCanvasPosChanged)
		p33:setState({
			absScrollSize = p33.scrollingRef.current.AbsoluteSize,
			canvasPos = p33.scrollingRef.current.CanvasPosition
		})
	end
end

function debugVisualizationsChart.willUnmount(p35) --[[ line: 476 ]]
	p35.visualizationsUpdated:Disconnect()
	p35.visualizationsUpdated = nil
	p35.canvasPosConnector:Disconnect()
	p35.canvasPosConnector = nil
end

function debugVisualizationsChart.render(p36) --[[ line: 483 ]]
	-- upvalues: minFrameWidth (ref), roactModule (ref), constructHeader (ref), headerFrameHeight (ref), constantsModule (ref)
	local absScrollSize = p36.state.absScrollSize
	local x = absScrollSize and math.max(absScrollSize.X, minFrameWidth) or minFrameWidth
	local var41, var42 = populateEntries(p36.props.searchTerm, p36.props.typeFilters, p36.state.visualizationEntries, p36.state.reverseSort, p36.state.canvasPos, absScrollSize, x, p36.state.expandedEntry, p36.getOnButtonPress, p36.getLearnMorePress)
	
	return roactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ClipsDescendants = true,
		Size = p36.props.size,
		LayoutOrder = p36.props.layoutOrder
	}, {
		Header = constructHeader(p36.onSortChanged, x),
		MainChart = roactModule.createElement("ScrollingFrame", {
			Position = UDim2.fromOffset(0, headerFrameHeight),
			Size = UDim2.new(1, 0, 1, -headerFrameHeight),
			CanvasSize = UDim2.fromOffset(x, var42),
			ScrollBarThickness = 6,
			BackgroundColor3 = constantsModule.Color.BaseGray,
			BackgroundTransparency = 1,
			[roactModule.Ref] = p36.scrollingRef
		}, var41)
	})
end

return dataConsumerModule(debugVisualizationsChart, "DebugVisualizationsData")