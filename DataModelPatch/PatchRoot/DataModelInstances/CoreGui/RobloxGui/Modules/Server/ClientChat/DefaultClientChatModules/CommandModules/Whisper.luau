local UtilModule = require(script.Parent:WaitForChild("Util"))
local ChatSettingsModule = require(script.Parent.Parent:WaitForChild("ChatSettings"))
local Players = game:GetService("Players")
local ChatLocalizationModule = nil
pcall(function()
	-- upvalues: ChatLocalizationModule (ref)
	ChatLocalizationModule = require(game:GetService("Chat").ClientChatModules.ChatLocalization)
end)
local LocalPlayer = Players.LocalPlayer
while LocalPlayer == nil do
	Players.ChildAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local Module = {}
Module.__index = Module

function Module:TrimWhisperCommand(Text: string)
	return if string.sub(Text, 1, 3):lower() == "/w " then string.sub(Text, 4) elseif string.sub(Text, 1, 9):lower() == "/whisper " then string.sub(Text, 10) else nil
end

function Module:TrimWhiteSpace(Text: string)
	return string.gsub(Text, "%s+", ""), Text[#Text] == " "
end

function Module:ShouldAutoCompleteNames()
	-- upvalues: ChatSettingsModule (copy)
	return ChatSettingsModule.WhisperCommandAutoCompletePlayerNames == nil or ChatSettingsModule.WhisperCommandAutoCompletePlayerNames
end

function Module.GetWhisperingPlayer(p1, Text: string)
	-- upvalues: Players (copy), LocalPlayer (ref), ChatSettingsModule (copy)
	local TrimWhisperCommandResult = p1:TrimWhisperCommand((Text:lower()))
	
	if TrimWhisperCommandResult then
		local TrimWhiteSpaceResult, TrimWhiteSpaceResult2 = p1:TrimWhiteSpace(TrimWhisperCommandResult)
		local t = {}
		local t1 = {}
		local Players1 = Players:GetPlayers()
		
		for i = 1, #Players1 do
			if Players1[i] ~= LocalPlayer then
				if string.sub(Players1[i].Name:lower(), 1, (string.len(TrimWhiteSpaceResult))) == TrimWhiteSpaceResult then
					t[Players1[i]] = Players1[i].Name:lower()
				end
				if ChatSettingsModule.WhisperByDisplayName then
					local Lowered: string = Players1[i].DisplayName:lower()
					
					if string.sub(Lowered, 1, (string.len(TrimWhiteSpaceResult))) == TrimWhiteSpaceResult then
						t1[Players1[i]] = Lowered
					end
				end
			end
		end
		local Count = 0
		local v1 = nil
		local v2 = nil
		
		for i1, value in pairs(t) do
			Count += 1
			v1 = i1
			v2 = value
			
			if value == TrimWhiteSpaceResult and TrimWhiteSpaceResult2 then
				return i1
			end
		end
		if ChatSettingsModule.WhisperByDisplayName then
			for i2, value1 in pairs(t1) do
				if v1 ~= i2 then
					Count += 1
					v1 = i2
					v2 = value1
				end
			end
		end
		if Count == 1 then
			if p1:ShouldAutoCompleteNames() then
				return v1
			elseif v2 == TrimWhiteSpaceResult then
				return v1
			end
		end
	end
	return nil
end

function Module.GetWhisperChanneNameColor(p2)
	return if p2.ChatSettings.WhisperChannelNameColor then p2.ChatSettings.WhisperChannelNameColor else Color3.fromRGB(102, 14, 102)
end

function Module.EnterWhisperState(p2, Player: Player)
	-- upvalues: ChatSettingsModule (copy), ChatLocalizationModule (ref)
	p2.PlayerNameEntered = true
	p2.PlayerName = Player.Name
	p2.PlayerDisplayName = Player.DisplayName
	p2.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	local Formatted = if ChatSettingsModule.PlayerDisplayNamesEnabled and ChatSettingsModule.WhisperByDisplayName then string.format("[To %s]", Player.DisplayName) else string.format("[To %s]", Player.Name)
	
	if ChatLocalizationModule.tryLocalize then
		Formatted = ChatLocalizationModule:tryLocalize(Formatted)
	end
	p2.MessageModeButton.Text = Formatted
	p2.MessageModeButton.TextColor3 = p2:GetWhisperChanneNameColor()
	local Ceiled = math.ceil(p2.MessageModeButton.TextBounds.X)
	p2.MessageModeButton.Size = UDim2.new(0, Ceiled, 1, 0)
	p2.TextBox.Size = UDim2.new(1, -Ceiled, 1, 0)
	p2.TextBox.Position = UDim2.new(0, Ceiled, 0, 0)
	p2.TextBox.Text = " "
end

function Module.TextUpdated(p2)
	local Text = p2.TextBox.Text
	
	if not p2.PlayerNameEntered then
		local WhisperingPlayer = p2:GetWhisperingPlayer(Text)
		
		if WhisperingPlayer then
			p2:EnterWhisperState(WhisperingPlayer)
			
			return
		end
	elseif Text == "" then
		p2.MessageModeButton.Text = ""
		p2.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
		p2.TextBox.Size = UDim2.new(1, 0, 1, 0)
		p2.TextBox.Position = UDim2.new(0, 0, 0, 0)
		p2.TextBox.Text = ""
		p2.PlayerNameEntered = false
		p2.ChatBar:ResetCustomState()
		p2.ChatBar:CaptureFocus()
	end
end

function Module.GetMessage(p2)
	return if p2.PlayerNameEntered then "/w " .. p2.PlayerName .. " " .. p2.TextBox.Text else p2.TextBox.Text
end

function Module:ProcessCompletedMessage(): boolean
	return false
end

function Module.Destroy(p2)
	p2.MessageModeConnection:disconnect()
	p2.Destroyed = true
end

local config = {
	new = function(ChatWindow, ChatBar, ChatSettings, Player)
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.Destroyed = false
		self.ChatWindow = ChatWindow
		self.ChatBar = ChatBar
		self.ChatSettings = ChatSettings
		self.TextBox = ChatBar:GetTextBox()
		self.MessageModeButton = ChatBar:GetMessageModeTextButton()
		self.OriginalWhisperText = ""
		self.PlayerNameEntered = false
		self.MessageModeConnection = self.MessageModeButton.MouseButton1Click:connect(function()
			-- upvalues: self (copy)
			local Text = self.TextBox.Text
			
			if string.sub(Text, 1, 1) == " " then
				Text = string.sub(Text, 2)
			end
			self.ChatBar:ResetCustomState()
			self.ChatBar:SetTextBoxText(Text)
			self.ChatBar:CaptureFocus()
		end)
		
		if Player then
			self:EnterWhisperState(Player)
			
			return self
		else
			self:TextUpdated()
			
			return self
		end
	end
}

function ProcessMessage(Text: string, ChatWindow, ChatBar, ChatSettings)
	-- upvalues: config (copy)
	return if string.sub(Text, 1, 3):lower() == "/w " or string.sub(Text, 1, 9):lower() == "/whisper " then config.new(ChatWindow, ChatBar, ChatSettings) else nil
end

function CreateCustomState(p2, ChatWindow, ChatBar, ChatSettings)
	-- upvalues: config (copy)
	return config.new(ChatWindow, ChatBar, ChatSettings, p2)
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.IN_PROGRESS_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage,
	CustomStateCreator = CreateCustomState
}