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

local function countContextLines(p1, p2)
	-- upvalues: countContextLines (ref)
	local var1 = 0
	
	for i, v in p1 do
		if i ~= "_expanded" then
			var1 += 1
			
			if type(v) == "table" and p2 + 1 < 3 and v._expanded then
				var1 += countContextLines(v, p2 + 1)
			end
		end
	end
	return var1
end

local logOutput = roactModule.Component:extend("LogOutput")

function logOutput.init(p3, p4)
	-- upvalues: roactModule (ref)
	local var2 = p4.initLogOutput and p4.initLogOutput()
	
	function p2.onCanvasChange()
		-- upvalues: p3 (ref)
		local current = p3.ref.current
		
		if current then
			local canvasPosition = current.CanvasPosition
			local absoluteSize = current.AbsoluteSize
			
			if p3.state.canvasPos ~= canvasPosition or p3.state.absSize ~= absoluteSize then
				p3:setState({
					canvasPos = canvasPosition,
					absSize = absoluteSize,
					autoScroll = current.CanvasPosition.Y + current.AbsoluteSize.Y == current.CanvasSize.Y.Offset
				})
			end
		end
	end
	
	p3.ref = roactModule.createRef()
	p3.state = {
		autoScroll = true,
		wordWrap = true,
		logData = var2,
		absSize = Vector2.new(),
		canvasPos = Vector2.new()
	}
end

function logOutput.willUpdate(p3, _, _)
	p3._canvasSignal:Disconnect()
	p3._absSizeSignal:Disconnect()
end

function logOutput.didUpdate(p3)
	p3._canvasSignal = p3.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p3.onCanvasChange)
	p3._absSizeSignal = p3.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p3.onCanvasChange)
	
	if p3.state.autoScroll then
		local current = p3.ref.current
		
		if current then
			current.CanvasPosition = Vector2.new(current.CanvasPosition.X, p3.ref.current.CanvasSize.Y.Offset + p3.ref.current.AbsoluteSize.Y)
		end
	end
end

function logOutput.didMount(p3)
	-- upvalues: textFrameHeight (ref), textFramePadding (ref)
	p3.logConnector = p3.props.targetSignal:Connect(function(p4)
		-- upvalues: p3 (ref), textFrameHeight (copy), textFramePadding (copy)
		if p3.state.autoScroll or p4:getSize() ~= p4:getMaxSize() then
			p3:setState({ logData = p4 })
			
			return
		end
		local canvasPos = p3.state.canvasPos
		local y = canvasPos.Y
		local var2 = p4:back()
		
		if var2 then
			local y_1 = var2.Dims.Y
			local var3 = p3.state.absSize.X - textFrameHeight
			
			if p3.state.wordWrap and var3 > 0 then
				y_1 = math.ceil(var2.Dims.Y * math.ceil(var2.Dims.X / var3))
			end
			y = math.max(0, y - y_1 - textFramePadding)
		end
		p3:setState({ logData = p4, canvasPos = Vector2.new(canvasPos.X, y) })
	end)
	p3._canvasSignal = p3.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p3.onCanvasChange)
	p3._absSizeSignal = p3.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p3.onCanvasChange)
	
	if p3.ref.current.AbsoluteSize.Magnitude > 0 then
		p3:setState({ absSize = p3.ref.current.AbsoluteSize })
	end
end

function logOutput.willUnmount(p3)
	p3.logConnector:Disconnect()
	p3.logConnector = nil
end

