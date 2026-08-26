local _ = nil
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRemoveMessageOnTextFilterFailures")
end)
local status_1 = ok and status
local _ = false
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local status_2_1 = ok_1 and status_2
local t = { ScrollBarThickness = 4 }
local clientChatModules = game:GetService("Chat"):WaitForChild("ClientChatModules")
local parent = script.Parent
local messageLabelCreatorModule = require(parent:WaitForChild("MessageLabelCreator"))
local curveUtilModule = require(parent:WaitForChild("CurveUtil"))
local chatSettingsModule = require(clientChatModules:WaitForChild("ChatSettings"))
local var1 = messageLabelCreatorModule.new()
local t_1 = {}
t_1.__index = t_1

local function CreateGuiObjects()
	-- upvalues: chatSettingsModule (ref), t (ref)
	local frame = Instance.new("Frame")
	frame.Selectable = false
	frame.Size = UDim2.new(1, 0, 1, 0)
	frame.BackgroundTransparency = 1
	local scroller = Instance.new("ScrollingFrame")
	scroller.Selectable = chatSettingsModule.GamepadNavigationEnabled
	scroller.Name = "Scroller"
	scroller.BackgroundTransparency = 1
	scroller.BorderSizePixel = 0
	scroller.Position = UDim2.new(0, 0, 0, 3)
	scroller.Size = UDim2.new(1, -4, 1, -6)
	scroller.CanvasSize = UDim2.new(0, 0, 0, 0)
	scroller.ScrollBarThickness = t.ScrollBarThickness
	scroller.Active = true
	scroller.Parent = frame
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIListLayout.Parent = scroller
	
	return frame, scroller, UIListLayout
end

function t_1.Destroy(p1)
	p1.GuiObject:Destroy()
	p1.Destroyed = true
end

function t_1.SetActive(value, p1)
	value.GuiObject.Visible = p1
end

function t_1.UpdateMessageFiltered(p1, p2)
	-- upvalues: status_1 (write)
	local var2
	local var3 = nil
	local var4 = 1
	local messageObjectLog = p1.MessageObjectLog
	while var4 <= #messageObjectLog do
		var2 = messageObjectLog[var4]
		
		if var2.ID ~= p2.ID then
			var4 += 1
			continue
		end
		var3 = var2
		break
	end
	if var3 then
		if status_1 then
			if p2.Message == "" then
				p1:RemoveMessageAtIndex(var4)
				
				return
			end
			var3.UpdateTextFunction(p2)
			p1:PositionMessageLabelInWindow(var3, var4)
			
			return
		else
			var3.UpdateTextFunction(p2)
			p1:PositionMessageLabelInWindow(var3, var4)
		end
	end
end

function t_1.RefreshMessagePlacement(p3, p4)
	local var5
	local var6 = nil
	local var7 = 1
	local messageObjectLog = p3.MessageObjectLog
	while var7 <= #messageObjectLog do
		var5 = messageObjectLog[var7]
		
		if var5.ID ~= p4.ID then
			var7 += 1
			continue
		end
		var6 = var5
		break
	end
	if var6 then
		p3:PositionMessageLabelInWindow(var6, var7)
	end
end

