local playersService = game:GetService("Players")
local list = { "/team ", "/t ", "% " }

function IsTeamCommand(p1)
	-- upvalues: list (ref)
	for i = 1, #list do
		local var1 = list[i]
		
		if string.sub(p1, 1, var1:len()):lower() ~= var1 then
			continue
		end
		return true
	end
	return false
end

local t = {}
t.__index = t
local utilModule = require(script.Parent:WaitForChild("Util"))
local t_1 = {
	new = function(p2, p3, p4)
		-- upvalues: t (ref)
		local tbl = setmetatable({}, t)
		tbl.Destroyed = false
		tbl.ChatWindow = p2
		tbl.ChatBar = p3
		tbl.ChatSettings = p4
		tbl.TextBox = p3:GetTextBox()
		tbl.MessageModeButton = p3:GetMessageModeTextButton()
		tbl.OriginalTeamText = ""
		tbl.TeamChatEntered = false
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
		tbl:EnterTeamChat()
		
		return tbl
	end
}

function t.EnterTeamChat(p2)
	p2.TeamChatEntered = true
	p2.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	p2.MessageModeButton.Text = "[Team]"
	p2.MessageModeButton.TextColor3 = p2:GetTeamChatColor()
	local x = p2.MessageModeButton.TextBounds.X
	p2.MessageModeButton.Size = UDim2.new(0, x, 1, 0)
	p2.TextBox.Size = UDim2.new(1, -x, 1, 0)
	p2.TextBox.Position = UDim2.new(0, x, 0, 0)
	p2.OriginalTeamText = p2.TextBox.Text
	p2.TextBox.Text = " "
end

function t.TextUpdated(p2)
	local text = p2.TextBox.Text
	
	if not p2.TeamChatEntered then
		if IsTeamCommand(text) then
			p2:EnterTeamChat()
			
			return
		end
	elseif text == "" then
		p2.MessageModeButton.Text = ""
		p2.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
		p2.TextBox.Size = UDim2.new(1, 0, 1, 0)
		p2.TextBox.Position = UDim2.new(0, 0, 0, 0)
		p2.TextBox.Text = ""
		p2.TeamChatEntered = false
		p2.ChatBar:ResetCustomState()
		p2.ChatBar:CaptureFocus()
	end
end

function t.GetMessage(p2)
	return if p2.TeamChatEntered then "/t " .. p6.TextBox.Text else p2.TextBox.Text
end

function t.ProcessCompletedMessage(_)
	return false
end

function t.Destroy(p2)
	p2.MessageModeConnection:disconnect()
	p2.Destroyed = true
end

function t.GetTeamChatColor(p2)
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer.Team then localPlayer.Team.TeamColor.Color elseif p2.ChatSettings.DefaultChannelNameColor then p2.ChatSettings.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
end

function ProcessMessage(p2, p3, p4, p5)
	-- upvalues: t_1 (ref)
	if p4.TargetChannel == "Team" then return end
	return if IsTeamCommand(p2) then t_1.new(p3, p4, p5) else nil
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.IN_PROGRESS_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}