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
local var24 = 0
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

function t_2.AddCustomAvatarMenuItem(_, p0, p1)
	-- upvalues: var24 (write), t_1 (ref)
	var24 += 1
	t_1[p0] = { event = p1, layoutOrder = var24 }
end

function t_2.RemoveCustomAvatarMenuItem(_, p2)
	-- upvalues: t_1 (ref)
	t_1[p2] = nil
end

function t_2.IsContextAvatarEnumItem(_, p3)
	local enumItems = Enum.AvatarContextMenuOption:GetEnumItems()
	
	for i = 1, #enumItems do
		if p3 ~= enumItems[i] then
			continue
		end
		return true
	end
	return false
end

function t_2.EnableDefaultMenuItem(_, p4)
	-- upvalues: t (ref)
	t[p4] = true
end

function t_2.RemoveDefaultMenuItem(_, p5)
	-- upvalues: t (ref)
	t[p5] = false
end

function t_2.RegisterCoreMethods(p6)
	-- upvalues: starterGuiService (ref)
	starterGuiService:RegisterSetCore("AddAvatarContextMenuOption", function(p7)
		-- upvalues: p6 (ref)
		if type(p7) == "table" then
			local var36 = ""
			
			if p7[1] and type(p7[1]) == "string" then
				var36 = p7[1]
			else
				error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			end
			if p7[2] and typeof(p7[2]) == "Instance" and p7[2].ClassName == "BindableEvent" then
				p6:AddCustomAvatarMenuItem(var36, p7[2])
				
				return
			end
			error("AddAvatarContextMenuOption second table entry must be a BindableEvent")
			
			return
		elseif typeof(p7) ~= "EnumItem" then
			error("AddAvatarContextMenuOption first argument must be a table or Enum.AvatarContextMenuOption")
			
			return
		elseif p6:IsContextAvatarEnumItem(p7) then
			p6:EnableDefaultMenuItem(p7)
			
			return
		end
		error("AddAvatarContextMenuOption given EnumItem is not valid")
	end)
	starterGuiService:RegisterSetCore("RemoveAvatarContextMenuOption", function(p8)
		-- upvalues: p6 (ref)
		if type(p8) == "string" then
			p6:RemoveCustomAvatarMenuItem(p8)
			
			return
		elseif typeof(p8) ~= "EnumItem" then
			error("RemoveAvatarContextMenuOption first argument must be a string or Enum.AvatarContextMenuOption")
			
			return
		elseif p6:IsContextAvatarEnumItem(p8) then
			p6:RemoveDefaultMenuItem(p8)
			
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

local var26 = "Add Friend"
local var27 = "Friends"
local var28 = "Friend Request Pending"
local var29 = "Accept Friend Request"
local var30 = "Player Blocked"

function t_2:CreateFriendButton(p9, p10)
	-- upvalues: var26 (write), robloxTranslatorModule (ref), var27 (write), var28 (write), var29 (write), var30 (write), rbxAnalyticsService (ref), localPlayer (write), contextMenuUtilModule (ref), themeHandlerModule (ref), var24 (write)
	var26 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.AddFriend")
	var27 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Friends")
	var28 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.FriendRequestPending")
	var29 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.AcceptFriendRequest")
	var30 = robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.PlayerBlocked")
	local friendStatus = self.MenuItemFrame:FindFirstChild("FriendStatus")
	
	if friendStatus then
		friendStatus:Destroy()
		friendStatus = nil
	end
	local var39 = nil
	local friendStatus_1, friendStatus_2 = contextMenuUtilModule:MakeStyledButton("FriendStatus", var26, UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: var39 (write), friendStatus (write), var28 (copy), rbxAnalyticsService (copy), localPlayer (copy), self (ref)
		if var39 and friendStatus.Selectable then
			friendStatus.Selectable = false
			var39.TextTransparency = 0.75
			var39.Text = var28
			rbxAnalyticsService:ReportCounter("AvatarContextMenu-RequestFriendship")
			rbxAnalyticsService:TrackEvent("Game", "RequestFriendship", "AvatarContextMenu")
			localPlayer:RequestFriendship(self.SelectedPlayer)
		end
	end, themeHandlerModule:GetTheme())
	friendStatus = friendStatus_1
	var39 = friendStatus_2
	
	if p10 then
		friendStatus.Selectable = false
		var39.TextTransparency = 0.75
		var39.Text = var30
	elseif p9 == Enum.FriendStatus.Friend then
		friendStatus.Selectable = false
		var39.TextTransparency = 0.75
		var39.Text = var27
	elseif p9 == Enum.FriendStatus.FriendRequestSent then
		friendStatus.Selectable = false
		var39.TextTransparency = 0.75
		var39.Text = var28
	elseif p9 == Enum.FriendStatus.FriendRequestReceived then
		var39.Text = var29
	else
		friendStatus.Selectable = true
		var39.TextTransparency = 0
	end
	friendStatus.LayoutOrder = var24 + 1
	friendStatus.Parent = self.MenuItemFrame
end

function t_2:UpdateFriendButton(p11, p12)
	if self.MenuItemFrame:FindFirstChild("FriendStatus") then
		self:CreateFriendButton(p11, p12)
	end
end

function t_2:CreateInspectAndBuyButton()
	-- upvalues: t (ref), guiService (ref), contextMenuUtilModule (ref), robloxTranslatorModule (ref), themeHandlerModule (ref), var24 (write)
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
	view.LayoutOrder = var24 + 4
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

local function _(p13)
	local ok, _ = pcall(function()
		local _ = Enum.ChatVersion.LegacyChatService
	end)
	
	return ok and p13.ChatVersion == Enum.ChatVersion.TextChatService
end

function t_2:CreateEmoteButton()
	-- upvalues: rbxAnalyticsService (ref), playersService (ref), findFirstTextChannel (ref), robloxTranslatorModule (ref), contextMenuUtilModule (ref), themeHandlerModule (ref), var24 (write)
	local wave = contextMenuUtilModule:MakeStyledButton("Wave", robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Wave"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: self (ref), rbxAnalyticsService (copy), playersService (copy), findFirstTextChannel (copy)
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		local var45
		rbxAnalyticsService:ReportCounter("AvatarContextMenu-Wave")
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuWave", "placeId: " .. tostring(game.PlaceId))
		playersService:Chat("/e wave")
		local textChatService = self.TextChatService
		local ok, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		
		if ok then
			var45 = textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService
		end
		if var45 then
			var45 = findFirstTextChannel()
			
			if var45 then
				var45:SendAsync("/e wave")
			end
		end
	end, themeHandlerModule:GetTheme())
	wave.LayoutOrder = var24 + 5
	wave.Parent = self.MenuItemFrame
end

local var32 = tModule.interface({
	localPlayerChatEnabled = tModule.boolean,
	localPlayerCanChatWithSelectedPlayer = tModule.boolean
})

function t_2:CreateChatButton(p14)
	-- upvalues: fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule (ref), rbxAnalyticsService (ref), findFirstTextChannel (ref), expChatModule (ref), robloxGui (ref), localPlayer (write), robloxTranslatorModule (ref), contextMenuUtilModule (ref), themeHandlerModule (ref), var24 (write), fFlagAvatarContextMenuItemsChatButtonRefactorModule (ref), argCheckModule (ref), var32 (ref), chatService (ref), runService (ref)
	if not fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule then
		local var46
		local textChatService = self.TextChatService
		local ok, _ = pcall(function()
			local _ = Enum.ChatVersion.LegacyChatService
		end)
		
		if ok then
			var46 = textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService
		end
		if var46 then return end
	end
	local localPlayerChatEnabled
	local var47 = false
	local chatStatus, chatStatus_1 = contextMenuUtilModule:MakeStyledButton("ChatStatus", robloxTranslatorModule:FormatByKey("Corescripts.AvatarContextMenu.Chat"), UDim2.new(0.96, 0, 0, 52), function()
		-- upvalues: var47 (write), self (ref), rbxAnalyticsService (copy), fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule (ref), findFirstTextChannel (copy), expChatModule (copy), robloxGui (copy), localPlayer (copy)
		if var47 then return end
		if self.CloseMenuFunc then
			self:CloseMenuFunc()
		end
		local var50
		rbxAnalyticsService:ReportCounter("AvatarContextMenu-Chat")
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuChat", "placeId: " .. tostring(game.PlaceId))
		
		if fFlagWhisperEmoteOnAvatarContextMenuWithExpChatModule then
			local textChatService = self.TextChatService
			local ok, _ = pcall(function()
				local _ = Enum.ChatVersion.LegacyChatService
			end)
			
			if ok then
				var50 = textChatService.ChatVersion ~= Enum.ChatVersion.TextChatService
			end
			if var50 then
				var50 = findFirstTextChannel()
				
				if var50 then
					task.spawn(function()
						-- upvalues: var50 (ref), self (copy)
						var50:SendAsync("/w @" .. self.SelectedPlayer.Name)
					end)
					
					if expChatModule.Events and expChatModule.Events.AvatarContextMenuWhisperSelected then
						expChatModule.Events.AvatarContextMenuWhisperSelected()
						
						return
					end
				end
			else
				var50 = require(robloxGui.Modules.ChatSelector)
				var50:SetVisible(true)
				
				if not var50:EnterWhisperState(self.SelectedPlayer) then
					local var51 = nil
					pcall(function()
						-- upvalues: var51 (write), localPlayer (copy)
						var51 = localPlayer.PlayerGui.Chat.Frame.ChatBarParentFrame.Frame.BoxFrame.Frame.ChatBar
					end)
					var50:FocusChatBar()
				end
			end
		end
	end, themeHandlerModule:GetTheme())
	chatStatus.LayoutOrder = var24 + 3
	local _ = nil
	
	if fFlagAvatarContextMenuItemsChatButtonRefactorModule then
		argCheckModule.assert(var32(p14))
		localPlayerChatEnabled = p14.localPlayerChatEnabled
	else
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), localPlayer (copy)
			return chatService:CanUserChatAsync(localPlayer.UserId)
		end)
		localPlayerChatEnabled = ok and (runService:IsStudio() or status)
	end
	if localPlayerChatEnabled then
		chatStatus.Parent = self.MenuItemFrame
		
		if not (if fFlagAvatarContextMenuItemsChatButtonRefactorModule then p14.localPlayerCanChatWithSelectedPlayer else contextMenuUtilModule:GetCanChatWith(self.SelectedPlayer)) then
			var47 = true
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
	local var53 = nil
	local var54 = -1
	
	for i, v in pairs(children) do
		if v:IsA("GuiObject") and var54 < v.LayoutOrder then
			var54 = v.LayoutOrder
			var53 = v
		end
	end
	if var53 then
		local underline = var53:FindFirstChild("Underline")
		
		if underline then
			underline:Destroy()
		end
	end
