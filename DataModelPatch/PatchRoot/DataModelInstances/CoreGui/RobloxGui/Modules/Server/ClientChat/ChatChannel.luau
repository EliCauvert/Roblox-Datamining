local Result1 = nil
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog")
end)
Result1 = Success and Result
local Result2_1 = false
local Success1, Result2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
Result2_1 = Success1 and Result2
local t = {}
local Parent = script.Parent
local ChatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local ChatTranslationEnabled = nil

if Result2_1 then
	ChatTranslationEnabled = Parent:FindFirstChild("ChatTranslationEnabled")
	
	if ChatTranslationEnabled == nil then
		local Connection = nil
		Connection = Parent.ChildAdded:Connect(function(Child)
			-- upvalues: ChatTranslationEnabled (ref), Connection (ref)
			if Child.Name == "ChatTranslationEnabled" then
				ChatTranslationEnabled = Child
				Connection:Disconnect()
			end
		end)
	end
end
local Module = {}
Module.__index = Module

function Module.Destroy(p1)
	p1.Destroyed = true
end

function Module.SetActive(p1, Enabled)
	if Enabled == p1.Active then return end
	if Enabled == false then
		p1.MessageLogDisplay:Clear()
	else
		p1.MessageLogDisplay:SetCurrentChannelName(p1.Name)
		
		for i = 1, #p1.MessageLog do
			p1.MessageLogDisplay:AddMessage(p1.MessageLog[i])
		end
	end
	p1.Active = Enabled
end

function Module.UpdateMessageFiltered(p2, p3)
	-- upvalues: Result2_1 (ref), ChatTranslationEnabled (ref), Result1 (ref)
	local Index = 1
	local MessageLog = p2.MessageLog
	local v1 = nil
	local MessageLogEntry = nil
	while Index <= #MessageLog do
		MessageLogEntry = MessageLog[Index]
		
		if MessageLogEntry.ID ~= p3.ID then
			Index += 1
			continue
		end
		v1 = MessageLogEntry
		break
	end
	if v1 then
		v1.Message = p3.Message
		v1.IsFiltered = true
		
		if Result2_1 and ChatTranslationEnabled ~= nil and ChatTranslationEnabled.Value then
			v1.TranslatedMessage = p3.TranslatedMessage
			v1.ShowTranslated = true
		end
		if p2.Active then
			if Result1 and v1.Message == "" then
				table.remove(p2.MessageLog, Index)
			end
			p2.MessageLogDisplay:UpdateMessageFiltered(v1)
			
			return
		end
	else
		p2:AddMessageToChannelByTimeStamp(p3)
	end
end

function Module.AddMessageToChannel(p4, p5)
	-- upvalues: ChatSettingsModule (copy)
	table.insert(p4.MessageLog, p5)
	
	if p4.Active then
		p4.MessageLogDisplay:AddMessage(p5)
	end
	if ChatSettingsModule.MessageHistoryLengthPerChannel < #p4.MessageLog then
		p4:RemoveLastMessageFromChannel()
	end
end

function Module.InternalAddMessageAtTimeStamp(p4, p5)
	for i = 1, #p4.MessageLog do
		if p5.Time < p4.MessageLog[i].Time then
			table.insert(p4.MessageLog, i, p5)
			
			return
		end
	end
	table.insert(p4.MessageLog, p5)
end

function Module.AddMessagesToChannelByTimeStamp(p6, p7, p8)
	-- upvalues: ChatSettingsModule (copy)
	for i = p8, #p7 do
		p6:InternalAddMessageAtTimeStamp(p7[i])
	end
	while ChatSettingsModule.MessageHistoryLengthPerChannel < #p6.MessageLog do
		table.remove(p6.MessageLog, 1)
	end
	if p6.Active then
		p6.MessageLogDisplay:Clear()
		
		for i1 = 1, #p6.MessageLog do
			p6.MessageLogDisplay:AddMessage(p6.MessageLog[i1])
		end
	end
end

function Module.AddMessageToChannelByTimeStamp(p9, p10)
	-- upvalues: ChatSettingsModule (copy)
	if #p9.MessageLog < 1 then
		p9:AddMessageToChannel(p10)
		
		return
	end
	if p10.Time < p9.MessageLog[1].Time then return end
	if p9.MessageLog[#p9.MessageLog].Time <= p10.Time then
		p9:AddMessageToChannel(p10)
		
		return
	end
	for i = 1, #p9.MessageLog do
		if p10.Time >= p9.MessageLog[i].Time then
			continue
		end
		table.insert(p9.MessageLog, i, p10)
		
		if ChatSettingsModule.MessageHistoryLengthPerChannel < #p9.MessageLog then
			p9:RemoveLastMessageFromChannel()
		end
		if p9.Active then
			p9.MessageLogDisplay:AddMessageAtIndex(p10, i)
		end
		break
	end
end

function Module.RemoveLastMessageFromChannel(p11)
	table.remove(p11.MessageLog, 1)
	
	if p11.Active then
		p11.MessageLogDisplay:RemoveLastMessage()
	end
end

function Module.ClearMessageLog(p11)
	p11.MessageLog = {}
	
	if p11.Active then
		p11.MessageLogDisplay:Clear()
	end
end

function Module.RegisterChannelTab(p11, ChannelTab)
	p11.ChannelTab = ChannelTab
end

function t.new(Name, MessageLogDisplay)
	-- upvalues: Module (copy)
	local self = setmetatable({}, Module)
	self.Destroyed = false
	self.Active = false
	self.MessageLog = {}
	self.MessageLogDisplay = MessageLogDisplay
	self.ChannelTab = nil
	self.Name = Name
	
	return self
end

return t