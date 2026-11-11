local TextService = game:GetService("TextService")
local RoactModule = require(game:GetService("CorePackages").Packages.Roact)
local BannerButtonModule = require(script.Parent.Parent.Parent.Components.BannerButton)
local ConstantsModule = require(script.Parent.Parent.Parent.Constants)
local MainWindow = ConstantsModule.DefaultFontSize.MainWindow
local Log = ConstantsModule.Font.Log
local IconHeight = ConstantsModule.LogFormatting.IconHeight
local TextFrameHeight = ConstantsModule.LogFormatting.TextFrameHeight
local TextFramePadding = ConstantsModule.LogFormatting.TextFramePadding
local MaxStringSize = ConstantsModule.LogFormatting.MaxStringSize

local function countContextLines(Context, p1: number): number
	-- upvalues: countContextLines (copy)
	local Count = 0
	
	for i, value in Context do
		if i ~= "_expanded" then
			Count += 1
			
			if type(value) == "table" and p1 + 1 < 3 and value._expanded then
				Count += countContextLines(value, p1 + 1)
			end
		end
	end
	return Count
end

local LogOutput = RoactModule.Component:extend("LogOutput")

function LogOutput.init(p2, p3)
	-- upvalues: RoactModule (copy)
	local InitLogOutputResult = p3.initLogOutput and p3.initLogOutput()
	
	function p2.onCanvasChange()
		-- upvalues: p2 (copy)
		local Current = p2.ref.current
		
		if Current then
			local CanvasPosition = Current.CanvasPosition
			local AbsoluteSize = Current.AbsoluteSize
			
			if p2.state.canvasPos ~= CanvasPosition or p2.state.absSize ~= AbsoluteSize then
				p2:setState({
					canvasPos = CanvasPosition,
					absSize = AbsoluteSize,
					autoScroll = Current.CanvasPosition.Y + Current.AbsoluteSize.Y == Current.CanvasSize.Y.Offset
				})
			end
		end
	end
	
	p2.ref = RoactModule.createRef()
	p2.state = {
		autoScroll = true,
		wordWrap = true,
		logData = InitLogOutputResult,
		absSize = Vector2.new(),
		canvasPos = Vector2.new()
	}
end

function LogOutput.willUpdate(p2, _, _)
	p2._canvasSignal:Disconnect()
	p2._absSizeSignal:Disconnect()
end

function LogOutput.didUpdate(p2)
	p2._canvasSignal = p2.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p2.onCanvasChange)
	p2._absSizeSignal = p2.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p2.onCanvasChange)
	
	if p2.state.autoScroll then
		local Current = p2.ref.current
		
		if Current then
			Current.CanvasPosition = Vector2.new(Current.CanvasPosition.X, p2.ref.current.CanvasSize.Y.Offset + p2.ref.current.AbsoluteSize.Y)
		end
	end
end

function LogOutput.didMount(p2)
	-- upvalues: TextFrameHeight (copy), TextFramePadding (copy)
	p2.logConnector = p2.props.targetSignal:Connect(function(LogData)
		-- upvalues: p2 (copy), TextFrameHeight (upval), TextFramePadding (upval)
		if p2.state.autoScroll or LogData:getSize() ~= LogData:getMaxSize() then
			p2:setState({ logData = LogData })
			
			return
		end
		local CanvasPos = p2.state.canvasPos
		local Y = CanvasPos.Y
		local BackResult = LogData:back()
		
		if BackResult then
			local Y1 = BackResult.Dims.Y
			local XDelta = p2.state.absSize.X - TextFrameHeight
			
			if p2.state.wordWrap and XDelta > 0 then
				Y1 = math.ceil(BackResult.Dims.Y * math.ceil(BackResult.Dims.X / XDelta))
			end
			Y = math.max(0, Y - Y1 - TextFramePadding)
		end
		p2:setState({
			logData = LogData,
			canvasPos = Vector2.new(CanvasPos.X, Y)
		})
	end)
	p2._canvasSignal = p2.ref.current:GetPropertyChangedSignal("CanvasPosition"):Connect(p2.onCanvasChange)
	p2._absSizeSignal = p2.ref.current:GetPropertyChangedSignal("AbsoluteSize"):Connect(p2.onCanvasChange)
	
	if p2.ref.current.AbsoluteSize.Magnitude > 0 then
		p2:setState({ absSize = p2.ref.current.AbsoluteSize })
	end
end

