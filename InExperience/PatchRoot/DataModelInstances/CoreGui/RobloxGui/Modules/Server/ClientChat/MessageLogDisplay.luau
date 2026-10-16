local Result1 = nil
local Success, Result = pcall(function() --[[ Line: 7 ]]
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
Result1 = Success and Result
local Result2_1 = false
local Success1, Result2 = pcall(function() --[[ Line: 15 ]]
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
Result2_1 = Success1 and Result2
local MessageLogDisplayModule = { ScrollBarThickness = 4 }
local Parent = script.Parent
local CurveUtilModule = require(Parent:WaitForChild("CurveUtil"))
local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local NewResult = require(Parent:WaitForChild("MessageLabelCreator")).new()
local Module = {}
Module.__index = Module

local function CreateGuiObjects() --[[ Line: 42 ]]
	-- upvalues: ChatSettingsModule (copy), MessageLogDisplayModule (copy)
	local Frame = Instance.new("Frame")
	Frame.Selectable = false
	Frame.Size = UDim2.new(1, 0, 1, 0)
	Frame.BackgroundTransparency = 1
	local Scroller = Instance.new("ScrollingFrame")
	Scroller.Selectable = ChatSettingsModule.GamepadNavigationEnabled
	Scroller.Name = "Scroller"
	Scroller.BackgroundTransparency = 1
	Scroller.BorderSizePixel = 0
	Scroller.Position = UDim2.new(0, 0, 0, 3)
	Scroller.Size = UDim2.new(1, -4, 1, -6)
	Scroller.CanvasSize = UDim2.new(0, 0, 0, 0)
	Scroller.ScrollBarThickness = MessageLogDisplayModule.ScrollBarThickness
	Scroller.Active = true
	Scroller.Parent = Frame
	local ListLayout = Instance.new("UIListLayout")
	ListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	ListLayout.Parent = Scroller
	
	return Frame, Scroller, ListLayout
end

function Module.Destroy(p1) --[[ Line: 67 ]]
	p1.GuiObject:Destroy()
	p1.Destroyed = true
end

function Module.SetActive(p1, Visible) --[[ Line: 72 ]]
	p1.GuiObject.Visible = Visible
end

function Module.UpdateMessageFiltered(p1, p2) --[[ Line: 76 ]]
	-- upvalues: Result1 (ref)
	local v1 = nil
	local Count = 1
	local MessageObjectLog = p1.MessageObjectLog
	local MessageObjectLogEntry = nil
	while Count <= #MessageObjectLog do
		MessageObjectLogEntry = MessageObjectLog[Count]
		
		if MessageObjectLogEntry.ID ~= p2.ID then
			Count += 1
			continue
		end
		v1 = MessageObjectLogEntry
		break
	end
	if v1 then
		if not Result1 then
			v1.UpdateTextFunction(p2)
			p1:PositionMessageLabelInWindow(v1, Count)
		elseif p2.Message == "" then
			p1:RemoveMessageAtIndex(Count)
			
			return
		else
			v1.UpdateTextFunction(p2)
			p1:PositionMessageLabelInWindow(v1, Count)
			
			return
		end
	end
end

function Module.RefreshMessagePlacement(p3, p4) --[[ Line: 107 ]]
	local v2 = nil
	local Count = 1
	local MessageObjectLog = p3.MessageObjectLog
	local MessageObjectLogEntry = nil
	while Count <= #MessageObjectLog do
		MessageObjectLogEntry = MessageObjectLog[Count]
		
		if MessageObjectLogEntry.ID ~= p4.ID then
			Count += 1
			continue
		end
		v2 = MessageObjectLogEntry
		break
	end
	if v2 then
		p3:PositionMessageLabelInWindow(v2, Count)
	end
end

function Module.AddMessage(p5, p6) --[[ Line: 129 ]]
	-- upvalues: Result2_1 (ref), NewResult (copy)
	p5:WaitUntilParentedCorrectly()
	local MessageLabel_Chat = if Result2_1 then NewResult:CreateMessageLabel_Chat(p6, p5.CurrentChannelName, function() --[[ Line: 134 ]]
		-- upvalues: p5 (copy), p6 (copy)
		p5:RefreshMessagePlacement(p6)
	end) else NewResult:CreateMessageLabel(p6, p5.CurrentChannelName)
	
	if MessageLabel_Chat ~= nil then
		table.insert(p5.MessageObjectLog, MessageLabel_Chat)
		p5:PositionMessageLabelInWindow(MessageLabel_Chat, #p5.MessageObjectLog)
		
		return
	end
end

function Module.RemoveMessageAtIndex(p5, Index) --[[ Line: 151 ]]
	p5:WaitUntilParentedCorrectly()
	local MessageObjectLogEntry = p5.MessageObjectLog[Index]
	
	if MessageObjectLogEntry then
		MessageObjectLogEntry:Destroy()
		table.remove(p5.MessageObjectLog, Index)
	end
end

function Module.AddMessageAtIndex(p5, p6, p7) --[[ Line: 162 ]]
	-- upvalues: Result2_1 (ref), NewResult (copy)
	local MessageLabel_Chat = if Result2_1 then NewResult:CreateMessageLabel_Chat(p6, p5.CurrentChannelName, function() --[[ Line: 165 ]]
		-- upvalues: p5 (copy), p6 (copy)
		p5:RefreshMessagePlacement(p6)
	end) else NewResult:CreateMessageLabel(p6, p5.CurrentChannelName)
	
	if MessageLabel_Chat ~= nil then
		table.insert(p5.MessageObjectLog, p7, MessageLabel_Chat)
		p5:PositionMessageLabelInWindow(MessageLabel_Chat, p7)
		
		return
	end
end

function Module.RemoveLastMessage(p5) --[[ Line: 183 ]]
	p5:WaitUntilParentedCorrectly()
	p5.MessageObjectLog[1]:Destroy()
	table.remove(p5.MessageObjectLog, 1)
end

function Module.IsScrolledDown(p5): boolean --[[ Line: 192 ]]
	local Offset = p5.Scroller.CanvasSize.Y.Offset
	local Y: number = p5.Scroller.AbsoluteWindowSize.Y
	local Y1 = p5.Scroller.CanvasPosition.Y
	
	return Offset < Y or Offset - Y1 <= Y + 5
end

function Module.UpdateMessageTextHeight(p5, p6) --[[ Line: 201 ]]
	local BaseFrame = p6.BaseFrame
	
	for i = 1, 10 do
		if p6.BaseMessage.TextFits then break end
		BaseFrame.Size = UDim2.new(1, 0, 0, p6.GetHeightFunction(p5.Scroller.AbsoluteSize.X - i))
	end
end

function Module.PositionMessageLabelInWindow(p7, MessageLabel_Chat, Count: number) --[[ Line: 213 ]]
	p7:WaitUntilParentedCorrectly()
	local IsScrolledDown = p7:IsScrolledDown()
	local BaseFrame = MessageLabel_Chat.BaseFrame
	BaseFrame.LayoutOrder = if p7.MessageObjectLog[Count - 1] then if Count == #p7.MessageObjectLog then p7.MessageObjectLog[Count - 1].BaseFrame.LayoutOrder + 1 else p7.MessageObjectLog[Count - 1].BaseFrame.LayoutOrder else 1
	BaseFrame.Size = UDim2.new(1, 0, 0, MessageLabel_Chat.GetHeightFunction(p7.Scroller.AbsoluteSize.X))
	BaseFrame.Parent = p7.Scroller
	
	if MessageLabel_Chat.BaseMessage then
		p7:UpdateMessageTextHeight(MessageLabel_Chat)
	end
	if IsScrolledDown then
		p7.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, p7.Scroller.CanvasSize.Y.Offset - p7.Scroller.AbsoluteSize.Y)))
	end
