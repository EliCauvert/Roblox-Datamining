local textService = game:GetService("TextService")
local roactModule = require(game:GetService("CorePackages").Packages.Roact)
local devConsoleFixMultilineContext = game:DefineFastFlag("DevConsoleFixMultilineContext", false)
local bannerButtonModule = require(script.Parent.Parent.Parent.Components.BannerButton)
local constantsModule = require(script.Parent.Parent.Parent.Constants)
local mainWindow = constantsModule.DefaultFontSize.MainWindow
local log = constantsModule.Font.Log
local iconHeight = constantsModule.LogFormatting.IconHeight
local textFrameHeight = constantsModule.LogFormatting.TextFrameHeight
local textFramePadding = constantsModule.LogFormatting.TextFramePadding
local maxStringSize = constantsModule.LogFormatting.MaxStringSize

local function _(p1, p2)
	local _, replaced = string.gsub(`{p1}: {p2}`, "\n", "")
	
	return replaced + 1
end

local function countContextLines(p1, p2)
	-- upvalues: devConsoleFixMultilineContext (ref), countContextLines (ref)
	local var1 = 0
	
	for i, v in p1 do
		if i ~= "_expanded" then
			local var2 = type(v) == "table" and p2 + 1 < 3
			
			if devConsoleFixMultilineContext and not var2 then
				local _, replaced = string.gsub(`{tostring(i)}: {tostring(v)}`, "\n", "")
				var1 += replaced + 1
			else
				var1 += 1
			end
			if var2 and v._expanded then
				var1 += countContextLines(v, p2 + 1)
			end
		end
	end
	return var1
end

local logOutput = roactModule.Component:extend("LogOutput")

