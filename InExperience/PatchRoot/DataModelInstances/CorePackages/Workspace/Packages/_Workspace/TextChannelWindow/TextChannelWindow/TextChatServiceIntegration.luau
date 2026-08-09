local _ = require(script.Parent.ChatApp)
local getFFlagExpChatProtectedChatInternalAPIs = require(script.Parent.Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

local function buildUserMessage(p0, p1, p2) --[[ line: 12 ]]
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref)
	return {
		messageType = "user",
		status = nil,
		messageId = p0.MessageId,
		senderUserId = tostring(p1.UserId),
		prefixText = if getFFlagExpChatProtectedChatInternalAPIs() then p0.PrefixTextInternal else p0.PrefixText,
		content = if getFFlagExpChatProtectedChatInternalAPIs() then p0.TextInternal else p0.Text,
		timestamp = p0.Timestamp,
		isOutgoing = p2
	}
end

local function mapTextChatMessage(p3, p4) --[[ line: 28 ]]
	-- upvalues: buildUserMessage (ref), getFFlagExpChatProtectedChatInternalAPIs (ref)
	return if p3.TextSource then buildUserMessage(p3, p3.TextSource, tostring(p3.TextSource.UserId) == p4) else {
		messageType = "system-roblox",
		messageId = p3.MessageId,
		content = if getFFlagExpChatProtectedChatInternalAPIs() then p3.TextInternal else p3.Text,
		timestamp = p3.Timestamp
	}
end

local function _(p5) --[[ line: 43 | named "mapSendingMessage" ]]
	-- upvalues: buildUserMessage (ref)
	return buildUserMessage(p5, p5.TextSource, true)
end

local function applyMessage(p6, p7) --[[ line: 51 ]]
	if p7.content == "" then
		return p6
	end
	for i, v in p6 do
		if v.messageId == p7.messageId then
			local cloned = table.clone(p6)
			cloned[i] = p7
			
			return cloned
		end
	end
	local cloned = table.clone(p6)
	table.insert(cloned, p7)
	
	return cloned
end

local _ = function(p8, p9) --[[ line: 71 | named "applyOutgoingMessage" ]]
	for i, v in p8 do
		if v.messageId == p9.messageId then
			return p8
		end
	end
	local cloned = table.clone(p8)
	table.insert(cloned, p9)
	
	return cloned
end

return {
	mapTextChatMessage = mapTextChatMessage,
	applyMessage = applyMessage,
	subscribeToMessages = function(p10) --[[ line: 94 ]]
		-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), buildUserMessage (ref), mapTextChatMessage (ref), applyMessage (ref)
		local channel = p10.channel
		
		if channel then
			local t = {}
			local localUserId = p10.localUserId
			local setMessages = p10.setMessages
			table.insert(t, p10.textChatService.SendingMessage:Connect(function(p11) --[[ line: 106 ]]
				-- upvalues: channel (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), buildUserMessage (copy), setMessages (ref)
				if not p11.TextSource then return end
				if p11.TextChannel ~= channel then return end
				if (if getFFlagExpChatProtectedChatInternalAPIs() then p11.TextInternal else p11.Text) == "" then
					return
				end
				local var8 = buildUserMessage(p11, p11.TextSource, true)
				setMessages(function(p12) --[[ line: 122 ]]
					-- upvalues: var8 (ref)
					for i, v in p12 do
						if v.messageId == var8.messageId then
							return p12
						end
					end
					local cloned = table.clone(p12)
					table.insert(cloned, var8)
					
					return cloned
				end)
			end))
			local isRBXSystem = channel.Name == "RBXSystem"
			table.insert(t, channel.MessageReceived:Connect(function(p13) --[[ line: 131 ]]
				-- upvalues: isRBXSystem (ref), mapTextChatMessage (copy), localUserId (ref), setMessages (ref), applyMessage (copy)
				if p13.TextSource or isRBXSystem then
					local var10 = mapTextChatMessage(p13, localUserId)
					setMessages(function(p14) --[[ line: 137 ]]
						-- upvalues: applyMessage (copy), var10 (ref)
						return applyMessage(p14, var10)
					end)
					
					return
				end
			end))
			
			return function() --[[ line: 143 ]]
				-- upvalues: t (ref)
				for i, v in t do
					v:Disconnect()
				end
			end
		end
		return function() --[[ line: 97 ]] end
	end
}