end

function Module.ReorderAllMessages(p7) --[[ Line: 243 ]]
	p7:WaitUntilParentedCorrectly()
	
	if p7.GuiObject.AbsoluteSize.Y < 1 then return end
	local CanvasPosition = p7.Scroller.CanvasPosition
	local IsScrolledDown = p7:IsScrolledDown()
	
	for _, value in pairs(p7.MessageObjectLog) do
		p7:UpdateMessageTextHeight(value)
	end
	if IsScrolledDown then
		p7.Scroller.CanvasPosition = Vector2.new(0, (math.max(0, p7.Scroller.CanvasSize.Y.Offset - p7.Scroller.AbsoluteSize.Y)))
		
		return
	else
		p7.Scroller.CanvasPosition = CanvasPosition
	end
end

function Module.Clear(p8) --[[ Line: 265 ]]
	for _, value in pairs(p8.MessageObjectLog) do
		value:Destroy()
	end
	p8.MessageObjectLog = {}
end

function Module.SetCurrentChannelName(p9, CurrentChannelName) --[[ Line: 272 ]]
	p9.CurrentChannelName = CurrentChannelName
end

function Module:FadeOutBackground(_) --[[ Line: 276 ]] end

function Module:FadeInBackground(_) --[[ Line: 280 ]] end