function t_1.AddMessage(p5, p6)
	-- upvalues: status_2_1 (write), var1 (ref)
	p5:WaitUntilParentedCorrectly()
	local var8 = if status_2_1 then var1:CreateMessageLabel_Chat(p6, p5.CurrentChannelName, function()
		-- upvalues: p5 (ref), p6 (ref)
		p5:RefreshMessagePlacement(p6)
	end) else var1:CreateMessageLabel(p6, p5.CurrentChannelName)
	
	if var8 == nil then
		return
	end
	table.insert(p5.MessageObjectLog, var8)
	p5:PositionMessageLabelInWindow(var8, #p5.MessageObjectLog)
end

function t_1.RemoveMessageAtIndex(p5, p6)
	p5:WaitUntilParentedCorrectly()
	local var8 = p5.MessageObjectLog[p6]
	
	if var8 then
		var8:Destroy()
		table.remove(p5.MessageObjectLog, p6)
	end
end

function t_1.AddMessageAtIndex(p5, p6, p7)
	-- upvalues: status_2_1 (write), var1 (ref)
	local var8 = if status_2_1 then var1:CreateMessageLabel_Chat(p6, p5.CurrentChannelName, function()
		-- upvalues: p5 (ref), p6 (ref)
		p5:RefreshMessagePlacement(p6)
	end) else var1:CreateMessageLabel(p6, p5.CurrentChannelName)
	
	if var8 == nil then
		return
	end
	table.insert(p5.MessageObjectLog, p7, var8)
	p5:PositionMessageLabelInWindow(var8, p7)
end

function t_1.RemoveLastMessage(p5)
	p5:WaitUntilParentedCorrectly()
	p5.MessageObjectLog[1]:Destroy()
	table.remove(p5.MessageObjectLog, 1)
end

function t_1.IsScrolledDown(p5)
	local offset = p5.Scroller.CanvasSize.Y.Offset
	local y = p5.Scroller.AbsoluteWindowSize.Y
	
	return if offset >= y then offset - p5.Scroller.CanvasPosition.Y <= y + 5 else true
end

function t_1.UpdateMessageTextHeight(p5, p6)
	local baseFrame = p6.BaseFrame
	
	for i = 1, 10 do
		if p6.BaseMessage.TextFits then break end
		baseFrame.Size = UDim2.new(1, 0, 0, p6.GetHeightFunction(p5.Scroller.AbsoluteSize.X - i))
	end
end

function t_1.PositionMessageLabelInWindow(p7, p8, p9)
	p7:WaitUntilParentedCorrectly()
	local var8 = p7:IsScrolledDown()
	local baseFrame = p8.BaseFrame
	baseFrame.LayoutOrder = if p7.MessageObjectLog[p9 - 1] then if p9 == #p7.MessageObjectLog then p7.MessageObjectLog[p9 - 1].BaseFrame.LayoutOrder + 1 else p7.MessageObjectLog[p9 - 1].BaseFrame.LayoutOrder else 1
	baseFrame.Size = UDim2.new(1, 0, 0, p8.GetHeightFunction(p7.Scroller.AbsoluteSize.X))
	baseFrame.Parent = p7.Scroller
	
	if p8.BaseMessage then
		p7:UpdateMessageTextHeight(p8)
	end
	if var8 then
		p7.Scroller.CanvasPosition = Vector2.new(0, math.max(0, p7.Scroller.CanvasSize.Y.Offset - p7.Scroller.AbsoluteSize.Y))
	end
end

function t_1.ReorderAllMessages(p7)
	p7:WaitUntilParentedCorrectly()
	
	if p7.GuiObject.AbsoluteSize.Y < 1 then return end
	local canvasPosition = p7.Scroller.CanvasPosition
	local var8 = p7:IsScrolledDown()
	
	for i, v in pairs(p7.MessageObjectLog) do
		p7:UpdateMessageTextHeight(v)
	end
	if var8 then
		p7.Scroller.CanvasPosition = Vector2.new(0, math.max(0, p7.Scroller.CanvasSize.Y.Offset - p7.Scroller.AbsoluteSize.Y))
		
		return
	end
	p7.Scroller.CanvasPosition = canvasPosition
end

function t_1.Clear(p8)
	for i, v in pairs(p8.MessageObjectLog) do
		v:Destroy()
	end
	p8.MessageObjectLog = {}
end

function t_1.SetCurrentChannelName(value, p9)
	value.CurrentChannelName = p9
end

function t_1.FadeOutBackground(_, _) end

function t_1.FadeInBackground(_, _) end

function t_1.FadeOutText(p9, p10)
	-- upvalues: curveUtilModule (ref)
	for i = 1, #p9.MessageObjectLog do
		if p9.MessageObjectLog[i].FadeOutFunction then
			p9.MessageObjectLog[i].FadeOutFunction(p10, curveUtilModule)
		end
	end
end

function t_1.FadeInText(p11, p12)
	-- upvalues: curveUtilModule (ref)
	for i = 1, #p11.MessageObjectLog do
		if p11.MessageObjectLog[i].FadeInFunction then
			p11.MessageObjectLog[i].FadeInFunction(p12, curveUtilModule)
		end
	end
end

function t_1.Update(p13, p14)
	-- upvalues: curveUtilModule (ref)
	for i = 1, #p13.MessageObjectLog do
		if p13.MessageObjectLog[i].UpdateAnimFunction then
			p13.MessageObjectLog[i].UpdateAnimFunction(p14, curveUtilModule)
		end
	end
end

function t_1.WaitUntilParentedCorrectly(p15)
	while not p15.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p15.GuiObject.AncestryChanged:wait()
	end
end

function t.new()
	-- upvalues: t_1 (ref), CreateGuiObjects (ref)
	local messageLogDisplay = setmetatable({}, t_1)
	messageLogDisplay.Destroyed = false
	local var9, var10, var11 = CreateGuiObjects()
	messageLogDisplay.GuiObject = var9
	messageLogDisplay.Scroller = var10
	messageLogDisplay.Layout = var11
	messageLogDisplay.MessageObjectLog = {}
	messageLogDisplay.Name = "MessageLogDisplay"
	messageLogDisplay.GuiObject.Name = "Frame_" .. messageLogDisplay.Name
	messageLogDisplay.CurrentChannelName = ""
	messageLogDisplay.GuiObject:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
		-- upvalues: messageLogDisplay (ref)
		spawn(function()
			-- upvalues: messageLogDisplay (copy)
			messageLogDisplay:ReorderAllMessages()
		end)
	end)
	local var12 = true
	messageLogDisplay.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: messageLogDisplay (ref), var12 (write)
		local absoluteContentSize = messageLogDisplay.Layout.AbsoluteContentSize
		messageLogDisplay.Scroller.CanvasSize = UDim2.new(0, 0, 0, absoluteContentSize.Y)
		
		if var12 then
			messageLogDisplay.Scroller.CanvasPosition = Vector2.new(0, absoluteContentSize.Y - messageLogDisplay.Scroller.AbsoluteWindowSize.Y)
		end
	end)
	messageLogDisplay.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		-- upvalues: var12 (write), messageLogDisplay (ref)
		var12 = messageLogDisplay:IsScrolledDown()
	end)
	
	return messageLogDisplay
end

return t