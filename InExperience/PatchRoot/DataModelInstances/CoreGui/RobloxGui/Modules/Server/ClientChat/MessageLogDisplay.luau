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
local var7 = messageLabelCreatorModule.new()
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

function t_1.Destroy(p0)
	p0.GuiObject:Destroy()
	p0.Destroyed = true
end

function t_1.SetActive(value, p1)
	value.GuiObject.Visible = p1
end

function t_1.UpdateMessageFiltered(p2, p3)
	-- upvalues: status_1 (write)
	local var15
	local var13 = nil
	local var14 = 1
	local messageObjectLog = p2.MessageObjectLog
	while var14 <= #messageObjectLog do
		var15 = messageObjectLog[var14]
		
		if var15.ID ~= p3.ID then
			var14 += 1
			continue
		end
		var13 = var15
		break
	end
	if var13 then
		if status_1 then
			if p3.Message == "" then
				p2:RemoveMessageAtIndex(var14)
				
				return
			end
			var13.UpdateTextFunction(p3)
			p2:PositionMessageLabelInWindow(var13, var14)
			
			return
		else
			var13.UpdateTextFunction(p3)
			p2:PositionMessageLabelInWindow(var13, var14)
		end
	end
end

function t_1.RefreshMessagePlacement(p4, p5)
	local var18
	local var16 = nil
	local var17 = 1
	local messageObjectLog = p4.MessageObjectLog
	while var17 <= #messageObjectLog do
		var18 = messageObjectLog[var17]
		
		if var18.ID ~= p5.ID then
			var17 += 1
			continue
		end
		var16 = var18
		break
	end
	if var16 then
		p4:PositionMessageLabelInWindow(var16, var17)
	end
end

