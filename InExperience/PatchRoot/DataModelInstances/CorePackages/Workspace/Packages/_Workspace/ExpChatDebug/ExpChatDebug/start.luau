local parent = script.Parent.Parent
local getFFlagTextChatEnableUniverseChatTabs = require(parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local getFFlagExpChatProtectedChatInternalAPIs = require(parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

return function()
	-- upvalues: getFFlagExpChatProtectedChatInternalAPIs (ref), getFFlagTextChatEnableUniverseChatTabs (ref)
	local coreGuiService = game:GetService("CoreGui")
	local textChatService = game:GetService("TextChatService")
	local expChatDebuggerIncomingMessageEventEngineFeature = game:GetEngineFeature("ExpChatDebuggerIncomingMessageEvent")
	local expChatDebugGlobalChat = game:DefineFastFlag("ExpChatDebugGlobalChat", false)
	local experienceChatDebug = Instance.new("ScreenGui")
	experienceChatDebug.Name = "ExperienceChatDebug"
	experienceChatDebug.ResetOnSpawn = false
	experienceChatDebug.DisplayOrder = -1
	experienceChatDebug.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local var1 = 7
	local list = {
		{
			vertical = Enum.VerticalAlignment.Top,
			horizontal = Enum.HorizontalAlignment.Left
		},
		{
			vertical = Enum.VerticalAlignment.Top,
			horizontal = Enum.HorizontalAlignment.Center
		},
		{
			vertical = Enum.VerticalAlignment.Top,
			horizontal = Enum.HorizontalAlignment.Right
		},
		{
			vertical = Enum.VerticalAlignment.Center,
			horizontal = Enum.HorizontalAlignment.Left
		},
		{
			vertical = Enum.VerticalAlignment.Center,
			horizontal = Enum.HorizontalAlignment.Center
		},
		{
			vertical = Enum.VerticalAlignment.Center,
			horizontal = Enum.HorizontalAlignment.Right
		},
		{
			vertical = Enum.VerticalAlignment.Bottom,
			horizontal = Enum.HorizontalAlignment.Left
		},
		{
			vertical = Enum.VerticalAlignment.Bottom,
			horizontal = Enum.HorizontalAlignment.Center
		},
		{
			vertical = Enum.VerticalAlignment.Bottom,
			horizontal = Enum.HorizontalAlignment.Right
		}
	}
	local t = {}
	local UIListLayout = Instance.new("UIListLayout")
	UIListLayout.Parent = experienceChatDebug
	
	local function _()
		-- upvalues: list (ref), var1 (write), UIListLayout (ref)
		local var2 = list[var1]
		UIListLayout.VerticalAlignment = var2.vertical
		UIListLayout.HorizontalAlignment = var2.horizontal
	end
	
	local var2 = list[var1]
	UIListLayout.VerticalAlignment = var2.vertical
	UIListLayout.HorizontalAlignment = var2.horizontal
	local imageButton = Instance.new("ImageButton")
	imageButton.AutomaticSize = Enum.AutomaticSize.XY
	imageButton.Size = UDim2.new(0, 200, 0, 20)
	imageButton.BackgroundTransparency = 0.3
	imageButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	imageButton.Parent = experienceChatDebug
	imageButton.Activated:Connect(function()
		-- upvalues: var1 (write), list (ref), UIListLayout (ref)
		var1 += 1
		
		if #list < var1 then
			var1 = 1
		end
		local var3 = list[var1]
		UIListLayout.VerticalAlignment = var3.vertical
		UIListLayout.HorizontalAlignment = var3.horizontal
	end)
	
	local function clearEntries()
		-- upvalues: t (write)
		for i, v in t do
			v:Destroy()
		end
		t = {}
	end
	
	imageButton.MouseButton2Click:Connect(clearEntries)
	imageButton.TouchLongPress:Connect(clearEntries)
	local UIListLayout_1 = Instance.new("UIListLayout")
	UIListLayout_1.VerticalAlignment = Enum.VerticalAlignment.Bottom
	UIListLayout_1.Parent = imageButton
	
	local function addEntryToContainer(p1, p2, p3)
		-- upvalues: t (write), imageButton (ref)
		if #t > 10 then
			local removed = table.remove(t, 1)
			
			if removed then
				removed:Destroy()
			end
		end
		local textLabel = Instance.new("TextLabel")
		textLabel.AutomaticSize = Enum.AutomaticSize.X
		textLabel.BackgroundTransparency = p3
		textLabel.BackgroundColor3 = p2
		textLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
		textLabel.Text = p1
		textLabel.RichText = true
		textLabel.TextTruncate = Enum.TextTruncate.AtEnd
		textLabel.TextYAlignment = Enum.TextYAlignment.Top
		textLabel.TextXAlignment = Enum.TextXAlignment.Left
		textLabel.TextSize = 16
		textLabel.FontFace = Font.fromEnum(Enum.Font.RobotoMono)
		textLabel.Size = UDim2.new(0, 0, 0, 18)
		textLabel.Parent = imageButton
		table.insert(t, textLabel)
	end
	
	local char = utf8.char(128227)
	local char_1 = utf8.char(128229)
	
	local function formatEntry(p1, p2)
		-- upvalues: char (ref), char_1 (ref), getFFlagExpChatProtectedChatInternalAPIs (copy), addEntryToContainer (ref)
		local var3
		local var4 = if p1.Status == Enum.TextChatMessageStatus.Sending then `{char} Sent` else `{char_1} Rec.`
		local _ = nil
		local var5 = if p2 == "Global" then "RBXGlobal" elseif p1.TextChannel and p2 == "Local" then p1.TextChannel.Name else "Unknown"
		
		if p1.Status ~= Enum.TextChatMessageStatus.Success then
			var3 = p1.Status == Enum.TextChatMessageStatus.Sending
		end
		addEntryToContainer(`{var4} [{var5}{if p1.TextChannel and p1.TextChannel.DirectChatRequester then " <font color='#00E344'>(Direct)</font>" else ""}] {if getFFlagExpChatProtectedChatInternalAPIs() then p1.TextInternal else p1.Text} {if var3 then `({p1.Status.Name})` else ""}`, if var3 then Color3.fromRGB(255, 0, 0) else Color3.fromRGB(32, 32, 32), if var3 then 0.5 else 1)
	end
	
	if expChatDebuggerIncomingMessageEventEngineFeature then
		textChatService.OnIncomingMessageEvent:Connect(function(p3)
			-- upvalues: formatEntry (ref)
			formatEntry(p3, "Local")
		end)
	else
		textChatService.MessageReceived:Connect(function(p3)
			-- upvalues: formatEntry (ref)
			formatEntry(p3, "Local")
		end)
		textChatService.SendingMessage:Connect(function(p3)
			-- upvalues: formatEntry (ref)
			formatEntry(p3, "Local")
		end)
	end
	if getFFlagTextChatEnableUniverseChatTabs() and expChatDebugGlobalChat then
		textChatService.UniverseChatMessageReceived:Connect(function(p3)
			-- upvalues: formatEntry (ref)
			formatEntry(p3, "Global")
		end)
	end
	experienceChatDebug.Parent = coreGuiService
end