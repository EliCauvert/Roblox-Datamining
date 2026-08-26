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
		childAddedConnection = parent.ChildAdded:Connect(function(p1)
			-- upvalues: chatTranslationEnabled (write), childAddedConnection (write)
			if p1.Name == "ChatTranslationEnabled" then
				chatTranslationEnabled = p1
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

function childAddedConnection.SetActive(value, p1)
	if p1 == value.Active then return end
	if p1 == false then
		value.MessageLogDisplay:Clear()
	else
		value.MessageLogDisplay:SetCurrentChannelName(value.Name)
		
		for i = 1, #value.MessageLog do
			value.MessageLogDisplay:AddMessage(value.MessageLog[i])
		end
	end
	value.Active = p1
end

function childAddedConnection.UpdateMessageFiltered(p2, p3)
	-- upvalues: status_2_1 (write), chatTranslationEnabled (write), status_1 (write)
	local var1
	local var2 = 1
	local messageLog = p2.MessageLog
	local var3 = nil
	while var2 <= #messageLog do
		var1 = messageLog[var2]
		
		if var1.ID ~= p3.ID then
			var2 += 1
			continue
		end
		var3 = var1
		break
	end
	if var3 then
		var3.Message = p3.Message
		var3.IsFiltered = true
		
		if status_2_1 and chatTranslationEnabled ~= nil and chatTranslationEnabled.Value then
			var3.TranslatedMessage = p3.TranslatedMessage
			var3.ShowTranslated = true
		end
		if not p2.Active then return end
		if status_1 and var3.Message == "" then
			table.remove(p2.MessageLog, var2)
		end
		p2.MessageLogDisplay:UpdateMessageFiltered(var3)
		
		return
	else
		p2:AddMessageToChannelByTimeStamp(p3)
	end
end

function childAddedConnection.AddMessageToChannel(p4, p5)
	-- upvalues: chatSettingsModule (ref)
	table.insert(p4.MessageLog, p5)
	
	if p4.Active then
		p4.MessageLogDisplay:AddMessage(p5)
	end
	if chatSettingsModule.MessageHistoryLengthPerChannel < #p4.MessageLog then
		p4:RemoveLastMessageFromChannel()
	end
end

function childAddedConnection.InternalAddMessageAtTimeStamp(p4, p5)
	for i = 1, #p4.MessageLog do
		if p5.Time >= p4.MessageLog[i].Time then
			continue
		end
		table.insert(p4.MessageLog, i, p5)
		
		return
	end
	table.insert(p4.MessageLog, p5)
end

function childAddedConnection.AddMessagesToChannelByTimeStamp(p6, p7, p8)
	-- upvalues: chatSettingsModule (ref)
	for i = p8, #p7 do
		p6:InternalAddMessageAtTimeStamp(p7[i])
	end
	while chatSettingsModule.MessageHistoryLengthPerChannel < #p6.MessageLog do
		table.remove(p6.MessageLog, 1)
	end
	if p6.Active then
		p6.MessageLogDisplay:Clear()
		
		for i_1 = 1, #p6.MessageLog do
			p6.MessageLogDisplay:AddMessage(p6.MessageLog[i_1])
		end
	end
end

function childAddedConnection.AddMessageToChannelByTimeStamp(p9, p10)
	-- upvalues: chatSettingsModule (ref)
	if #p9.MessageLog < 1 then
		p9:AddMessageToChannel(p10)
		
		return
	elseif p10.Time < p9.MessageLog[1].Time then return end
	if p9.MessageLog[#p9.MessageLog].Time <= p10.Time then
		p9:AddMessageToChannel(p10)
		
		return
	end
	for i = 1, #p9.MessageLog do
		if p10.Time >= p9.MessageLog[i].Time then
			continue
		end
		table.insert(p9.MessageLog, i, p10)
		
		if chatSettingsModule.MessageHistoryLengthPerChannel < #p9.MessageLog then
			p9:RemoveLastMessageFromChannel()
		end
		if p9.Active then
			p9.MessageLogDisplay:AddMessageAtIndex(p10, i)
		end
		return
	end
end

function childAddedConnection.RemoveLastMessageFromChannel(p11)
	table.remove(p11.MessageLog, 1)
	
	if p11.Active then
		p11.MessageLogDisplay:RemoveLastMessage()
	end
end

function childAddedConnection.ClearMessageLog(p11)
	p11.MessageLog = {}
	
	if p11.Active then
		p11.MessageLogDisplay:Clear()
	end
end

function childAddedConnection.RegisterChannelTab(p11, p12)
	p11.ChannelTab = p12
end

function t.new(p11, p12)
	-- upvalues: childAddedConnection (ref)
	local tbl = setmetatable({}, childAddedConnection)
	tbl.Destroyed = false
	tbl.Active = false
	tbl.MessageLog = {}
	tbl.MessageLogDisplay = p12
	tbl.ChannelTab = nil
	tbl.Name = p11
	
	return tbl
end

return t