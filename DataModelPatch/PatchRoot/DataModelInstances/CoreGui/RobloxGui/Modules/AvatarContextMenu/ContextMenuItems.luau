local Players = game:GetService("Players")
local StarterGui = game:GetService("StarterGui")
local Chat = game:GetService("Chat")
local RunService = game:GetService("RunService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local GuiService = game:GetService("GuiService")
local CorePackages = game:GetService("CorePackages")
local TextChatService = game:GetService("TextChatService")
local RobloxGui = game:GetService("CoreGui"):WaitForChild("RobloxGui")
local Modules = RobloxGui:WaitForChild("Modules")
local RobloxTranslatorModule = require(CorePackages.Workspace.Packages.RobloxTranslator)
local GameTranslatorModule = require(RobloxGui.Modules.GameTranslator)
local AvatarContextMenu = Modules:WaitForChild("AvatarContextMenu")
local ContextMenuUtilModule = require(AvatarContextMenu:WaitForChild("ContextMenuUtil"))
local ThemeHandlerModule = require(AvatarContextMenu.ThemeHandler)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local TModule = require(CorePackages.Packages.t)
local ArgCheckModule = require(CorePackages.Workspace.Packages.ArgCheck)
local ExpChatModule = require(CorePackages.Workspace.Packages.ExpChat)
local FFlagAvatarContextMenuItemsChatButtonRefactorModule = require(Modules.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor)
local FFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule = require(Modules.Common.Flags.FFlagWhisperEmoteOnAvatarContextMenuWithExpChat)
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.PlayerAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
local config = {
	[Enum.AvatarContextMenuOption.Chat] = true,
	[Enum.AvatarContextMenuOption.Friend] = true,
	[Enum.AvatarContextMenuOption.Emote] = true,
	[Enum.AvatarContextMenuOption.InspectMenu] = true
}
local t = {}
local LayoutOrder = 0
local Module = {}
Module.__index = Module

function Module:UpdateInspectMenuEnabled()
	-- upvalues: GuiService (copy), config (copy)
	local InspectMenuEnabled = GuiService:GetInspectMenuEnabled()
	
	if InspectMenuEnabled ~= config[Enum.AvatarContextMenuOption.InspectMenu] then
		config[Enum.AvatarContextMenuOption.InspectMenu] = InspectMenuEnabled
	end
end

function Module:ClearMenuItems()
	local Children = self.MenuItemFrame:GetChildren()
	
	for i = 1, #Children do
		if Children[i]:IsA("GuiObject") then
			Children[i]:Destroy()
		end
	end
end

function Module:AddCustomAvatarMenuItem(Key, Event)
	-- upvalues: LayoutOrder (ref), t (copy)
	LayoutOrder += 1
	t[Key] = { event = Event, layoutOrder = LayoutOrder }
end

function Module:RemoveCustomAvatarMenuItem(Key)
	-- upvalues: t (copy)
	t[Key] = nil
end

function Module:IsContextAvatarEnumItem(p1): boolean
	local EnumItems = Enum.AvatarContextMenuOption:GetEnumItems()
	
	for i = 1, #EnumItems do
		if p1 == EnumItems[i] then
			return true
		end
	end
	return false
end

function Module:EnableDefaultMenuItem(InspectMenu)
	-- upvalues: config (copy)
	config[InspectMenu] = true
end

function Module:RemoveDefaultMenuItem(InspectMenu)
	-- upvalues: config (copy)
	config[InspectMenu] = false
end

function Module.RegisterCoreMethods(p2)
	-- upvalues: StarterGui (copy)
	StarterGui:RegisterSetCore("AddAvatarContextMenuOption", function(Entry)
		-- upvalues: p2 (copy)
		if type(Entry) == "table" then
			local v1 = ""
			
			if Entry[1] and type(Entry[1]) == "string" then
				v1 = Entry[1]
			else
				error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			end
			if Entry[2] and typeof(Entry[2]) == "Instance" and Entry[2].ClassName == "BindableEvent" then
				p2:AddCustomAvatarMenuItem(v1, Entry[2])
				
				return
			else
				error("AddAvatarContextMenuOption second table entry must be a BindableEvent")
				
				return
			end
		elseif typeof(Entry) ~= "EnumItem" then
			error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			
			return
		else
			if p2:IsContextAvatarEnumItem(Entry) then
				p2:EnableDefaultMenuItem(Entry)
				
				return
			else
				error("AddAvatarContextMenuOption given EnumItem is not valid")
			end
		end
	end)
	StarterGui:RegisterSetCore("RemoveAvatarContextMenuOption", function(p3)
		-- upvalues: p2 (copy)
		if type(p3) == "string" then
			p2:RemoveCustomAvatarMenuItem(p3)
			
			return
		end
		if typeof(p3) ~= "EnumItem" then
			error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption")
			
			return
		end
		if p2:IsContextAvatarEnumItem(p3) then
			p2:RemoveDefaultMenuItem(p3)
			
			return
		else
			error("RemoveAvatarContextMenuOption given EnumItem is not valid")
		end
	end)
end

function Module:CreateCustomMenuItems()
	-- upvalues: t (copy), RbxAnalyticsService (copy), GameTranslatorModule (copy), ContextMenuUtilModule (copy), ThemeHandlerModule (copy)
	for i, value in pairs(t) do
		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuCustomButton", "name: " .. tostring(i))
		local CustomButton = ContextMenuUtilModule:MakeStyledButton("CustomButton", GameTranslatorModule:TranslateGameText(self.MenuItemFrame, i), UDim2.new(0.96, 0, 0, 52), function()
			-- upvalues: self (copy), value (copy)
			if self.CloseMenuFunc then
				self:CloseMenuFunc()
			end
			value.event:Fire(self.SelectedPlayer)
		end, ThemeHandlerModule:GetTheme())
		CustomButton.Name = "CustomButton"
		CustomButton.LayoutOrder = value.layoutOrder
		CustomButton.Parent = self.MenuItemFrame
	end
end

local CorescriptsAvatarContextMenuAddFriend = "Add Friend"
local CorescriptsAvatarContextMenuFriends = "Friends"
local CorescriptsAvatarContextMenuFriendRequestPending = "Friend Request Pending"
local CorescriptsAvatarContextMenuAcceptFriendRequest = "Accept Friend Request"
local CorescriptsAvatarContextMenuPlayerBlocked = "Player Blocked"

function Module:CreateFriendButton(FriendStatus, IsPlayerBlockedByUserId)
	-- upvalues: CorescriptsAvatarContextMenuAddFriend (ref), RobloxTranslatorModule (copy), CorescriptsAvatarContextMenuFriends (ref), CorescriptsAvatarContextMenuFriendRequestPending (ref), CorescriptsAvatarContextMenuAcceptFriendRequest (ref), CorescriptsAvatarContextMenuPlayerBlocked (ref), RbxAnalyticsService (copy), LocalPlayer (ref), ContextMenuUtilModule (copy), ThemeHandlerModule (copy), LayoutOrder (ref)
	CorescriptsAvatarContextMenuAddFriend = RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.AddFriend")
	CorescriptsAvatarContextMenuFriends = RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Friends")
	CorescriptsAvatarContextMenuFriendRequestPending = RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending")
	CorescriptsAvatarContextMenuAcceptFriendRequest = RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest")
	CorescriptsAvatarContextMenuPlayerBlocked = RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked")
	local FriendStatus1 = self.MenuItemFrame:FindFirstChild("FriendStatus")
	
	if FriendStatus1 then
		FriendStatus1:Destroy()
		FriendStatus1 = nil
	end
	local Label = nil
	local FriendStatus2, FriendStatus2_1 = ContextMenuUtilModule:MakeStyledButton("FriendStatus", CorescriptsAvatarContextMenuAddFriend, UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: Label (ref), FriendStatus1 (ref), CorescriptsAvatarContextMenuFriendRequestPending (upval), RbxAnalyticsService (upval), LocalPlayer (upval), self (copy)
		if Label and FriendStatus1.Selectable then
			FriendStatus1.Selectable = false
			Label.TextTransparency = 0.75
			Label.Text = CorescriptsAvatarContextMenuFriendRequestPending
			RbxAnalyticsService:ReportCounter("AvatarContextMenu-RequestFriendship")
			RbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu")
			LocalPlayer:RequestFriendship(self.SelectedPlayer)
		end
	end, ThemeHandlerModule:GetTheme())
	
	if IsPlayerBlockedByUserId then
		FriendStatus2.Selectable = false
		FriendStatus2_1.TextTransparency = 0.75
		FriendStatus2_1.Text = CorescriptsAvatarContextMenuPlayerBlocked
	elseif FriendStatus == Enum.FriendStatus.Friend then
		FriendStatus2.Selectable = false
		FriendStatus2_1.TextTransparency = 0.75
		FriendStatus2_1.Text = CorescriptsAvatarContextMenuFriends
	elseif FriendStatus == Enum.FriendStatus.FriendRequestSent then
		FriendStatus2.Selectable = false
		FriendStatus2_1.TextTransparency = 0.75
		FriendStatus2_1.Text = CorescriptsAvatarContextMenuFriendRequestPending
	elseif FriendStatus == Enum.FriendStatus.FriendRequestReceived then
		FriendStatus2_1.Text = CorescriptsAvatarContextMenuAcceptFriendRequest
	else
		FriendStatus2.Selectable = true
		FriendStatus2_1.TextTransparency = 0
	end
	FriendStatus2.LayoutOrder = LayoutOrder + 1
	FriendStatus2.Parent = self.MenuItemFrame
end

function Module:UpdateFriendButton(FriendStatus, p2)
	if self.MenuItemFrame:FindFirstChild("FriendStatus") then
		self:CreateFriendButton(FriendStatus, p2)
	end
end

function Module:CreateInspectAndBuyButton()
	-- upvalues: config (copy), GuiService (copy), ContextMenuUtilModule (copy), RobloxTranslatorModule (copy), ThemeHandlerModule (copy), LayoutOrder (ref)
	local View = ContextMenuUtilModule:MakeStyledButton("View", RobloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.View"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: self (copy), config (upval), GuiService (upval)
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		if config[Enum.AvatarContextMenuOption.InspectMenu] then
			GuiService:InspectPlayerFromUserIdWithCtx(self.SelectedPlayer.UserId, "avatarContextMenu")
			
			return
		else
			warn("The Inspect Menu is not currently available.")
		end
	end, ThemeHandlerModule:GetTheme())
	View.LayoutOrder = LayoutOrder + 4
	View.Parent = self.MenuItemFrame
end

local function findFirstTextChannel()
	-- upvalues: TextChatService (copy), Players (copy)
	local RBXGeneral = TextChatService:FindFirstChild("RBXGeneral", true)
	
	if RBXGeneral then
		return RBXGeneral
	end
	local Parent = nil
	for _, TextSource in ipairs(TextChatService:GetDescendants()) do
		if TextSource:IsA("TextSource") and TextSource.UserId == Players.LocalPlayer.UserId and TextSource.CanSend == true then
			Parent = TextSource.Parent
			
			if Parent:IsA("TextChannel") then
				return Parent
			end
		end
	end
	return nil
end

local function _(p2): boolean
	local Success, _ = pcall(function()
		local _ = Enum.ChatVersion.LegacyChatService
	end)
	
	return Success and p2.ChatVersion == Enum.ChatVersion.TextChatService or false
end

function Module:CreateEmoteButton()
	-- upvalues: RbxAnalyticsService (copy), Players (copy), findFirstTextChannel (copy), RobloxTranslatorModule (copy), ContextMenuUtilModule (copy), ThemeHandlerModule (copy), LayoutOrder (ref)
	local Wave = ContextMenuUtilModule:MakeStyledButton("Wave", RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Wave"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: self (copy), RbxAnalyticsService (upval), Players (upval), findFirstTextChannel (upval)
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		RbxAnalyticsService:ReportCounter("AvatarContextMenu-Wave")
		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(game.PlaceId))
		Players:Chat("/e wave")
		local TextChatService = self.TextChatService
		local Success, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		
		if Success and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService or false then
			local FirstTextChannel = findFirstTextChannel()
			
			if FirstTextChannel then
				FirstTextChannel:SendAsync("/e wave")
			end
		end
	end, ThemeHandlerModule:GetTheme())
	Wave.LayoutOrder = LayoutOrder + 5
	Wave.Parent = self.MenuItemFrame
