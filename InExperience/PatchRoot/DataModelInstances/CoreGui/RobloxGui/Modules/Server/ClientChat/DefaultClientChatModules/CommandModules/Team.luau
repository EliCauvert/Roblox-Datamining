local playersService = game:GetService("Players")
local list = { "/team ", "/t ", "% " }

function IsTeamCommand(p0) --[[ line: 10 ]]
	-- upvalues: list (ref)
	for i = 1, #list do
		local var5 = list[i]
		
		if string.sub(p0, 1, var5:len()):lower() ~= var5 then
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
	new = function(p1, p2, p3) --[[ line: 91 ]]
		-- upvalues: t (ref)
		local tbl = setmetatable({}, t)
		tbl.Destroyed = false
		tbl.ChatWindow = p1
		tbl.ChatBar = p2
		tbl.ChatSettings = p3
		tbl.TextBox = p2:GetTextBox()
		tbl.MessageModeButton = p2:GetMessageModeTextButton()
		tbl.OriginalTeamText = ""
		tbl.TeamChatEntered = false
		tbl.MessageModeConnection = tbl.MessageModeButton.MouseButton1Click:connect(function() --[[ line: 102 ]]
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

function t.EnterTeamChat(p4) --[[ line: 27 ]]
	p4.TeamChatEntered = true
	p4.MessageModeButton.Size = UDim2.new(0, 1000, 1, 0)
	p4.MessageModeButton.Text = "[Team]"
	p4.MessageModeButton.TextColor3 = p4:GetTeamChatColor()
	local x = p4.MessageModeButton.TextBounds.X
	p4.MessageModeButton.Size = UDim2.new(0, x, 1, 0)
	p4.TextBox.Size = UDim2.new(1, -x, 1, 0)
	p4.TextBox.Position = UDim2.new(0, x, 0, 0)
	p4.OriginalTeamText = p4.TextBox.Text
	p4.TextBox.Text = " "
end

function t.TextUpdated(p5) --[[ line: 41 ]]
	local text = p5.TextBox.Text
	
	if not p5.TeamChatEntered then
		if IsTeamCommand(text) then
			p5:EnterTeamChat()
			
			return
		end
	elseif text == "" then
		p5.MessageModeButton.Text = ""
		p5.MessageModeButton.Size = UDim2.new(0, 0, 0, 0)
		p5.TextBox.Size = UDim2.new(1, 0, 1, 0)
		p5.TextBox.Position = UDim2.new(0, 0, 0, 0)
		p5.TextBox.Text = ""
		p5.TeamChatEntered = false
		p5.ChatBar:ResetCustomState()
		p5.ChatBar:CaptureFocus()
	end
end

function t.GetMessage(p6) --[[ line: 64 ]]
	return if p6.TeamChatEntered then "/t " .. p6.TextBox.Text else p6.TextBox.Text
end

function t.ProcessCompletedMessage(_) --[[ line: 71 ]]
	return false
end

function t.Destroy(p7) --[[ line: 75 ]]
	p7.MessageModeConnection:disconnect()
	p7.Destroyed = true
end

function t.GetTeamChatColor(p8) --[[ line: 80 ]]
	-- upvalues: playersService (ref)
	local localPlayer = playersService.LocalPlayer
	
	return if localPlayer.Team then localPlayer.Team.TeamColor.Color elseif p8.ChatSettings.DefaultChannelNameColor then p8.ChatSettings.DefaultChannelNameColor else Color3.fromRGB(35, 76, 142)
end

function ProcessMessage(p9, p10, p11, p12) --[[ line: 117 ]]
	-- upvalues: t_1 (ref)
	if p11.TargetChannel == "Team" then return end
	return if IsTeamCommand(p9) then t_1.new(p10, p11, p12) else nil
end

return {
	[utilModule.KEY_COMMAND_PROCESSOR_TYPE] = utilModule.IN_PROGRESS_MESSAGE_PROCESSOR,
	[utilModule.KEY_PROCESSOR_FUNCTION] = ProcessMessage
}