function LogOutput.willUnmount(p2)
	p2.logConnector:Disconnect()
	p2.logConnector = nil
end

function LogOutput.render(p2)
	-- upvalues: TextFrameHeight (copy), RoactModule (copy), BannerButtonModule (copy), MainWindow (copy), Log (copy), TextFramePadding (copy), countContextLines (copy), ConstantsModule (copy), IconHeight (copy), MaxStringSize (copy), TextService (copy)
	local LayoutOrder = p2.props.layoutOrder
	local Size = p2.props.size
	local LogData = p2.state.logData
	local AbsSize = p2.state.absSize
	local CanvasPos = p2.state.canvasPos
	local WordWrap = p2.state.wordWrap
	local Frames = {}
	local LayoutOrder1 = 1
	local YOffset1 = 0
	
	if p2.ref.current and LogData then
		local XDelta = AbsSize.X - TextFrameHeight
		local YOffset = -1
		local v1 = 0
		
		local function _(p3)
			-- upvalues: p2 (copy)
			return function()
				-- upvalues: p3 (copy), p2 (upval)
				p3.Expanded = not p3.Expanded
				p2:setState({})
			end
		end
		
		local function addContextEntries(Elements, Context, TextColor, p3: number, p4)
			-- upvalues: RoactModule (upval), BannerButtonModule (upval), MainWindow (upval), p2 (copy), Log (upval), addContextEntries (copy)
			if p3 >= 3 then return end
			local List = {}
			
			for i in Context do
				if i ~= "_expanded" then
					table.insert(List, i)
				end
			end
			table.sort(List, function(A, B): boolean
				return tostring(A) < tostring(B)
			end)
			local v2 = p3 * 20 + 20
			
			for _, value in List do
				local ContextEntry = Context[value]
				p4.i += 1
				local I = p4.i
				local Text: string = `Ctx_{p3}_{tostring(value)}`
				
				if type(ContextEntry) == "table" and p3 + 1 < 3 then
					Elements[Text] = RoactModule.createElement(BannerButtonModule, {
						isExpandable = true,
						hideLines = true,
						size = UDim2.new(1, 0, 0, MainWindow),
						isExpanded = ContextEntry._expanded,
						layoutOrder = I,
						onButtonPress = function()
							-- upvalues: ContextEntry (copy), p2 (upval)
							ContextEntry._expanded = not ContextEntry._expanded
							p2:setState({})
						end
					}, {
						Label = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = `{tostring(value)}: \{...}`,
							TextSize = MainWindow,
							Font = Log,
							TextColor3 = TextColor,
							Size = UDim2.new(1, -(v2 + 20), 1, 0),
							Position = UDim2.fromOffset(v2 + 20, 0),
							TextXAlignment = Enum.TextXAlignment.Left
						})
					})
					
					if ContextEntry._expanded then
						addContextEntries(Elements, ContextEntry, TextColor, p3 + 1, p4)
					end
				else
					Elements[Text] = RoactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						Text = `{tostring(value)}: {tostring(ContextEntry)}`,
						TextSize = MainWindow,
						Font = Log,
						TextColor3 = TextColor,
						Size = UDim2.new(1, 0, 0, MainWindow),
						LayoutOrder = I,
						TextXAlignment = Enum.TextXAlignment.Left
					}, {
						Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, v2 + 20) })
					})
				end
			end
		end
		
		local IteratorResult = LogData:iterator()
		local Key = IteratorResult:next()
		while Key do
			local Key1 = Key
			local Message = Key1.Message
			local CharCount = Key1.CharCount
			local Ceiled = if WordWrap and XDelta > 0 then math.ceil(Key1.Dims.Y * math.ceil(Key1.Dims.X / XDelta)) else Key1.Dims.Y
			local YOffset3 = 0
			
			if Key1.Context then
				YOffset3 = MainWindow + TextFramePadding
				
				if Key1.Expanded then
					YOffset3 += countContextLines(Key1.Context, 0) * (MainWindow + TextFramePadding)
				end
			end
			local YOffset2 = Ceiled + YOffset3
			LayoutOrder1 += 1
			
			if CanvasPos.Y <= YOffset1 + YOffset2 then
				if v1 < AbsSize.Y then
					local Text = ConstantsModule.Color.Text
					local Error = ""
					
					if Key1.Type == Enum.MessageType.MessageOutput.Value then
						Text = ConstantsModule.Color.Text
					elseif Key1.Type == Enum.MessageType.MessageInfo.Value then
						Text = ConstantsModule.Color.HighlightBlue
						Error = ConstantsModule.Image.Info
					elseif Key1.Type == Enum.MessageType.MessageWarning.Value then
						Text = ConstantsModule.Color.WarningYellow
						Error = ConstantsModule.Image.Warning
					elseif Key1.Type == Enum.MessageType.MessageError.Value then
						Text = ConstantsModule.Color.ErrorRed
						Error = ConstantsModule.Image.Error
					end
					local t = {}
					
					if Key1.Context then
						t.Layout = RoactModule.createElement("UIListLayout", {
							SortOrder = Enum.SortOrder.LayoutOrder,
							Padding = UDim.new(0, TextFramePadding)
						})
						t.Header = RoactModule.createElement(BannerButtonModule, {
							isExpandable = true,
							layoutOrder = 0,
							hideLines = true,
							size = UDim2.new(1, 0, 0, MainWindow),
							isExpanded = Key1.Expanded,
							onButtonPress = function()
								-- upvalues: Key1 (copy), p2 (copy)
								Key1.Expanded = not Key1.Expanded
								p2:setState({})
							end
						}, {
							Label = RoactModule.createElement("TextLabel", {
								Text = "Context: {...}",
								BackgroundTransparency = 1,
								TextSize = MainWindow,
								Font = Log,
								TextColor3 = Text,
								Size = UDim2.new(1, -20, 1, 0),
								Position = UDim2.fromOffset(20, 0),
								TextXAlignment = Enum.TextXAlignment.Left
							})
						})
						
						if Key1.Expanded then
							addContextEntries(t, Key1.Context, Text, 0, { i = 0 })
						end
					end
					Frames[LayoutOrder1] = RoactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						Size = UDim2.new(1, 0, 0, YOffset2),
						LayoutOrder = LayoutOrder1
					}, {
						image = RoactModule.createElement("ImageLabel", {
							BackgroundTransparency = 1,
							Image = Error,
							Size = UDim2.new(0, IconHeight, 0, IconHeight),
							Position = UDim2.new(0, IconHeight / 4, 0, (MainWindow - IconHeight) / 2)
						}),
						msg = RoactModule.createElement("TextLabel", {
							BackgroundTransparency = 1,
							Text = Message,
							TextColor3 = Text,
							TextSize = MainWindow,
							Font = Log,
							TextXAlignment = Enum.TextXAlignment.Left,
							TextWrapped = WordWrap,
							Size = UDim2.new(1, 0, 0, Ceiled),
							Position = UDim2.new(0, TextFrameHeight, 0, 0)
						}),
						context = Key1.Context and RoactModule.createElement("Frame", {
							BackgroundTransparency = 1,
							Size = UDim2.new(1, -TextFrameHeight, 0, YOffset3),
							Position = UDim2.new(0, TextFrameHeight, 0, Ceiled + TextFramePadding)
						}, t)
					})
				end
				if YOffset < 0 then
					YOffset = YOffset1
				else
					v1 = v1 + YOffset2 + TextFramePadding
				end
			end
			YOffset1 = YOffset1 + YOffset2 + TextFramePadding
			
			if CharCount < MaxStringSize then
				Key = IteratorResult:next()
			else
				local Formatted = string.format(" -- Could not display entire %d character message because message exceeds max displayable length of %d", CharCount, MaxStringSize)
				Key = {
					Message = Formatted,
					CharCount = #Formatted,
					Type = Key1.Type,
					Dims = TextService:GetTextSize(Formatted, MainWindow, Log, Vector2.new())
				}
			end
		end
		Frames.UIListLayout = RoactModule.createElement("UIListLayout", {
			HorizontalAlignment = Enum.HorizontalAlignment.Left,
			VerticalAlignment = Enum.VerticalAlignment.Top,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, TextFramePadding)
		})
		Frames.WindowingPadding = RoactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			Size = UDim2.new(1, 0, 0, YOffset)
		})
	end
	return RoactModule.createElement("ScrollingFrame", {
		Size = Size,
		BackgroundTransparency = 1,
		VerticalScrollBarInset = 1,
		ScrollBarThickness = 6,
		CanvasSize = UDim2.new(0, 0, 0, YOffset1),
		CanvasPosition = CanvasPos,
		LayoutOrder = LayoutOrder,
		[RoactModule.Ref] = p2.ref
	}, Frames)
end

return LogOutput