end

function t_2:BuildContextMenuItems(p15, p16)
	-- upvalues: contextMenuUtilModule (ref), blockingUtilityModule (ref), t (ref)
	if not p15 then return end
	local var56 = contextMenuUtilModule:GetFriendStatus(p15)
	local userId = blockingUtilityModule:IsPlayerBlockedByUserId(p15.UserId)
	self:ClearMenuItems()
	self:SetSelectedPlayer(p15)
	
	if t[Enum.AvatarContextMenuOption.Friend] then
		self:CreateFriendButton(var56, userId)
	end
	if t[Enum.AvatarContextMenuOption.Chat] then
		self:CreateChatButton(p16)
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

function t_2:SetSelectedPlayer(p17)
	self.SelectedPlayer = p17
end

function t_2:SetCloseMenuFunc(p18)
	self.CloseMenuFunc = p18
end

function t_2.new(p19, p20)
	-- upvalues: t_2 (ref), textChatService (ref)
	local tbl = setmetatable({}, t_2)
	tbl.MenuItemFrame = p19
	tbl.SelectedPlayer = nil
	tbl.TextChatService = if p20 then p20.TextChatService else textChatService
	tbl:RegisterCoreMethods()
	t_2:UpdateInspectMenuEnabled()
	
	return tbl
end

guiService.InspectMenuEnabledChangedSignal:Connect(function(p21)
	-- upvalues: t_2 (ref)
	if p21 then
		t_2:EnableDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
		
		return
	end
	t_2:RemoveDefaultMenuItem(Enum.AvatarContextMenuOption.InspectMenu)
end)

return t_2