end

local InterfaceResult = TModule.interface({
	localPlayerChatEnabled = TModule.boolean,
	localPlayerCanChatWithSelectedPlayer = TModule.boolean
})

function Module:CreateChatButton(p2)
	-- upvalues: FFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule (copy), RbxAnalyticsService (copy), findFirstTextChannel (copy), ExpChatModule (copy), RobloxGui (copy), LocalPlayer (ref), RobloxTranslatorModule (copy), ContextMenuUtilModule (copy), ThemeHandlerModule (copy), LayoutOrder (ref), FFlagAvatarContextMenuItemsChatButtonRefactorModule (copy), ArgCheckModule (copy), InterfaceResult (copy), Chat (copy), RunService (copy)
	if not FFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule then
		local TextChatService = self.TextChatService
		local Success, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		
		if Success and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService or false then return end
	end
	local Flag = false
	local ChatStatus, ChatStatus2 = ContextMenuUtilModule:MakeStyledButton("ChatStatus", RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Chat"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: Flag (ref), self (copy), RbxAnalyticsService (upval), FFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule (copy), findFirstTextChannel (upval), ExpChatModule (upval), RobloxGui (upval), LocalPlayer (upval)
		if Flag then return end
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		RbxAnalyticsService:ReportCounter("AvatarContextMenu-Chat")
		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(game.PlaceId))
		repeat
			if FFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule then
				local TextChatService = self.TextChatService
				local Success, _ = pcall(function()
					local _ = Enum.ChatVersion.LegacyChatService
				end)
				
				if Success and TextChatService.ChatVersion == Enum.ChatVersion.TextChatService or false then
					local FirstTextChannel = findFirstTextChannel()
					
					if not FirstTextChannel then break end
					task.spawn(function()
						-- upvalues: FirstTextChannel (copy), self (upval)
						FirstTextChannel:SendAsync("/w @" .. self.SelectedPlayer.Name)
					end)
					
					if not ExpChatModule.Events or not ExpChatModule.Events.AvatarContextMenuWhisperSelected then break end
					ExpChatModule.Events.AvatarContextMenuWhisperSelected()
					break
				end
			end
			local ChatSelectorModule = require(RobloxGui.Modules.ChatSelector)
			ChatSelectorModule:SetVisible(true)
			
			if ChatSelectorModule:EnterWhisperState(self.SelectedPlayer) then break end
			local ChatBar = nil
			pcall(function()
				-- upvalues: ChatBar (ref), LocalPlayer (upval)
				ChatBar = LocalPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
			end)
			
			if ChatBar then
				ChatBar.Text = "/w " .. self.SelectedPlayer.Name
			end
			ChatSelectorModule:FocusChatBar()
		until true
	end, ThemeHandlerModule:GetTheme())
	ChatStatus.LayoutOrder = LayoutOrder + 3
	local LocalPlayerChatEnabled = nil
	
	if FFlagAvatarContextMenuItemsChatButtonRefactorModule then
		ArgCheckModule.assert(InterfaceResult(p2))
		LocalPlayerChatEnabled = p2.localPlayerChatEnabled
	else
		local Success1, Result = pcall(function()
			-- upvalues: Chat (upval), LocalPlayer (upval)
			return Chat:CanUserChatAsync(LocalPlayer.UserId)
		end)
		
		if Success1 then
			Success1 = RunService:IsStudio() or Result
		end
		LocalPlayerChatEnabled = Success1
	end
	if LocalPlayerChatEnabled then
		ChatStatus.Parent = self.MenuItemFrame
		
		if not (if FFlagAvatarContextMenuItemsChatButtonRefactorModule then p2.localPlayerCanChatWithSelectedPlayer else ContextMenuUtilModule:GetCanChatWith(self.SelectedPlayer)) then
			Flag = true
			ChatStatus.Selectable = false
			ChatStatus2.TextTransparency = 0.75
			ChatStatus2.Text = RobloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.ChatDisabled")
		end
	else
		ChatStatus.Parent = nil
	end