function Module.FadeOutText(p9, p10) --[[ Line: 284 ]]
	-- upvalues: CurveUtilModule (copy)
	for i = 1, #p9.MessageObjectLog do
		if p9.MessageObjectLog[i].FadeOutFunction then
			p9.MessageObjectLog[i].FadeOutFunction(p10, CurveUtilModule)
		end
	end
end

function Module.FadeInText(p11, p12) --[[ Line: 292 ]]
	-- upvalues: CurveUtilModule (copy)
	for i = 1, #p11.MessageObjectLog do
		if p11.MessageObjectLog[i].FadeInFunction then
			p11.MessageObjectLog[i].FadeInFunction(p12, CurveUtilModule)
		end
	end
end

function Module.Update(p13, p14) --[[ Line: 300 ]]
	-- upvalues: CurveUtilModule (copy)
	for i = 1, #p13.MessageObjectLog do
		if p13.MessageObjectLog[i].UpdateAnimFunction then
			p13.MessageObjectLog[i].UpdateAnimFunction(p14, CurveUtilModule)
		end
	end
end

function Module.WaitUntilParentedCorrectly(p15) --[[ Line: 309 ]]
	while not p15.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p15.GuiObject.AncestryChanged:wait()
	end
end

function MessageLogDisplayModule.new() --[[ Line: 318 ]]
	-- upvalues: Module (copy), CreateGuiObjects (copy)
	local MessageLogDisplay = setmetatable({}, Module)
	MessageLogDisplay.Destroyed = false
	MessageLogDisplay.GuiObject, MessageLogDisplay.Scroller, MessageLogDisplay.Layout = CreateGuiObjects()
	MessageLogDisplay.MessageObjectLog = {}
	MessageLogDisplay.Name = "MessageLogDisplay"
	MessageLogDisplay.GuiObject.Name = "Frame_" .. MessageLogDisplay.Name
	MessageLogDisplay.CurrentChannelName = ""
	MessageLogDisplay.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function() --[[ Line: 334 ]]
		-- upvalues: MessageLogDisplay (copy)
		spawn(function() --[[ Line: 335 ]]
			-- upvalues: MessageLogDisplay (upval)
			MessageLogDisplay:ReorderAllMessages()
		end)
	end)
	local IsScrolledDown = true
	MessageLogDisplay.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function() --[[ Line: 340 ]]
		-- upvalues: MessageLogDisplay (copy), IsScrolledDown (ref)
		local AbsoluteContentSize = MessageLogDisplay.Layout.AbsoluteContentSize
		MessageLogDisplay.Scroller.CanvasSize = UDim2.new(0, 0, 0, AbsoluteContentSize.Y)
		
		if IsScrolledDown then
			MessageLogDisplay.Scroller.CanvasPosition = Vector2.new(0, AbsoluteContentSize.Y - MessageLogDisplay.Scroller.AbsoluteWindowSize.Y)
		end
	end)
	MessageLogDisplay.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function() --[[ Line: 349 ]]
		-- upvalues: IsScrolledDown (ref), MessageLogDisplay (copy)
		IsScrolledDown = MessageLogDisplay:IsScrolledDown()
	end)
	
	return MessageLogDisplay
end

return MessageLogDisplayModule