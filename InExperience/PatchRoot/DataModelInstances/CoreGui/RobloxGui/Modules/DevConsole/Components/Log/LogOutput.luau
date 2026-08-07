local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local bannerButtonModule = require(script.Parent.Parent.Parent.Components.BannerButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local log = constantsModule.Font.Log
local iconHeight = constantsModule.LogFormatting.IconHeight
local textFrameHeight = constantsModule.LogFormatting.TextFrameHeight
local textFramePadding = constantsModule.LogFormatting.TextFramePadding
local maxStringSize = constantsModule.LogFormatting.MaxStringSize

local function countContextLines(p0, p1) --[[ line: 23 ]]
	-- upvalues: countContextLines (ref)
	local var6 = 0
	
	for i, v in p0 do
		if i ~= "_expanded" then
			var6 += 1
			
			if type(v) == "table" and p1 + 1 < 3 and v._expanded then
				var6 += countContextLines(v, p1 + 1)
			end
		end
	end
	return var6
end

local logOutput = roactModule.Component:extend("LogOutput")

function logOutput.init(p2, p3) --[[ line: 38 ]]
	-- upvalues: roactModule (ref)
	local var7 = p3.initLogOutput and p3.initLogOutput()
	
	function p2.onCanvasChange() --[[ line: 41 ]]
		-- upvalues: p2 (ref)
		local current = p2.ref.current
		
		if current then
			local canvasPosition = current.CanvasPosition
			local absoluteSize = current.AbsoluteSize
			
			if p2.state.canvasPos ~= canvasPosition or p2.state.absSize ~= absoluteSize then
				p2:setState({
					canvasPos = canvasPosition,
					absSize = absoluteSize,
					autoScroll = current.CanvasPosition.Y + current.AbsoluteSize.Y == current.CanvasSize.Y.Offset
				})
			end
		end
	end
	
	p2.ref = roactModule.createRef()
	p2.state = {
		autoScroll = true,
		wordWrap = true,
		logData = var7,
		absSize = Vector2.new(),
		canvasPos = Vector2.new()
	}
end

function logOutput.willUpdate(p4, _, _) --[[ line: 71 ]]
	p4._canvasSignal:Disconnect()
	p4._absSizeSignal:Disconnect()
end

function logOutput.didUpdate(p5) --[[ line: 76 ]]
	p5._canvasSignal = p5.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p5.onCanvasChange)
	p5._absSizeSignal = p5.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p5.onCanvasChange)
	
	if p5.state.autoScroll then
		local current = p5.ref.current
		
		if current then
			current.CanvasPosition = Vector2.new(current.CanvasPosition.X, p5.ref.current.CanvasSize.Y.Offset + p5.ref.current.AbsoluteSize.Y)
		end
	end
end

function logOutput.didMount(p6) --[[ line: 92 ]]
	-- upvalues: textFrameHeight (ref), textFramePadding (ref)
	p6.logConnector = p6.props.targetSignal:Connect(function(p7) --[[ line: 93 ]]
		-- upvalues: p6 (ref), textFrameHeight (copy), textFramePadding (copy)
		if p6.state.autoScroll or p7:getSize() ~= p7:getMaxSize() then
			p6:setState({ logData = p7 })
			
			return
		end
		local canvasPos = p6.state.canvasPos
		local y = canvasPos.Y
		local var8 = p7:back()
		
		if var8 then
			local y_1 = var8.Dims.Y
			local var9 = p6.state.absSize.X - textFrameHeight
			
			if p6.state.wordWrap and var9 > 0 then
				y_1 = math.ceil(var8.Dims.Y * math.ceil(var8.Dims.X / var9))
			end
			y = math.max(0, y - y_1 - textFramePadding)
		end
		p6:setState({ logData = p7, canvasPos = Vector2.new(canvasPos.X, y) })
	end)
	p6._canvasSignal = p6.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p6.onCanvasChange)
	p6._absSizeSignal = p6.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p6.onCanvasChange)
	
	if p6.ref.current.AbsoluteSize.Magnitude > 0 then
		p6:setState({ absSize = p6.ref.current.AbsoluteSize })
	end
end

function logOutput.willUnmount(p8) --[[ line: 137 ]]
	p8.logConnector:Disconnect()
	p8.logConnector = nil
end