end

function Module.RemoveLastButtonUnderline(p2)
	local Object = nil
	local LayoutOrder = -1
	
	for _, Gui in pairs((p2.MenuItemFrame:GetChildren())) do
		if Gui:IsA("GuiObject") and LayoutOrder < Gui.LayoutOrder then
			LayoutOrder = Gui.LayoutOrder
			Object = Gui
		end
	end
	if Object then
		local Underline = Object:FindFirstChild("Underline")
		
		if Underline then
			Underline:Destroy()
		end
	end
end

function Module:BuildContextMenuItems(Player, p3)
	-- upvalues: ContextMenuUtilModule (copy), BlockingUtilityModule (copy), config (copy)
	if not Player then return end
	local FriendStatus = ContextMenuUtilModule:GetFriendStatus(Player)
	local IsPlayerBlockedByUserId = BlockingUtilityModule:IsPlayerBlockedByUserId(Player.UserId)
	self:ClearMenuItems()
	self:SetSelectedPlayer(Player)
	
	if config[Enum.AvatarContextMenuOption.Friend] then
		self:CreateFriendButton(FriendStatus, IsPlayerBlockedByUserId)
	end
	if config[Enum.AvatarContextMenuOption.Chat] then
		self:CreateChatButton(p3)
	end
	if config[Enum.AvatarContextMenuOption.Emote] then
		self:CreateEmoteButton()
	end
	if config[Enum.AvatarContextMenuOption.InspectMenu] then
		self:CreateInspectAndBuyButton()
	end
	self:CreateCustomMenuItems()
	self:RemoveLastButtonUnderline()
end

function Module:SetSelectedPlayer(SelectedPlayer)
	self.SelectedPlayer = SelectedPlayer
end

function Module:SetCloseMenuFunc(CloseMenuFunc)
	self.CloseMenuFunc = CloseMenuFunc
end

function Module.new(MenuItemFrame, p3)
	-- upvalues: Module (copy), TextChatService (copy)
	local self = setmetatable({}, Module)
	self.MenuItemFrame = MenuItemFrame
	self.SelectedPlayer = nil
	self.TextChatService = p3 and p3.TextChatService or TextChatService
	self:RegisterCoreMethods()
	Module:UpdateInspectMenuEnabled()
	
	return self
end

GuiService.InspectMenuEnabledChangedSignal:Connect(function(Enabled)
	-- upvalues: Module (copy)
	if Enabled then
		Module:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
		
		return
	else
		Module:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
	end
end)

return Module