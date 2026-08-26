local var1 = game:GetService("RunService"):IsStudio()
local var2 = false
local tweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo_1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local userInputService = game:GetService("UserInputService")
local contextActionService = game:GetService("ContextActionService")
local playersService = game:GetService("Players")
local tweenService = game:GetService("TweenService")
local coreGuiService = game:GetService("CoreGui")
local starterGuiService = game:GetService("StarterGui")
local guiService = game:GetService("GuiService")
local rbxAnalyticsService = game:GetService("RbxAnalyticsService")
local runService = game:GetService("RunService")
local chatService = game:GetService("Chat")
local corePackagesService = game:GetService("CorePackages")
local var3 = false

function enableAvatarContextMenu(p1)
	-- upvalues: var2 (write), var3 (write), rbxAnalyticsService (ref)
	var2 = not not p1
	
	if var2 and not var3 then
		var3 = true
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuEnabled", "placeId: " .. tostring(game.PlaceId))
	end
end

starterGuiService:RegisterSetCore("SetAvatarContextMenuEnabled", enableAvatarContextMenu)
starterGuiService:RegisterSetCore("AvatarContextMenuEnabled", enableAvatarContextMenu)
starterGuiService:RegisterGetCore("AvatarContextMenuEnabled", function()
	-- upvalues: var2 (write)
	return var2
end)
local modules = coreGuiService.RobloxGui.Modules
local avatarContextMenu = modules.AvatarContextMenu
local contextMenuGuiModule = require(avatarContextMenu.ContextMenuGui)
local contextMenuItemsModule = require(avatarContextMenu.ContextMenuItems)
local contextMenuUtilModule = require(avatarContextMenu.ContextMenuUtil)
local selectedCharacterIndicatorModule = require(avatarContextMenu.SelectedCharacterIndicator)
local themeHandlerModule = require(avatarContextMenu.ThemeHandler)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var4 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var5 = if not fFlagEnableNewBackpack then require(modules.BackpackScript) else nil
local emotesMenuMasterModule = require(modules.EmotesMenu.EmotesMenuMaster)
local blockingUtilityModule = require(corePackagesService.Workspace.Packages.BlockingUtility)
local fFlagAvatarContextMenuItemsChatButtonRefactorModule = require(modules.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor)
local ok, status = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRaycastUpdateAPI2")
end)
status = ok and status
local localPlayer = playersService.LocalPlayer
while not localPlayer do
	playersService.PlayerAdded:wait()
	localPlayer = playersService.LocalPlayer
end
if localPlayer.UserId <= 0 and not var1 then return end
local _ = nil
local _ = nil
local var6 = false
local var7 = false
local var8 = nil
local var9 = nil
local var10 = nil
local var11 = nil
local var12 = nil
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
local var13 = contextMenuGuiModule:CreateMenuFrame(themeHandlerModule:GetTheme())
local var14 = contextMenuItemsModule.new(var13.Content.ContextActionList)

function SetSelectedPlayer(value, p1)
	-- upvalues: var8 (write), selectedCharacterIndicatorModule (ref), themeHandlerModule (ref), fFlagAvatarContextMenuItemsChatButtonRefactorModule (ref), chatService (ref), localPlayer (write), runService (ref), contextMenuUtilModule (ref), var14 (write), contextMenuGuiModule (ref)
	if var8 == value then return end
	var8 = value
	selectedCharacterIndicatorModule:ChangeSelectedPlayer(var8, themeHandlerModule:GetTheme())
	
	if fFlagAvatarContextMenuItemsChatButtonRefactorModule then
		local t = {}
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), localPlayer (copy)
			return chatService:CanUserChatAsync(localPlayer.UserId)
		end)
		t.localPlayerChatEnabled = ok and (runService:IsStudio() or status)
		t.localPlayerCanChatWithSelectedPlayer = false
		
		if var8 then
			t.localPlayerCanChatWithSelectedPlayer = contextMenuUtilModule:GetCanChatWith(var8)
		end
		var14:BuildContextMenuItems(var8, t)
	else
		var14:BuildContextMenuItems(var8)
	end
	contextMenuGuiModule:SwitchToPlayerEntry(var8, p1)
