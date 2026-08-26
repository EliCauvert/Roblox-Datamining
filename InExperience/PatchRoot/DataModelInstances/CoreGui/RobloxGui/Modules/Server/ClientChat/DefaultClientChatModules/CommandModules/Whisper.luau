local utilModule = require(script.Parent:WaitForChild("Util"))
local chatSettingsModule = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local playersService = game:GetService("Players")
local var1 = nil
pcall(function()
	-- upvalues: var1 (write)
	var1 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local t = {}
t.__index = t
local t_1 = {
	new = function(p1, p2, p3, p4)
		-- upvalues: t (ref)
		local tbl = setmetatable({}, t)
		tbl.Destroyed = false
		tbl.ChatWindow = p1
		tbl.ChatBar = p2
		tbl.ChatSettings = p3
		tbl.TextBox = p2:GetTextBox()
		tbl.MessageModeButton = p2:GetMessageModeTextButton()
		tbl.OriginalWhisperText = ""
		tbl.PlayerNameEntered = false
		tbl.MessageModeConnection = tbl.MessageModeButton.MouseButton1Click:connect(function()
			-- upvalues: tbl (ref)
			local text = tbl.TextBox.Text
			
			if string.sub(text, 1, 1) == " " then
				text = string.sub(text, 2)
			end
			tbl.ChatBar:ResetCustomState()
			tbl.ChatBar:SetTextBoxText(text)
			tbl.ChatBar:CaptureFocus()
		end)
		
		if p4 then
			tbl:EnterWhisperState(p4)
			
			return tbl
		end
		tbl:TextUpdated()
		
		return tbl
	end
}

function t.TrimWhisperCommand(_, p1)
	return if string.sub(p1, 1, 3):lower() == "/w " then string.sub(p1, 4) elseif string.sub(p1, 1, 9):lower() == "/whisper " then string.sub(p1, 10) else nil
end

function t.TrimWhiteSpace(_, p1)
	return string.gsub(p1, "%s+", ""), p1[#p1] == " "
end

function t.ShouldAutoCompleteNames(_)
	-- upvalues: chatSettingsModule (ref)
	return chatSettingsModule.WhisperCommandAutoCompletePlayerNames == nil or chatSettingsModule.WhisperCommandAutoCompletePlayerNames
end

function t.GetWhisperingPlayer(p1, p2)
	-- upvalues: playersService (ref), localPlayer (write), chatSettingsModule (ref)
	local var2 = p1:TrimWhisperCommand(p2:lower())
	
	if var2 then
		local i
		local var3, var4 = p1:TrimWhiteSpace(var2)
		local t = {}
		local t_1 = {}
		local players = playersService:GetPlayers()
		
		for i = 1, #players do
			if players[i] == localPlayer then
				continue
			end
			if string.sub(players[i].Name:lower(), 1, string.len(var3)) == var3 then
				t[players[i]] = players[i].Name:lower()
			end
			if chatSettingsModule.WhisperByDisplayName then
				local var5 = players[i].DisplayName:lower()
				
				if string.sub(var5, 1, string.len(var3)) == var3 then
					t_1[players[i]] = var5
				end
			end
		end
		local var6 = 0
		local var7 = nil
		i = nil
		
		for i_1, v in pairs(t) do
			var6 += 1
			var7 = i_1
			i = v
			
			if v == var3 and var4 then
				return i_1
			end
		end
		if chatSettingsModule.WhisperByDisplayName then
			for i_2, v_1 in pairs(t_1) do
				if var7 ~= i_2 then
					var6 += 1
					var7 = i_2
					i = v_1
				end
			end
		end
		if var6 == 1 then
			return if p1:ShouldAutoCompleteNames() then var7 elseif i == var3 then var7 else nil
		end
	end
end

function t.GetWhisperChanneNameColor(p3)
	return if p3.ChatSettings.WhisperChannelNameColor then p3.ChatSettings.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
end

function t.EnterWhisperState(p3, p4)
	-- upvalues: chatSettingsModule (ref), var1 (write)
	p3.PlayerNameEntered = true
	p3.PlayerName = p4.Name
	p3.PlayerDisplayName = p4.DisplayName
	p3.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	local _ = nil
	local var8 = if chatSettingsModule.PlayerDisplayNamesEnabled and chatSettingsModule.WhisperByDisplayName then string.format("[To %s]", p4.DisplayName) else string.format("[To %s]", p4.Name)
	
	if var1.tryLocalize then
		var8 = var1:tryLocalize(var8)
	end
	p3.MessageModeButton.Text = var8
	p3.MessageModeButton.TextColor3 = p3:GetWhisperChanneNameColor()
	local ceiled = math.ceil(p3.MessageModeButton.TextBounds.X)
	p3.MessageModeButton.Size = UDim2.new(0, ceiled, 1, 0)
	p3.TextBox.Size = UDim2.new(1, -ceiled, 1, 0)
	p3.TextBox.Position = UDim2.new(0, ceiled, 0, 0)
	p3.TextBox.Text = " "
end

function t.TextUpdated(p3)
	local text = p3.TextBox.Text
	
	if not p3.PlayerNameEntered then
		local var8 = p3:GetWhisperingPlayer(text)
		
		if var8 then
			p3:EnterWhisperState(var8)
			
			return
		end
	elseif text == "" then
		p3.MessageModeButton.Text = ""
		p3.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
		p3.TextBox.Size = UDim2.new(1, 0, 1, 0)
		p3.TextBox.Position = UDim2.new(0, 0, 0, 0)
		p3.TextBox.Text = ""
		p3.PlayerNameEntered = false
		p3.ChatBar:ResetCustomState()
		p3.ChatBar:CaptureFocus()
	end
end

function t.GetMessage(p3)
	return if p3.PlayerNameEntered then "/w " .. p12.PlayerName .. " " .. p12.TextBox.Text else p3.TextBox.Text
end

function t.ProcessCompletedMessage(_)
	return false
end

function t.Destroy(p3)
	p3.MessageModeConnection:disconnect()
	p3.Destroyed = true
end

function ProcessMessage(p3, p4, p5, p6)
	-- upvalues: t_1 (ref)
	return if string.sub(p3, 1, 3):lower() == "/w " or string.sub(p3, 1, 9):lower() == "/whisper " then t_1.new(p4, p5, p6) else nil
end

function CreateCustomState(p3, p4, p5, p6)
	-- upvalues: t_1 (ref)
	return t_1.new(p4, p5, p6, p3)
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.IN_PROGRESS_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage,
	CustomStateCreator = CreateCustomState
}