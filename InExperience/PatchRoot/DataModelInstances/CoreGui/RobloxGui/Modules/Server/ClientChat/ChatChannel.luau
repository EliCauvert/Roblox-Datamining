local childAddedConnection
local _ = nil
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserFlagRemoveMessageFromMessageLog")
end)
local status_1 = ok and status
local _ = false
local ok_1, status_2 = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserIsChatTranslationEnabled2")
end)
local status_2_1 = ok_1 and status_2
local t = {}
local parent = script.Parent
local chatSettingsModule = require(game:GetService("Chat"):WaitForChild("ClientChatModules"):WaitForChild("ChatSettings"))
local chatTranslationEnabled = nil

if status_2_1 then
	chatTranslationEnabled = parent:FindFirstChild("ChatTranslationEnabled")
	
	if chatTranslationEnabled == nil then
		childAddedConnection = nil
		childAddedConnection = parent.ChildAdded:Connect(function(p0)
			-- upvalues: chatTranslationEnabled (write), childAddedConnection (write)
			if p0.Name == "ChatTranslationEnabled" then
				chatTranslationEnabled = p0
				childAddedConnection:Disconnect()
			end
		end)
	end
end
childAddedConnection = {}
childAddedConnection.__index = childAddedConnection

function childAddedConnection.Destroy(p1)
	p1.Destroyed = true
end

function childAddedConnection.SetActive(value, p2)
	if p2 == value.Active then return end
	if p2 == false then
		value.MessageLogDisplay:Clear()
	else
		value.MessageLogDisplay:SetCurrentChannelName(value.Name)
		
		for i = 1, #value.MessageLog do
			value.MessageLogDisplay:AddMessage(value.MessageLog[i])
		end
	end
	value.Active = p2
end

function childAddedConnection.UpdateMessageFiltered(p3, p4)
	-- upvalues: status_2_1 (write), chatTranslationEnabled (write), status_1 (write)
	local var8
	local var6 = 1
	local messageLog = p3.MessageLog
	local var7 = nil
	while var6 <= #messageLog do
		var8 = messageLog[var6]
		
		if var8.ID ~= p4.ID then
			var6 += 1
			continue
		end
		var7 = var8
		break
	end
	if var7 then
		var7.Message = p4.Message
		var7.IsFiltered = true
		
		if status_2_1 and chatTranslationEnabled ~= nil and chatTranslationEnabled.Value then
			var7.TranslatedMessage = p4.TranslatedMessage
			var7.ShowTranslated = true
		end
		if not p3.Active then return end
		if status_1 and var7.Message == "" then
			table.remove(p3.MessageLog, var6)
		end
		p3.MessageLogDisplay:UpdateMessageFiltered(var7)
		
		return
	else
		p3:AddMessageToChannelByTimeStamp(p4)
	end
end

function childAddedConnection.AddMessageToChannel(p5, p6)
	-- upvalues: chatSettingsModule (ref)
	table.insert(p5.MessageLog, p6)
	
	if p5.Active then
		p5.MessageLogDisplay:AddMessage(p6)
	end
	if chatSettingsModule.MessageHistoryLengthPerChannel < #p5.MessageLog then
		p5:RemoveLastMessageFromChannel()
	end
end

function childAddedConnection.InternalAddMessageAtTimeStamp(p7, p8)
	for i = 1, #p7.MessageLog do
		if p8.Time >= p7.MessageLog[i].Time then
			continue
		end
		table.insert(p7.MessageLog, i, p8)
		
		return
	end
	table.insert(p7.MessageLog, p8)
end

function childAddedConnection.AddMessagesToChannelByTimeStamp(p9, p10, p11)
	-- upvalues: chatSettingsModule (ref)
	for i = p11, #p10 do
		p9:InternalAddMessageAtTimeStamp(p10[i])
	end
	while chatSettingsModule.MessageHistoryLengthPerChannel < #p9.MessageLog do
		table.remove(p9.MessageLog, 1)
	end
	if p9.Active then
		p9.MessageLogDisplay:Clear()
		
		for i_1 = 1, #p9.MessageLog do
			p9.MessageLogDisplay:AddMessage(p9.MessageLog[i_1])
		end
	end
end

function childAddedConnection.AddMessageToChannelByTimeStamp(p12, p13)
	-- upvalues: chatSettingsModule (ref)
	if #p12.MessageLog < 1 then
		p12:AddMessageToChannel(p13)
		
		return
	elseif p13.Time < p12.MessageLog[1].Time then return end
	if p12.MessageLog[#p12.MessageLog].Time <= p13.Time then
		p12:AddMessageToChannel(p13)
		
		return
	end
	for i = 1, #p12.MessageLog do
		if p13.Time >= p12.MessageLog[i].Time then
			continue
		end
		table.insert(p12.MessageLog, i, p13)
		
		if chatSettingsModule.MessageHistoryLengthPerChannel < #p12.MessageLog then
			p12:RemoveLastMessageFromChannel()
		end
		if p12.Active then
			p12.MessageLogDisplay:AddMessageAtIndex(p13, i)
		end
		return
	end
end

function childAddedConnection.RemoveLastMessageFromChannel(p14)
	table.remove(p14.MessageLog, 1)
	
	if p14.Active then
		p14.MessageLogDisplay:RemoveLastMessage()
	end
end

function childAddedConnection.ClearMessageLog(p15)
	p15.MessageLog = {}
	
	if p15.Active then
		p15.MessageLogDisplay:Clear()
	end
end

function childAddedConnection.RegisterChannelTab(p16, p17)
	p16.ChannelTab = p17
end

function t.new(p18, p19)
	-- upvalues: childAddedConnection (ref)
	local tbl = setmetatable({}, childAddedConnection)
	tbl.Destroyed = false
	tbl.Active = false
	tbl.MessageLog = {}
	tbl.MessageLogDisplay = p19
	tbl.ChannelTab = nil
	tbl.Name = p18
	
	return tbl
end

return t