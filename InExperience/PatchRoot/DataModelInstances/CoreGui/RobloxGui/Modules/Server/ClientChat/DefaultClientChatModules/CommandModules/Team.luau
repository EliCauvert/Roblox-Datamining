local Players = game:GetService("Players")
local list = { "/team ", "/t ", "% " }

function IsTeamCommand(Text: string): boolean --[[ Line: 10 ]]
	-- upvalues: list (copy)
	for i = 1, #list do
		local Entry = list[i]
		
		if string.sub(Text, 1, Entry:len()):lower() == Entry then
			return true
		end
	end
	return false
end

local Module = {}
Module.__index = Module
local UtilModule = require(script.Parent:WaitForChild("Util"))

function Module.EnterTeamChat(p1) --[[ Line: 27 ]]
	p1.TeamChatEntered = true
	p1.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	p1.MessageModeButton.Text = "[Team]"
	p1.MessageModeButton.TextColor3 = p1:GetTeamChatColor()
	local X = p1.MessageModeButton.TextBounds.X
	p1.MessageModeButton.Size = UDim2.new(0, X, 1, 0)
	p1.TextBox.Size = UDim2.new(1, -X, 1, 0)
	p1.TextBox.Position = UDim2.new(0, X, 0, 0)
	p1.OriginalTeamText = p1.TextBox.Text
	p1.TextBox.Text = " "
end

function Module.TextUpdated(p1) --[[ Line: 41 ]]
	local Text = p1.TextBox.Text
	
	if p1.TeamChatEntered then
		if Text == "" then
			p1.MessageModeButton.Text = ""
			p1.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
			p1.TextBox.Size = UDim2.new(1, 0, 1, 0)
			p1.TextBox.Position = UDim2.new(0, 0, 0, 0)
			p1.TextBox.Text = ""
			p1.TeamChatEntered = false
			p1.ChatBar:ResetCustomState()
			p1.ChatBar:CaptureFocus()
		end
	elseif IsTeamCommand(Text) then
		p1:EnterTeamChat()
		
		return
	end
end

function Module.GetMessage(p1) --[[ Line: 64 ]]
	return if p1.TeamChatEntered then "/t " .. p1.TextBox.Text else p1.TextBox.Text
end

function Module:ProcessCompletedMessage(): boolean --[[ Line: 71 ]]
	return false
end

function Module.Destroy(p1) --[[ Line: 75 ]]
	p1.MessageModeConnection:disconnect()
	p1.Destroyed = true
end

function Module.GetTeamChatColor(p1) --[[ Line: 80 ]]
	-- upvalues: Players (copy)
	local LocalPlayer = Players.LocalPlayer
	
	return if LocalPlayer.Team then LocalPlayer.Team.TeamColor.Color elseif p1.ChatSettings.DefaultChannelNameColor then p1.ChatSettings.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
end

local config = {
	new = function(ChatWindow, ChatBar, ChatSettings) --[[ Line: 91 ]]
		-- upvalues: Module (copy)
		local self = setmetatable({}, Module)
		self.Destroyed = false
		self.ChatWindow = ChatWindow
		self.ChatBar = ChatBar
		self.ChatSettings = ChatSettings
		self.TextBox = ChatBar:GetTextBox()
		self.MessageModeButton = ChatBar:GetMessageModeTextButton()
		self.OriginalTeamText = ""
		self.TeamChatEntered = false
		self.MessageModeConnection = self.MessageModeButton.MouseButton1Click:connect(function() --[[ Line: 102 ]]
			-- upvalues: self (copy)
			local Text = self.TextBox.Text
			
			if string.sub(Text, 1, 1) == " " then
				Text = string.sub(Text, 2)
			end
			self.ChatBar:ResetCustomState()
			self.ChatBar:SetTextBoxText(Text)
			self.ChatBar:CaptureFocus()
		end)
		self:EnterTeamChat()
		
		return self
	end
}

function ProcessMessage(p1, ChatWindow, ChatBar, ChatSettings) --[[ Line: 117 ]]
	-- upvalues: config (copy)
	if ChatBar.TargetChannel == "Team" then return end
	return if IsTeamCommand(p1) then config.new(ChatWindow, ChatBar, ChatSettings) else nil
end

return {
	[UtilModule.KEY_COMMAND_PROCESSOR_TYPE] = UtilModule.IN_PROGRESS_MESSAGE_PROCESSOR,
	[UtilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}