end

function OpenMenu(p1)
	-- upvalues: var6 (write), var13 (write), var12 (write), contextMenuGuiModule (ref), tweenService (ref), tweenInfo (ref)
	var6 = true
	var13.Visible = true
	var13.Content.ContextActionList.CanvasPosition = Vector2.new(0, 0)
	var13.Position = p1.OffScreenPosition
	var12 = contextMenuGuiModule.SelectedPlayerChanged:connect(function()
		-- upvalues: contextMenuGuiModule (copy)
		SetSelectedPlayer(contextMenuGuiModule:GetSelectedPlayer())
	end)
	var13.Position = p1.OffScreenPosition
	local var15 = tweenService:Create(var13, tweenInfo, { Position = p1.OnScreenPosition })
	var15:Play()
	var15.Completed:wait()
	var6 = false
end

function BindMenuActions()
	-- upvalues: contextActionService (ref), contextMenuGuiModule (ref), guiService (ref)
	contextActionService:BindCoreAction("EscapeAvatarContextMenu", function(_, p1, _)
		if p1 == Enum.UserInputState.Begin then
			CloseContextMenu()
			
			return
		end
	end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("SwitchPageAvatarContextMenu", function(_, p1, p2)
		-- upvalues: contextMenuGuiModule (copy)
		if p1 == Enum.UserInputState.Begin then
			if p2.KeyCode == Enum.KeyCode.ButtonR1 then
				contextMenuGuiModule:OffsetPlayerEntry(1)
				
				return
			elseif p2.KeyCode == Enum.KeyCode.ButtonL1 then
				contextMenuGuiModule:OffsetPlayerEntry(-1)
			end
		end
	end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
	local menuOpenedConnection = nil
	menuOpenedConnection = guiService.MenuOpened:connect(function()
		-- upvalues: menuOpenedConnection (write)
		menuOpenedConnection:disconnect()
		
		if Enum.UserInputState.Begin == Enum.UserInputState.Begin then
			CloseContextMenu()
			
			return
		end
	end)
end

function BuildPlayerCarousel(_, p1)
	-- upvalues: playersService (ref), var1 (ref), localPlayer (write), contextMenuUtilModule (ref), contextMenuGuiModule (ref), themeHandlerModule (ref)
	local t = {}
	local players = playersService:GetPlayers()
	
	for i = 1, #players do
		if (players[i].UserId > 0 or var1) and players[i] ~= localPlayer then
			local var15 = contextMenuUtilModule:GetPlayerPosition(players[i])
			
			if var15 then
				table.insert(t, { players[i], (p1 - var15).magnitude })
			end
		end
	end
	table.sort(t, function(p2, p3)
		return p3[2] < p2[2]
	end)
	contextMenuGuiModule:BuildPlayerCarousel(t, themeHandlerModule:GetTheme())
end

playersService.PlayerRemoving:connect(function(p2)
	-- upvalues: var7 (write), var8 (write), contextMenuGuiModule (ref)
	if var7 and p2 ~= var8 then
		contextMenuGuiModule:RemovePlayerEntry(p2)
	end
end)

local function _()
	-- upvalues: emotesMenuMasterModule (ref), fFlagEnableNewBackpack (ref), var4 (ref), var5 (ref)
	if emotesMenuMasterModule:isOpen() then
		emotesMenuMasterModule:close()
	end
	if fFlagEnableNewBackpack then
		var4.setVisibility(var4.FeatureName.Backpack, false)
		
		return
	elseif var5.IsOpen then
		var5.OpenClose()
	end
end

function OpenContextMenu(p2, p3)
	-- upvalues: var6 (write), var7 (write), var2 (write), emotesMenuMasterModule (ref), fFlagEnableNewBackpack (ref), var4 (ref), var5 (ref), contextMenuUtilModule (ref), contextMenuGuiModule (ref), themeHandlerModule (ref)
	if var6 or var7 or not var2 then return end
	var7 = true
	
	if emotesMenuMasterModule:isOpen() then
		emotesMenuMasterModule:close()
	end
	if fFlagEnableNewBackpack then
		var4.setVisibility(var4.FeatureName.Backpack, false)
	elseif var5.IsOpen then
		var5.OpenClose()
	end
	BuildPlayerCarousel(p2, p3)
	contextMenuUtilModule:DisablePlayerMovement()
	BindMenuActions()
	SetSelectedPlayer(p2, true)
	contextMenuGuiModule:UpdateGuiTheme(themeHandlerModule:GetTheme())
	OpenMenu(themeHandlerModule:GetTheme())
end

function CloseContextMenu()
	-- upvalues: guiService (ref), contextActionService (ref), contextMenuUtilModule (ref), var12 (write), tweenService (ref), var13 (write), tweenInfo_1 (ref), var7 (write)
	guiService.SelectedCoreObject = nil
	contextActionService:UnbindCoreAction("EscapeAvatarContextMenu")
	contextActionService:UnbindCoreAction("SwitchPageAvatarContextMenu")
	contextMenuUtilModule:EnablePlayerMovement()
	
	if var12 then
		var12:disconnect()
	end
	local var16 = tweenService:Create(var13, tweenInfo_1, { Position = UDim2.new(0.5, 0, 1, var13.AbsoluteSize.Y) })
	var16:Play()
	var16.Completed:wait()
	var13.Visible = false
	SetSelectedPlayer(nil)
	var7 = false
end

contextMenuGuiModule:SetCloseMenuFunc(CloseContextMenu)
var14:SetCloseMenuFunc(CloseContextMenu)

local _ = function(p2, p3, p4)
	return p3.X <= p2.X and (p2.X <= p4.X and (p3.Y <= p2.Y and p2.Y <= p4.Y))
end

function PointInSwipeArea(p2)
	-- upvalues: var13 (write)
	local absolutePosition = var13.AbsolutePosition
	local nameTag = var13.Content:FindFirstChild("NameTag")
	local vector2 = Vector2.new(absolutePosition.x + var13.AbsoluteSize.x, nameTag.AbsolutePosition.y + nameTag.AbsoluteSize.y)
	
	return absolutePosition.X <= p2.X and (p2.X <= vector2.X and (absolutePosition.Y <= p2.Y and p2.Y <= vector2.Y))
end

function LocalPlayerHasToolEquipped()
	-- upvalues: localPlayer (write)
	if not localPlayer.Character then
		return false
	end
	for i, v in ipairs(localPlayer.Character:GetChildren()) do
		if v:IsA("BackpackItem") then
			return true
		end
	end
	return false
end

function shouldIgnoreLocalCharacter()
	-- upvalues: localPlayer (write)
	if localPlayer.Character then
		local head = localPlayer.Character:FindFirstChild("Head")
		
		if head and head:IsA("BasePart") then
			return head.LocalTransparencyModifier >= 0.95
		end
	end
end

function clickedOnPoint(p2)
	-- upvalues: status (write), raycastParams (ref), localPlayer (write), contextMenuUtilModule (ref), var1 (ref), var7 (write)
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera then return end
	if LocalPlayerHasToolEquipped() then return end
	local var16
	local x = currentCamera:ScreenPointToRay(p2.X, p2.Y)
	
	if status then
		raycastParams.FilterDescendantsInstances = if shouldIgnoreLocalCharacter() then { localPlayer.Character } else {}
		local origin = workspace:Raycast(x.Origin, x.Direction * 100, raycastParams)
		var16 = if origin then contextMenuUtilModule:FindPlayerFromPart(origin.Instance) else nil
		
		if var16 and (var1 and var16 ~= localPlayer or var16 ~= localPlayer and var16.UserId > 0) then
			if var7 then
				SetSelectedPlayer(var16)
				
				return
			end
			OpenContextMenu(var16, origin.Position)
			
			return
		elseif var16 or not var7 then
			return
		else
			CloseContextMenu()
			
			return
		end
	else
		local var17
		x = Ray.new(x.Origin, x.Direction * 100)
		local _ = nil
		var16 = nil
		
		if shouldIgnoreLocalCharacter() then
			local var18, var19 = workspace:FindPartOnRay(x, localPlayer.Character, false, true)
			var17 = var18
			var16 = var19
		else
			local var20, var21 = workspace:FindPartOnRay(x, nil, false, true)
			var17 = var20
			var16 = var21
		end
		local var22 = contextMenuUtilModule:FindPlayerFromPart(var17)
		
		if var22 and (var1 and var22 ~= localPlayer or var22 ~= localPlayer and var22.UserId > 0) then
			if var7 then
				SetSelectedPlayer(var22)
				
				return
			end
			OpenContextMenu(var22, var16)
			
			return
		elseif not var22 and var7 then
			CloseContextMenu()
		end
	end
end

function OnUserInput(p2, p3)
	-- upvalues: var9 (write), var10 (write)
	if p3.UserInputState == Enum.UserInputState.Begin and var9 == nil then
		var9 = p3
		var10 = p2
		
		return
	elseif var9 == p3 and p3.UserInputState == Enum.UserInputState.Change then
		if (p2 - var10).magnitude > 5 then
			var9 = nil
			var10 = nil
			
			return
		end
	elseif p3.UserInputState == Enum.UserInputState.End and var9 == p3 then
		var9 = nil
		var10 = nil
		clickedOnPoint(p2)
	end
end

function OnMouseMoved(p2)
	-- upvalues: var7 (write), var9 (write), var10 (write)
	if not var7 and var9 and (p2 - var10).magnitude > 20 then
		var9 = nil
		var10 = nil
	end
end

function trackTouchSwipeInput(p2)
	-- upvalues: var11 (write)
	if p2.UserInputType == Enum.UserInputType.Touch then
		if not var11 and p2.UserInputState == Enum.UserInputState.Begin then
			if PointInSwipeArea(p2.Position) then
				var11 = p2
				
				return
			end
		elseif var11 == p2 and p2.UserInputState == Enum.UserInputState.End then
			spawn(function()
				-- upvalues: var11 (copy)
				var11 = nil
			end)
		end
	end
end

local function functionProcessInput(p2, p3)
	-- upvalues: var9 (write)
	trackTouchSwipeInput(p2)
	
	if p3 then
		if p2 == var9 then
			var9 = nil
		end
		return
	elseif p2.UserInputType == Enum.UserInputType.MouseButton1 or p2.UserInputType == Enum.UserInputType.Touch then
		OnUserInput(Vector2.new(p2.Position.X, p2.Position.Y), p2)
		
		return
	elseif p2.UserInputType == Enum.UserInputType.MouseMovement then
		OnMouseMoved(Vector2.new(p2.Position.X, p2.Position.Y))
	end
end

userInputService.InputBegan:Connect(functionProcessInput)
userInputService.InputChanged:Connect(functionProcessInput)
userInputService.InputEnded:Connect(functionProcessInput)
userInputService.TouchSwipe:Connect(function(p2, _, p3)
	-- upvalues: var7 (write), var11 (write), contextMenuGuiModule (ref)
	if not p3 then return end
	if not var7 then return end
	if not var11 then return end
	local var16 = 0
	
	if p2 == Enum.SwipeDirection.Left then
		var16 = 1
	elseif p2 == Enum.SwipeDirection.Right then
		var16 = -1
	end
	if var16 ~= 0 then
		contextMenuGuiModule:OffsetPlayerEntry(var16)
		SetSelectedPlayer(contextMenuGuiModule:GetSelectedPlayer())
	end
end)
localPlayer.FriendStatusChanged:Connect(function(p2, p3)
	-- upvalues: var8 (write), blockingUtilityModule (ref), var14 (write)
	if p2 and p2 == var8 then
		var14:UpdateFriendButton(p3, blockingUtilityModule:IsPlayerBlockedByUserId(p2.UserId))
	end
end)

if fFlagEnableNewBackpack then
	var4.onVisibilityChanged(var4.FeatureName.Backpack, function(p2)
		-- upvalues: var7 (write)
		if p2 and var7 then
			CloseContextMenu()
		end
	end)
else
	var5.StateChanged.Event:Connect(function(p2)
		-- upvalues: var7 (write)
		if p2 and var7 then
			CloseContextMenu()
		end
	end)
end
emotesMenuMasterModule.EmotesMenuToggled.Event:Connect(function(p2)
	-- upvalues: var7 (write)
	if p2 and var7 then
		CloseContextMenu()
	end
end)

function GetWorldPoint(p2)
	-- upvalues: localPlayer (write)
	if p2.Character then
		local humanoidRootPart = p2.Character:FindFirstChild("HumanoidRootPart")
		
		return if humanoidRootPart then humanoidRootPart.Position elseif p2 == localPlayer then Vector3.new(0, 0, 0) else GetWorldPoint(localPlayer)
	end
end

starterGuiService:RegisterGetCore("AvatarContextMenuTarget", function()
	-- upvalues: var8 (write)
	return var8
end)
starterGuiService:RegisterSetCore("AvatarContextMenuTarget", function(p2)
	-- upvalues: var7 (write), var6 (write)
	if typeof(p2) == "Instance" and p2:IsA("Player") then
		if p2.Parent == nil then
			error("AvatarContextMenuTarget Player must be in the game")
			
			return
		elseif var7 or var6 then
			SetSelectedPlayer(p2, true)
			
			return
		end
		OpenContextMenu(p2, GetWorldPoint(p2))
		
		return
	elseif p2 == nil then
		CloseContextMenu()
		
		return
	end
	error("AvatarContextMenuTarget argument must be a Player or nil")
end)

local function getClosestPlayer()
	-- upvalues: localPlayer (write), playersService (ref)
	if not localPlayer.Character then return end
	local humanoidRootPart = localPlayer.Character:FindFirstChild("HumanoidRootPart")
	
	if not humanoidRootPart then return end
	local position = humanoidRootPart.Position
	local var16 = nil
	local var17 = 1e999
	local position_1 = nil
	
	for i, v in ipairs(playersService:GetPlayers()) do
		if v ~= localPlayer and v.Character then
			local humanoidRootPart_1 = v.Character:FindFirstChild("HumanoidRootPart")
			
			if humanoidRootPart_1 and (humanoidRootPart_1.Position - position).magnitude < var17 then
				var16 = v
				var17 = (humanoidRootPart_1.Position - position).magnitude
				position_1 = humanoidRootPart_1.Position
			end
		end
	end
	return var16, position_1
end

contextActionService:BindCoreAction("GamepadOpenAvatarContextMenu", function(_, p2, _)
	-- upvalues: var2 (write), guiService (ref), var7 (write), getClosestPlayer (ref)
	if not var2 then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedCoreObject or guiService.SelectedObject then
		return Enum.ContextActionResult.Pass
	elseif p2 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Sink
	elseif var7 then
		CloseContextMenu()
	else
		local var18, var19 = getClosestPlayer()
		
		if var18 then
			OpenContextMenu(var18, var19)
		end
	end
	return Enum.ContextActionResult.Sink
end, false, Enum.KeyCode.DPadUp)