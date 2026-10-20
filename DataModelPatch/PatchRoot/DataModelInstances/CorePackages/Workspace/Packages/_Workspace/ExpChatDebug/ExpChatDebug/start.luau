local Parent = script.Parent.Parent
local GetFFlagTextChatEnableUniverseChatTabsFunction = require(Parent.ExpChatShared).Flags.GetFFlagTextChatEnableUniverseChatTabs
local GetFFlagExpChatProtectedChatInternalAPIsFunction = require(Parent.SharedFlags).getFFlagExpChatProtectedChatInternalAPIs

return function()
	-- upvalues: GetFFlagExpChatProtectedChatInternalAPIsFunction (copy), GetFFlagTextChatEnableUniverseChatTabsFunction (copy)
	local CoreGui = game:GetService("CoreGui")
	local TextChatService = game:GetService("TextChatService")
	local ExpChatDebuggerIncomingMessageEventEngineFeature = game:GetEngineFeature("ExpChatDebuggerIncomingMessageEvent")
	local ExpChatDebugGlobalChat = game:DefineFastFlag("ExpChatDebugGlobalChat", false)
	local ExperienceChatDebug = Instance.new("ScreenGui")
	ExperienceChatDebug.Name = "ExperienceChatDebug"
	ExperienceChatDebug.ResetOnSpawn = false
	ExperienceChatDebug.DisplayOrder = -1
	ExperienceChatDebug.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	local Count = 7
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
	local List = {}
	local ListLayout = Instance.new("UIListLayout")
	ListLayout.Parent = ExperienceChatDebug
	
	local function _()
		-- upvalues: list (copy), Count (ref), ListLayout (copy)
		local Entry = list[Count]
		ListLayout.VerticalAlignment = Entry.vertical
		ListLayout.HorizontalAlignment = Entry.horizontal
	end
	
	local Entry = list[Count]
	ListLayout.VerticalAlignment = Entry.vertical
	ListLayout.HorizontalAlignment = Entry.horizontal
	local ImageButton = Instance.new("ImageButton")
	ImageButton.AutomaticSize = Enum.AutomaticSize.XY
	ImageButton.Size = UDim2.new(0, 200, 0, 20)
	ImageButton.BackgroundTransparency = 0.3
	ImageButton.BackgroundColor3 = Color3.fromRGB(32, 32, 32)
	ImageButton.Parent = ExperienceChatDebug
	ImageButton.Activated:Connect(function()
		-- upvalues: Count (ref), list (copy), ListLayout (copy)
		Count += 1
		
		if #list < Count then
			Count = 1
		end
		local Entry = list[Count]
		ListLayout.VerticalAlignment = Entry.vertical
		ListLayout.HorizontalAlignment = Entry.horizontal
	end)
	
	local function clearEntries()
		-- upvalues: List (ref)
		for _, value in List do
			value:Destroy()
		end
		List = {}
	end
	
	ImageButton.MouseButton2Click:Connect(clearEntries)
	ImageButton.TouchLongPress:Connect(clearEntries)
	local ListLayout1 = Instance.new("UIListLayout")
	ListLayout1.VerticalAlignment = Enum.VerticalAlignment.Bottom
	ListLayout1.Parent = ImageButton
	
	local function addEntryToContainer(Text, BackgroundColor3, BackgroundTransparency)
		-- upvalues: List (ref), ImageButton (copy)
		if #List > 10 then
			local Removed = table.remove(List, 1)
			
			if Removed then
				Removed:Destroy()
			end
		end
		local Label = Instance.new("TextLabel")
		Label.AutomaticSize = Enum.AutomaticSize.X
		Label.BackgroundTransparency = BackgroundTransparency
		Label.BackgroundColor3 = BackgroundColor3
		Label.TextColor3 = Color3.fromRGB(255, 255, 255)
		Label.Text = Text
		Label.RichText = true
		Label.TextTruncate = Enum.TextTruncate.AtEnd
		Label.TextYAlignment = Enum.TextYAlignment.Top
		Label.TextXAlignment = Enum.TextXAlignment.Left
		Label.TextSize = 16
		Label.FontFace = Font.fromEnum(Enum.Font.RobotoMono)
		Label.Size = UDim2.new(0, 0, 0, 18)
		Label.Parent = ImageButton
		table.insert(List, Label)
	end
	
	local Character = utf8.char(128227)
	local Character1 = utf8.char(128229)
	
	local function formatEntry(TextChatMessage, p1)
		-- upvalues: Character (copy), Character1 (copy), GetFFlagExpChatProtectedChatInternalAPIsFunction (upval), addEntryToContainer (copy)
		local IsNotStatusMatch: boolean = TextChatMessage.Status ~= Enum.TextChatMessageStatus.Success and TextChatMessage.Status ~= Enum.TextChatMessageStatus.Sending
		addEntryToContainer(`{if TextChatMessage.Status == Enum.TextChatMessageStatus.Sending then `{Character} Sent` else `{Character1} Rec.`} [{if p1 == "Global" then "RBXGlobal" elseif TextChatMessage.TextChannel and p1 == "Local" then TextChatMessage.TextChannel.Name else "Unknown"}{if TextChatMessage.TextChannel and TextChatMessage.TextChannel.DirectChatRequester then " <font color='#00E344'>(Direct)</font>" else ""}] {if GetFFlagExpChatProtectedChatInternalAPIsFunction() then TextChatMessage.TextInternal else TextChatMessage.Text} {if IsNotStatusMatch then `({TextChatMessage.Status.Name})` else ""}`, if IsNotStatusMatch then Color3.fromRGB(255, 0, 0) else Color3.fromRGB(32, 32, 32), if IsNotStatusMatch then 0.5 else 1)
	end
	
	if ExpChatDebuggerIncomingMessageEventEngineFeature then
		TextChatService.OnIncomingMessageEvent:Connect(function(TextChatMessage)
			-- upvalues: formatEntry (copy)
			formatEntry(TextChatMessage, "Local")
		end)
	else
		TextChatService.MessageReceived:Connect(function(TextChatMessage)
			-- upvalues: formatEntry (copy)
			formatEntry(TextChatMessage, "Local")
		end)
		TextChatService.SendingMessage:Connect(function(TextChatMessage)
			-- upvalues: formatEntry (copy)
			formatEntry(TextChatMessage, "Local")
		end)
	end
	if GetFFlagTextChatEnableUniverseChatTabsFunction() and ExpChatDebugGlobalChat then
		TextChatService.UniverseChatMessageReceived:Connect(function(TextChatMessage)
			-- upvalues: formatEntry (copy)
			formatEntry(TextChatMessage, "Global")
		end)
	end
	ExperienceChatDebug.Parent = CoreGui
end