function logOutput.render(p9) --[[ line: 142 ]]
	-- upvalues: textFrameHeight (ref), roactModule (ref), bannerButtonModule (ref), mainWindow (ref), log (ref), textFramePadding (ref), countContextLines (ref), constantsModule (ref), iconHeight (ref), maxStringSize (ref), textService (ref)
	local layoutOrder = p9.props.layoutOrder
	local size = p9.props.size
	local logData = p9.state.logData
	local absSize = p9.state.absSize
	local canvasPos = p9.state.canvasPos
	local wordWrap = p9.state.wordWrap
	local t = {}
	local var11 = 1
	local var12 = 0
	
	if p9.ref.current and logData then
		local var13 = absSize.X - textFrameHeight
		local var14 = -1
		local var15 = 0
		
		local function _(p10) --[[ line: 161 | named "createOnButtonPress" ]]
			-- upvalues: p9 (ref)
			return function() --[[ line: 162 ]]
				-- upvalues: p10 (ref), p9 (copy)
				p10.Expanded = not p10.Expanded
				p9:setState({})
			end
		end
		
		local function addContextEntries(p11, p12, p13, p14, p15) --[[ line: 168 ]]
			-- upvalues: roactModule (copy), bannerButtonModule (copy), mainWindow (copy), p9 (ref), log (copy), addContextEntries (ref)
			if p14 >= 3 then return end
			local t = {}
			
			for i in p12 do
				if i ~= "_expanded" then
					table.insert(t, i)
				end
			end
			table.sort(t, function(p16, p17) --[[ line: 176 ]]
				return tostring(p16) < tostring(p17)
			end)
			local var27 = p14 * 20 + 20
			
			for i_1, v in t do
				local var28 = p12[v]
				p15.i += 1
				local i_2 = p15.i
				local var29 = `Ctx_{p14}_{tostring(v)}`
				
				if type(var28) == "table" and p14 + 1 < 3 then
					p11[var29] = roactModule.createElement(bannerButtonModule, {
						isExpandable = true,
						hideLines = true,
						size = UDim2.new(1, 0, 0, mainWindow),
						isExpanded = var28._expanded,
						layoutOrder = i_2,
						onButtonPress = function() --[[ line: 194 ]]
							-- upvalues: var28 (ref), p9 (copy)
							var28._expanded = not var28._expanded
							p9:setState({})
						end
					}, {
						Label = roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = `{tostring(v)}: \{...}`,
							TextSize = mainWindow,
							Font = log,
							TextColor3 = p13,
							Size = UDim2.new(1, -(var27 + 20), 1, 0),
							Position = UDim2.fromOffset(var27 + 20, 0),
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
					
					if var28._expanded then
						addContextEntries(p11, var28, p13, p14 + 1, p15)
					end
				else
					p11[var29] = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = `{tostring(v)}: {tostring(var28)}`,
						TextSize = mainWindow,
						Font = log,
						TextColor3 = p13,
						Size = UDim2.new(1, 0, 0, mainWindow),
						LayoutOrder = i_2,
						TextXAlignment = Enum.TextXAlignment.Left
					}, {
						Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var27 + 20) })
					})
				end
			end
		end
		
		local var17 = logData:iterator()
		local var18 = var17:next()
		while var18 do
			local var19 = var18
			local message = var19.Message
			local charCount = var19.CharCount
			local var20 = if wordWrap and var13 > 0 then math.ceil(var19.Dims.Y * math.ceil(var19.Dims.X / var13)) else var19.Dims.Y
			local var21 = 0
			
			if var19.Context then
				var21 = mainWindow + textFramePadding
				
				if var19.Expanded then
					var21 += countContextLines(var19.Context, 0) * (mainWindow + textFramePadding)
				end
			end
			local var22 = var20 + var21
			var11 += 1
			
			if canvasPos.Y <= var12 + var22 then
				if var15 < absSize.Y then
					local text = constantsModule.Color.Text
					local var23 = ""
					
					if var19.Type == Enum.MessageType.MessageOutput.Value then
						text = constantsModule.Color.Text
					elseif var19.Type == Enum.MessageType.MessageInfo.Value then
						text = constantsModule.Color.HighlightBlue
						var23 = constantsModule.Image.Info
					elseif var19.Type == Enum.MessageType.MessageWarning.Value then
						text = constantsModule.Color.WarningYellow
						var23 = constantsModule.Image.Warning
					elseif var19.Type == Enum.MessageType.MessageError.Value then
						text = constantsModule.Color.ErrorRed
						var23 = constantsModule.Image.Error
					end
					local t_1 = {}
					
					if var19.Context then
						t_1.Layout = roactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, textFramePadding)
						})
						t_1.Header = roactModule.createElement(bannerButtonModule, {
							isExpandable = true,
							layoutOrder = 0,
							hideLines = true,
							size = UDim2.new(1, 0, 0, mainWindow),
							isExpanded = var19.Expanded,
							onButtonPress = function() --[[ line: 162 ]]
								-- upvalues: var19 (ref), p9 (ref)
								var19.Expanded = not var19.Expanded
								p9:setState({})
							end
						}, {
							Label = roactModule.createElement("TextLabel", {
								Text = "Context: {...}",
								BackgroundTransparency = 1,
								TextSize = mainWindow,
								Font = log,
								TextColor3 = text,
								Size = UDim2.new(1, -20, 1, 0),
								Position = UDim2.fromOffset(20, 0),
								TextXAlignment = Enum.TextXAlignment.Left
							})
						})
						
						if var19.Expanded then
							addContextEntries(t_1, var19.Context, text, 0, { i = 0 })
						end
					end
					t[var11] = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, var22),
						LayoutOrder = var11
					}, {
						image = roactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Image = var23,
							Size = UDim2.new(0, iconHeight, 0, iconHeight),
							Position = UDim2.new(0, iconHeight / 4, 0, (mainWindow - iconHeight) / 2)
						}),
						msg = roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = message,
							TextColor3 = text,
							TextSize = mainWindow,
							Font = log,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextWrapped = wordWrap,
							Size = UDim2.new(1, 0, 0, var20),
							Position = UDim2.new(0, textFrameHeight, 0, 0)
						}),
						context = var19.Context and roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -textFrameHeight, 0, var21),
							Position = UDim2.new(0, textFrameHeight, 0, var20 + textFramePadding)
						}, t_1)
					})
				end
				if var14 < 0 then
					var14 = var12
				else
					var15 = var15 + var22 + textFramePadding
				end
			end
			var12 = var12 + var22 + textFramePadding
			
			if charCount < maxStringSize then
				var18 = var17:next()
			else
				local formattedText = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", charCount, maxStringSize)
				var18 = {
					Message = formattedText,
					CharCount = #formattedText,
					Type = var19.Type,
					Dims = textService:GetTextSize(formattedText, mainWindow, log, Vector2.new())
				}
			end
		end
		t.UIListLayout = roactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, textFramePadding)
		})
		t.WindowingPadding = roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, var14)
		})
	end
	return roactModule.createElement("ScrollingFrame", {
		Size = size,
		BackgroundTransparency = 1,
		VerticalScrollBarInset = 1,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, var12),
		CanvasPosition = canvasPos,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p9.ref
	}, t)
end

return logOutput