function t_1.AddMessage(p6, p7)
	-- upvalues: status_2_1 (write), var7 (ref)
	p6:WaitUntilParentedCorrectly()
	local var19 = if status_2_1 then var7:CreateMessageLabel_Chat(p7, p6.CurrentChannelName, function()
		-- upvalues: p6 (ref), p7 (ref)
		p6:RefreshMessagePlacement(p7)
	end) else var7:CreateMessageLabel(p7, p6.CurrentChannelName)
	
	if var19 == nil then
		return
	end
	table.insert(p6.MessageObjectLog, var19)
	p6:PositionMessageLabelInWindow(var19, #p6.MessageObjectLog)
end

function t_1.RemoveMessageAtIndex(p8, p9)
	p8:WaitUntilParentedCorrectly()
	local var20 = p8.MessageObjectLog[p9]
	
	if var20 then
		var20:Destroy()
		table.remove(p8.MessageObjectLog, p9)
	end
end

function t_1.AddMessageAtIndex(p10, p11, p12)
	-- upvalues: status_2_1 (write), var7 (ref)
	local var21 = if status_2_1 then var7:CreateMessageLabel_Chat(p11, p10.CurrentChannelName, function()
		-- upvalues: p10 (ref), p11 (ref)
		p10:RefreshMessagePlacement(p11)
	end) else var7:CreateMessageLabel(p11, p10.CurrentChannelName)
	
	if var21 == nil then
		return
	end
	table.insert(p10.MessageObjectLog, p12, var21)
	p10:PositionMessageLabelInWindow(var21, p12)
end

function t_1.RemoveLastMessage(p13)
	p13:WaitUntilParentedCorrectly()
	p13.MessageObjectLog[1]:Destroy()
	table.remove(p13.MessageObjectLog, 1)
end

function t_1.IsScrolledDown(p14)
	local offset = p14.Scroller.CanvasSize.Y.Offset
	local y = p14.Scroller.AbsoluteWindowSize.Y
	
	return if offset >= y then offset - p14.Scroller.CanvasPosition.Y <= y + 5 else true
end

function t_1.UpdateMessageTextHeight(p15, p16)
	local baseFrame = p16.BaseFrame
	
	for i = 1, 10 do
		if p16.BaseMessage.TextFits then break end
		baseFrame.Size = UDim2.new(1, 0, 0, p16.GetHeightFunction(p15.Scroller.AbsoluteSize.X - i))
	end
end

function t_1.PositionMessageLabelInWindow(p17, p18, p19)
	p17:WaitUntilParentedCorrectly()
	local var22 = p17:IsScrolledDown()
	local baseFrame = p18.BaseFrame
	baseFrame.LayoutOrder = if p17.MessageObjectLog[p19 - 1] then if p19 == #p17.MessageObjectLog then p17.MessageObjectLog[p19 - 1].BaseFrame.LayoutOrder + 1 else p17.MessageObjectLog[p19 - 1].BaseFrame.LayoutOrder else 1
	baseFrame.Size = UDim2.new(1, 0, 0, p18.GetHeightFunction(p17.Scroller.AbsoluteSize.X))
	baseFrame.Parent = p17.Scroller
	
	if p18.BaseMessage then
		p17:UpdateMessageTextHeight(p18)
	end
	if var22 then
		p17.Scroller.CanvasPosition = Vector2.new(0, math.max(0, p17.Scroller.CanvasSize.Y.Offset - p17.Scroller.AbsoluteSize.Y))
	end
end

function t_1.ReorderAllMessages(p20)
	p20:WaitUntilParentedCorrectly()
	
	if p20.GuiObject.AbsoluteSize.Y < 1 then return end
	local canvasPosition = p20.Scroller.CanvasPosition
	local var23 = p20:IsScrolledDown()
	
	for i, v in pairs(p20.MessageObjectLog) do
		p20:UpdateMessageTextHeight(v)
	end
	if var23 then
		p20.Scroller.CanvasPosition = Vector2.new(0, math.max(0, p20.Scroller.CanvasSize.Y.Offset - p20.Scroller.AbsoluteSize.Y))
		
		return
	end
	p20.Scroller.CanvasPosition = canvasPosition
end

function t_1.Clear(p21)
	for i, v in pairs(p21.MessageObjectLog) do
		v:Destroy()
	end
	p21.MessageObjectLog = {}
end

function t_1.SetCurrentChannelName(value, p22)
	value.CurrentChannelName = p22
end

function t_1.FadeOutBackground(_, _) end

function t_1.FadeInBackground(_, _) end

function t_1.FadeOutText(p23, p24)
	-- upvalues: curveUtilModule (ref)
	for i = 1, #p23.MessageObjectLog do
		if p23.MessageObjectLog[i].FadeOutFunction then
			p23.MessageObjectLog[i].FadeOutFunction(p24, curveUtilModule)
		end
	end
end

function t_1.FadeInText(p25, p26)
	-- upvalues: curveUtilModule (ref)
	for i = 1, #p25.MessageObjectLog do
		if p25.MessageObjectLog[i].FadeInFunction then
			p25.MessageObjectLog[i].FadeInFunction(p26, curveUtilModule)
		end
	end
end

function t_1.Update(p27, p28)
	-- upvalues: curveUtilModule (ref)
	for i = 1, #p27.MessageObjectLog do
		if p27.MessageObjectLog[i].UpdateAnimFunction then
			p27.MessageObjectLog[i].UpdateAnimFunction(p28, curveUtilModule)
		end
	end
end

function t_1.WaitUntilParentedCorrectly(p29)
	while not p29.GuiObject:IsDescendantOf(game:GetService("Players").LocalPlayer) do
		p29.GuiObject.AncestryChanged:wait()
	end
end

function t.new()
	-- upvalues: t_1 (ref), CreateGuiObjects (ref)
	local messageLogDisplay = setmetatable({}, t_1)
	messageLogDisplay.Destroyed = false
	local var25, var26, var27 = CreateGuiObjects()
	messageLogDisplay.GuiObject = var25
	messageLogDisplay.Scroller = var26
	messageLogDisplay.Layout = var27
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
	local var28 = true
	messageLogDisplay.Layout:GetPropertyChangedSignal("AbsoluteContentSize"):Connect(function()
		-- upvalues: messageLogDisplay (ref), var28 (write)
		local absoluteContentSize = messageLogDisplay.Layout.AbsoluteContentSize
		messageLogDisplay.Scroller.CanvasSize = UDim2.new(0, 0, 0, absoluteContentSize.Y)
		
		if var28 then
			messageLogDisplay.Scroller.CanvasPosition = Vector2.new(0, absoluteContentSize.Y - messageLogDisplay.Scroller.AbsoluteWindowSize.Y)
		end
	end)
	messageLogDisplay.Scroller:GetPropertyChangedSignal("CanvasPosition"):Connect(function()
		-- upvalues: var28 (write), messageLogDisplay (ref)
		var28 = messageLogDisplay:IsScrolledDown()
	end)
	
	return messageLogDisplay
end

return t