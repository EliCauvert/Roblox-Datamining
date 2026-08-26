local playersService = game:GetService("Players")
local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local chatService = game:GetService("Chat")
local runService = game:GetService("RunService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local guiService = game:GetService("GuiService")
local corePackagesService = game:GetService("CorePackages")
local textChatService = game:GetService("TextChatService")
local robloxGui = coreGuiService:WaitForChild("RobloxGui")
local modules = robloxGui:WaitForChild("Modules")
local robloxTranslatorModule = require(corePackagesService.Workspace.Packages.RobloxTranslator)
local gameTranslatorModule = require(robloxGui.Modules.GameTranslator)
local avatarContextMenu = modules:WaitForChild("AvatarContextMenu")
local contextMenuUtilModule = require(avatarContextMenu:WaitForChild("ContextMenuUtil"))
local themeHandlerModule = require(avatarContextMenu.ThemeHandler)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local tModule = require(corePackagesService.Packages.t)
local argCheckModule = require(corePackagesService.Workspace.Packages.ArgCheck)
local expChatModule = require(corePackagesService.Workspace.Packages.ExpChat)
local fFlagAvatarContextMenuItemsChatButtonRefactorModule = require(modules.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor)
local fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule = require(modules.Common.Flags.FFlagWhisperEmoteOnAvatarContextMenuWithExpChat)
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.PlayerAdded:wait()
	localPlayer = playersService.LocalPlayer
end
local t = {
	[Enum.AvatarContextMenuOption.Chat] = true,
	[Enum.AvatarContextMenuOption.Friend] = true,
	[Enum.AvatarContextMenuOption.Emote] = true,
	[Enum.AvatarContextMenuOption.InspectMenu] = true
}
local t_1 = {}
local var1 = 0
local t_2 = {}
t_2.__index = t_2

function t_2.UpdateInspectMenuEnabled(_)
	-- upvalues: guiService (ref), t (ref)
	local inspectMenuEnabled = guiService:GetInspectMenuEnabled()
	
	if inspectMenuEnabled ~= t[Enum.AvatarContextMenuOption.InspectMenu] then
		t[Enum.AvatarContextMenuOption.InspectMenu] = inspectMenuEnabled
	end
end

function t_2:ClearMenuItems()
	local children = self.MenuItemFrame:GetChildren()
	
	for i = 1, #children do
		if children[i]:IsA("GuiObject") then
			children[i]:Destroy()
		end
	end
end

function t_2.AddCustomAvatarMenuItem(_, p1, p2)
	-- upvalues: var1 (write), t_1 (ref)
	var1 += 1
	t_1[p1] = { event = p2, layoutOrder = var1 }
end

function t_2.RemoveCustomAvatarMenuItem(_, p1)
	-- upvalues: t_1 (ref)
	t_1[p1] = nil
end

function t_2.IsContextAvatarEnumItem(_, p1)
	local enumItems = Enum.AvatarContextMenuOption:GetEnumItems()
	
	for i = 1, #enumItems do
		if p1 ~= enumItems[i] then
			continue
		end
		return true
	end
	return false
end

function t_2.EnableDefaultMenuItem(_, p2)
	-- upvalues: t (ref)
	t[p2] = true
end

function t_2.RemoveDefaultMenuItem(_, p2)
	-- upvalues: t (ref)
	t[p2] = false
end

function t_2.RegisterCoreMethods(p2)
	-- upvalues: starterGuiService (ref)
	starterGuiService:RegisterSetCore("AddAvatarContextMenuOption", function(p3)
		-- upvalues: p2 (ref)
		if type(p3) == "table" then
			local var2 = ""
			
			if p3[1] and type(p3[1]) == "string" then
				var2 = p3[1]
			else
				error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			end
			if p3[2] and typeof(p3[2]) == "Instance" and p3[2].ClassName == "BindableEvent" then
				p2:AddCustomAvatarMenuItem(var2, p3[2])
				
				return
			end
			error("AddAvatarContextMenuOption second table entry must be a BindableEvent")
			
			return
		elseif typeof(p3) ~= "EnumItem" then
			error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			
			return
		elseif p2:IsContextAvatarEnumItem(p3) then
			p2:EnableDefaultMenuItem(p3)
			
			return
		end
		error("AddAvatarContextMenuOption given EnumItem is not valid")
	end)
	starterGuiService:RegisterSetCore("RemoveAvatarContextMenuOption", function(p3)
		-- upvalues: p2 (ref)
		if type(p3) == "string" then
			p2:RemoveCustomAvatarMenuItem(p3)
			
			return
		elseif typeof(p3) ~= "EnumItem" then
			error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption")
			
			return
		elseif p2:IsContextAvatarEnumItem(p3) then
			p2:RemoveDefaultMenuItem(p3)
			
			return
		end
		error("RemoveAvatarContextMenuOption given EnumItem is not valid")
	end)
end

function t_2:CreateCustomMenuItems()
	-- upvalues: t_1 (ref), rbxAnalyticsService (ref), gameTranslatorModule (ref), contextMenuUtilModule (ref), themeHandlerModule (ref)
	for i, v in pairs(t_1) do
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuCustomButton", "name: " .. tostring(i))
		local customButton_1 = contextMenuUtilModule:MakeStyledButton("CustomButton", gameTranslatorModule:TranslateGameText(self.MenuItemFrame, i), UDim2.new(0.96, 0, 0, 52), function()
			-- upvalues: self (ref), v (ref)
			if self.CloseMenuFunc then
				self:CloseMenuFunc()
			end
			v.event:Fire(self.SelectedPlayer)
		end, themeHandlerModule:GetTheme())
		customButton_1.Name = "CustomButton"
		customButton_1.LayoutOrder = v.layoutOrder
		customButton_1.Parent = self.MenuItemFrame
	end
end

local var2 = "Add Friend"
local var3 = "Friends"
local var4 = "Friend Request Pending"
local var5 = "Accept Friend Request"
local var6 = "Player Blocked"

function t_2:CreateFriendButton(p2, p3)
	-- upvalues: var2 (write), robloxTranslatorModule (ref), var3 (write), var4 (write), var5 (write), var6 (write), rbxAnalyticsService (ref), localPlayer (write), contextMenuUtilModule (ref), themeHandlerModule (ref), var1 (write)
	var2 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.AddFriend")
	var3 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Friends")
	var4 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending")
	var5 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest")
	var6 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked")
	local friendStatus = self.MenuItemFrame:FindFirstChild("FriendStatus")
	
	if friendStatus then
		friendStatus:Destroy()
		friendStatus = nil
	end
	local var7 = nil
	local friendStatus_1, friendStatus_2 = contextMenuUtilModule:MakeStyledButton("FriendStatus", var2, UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: var7 (write), friendStatus (write), var4 (copy), rbxAnalyticsService (copy), localPlayer (copy), self (ref)
		if var7 and friendStatus.Selectable then
			friendStatus.Selectable = false
			var7.TextTransparency = 0.75
			var7.Text = var4
			rbxAnalyticsService:ReportCounter("AvatarContextMenu-RequestFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu")
			localPlayer:RequestFriendship(self.SelectedPlayer)
		end
	end, themeHandlerModule:GetTheme())
	friendStatus = friendStatus_1
	var7 = friendStatus_2
	
	if p3 then
		friendStatus.Selectable = false
		var7.TextTransparency = 0.75
		var7.Text = var6
	elseif p2 == Enum.FriendStatus.Friend then
		friendStatus.Selectable = false
		var7.TextTransparency = 0.75
		var7.Text = var3
	elseif p2 == Enum.FriendStatus.FriendRequestSent then
		friendStatus.Selectable = false
		var7.TextTransparency = 0.75
		var7.Text = var4
	elseif p2 == Enum.FriendStatus.FriendRequestReceived then
		var7.Text = var5
	else
		friendStatus.Selectable = true
		var7.TextTransparency = 0
	end
	friendStatus.LayoutOrder = var1 + 1
	friendStatus.Parent = self.MenuItemFrame
end

function t_2:UpdateFriendButton(p2, p3)
	if self.MenuItemFrame:FindFirstChild("FriendStatus") then
		self:CreateFriendButton(p2, p3)
	end
end

function t_2:CreateInspectAndBuyButton()
	-- upvalues: t (ref), guiService (ref), contextMenuUtilModule (ref), robloxTranslatorModule (ref), themeHandlerModule (ref), var1 (write)
	local view = contextMenuUtilModule:MakeStyledButton("View", robloxTranslatorModule:FormatByKey("InGame.InspectMenu.Action.View"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: self (ref), t (copy), guiService (copy)
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		if t[Enum.AvatarContextMenuOption.InspectMenu] then
			guiService:InspectPlayerFromUserIdWithCtx(self.SelectedPlayer.UserId, "avatarContextMenu")
			
			return
		end
		warn("The Inspect Menu is not currently available.")
	end, themeHandlerModule:GetTheme())
	view.LayoutOrder = var1 + 4
	view.Parent = self.MenuItemFrame
end

local function findFirstTextChannel()
	-- upvalues: textChatService (ref), playersService (ref)
	local RBXGeneral = textChatService:FindFirstChild("RBXGeneral", true)
	
	if RBXGeneral then
		return RBXGeneral
	end
	for i, v in ipairs(textChatService:GetDescendants()) do
		if v:IsA("TextSource") and v.UserId == playersService.LocalPlayer.UserId and v.CanSend == true then
			local parent = v.Parent
			
			if parent:IsA("TextChannel") then
				return parent
			end
		end
	end
	return nil
end

local function _(p2)
	local ok, _ = pcall(function()
		local _ = Enum.ChatVersion.LegacyChatService
	end)
	
	return ok and p2.ChatVersion == Enum.ChatVersion.TextChatService
end

function t_2:CreateEmoteButton()
	-- upvalues: rbxAnalyticsService (ref), playersService (ref), findFirstTextChannel (ref), robloxTranslatorModule (ref), contextMenuUtilModule (ref), themeHandlerModule (ref), var1 (write)
	local wave = contextMenuUtilModule:MakeStyledButton("Wave", robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Wave"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: self (ref), rbxAnalyticsService (copy), playersService (copy), findFirstTextChannel (copy)
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		local var7
		rbxAnalyticsService:ReportCounter("AvatarContextMenu-Wave")
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(game.PlaceId))
		playersService:Chat("/e wave")
		local textChatService = self.TextChatService
		local ok, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		
		if ok then
			var7 = textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService
		end
		if var7 then
			var7 = findFirstTextChannel()
			
			if var7 then
				var7:SendAsync("/e wave")
			end
		end
	end, themeHandlerModule:GetTheme())
	wave.LayoutOrder = var1 + 5
	wave.Parent = self.MenuItemFrame
end

local var7 = tModule.interface({
	localPlayerChatEnabled = tModule.boolean,
	localPlayerCanChatWithSelectedPlayer = tModule.boolean
})

function t_2:CreateChatButton(p2)
	-- upvalues: fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule (ref), rbxAnalyticsService (ref), findFirstTextChannel (ref), expChatModule (ref), robloxGui (ref), localPlayer (write), robloxTranslatorModule (ref), contextMenuUtilModule (ref), themeHandlerModule (ref), var1 (write), fFlagAvatarContextMenuItemsChatButtonRefactorModule (ref), argCheckModule (ref), var7 (ref), chatService (ref), runService (ref)
	if not fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule then
		local var8
		local textChatService = self.TextChatService
		local ok, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		
		if ok then
			var8 = textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService
		end
		if var8 then return end
	end
	local localPlayerChatEnabled
	local var9 = false
	local chatStatus, chatStatus_1 = contextMenuUtilModule:MakeStyledButton("ChatStatus", robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Chat"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: var9 (write), self (ref), rbxAnalyticsService (copy), fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule (ref), findFirstTextChannel (copy), expChatModule (copy), robloxGui (copy), localPlayer (copy)
		if var9 then return end
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		local var10
		rbxAnalyticsService:ReportCounter("AvatarContextMenu-Chat")
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(game.PlaceId))
		
		if fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule then
			local textChatService = self.TextChatService
			local ok, _ = pcall(function()
				local _ = Enum.ChatVersion.LegacyChatService
			end)
			
			if ok then
				var10 = textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService
			end
			if var10 then
				var10 = findFirstTextChannel()
				
				if var10 then
					task.spawn(function()
						-- upvalues: var10 (ref), self (copy)
						var10:SendAsync("/w @" .. self.SelectedPlayer.Name)
					end)
					
					if expChatModule.Events and expChatModule.Events.AvatarContextMenuWhisperSelected then
						expChatModule.Events.AvatarContextMenuWhisperSelected()
						
						return
					end
				end
			else
				var10 = require(robloxGui.Modules.ChatSelector)
				var10:SetVisible(true)
				
				if not var10:EnterWhisperState(self.SelectedPlayer) then
					local var11 = nil
					pcall(function()
						-- upvalues: var11 (write), localPlayer (copy)
						var11 = localPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
					end)
					var10:FocusChatBar()
				end
			end
		end
	end, themeHandlerModule:GetTheme())
	chatStatus.LayoutOrder = var1 + 3
	local _ = nil
	
	if fFlagAvatarContextMenuItemsChatButtonRefactorModule then
		argCheckModule.assert(var7(p2))
		localPlayerChatEnabled = p2.localPlayerChatEnabled
	else
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), localPlayer (copy)
			return chatService:CanUserChatAsync(localPlayer.UserId)
		end)
		localPlayerChatEnabled = ok and (runService:IsStudio() or status)
	end
	if localPlayerChatEnabled then
		chatStatus.Parent = self.MenuItemFrame
		
		if not (if fFlagAvatarContextMenuItemsChatButtonRefactorModule then p2.localPlayerCanChatWithSelectedPlayer else contextMenuUtilModule:GetCanChatWith(self.SelectedPlayer)) then
			var9 = true
			chatStatus.Selectable = false
			chatStatus_1.TextTransparency = 0.75
			chatStatus_1.Text = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.ChatDisabled")
		end
	else
		chatStatus.Parent = nil
	end
