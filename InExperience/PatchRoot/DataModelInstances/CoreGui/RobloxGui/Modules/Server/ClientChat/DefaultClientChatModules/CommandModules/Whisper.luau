local utilModule = require(script.Parent:WaitForChild("Util"))
local chatSettingsModule = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local playersService = game:GetService("Players")
local var3 = nil
pcall(function() --[[ line: 13 ]]
	-- upvalues: var3 (write)
	var3 = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
local localPlayer = playersService.LocalPlayer
while localPlayer == nil do
	playersService.ChildAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local t = {}
t.__index = t
local t_1 = {
	new = function(p0, p1, p2, p3) --[[ line: 182 ]]
		-- upvalues: t (ref)
		local tbl = setmetatable({}, t)
		tbl.Destroyed = false
		tbl.ChatWindow = p0
		tbl.ChatBar = p1
		tbl.ChatSettings = p2
		tbl.TextBox = p1:GetTextBox()
		tbl.MessageModeButton = p1:GetMessageModeTextButton()
		tbl.OriginalWhisperText = ""
		tbl.PlayerNameEntered = false
		tbl.MessageModeConnection = tbl.MessageModeButton.MouseButton1Click:connect(function() --[[ line: 193 ]]
			-- upvalues: tbl (ref)
			local text = tbl.TextBox.Text
			
			if string.sub(text, 1, 1) == " " then
				text = string.sub(text, 2)
			end
			tbl.ChatBar:ResetCustomState()
			tbl.ChatBar:SetTextBoxText(text)
			tbl.ChatBar:CaptureFocus()
		end)
		
		if p3 then
			tbl:EnterWhisperState(p3)
			
			return tbl
		end
		tbl:TextUpdated()
		
		return tbl
	end
}

function t.TrimWhisperCommand(_, p4) --[[ line: 26 ]]
	return if string.sub(p4, 1, 3):lower() == "/w " then string.sub(p4, 4) elseif string.sub(p4, 1, 9):lower() == "/whisper " then string.sub(p4, 10) else nil
end

function t.TrimWhiteSpace(_, p5) --[[ line: 35 ]]
	return string.gsub(p5, "%s+", ""), p5[#p5] == " "
end

function t.ShouldAutoCompleteNames(_) --[[ line: 41 ]]
	-- upvalues: chatSettingsModule (ref)
	return chatSettingsModule.WhisperCommandAutoCompletePlayerNames == nil or chatSettingsModule.WhisperCommandAutoCompletePlayerNames
end

function t.GetWhisperingPlayer(p6, p7) --[[ line: 48 ]]
	-- upvalues: playersService (ref), localPlayer (write), chatSettingsModule (ref)
	local var7 = p6:TrimWhisperCommand(p7:lower())
	
	if var7 then
		local i
		local var8, var9 = p6:TrimWhiteSpace(var7)
		local t = {}
		local t_1 = {}
		local players = playersService:GetPlayers()
		
		for i = 1, #players do
			if players[i] == localPlayer then
				continue
			end
			if string.sub(players[i].Name:lower(), 1, string.len(var8)) == var8 then
				t[players[i]] = players[i].Name:lower()
			end
			if chatSettingsModule.WhisperByDisplayName then
				local var13 = players[i].DisplayName:lower()
				
				if string.sub(var13, 1, string.len(var8)) == var8 then
					t_1[players[i]] = var13
				end
			end
		end
		local var14 = 0
		local var15 = nil
		i = nil
		
		for i_1, v in pairs(t) do
			var14 += 1
			var15 = i_1
			i = v
			
			if v == var8 and var9 then
				return i_1
			end
		end
		if chatSettingsModule.WhisperByDisplayName then
			for i_2, v_1 in pairs(t_1) do
				if var15 ~= i_2 then
					var14 += 1
					var15 = i_2
					i = v_1
				end
			end
		end
		if var14 == 1 then
			return if p6:ShouldAutoCompleteNames() then var15 elseif i == var8 then var15 else nil
		end
	end
end

function t.GetWhisperChanneNameColor(p8) --[[ line: 106 ]]
	return if p8.ChatSettings.WhisperChannelNameColor then p8.ChatSettings.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
end

function t.EnterWhisperState(p9, p10) --[[ line: 113 ]]
	-- upvalues: chatSettingsModule (ref), var3 (write)
	p9.PlayerNameEntered = true
	p9.PlayerName = p10.Name
	p9.PlayerDisplayName = p10.DisplayName
	p9.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	local _ = nil
	local var16 = if chatSettingsModule.PlayerDisplayNamesEnabled and chatSettingsModule.WhisperByDisplayName then string.format("[To %s]", p10.DisplayName) else string.format("[To %s]", p10.Name)
	
	if var3.tryLocalize then
		var16 = var3:tryLocalize(var16)
	end
	p9.MessageModeButton.Text = var16
	p9.MessageModeButton.TextColor3 = p9:GetWhisperChanneNameColor()
	local ceiled = math.ceil(p9.MessageModeButton.TextBounds.X)
	p9.MessageModeButton.Size = UDim2.new(0, ceiled, 1, 0)
	p9.TextBox.Size = UDim2.new(1, -ceiled, 1, 0)
	p9.TextBox.Position = UDim2.new(0, ceiled, 0, 0)
	p9.TextBox.Text = " "
end

function t.TextUpdated(p11) --[[ line: 142 ]]
	local text = p11.TextBox.Text
	
	if not p11.PlayerNameEntered then
		local var18 = p11:GetWhisperingPlayer(text)
		
		if var18 then
			p11:EnterWhisperState(var18)
			
			return
		end
	elseif text == "" then
		p11.MessageModeButton.Text = ""
		p11.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
		p11.TextBox.Size = UDim2.new(1, 0, 1, 0)
		p11.TextBox.Position = UDim2.new(0, 0, 0, 0)
		p11.TextBox.Text = ""
		p11.PlayerNameEntered = false
		p11.ChatBar:ResetCustomState()
		p11.ChatBar:CaptureFocus()
	end
end

function t.GetMessage(p12) --[[ line: 166 ]]
	return if p12.PlayerNameEntered then "/w " .. p12.PlayerName .. " " .. p12.TextBox.Text else p12.TextBox.Text
end

function t.ProcessCompletedMessage(_) --[[ line: 173 ]]
	return false
end

function t.Destroy(p13) --[[ line: 177 ]]
	p13.MessageModeConnection:disconnect()
	p13.Destroyed = true
end

function ProcessMessage(p14, p15, p16, p17) --[[ line: 212 ]]
	-- upvalues: t_1 (ref)
	return if string.sub(p14, 1, 3):lower() == "/w " or string.sub(p14, 1, 9):lower() == "/whisper " then t_1.new(p15, p16, p17) else nil
end

function CreateCustomState(p18, p19, p20, p21) --[[ line: 219 ]]
	-- upvalues: t_1 (ref)
	return t_1.new(p19, p20, p21, p18)
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.IN_PROGRESS_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage,
	CustomStateCreator = CreateCustomState
}