function logOutput.render(p3)
	-- upvalues: textFrameHeight (ref), roactModule (ref), bannerButtonModule (ref), mainWindow (ref), log (ref), textFramePadding (ref), countContextLines (ref), constantsModule (ref), iconHeight (ref), maxStringSize (ref), textService (ref)
	local layoutOrder = p3.props.layoutOrder
	local size = p3.props.size
	local logData = p3.state.logData
	local absSize = p3.state.absSize
	local canvasPos = p3.state.canvasPos
	local wordWrap = p3.state.wordWrap
	local t = {}
	local var2 = 1
	local var3 = 0
	
	if p3.ref.current and logData then
		local var4 = absSize.X - textFrameHeight
		local var5 = -1
		local var6 = 0
		
		local function _(p4)
			-- upvalues: p3 (ref)
			return function()
				-- upvalues: p4 (ref), p3 (copy)
				p4.Expanded = not p4.Expanded
				p3:setState({})
			end
		end
		
		local function addContextEntries(p4, p5, p6, p7, p8)
			-- upvalues: roactModule (copy), bannerButtonModule (copy), mainWindow (copy), p3 (ref), log (copy), addContextEntries (ref)
			if p7 >= 3 then return end
			local t = {}
			
			for i in p5 do
				if i ~= "_expanded" then
					table.insert(t, i)
				end
			end
			table.sort(t, function(p9, p10)
				return tostring(p9) < tostring(p10)
			end)
			local var7 = p7 * 20 + 20
			
			for i_1, v in t do
				local var8 = p5[v]
				p8.i += 1
				local i_2 = p8.i
				local var9 = `Ctx_{p7}_{tostring(v)}`
				
				if type(var8) == "table" and p7 + 1 < 3 then
					p4[var9] = roactModule.createElement(bannerButtonModule, {
						isExpandable = true,
						hideLines = true,
						size = UDim2.new(1, 0, 0, mainWindow),
						isExpanded = var8._expanded,
						layoutOrder = i_2,
						onButtonPress = function()
							-- upvalues: var8 (ref), p3 (copy)
							var8._expanded = not var8._expanded
							p3:setState({})
						end
					}, {
						Label = roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = `{tostring(v)}: \{...}`,
							TextSize = mainWindow,
							Font = log,
							TextColor3 = p6,
							Size = UDim2.new(1, -(var7 + 20), 1, 0),
							Position = UDim2.fromOffset(var7 + 20, 0),
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
					
					if var8._expanded then
						addContextEntries(p4, var8, p6, p7 + 1, p8)
					end
				else
					p4[var9] = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = `{tostring(v)}: {tostring(var8)}`,
						TextSize = mainWindow,
						Font = log,
						TextColor3 = p6,
						Size = UDim2.new(1, 0, 0, mainWindow),
						LayoutOrder = i_2,
						TextXAlignment = Enum.TextXAlignment.Left
					}, {
						Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var7 + 20) })
					})
				end
			end
		end
		
		local var10 = logData:iterator()
		local var11 = var10:next()
		while var11 do
			local var12 = var11
			local message = var12.Message
			local charCount = var12.CharCount
			local var13 = if wordWrap and var4 > 0 then math.ceil(var12.Dims.Y * math.ceil(var12.Dims.X / var4)) else var12.Dims.Y
			local var14 = 0
			
			if var12.Context then
				var14 = mainWindow + textFramePadding
				
				if var12.Expanded then
					var14 += countContextLines(var12.Context, 0) * (mainWindow + textFramePadding)
				end
			end
			local var15 = var13 + var14
			var2 += 1
			
			if canvasPos.Y <= var3 + var15 then
				if var6 < absSize.Y then
					local text = constantsModule.Color.Text
					local var16 = ""
					
					if var12.Type == Enum.MessageType.MessageOutput.Value then
						text = constantsModule.Color.Text
					elseif var12.Type == Enum.MessageType.MessageInfo.Value then
						text = constantsModule.Color.HighlightBlue
						var16 = constantsModule.Image.Info
					elseif var12.Type == Enum.MessageType.MessageWarning.Value then
						text = constantsModule.Color.WarningYellow
						var16 = constantsModule.Image.Warning
					elseif var12.Type == Enum.MessageType.MessageError.Value then
						text = constantsModule.Color.ErrorRed
						var16 = constantsModule.Image.Error
					end
					local t_1 = {}
					
					if var12.Context then
						t_1.Layout = roactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, textFramePadding)
						})
						t_1.Header = roactModule.createElement(bannerButtonModule, {
							isExpandable = true,
							layoutOrder = 0,
							hideLines = true,
							size = UDim2.new(1, 0, 0, mainWindow),
							isExpanded = var12.Expanded,
							onButtonPress = function()
								-- upvalues: var12 (ref), p3 (ref)
								var12.Expanded = not var12.Expanded
								p3:setState({})
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
						
						if var12.Expanded then
							addContextEntries(t_1, var12.Context, text, 0, { i = 0 })
						end
					end
					t[var2] = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, var15),
						LayoutOrder = var2
					}, {
						image = roactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Image = var16,
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
							Size = UDim2.new(1, 0, 0, var13),
							Position = UDim2.new(0, textFrameHeight, 0, 0)
						}),
						context = var12.Context and roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -textFrameHeight, 0, var14),
							Position = UDim2.new(0, textFrameHeight, 0, var13 + textFramePadding)
						}, t_1)
					})
				end
				if var5 < 0 then
					var5 = var3
				else
					var6 = var6 + var15 + textFramePadding
				end
			end
			var3 = var3 + var15 + textFramePadding
			
			if charCount < maxStringSize then
				var11 = var10:next()
			else
				local formattedText = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", charCount, maxStringSize)
				var11 = {
					Message = formattedText,
					CharCount = #formattedText,
					Type = var12.Type,
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
			Size = UDim2.new(1, 0, 0, var5)
		})
	end
	return roactModule.createElement("ScrollingFrame", {
		Size = size,
		BackgroundTransparency = 1,
		VerticalScrollBarInset = 1,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, var3),
		CanvasPosition = canvasPos,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p3.ref
	}, t)
end

return logOutput