end

function t_2:RemoveLastButtonUnderline()
	local children = self.MenuItemFrame:GetChildren()
	local var8 = nil
	local var9 = -1
	
	for i, v in pairs(children) do
		if v:IsA("GuiObject") and var9 < v.LayoutOrder then
			var9 = v.LayoutOrder
			var8 = v
		end
	end
	if var8 then
		local underline = var8:FindFirstChild("Underline")
		
		if underline then
			underline:Destroy()
		end
	end
end

function t_2:BuildContextMenuItems(p2, p3)
	-- upvalues: contextMenuUtilModule (ref), blockingUtilityModule (ref), t (ref)
	if not p2 then return end
	local var10 = contextMenuUtilModule:GetFriendStatus(p2)
	local userId = blockingUtilityModule:IsPlayerBlockedByUserId(p2.UserId)
	self:ClearMenuItems()
	self:SetSelectedPlayer(p2)
	
	if t[Enum.AvatarContextMenuOption.Friend] then
		self:CreateFriendButton(var10, userId)
	end
	if t[Enum.AvatarContextMenuOption.Chat] then
		self:CreateChatButton(p3)
	end
	if t[Enum.AvatarContextMenuOption.Emote] then
		self:CreateEmoteButton()
	end
	if t[Enum.AvatarContextMenuOption.InspectMenu] then
		self:CreateInspectAndBuyButton()
	end
	self:CreateCustomMenuItems()
	self:RemoveLastButtonUnderline()
end

function t_2:SetSelectedPlayer(p2)
	self.SelectedPlayer = p2
end

function t_2:SetCloseMenuFunc(p2)
	self.CloseMenuFunc = p2
end

function t_2.new(p2, p3)
	-- upvalues: t_2 (ref), textChatService (ref)
	local tbl = setmetatable({}, t_2)
	tbl.MenuItemFrame = p2
	tbl.SelectedPlayer = nil
	tbl.TextChatService = if p3 then p3.TextChatService else textChatService
	tbl:RegisterCoreMethods()
	t_2:UpdateInspectMenuEnabled()
	
	return tbl
end

guiService.InspectMenuEnabledChangedSignal:Connect(function(p2)
	-- upvalues: t_2 (ref)
	if p2 then
		t_2:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
		
		return
	end
	t_2:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
end)

return t_2