function logOutput.init(p3, p4)
	-- upvalues: roactModule (ref)
	local var3 = p4.initLogOutput and p4.initLogOutput()
	
	function p4.onCanvasChange()
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
		logData = var3,
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
		local var3 = p4:back()
		
		if var3 then
			local y_1 = var3.Dims.Y
			local var4 = p3.state.absSize.X - textFrameHeight
			
			if p3.state.wordWrap and var4 > 0 then
				y_1 = math.ceil(var3.Dims.Y * math.ceil(var3.Dims.X / var4))
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
	-- upvalues: textFrameHeight (ref), roactModule (ref), bannerButtonModule (ref), mainWindow (ref), log (ref), devConsoleFixMultilineContext (ref), textFramePadding (ref), countContextLines (ref), constantsModule (ref), iconHeight (ref), maxStringSize (ref), textService (ref)
	local layoutOrder = p3.props.layoutOrder
	local size = p3.props.size
	local logData = p3.state.logData
	local absSize = p3.state.absSize
	local canvasPos = p3.state.canvasPos
	local wordWrap = p3.state.wordWrap
	local t = {}
	local var3 = 1
	local var4 = 0
	
	if p3.ref.current and logData then
		local var5 = absSize.X - textFrameHeight
		local var6 = -1
		local var7 = 0
		
		local function _(p4)
			-- upvalues: p3 (ref)
			return function()
				-- upvalues: p4 (ref), p3 (copy)
				p4.Expanded = not p4.Expanded
				p3:setState({})
			end
		end
		
		local function addContextEntries(p4, p5, p6, p7, p8)
			-- upvalues: roactModule (copy), bannerButtonModule (copy), mainWindow (copy), p3 (ref), log (copy), addContextEntries (ref), devConsoleFixMultilineContext (copy), textFramePadding (copy)
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
			local var8 = p7 * 20 + 20
			
			for i_1, v in t do
				local var9 = p5[v]
				p8.i += 1
				local i_2 = p8.i
				local var10 = `Ctx_{p7}_{tostring(v)}`
				
				if type(var9) == "table" and p7 + 1 < 3 then
					p4[var10] = roactModule.createElement(bannerButtonModule, {
						isExpandable = true,
						hideLines = true,
						size = UDim2.new(1, 0, 0, mainWindow),
						isExpanded = var9._expanded,
						layoutOrder = i_2,
						onButtonPress = function()
							-- upvalues: var9 (ref), p3 (copy)
							var9._expanded = not var9._expanded
							p3:setState({})
						end
					}, {
						Label = roactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = `{tostring(v)}: \{...}`,
							TextSize = mainWindow,
							Font = log,
							TextColor3 = p6,
							Size = UDim2.new(1, -(var8 + 20), 1, 0),
							Position = UDim2.fromOffset(var8 + 20, 0),
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
					
					if var9._expanded then
						addContextEntries(p4, var9, p6, p7 + 1, p8)
					end
				elseif devConsoleFixMultilineContext then
					local _, replaced = string.gsub(`{tostring(v)}: {tostring(var9)}`, "\n", "")
					local var11 = replaced + 1
					p4[var10] = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = `{tostring(v)}: {tostring(var9)}`,
						TextSize = mainWindow,
						Font = log,
						TextColor3 = p6,
						Size = UDim2.new(1, 0, 0, var11 * mainWindow + (var11 - 1) * textFramePadding),
						LayoutOrder = i_2,
						TextXAlignment = Enum.TextXAlignment.Left
					}, {
						Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var8 + 20) })
					})
				else
					p4[var10] = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = `{tostring(v)}: {tostring(var9)}`,
						TextSize = mainWindow,
						Font = log,
						TextColor3 = p6,
						Size = UDim2.new(1, 0, 0, mainWindow),
						LayoutOrder = i_2,
						TextXAlignment = Enum.TextXAlignment.Left
					}, {
						Padding = roactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, var8 + 20) })
					})
				end
			end
		end
		
		local var12 = logData:iterator()
		local var13 = var12:next()
		while var13 do
			local var14 = var13
			local message = var14.Message
			local charCount = var14.CharCount
			local var15 = if wordWrap and var5 > 0 then math.ceil(var14.Dims.Y * math.ceil(var14.Dims.X / var5)) else var14.Dims.Y
			local var16 = 0
			
			if var14.Context then
				var16 = mainWindow + textFramePadding
				
				if var14.Expanded then
					var16 += countContextLines(var14.Context, 0) * (mainWindow + textFramePadding)
				end
			end
			local var17 = var15 + var16
			var3 += 1
			
			if canvasPos.Y <= var4 + var17 then
				if var7 < absSize.Y then
					local text = constantsModule.Color.Text
					local var18 = ""
					
					if var14.Type == Enum.MessageType.MessageOutput.Value then
						text = constantsModule.Color.Text
					elseif var14.Type == Enum.MessageType.MessageInfo.Value then
						text = constantsModule.Color.HighlightBlue
						var18 = constantsModule.Image.Info
					elseif var14.Type == Enum.MessageType.MessageWarning.Value then
						text = constantsModule.Color.WarningYellow
						var18 = constantsModule.Image.Warning
					elseif var14.Type == Enum.MessageType.MessageError.Value then
						text = constantsModule.Color.ErrorRed
						var18 = constantsModule.Image.Error
					end
					local t_1 = {}
					
					if var14.Context then
						t_1.Layout = roactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, textFramePadding)
						})
						t_1.Header = roactModule.createElement(bannerButtonModule, {
							isExpandable = true,
							layoutOrder = 0,
							hideLines = true,
							size = UDim2.new(1, 0, 0, mainWindow),
							isExpanded = var14.Expanded,
							onButtonPress = function()
								-- upvalues: var14 (ref), p3 (ref)
								var14.Expanded = not var14.Expanded
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
						
						if var14.Expanded then
							addContextEntries(t_1, var14.Context, text, 0, { i = 0 })
						end
					end
					t[var3] = roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, var17),
						LayoutOrder = var3
					}, {
						image = roactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Image = var18,
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
							Size = UDim2.new(1, 0, 0, var15),
							Position = UDim2.new(0, textFrameHeight, 0, 0)
						}),
						context = var14.Context and roactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -textFrameHeight, 0, var16),
							Position = UDim2.new(0, textFrameHeight, 0, var15 + textFramePadding)
						}, t_1)
					})
				end
				if var6 < 0 then
					var6 = var4
				else
					var7 = var7 + var17 + textFramePadding
				end
			end
			var4 = var4 + var17 + textFramePadding
			
			if charCount < maxStringSize then
				var13 = var12:next()
			else
				local formattedText = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", charCount, maxStringSize)
				var13 = {
					Message = formattedText,
					CharCount = #formattedText,
					Type = var14.Type,
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
			Size = UDim2.new(1, 0, 0, var6)
		})
	end
	return roactModule.createElement("ScrollingFrame", {
		Size = size,
		BackgroundTransparency = 1,
		VerticalScrollBarInset = 1,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, var4),
		CanvasPosition = canvasPos,
		LayoutOrder = layoutOrder,
		[roactModule.Ref] = p3.ref
	}, t)
end

return logOutput