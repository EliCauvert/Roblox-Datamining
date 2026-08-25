local var0 = game:GetService("RunService"):IsStudio()
local var1 = false
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
local var15 = false

function enableAvatarContextMenu(p0)
	-- upvalues: var1 (write), var15 (write), rbxAnalyticsService (ref)
	var1 = not not p0
	
	if var1 and not var15 then
		var15 = true
		rbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuEnabled", "placeId: " .. tostring(game.PlaceId))
	end
end

starterGuiService:RegisterSetCore("SetAvatarContextMenuEnabled", enableAvatarContextMenu)
starterGuiService:RegisterSetCore("AvatarContextMenuEnabled", enableAvatarContextMenu)
starterGuiService:RegisterGetCore("AvatarContextMenuEnabled", function()
	-- upvalues: var1 (write)
	return var1
end)
local modules = coreGuiService.RobloxGui.Modules
local avatarContextMenu = modules.AvatarContextMenu
local contextMenuGuiModule = require(avatarContextMenu.ContextMenuGui)
local contextMenuItemsModule = require(avatarContextMenu.ContextMenuItems)
local contextMenuUtilModule = require(avatarContextMenu.ContextMenuUtil)
local selectedCharacterIndicatorModule = require(avatarContextMenu.SelectedCharacterIndicator)
local themeHandlerModule = require(avatarContextMenu.ThemeHandler)
local fFlagEnableNewBackpack = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local var21 = if fFlagEnableNewBackpack then require(corePackagesService.Workspace.Packages.System).Features else nil
local var22 = if not fFlagEnableNewBackpack then require(modules.BackpackScript) else nil
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
if localPlayer.UserId <= 0 and not var0 then return end
local _ = nil
local _ = nil
local var26 = false
local var27 = false
local var28 = nil
local var29 = nil
local var30 = nil
local var31 = nil
local var32 = nil
local raycastParams = RaycastParams.new()
raycastParams.FilterType = Enum.RaycastFilterType.Exclude
local var34 = contextMenuGuiModule:CreateMenuFrame(themeHandlerModule:GetTheme())
local var35 = contextMenuItemsModule.new(var34.Content.ContextActionList)

function SetSelectedPlayer(value, p1)
	-- upvalues: var28 (write), selectedCharacterIndicatorModule (ref), themeHandlerModule (ref), fFlagAvatarContextMenuItemsChatButtonRefactorModule (ref), chatService (ref), localPlayer (write), runService (ref), contextMenuUtilModule (ref), var35 (write), contextMenuGuiModule (ref)
	if var28 == value then return end
	var28 = value
	selectedCharacterIndicatorModule:ChangeSelectedPlayer(var28, themeHandlerModule:GetTheme())
	
	if fFlagAvatarContextMenuItemsChatButtonRefactorModule then
		local t = {}
		local ok, status = pcall(function()
			-- upvalues: chatService (copy), localPlayer (copy)
			return chatService:CanUserChatAsync(localPlayer.UserId)
		end)
		t.localPlayerChatEnabled = ok and (runService:IsStudio() or status)
		t.localPlayerCanChatWithSelectedPlayer = false
		
		if var28 then
			t.localPlayerCanChatWithSelectedPlayer = contextMenuUtilModule:GetCanChatWith(var28)
		end
		var35:BuildContextMenuItems(var28, t)
	else
		var35:BuildContextMenuItems(var28)
	end
	contextMenuGuiModule:SwitchToPlayerEntry(var28, p1)
end

function OpenMenu(p2)
	-- upvalues: var26 (write), var34 (write), var32 (write), contextMenuGuiModule (ref), tweenService (ref), tweenInfo (ref)
	var26 = true
	var34.Visible = true
	var34.Content.ContextActionList.CanvasPosition = Vector2.new(0, 0)
	var34.Position = p2.OffScreenPosition
	var32 = contextMenuGuiModule.SelectedPlayerChanged:connect(function()
		-- upvalues: contextMenuGuiModule (copy)
		SetSelectedPlayer(contextMenuGuiModule:GetSelectedPlayer())
	end)
	var34.Position = p2.OffScreenPosition
	local var39 = tweenService:Create(var34, tweenInfo, { Position = p2.OnScreenPosition })
	var39:Play()
	var39.Completed:wait()
	var26 = false
end

function BindMenuActions()
	-- upvalues: contextActionService (ref), contextMenuGuiModule (ref), guiService (ref)
	contextActionService:BindCoreAction("EscapeAvatarContextMenu", function(_, p3, _)
		if p3 == Enum.UserInputState.Begin then
			CloseContextMenu()
			
			return
		end
	end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
	contextActionService:BindCoreAction("SwitchPageAvatarContextMenu", function(_, p4, p5)
		-- upvalues: contextMenuGuiModule (copy)
		if p4 == Enum.UserInputState.Begin then
			if p5.KeyCode == Enum.KeyCode.ButtonR1 then
				contextMenuGuiModule:OffsetPlayerEntry(1)
				
				return
			elseif p5.KeyCode == Enum.KeyCode.ButtonL1 then
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

function BuildPlayerCarousel(_, p6)
	-- upvalues: playersService (ref), var0 (ref), localPlayer (write), contextMenuUtilModule (ref), contextMenuGuiModule (ref), themeHandlerModule (ref)
	local t = {}
	local players = playersService:GetPlayers()
	
	for i = 1, #players do
		if (players[i].UserId > 0 or var0) and players[i] ~= localPlayer then
			local var43 = contextMenuUtilModule:GetPlayerPosition(players[i])
			
			if var43 then
				table.insert(t, { players[i], (p6 - var43).magnitude })
			end
		end
	end
	table.sort(t, function(p7, p8)
		return p8[2] < p7[2]
	end)
	contextMenuGuiModule:BuildPlayerCarousel(t, themeHandlerModule:GetTheme())
end

playersService.PlayerRemoving:connect(function(p9)
	-- upvalues: var27 (write), var28 (write), contextMenuGuiModule (ref)
	if var27 and p9 ~= var28 then
		contextMenuGuiModule:RemovePlayerEntry(p9)
	end
end)

local function _()
	-- upvalues: emotesMenuMasterModule (ref), fFlagEnableNewBackpack (ref), var21 (ref), var22 (ref)
	if emotesMenuMasterModule:isOpen() then
		emotesMenuMasterModule:close()
	end
	if fFlagEnableNewBackpack then
		var21.setVisibility(var21.FeatureName.Backpack, false)
		
		return
	elseif var22.IsOpen then
		var22.OpenClose()
	end
end

function OpenContextMenu(p10, p11)
	-- upvalues: var26 (write), var27 (write), var1 (write), emotesMenuMasterModule (ref), fFlagEnableNewBackpack (ref), var21 (ref), var22 (ref), contextMenuUtilModule (ref), contextMenuGuiModule (ref), themeHandlerModule (ref)
	if var26 or var27 or not var1 then return end
	var27 = true
	
	if emotesMenuMasterModule:isOpen() then
		emotesMenuMasterModule:close()
	end
	if fFlagEnableNewBackpack then
		var21.setVisibility(var21.FeatureName.Backpack, false)
	elseif var22.IsOpen then
		var22.OpenClose()
	end
	BuildPlayerCarousel(p10, p11)
	contextMenuUtilModule:DisablePlayerMovement()
	BindMenuActions()
	SetSelectedPlayer(p10, true)
	contextMenuGuiModule:UpdateGuiTheme(themeHandlerModule:GetTheme())
	OpenMenu(themeHandlerModule:GetTheme())
end

function CloseContextMenu()
	-- upvalues: guiService (ref), contextActionService (ref), contextMenuUtilModule (ref), var32 (write), tweenService (ref), var34 (write), tweenInfo_1 (ref), var27 (write)
	guiService.SelectedCoreObject = nil
	contextActionService:UnbindCoreAction("EscapeAvatarContextMenu")
	contextActionService:UnbindCoreAction("SwitchPageAvatarContextMenu")
	contextMenuUtilModule:EnablePlayerMovement()
	
	if var32 then
		var32:disconnect()
	end
	local var44 = tweenService:Create(var34, tweenInfo_1, { Position = UDim2.new(0.5, 0, 1, var34.AbsoluteSize.Y) })
	var44:Play()
	var44.Completed:wait()
	var34.Visible = false
	SetSelectedPlayer(nil)
	var27 = false
end

contextMenuGuiModule:SetCloseMenuFunc(CloseContextMenu)
var35:SetCloseMenuFunc(CloseContextMenu)

local _ = function(p12, p13, p14)
	return p13.X <= p12.X and (p12.X <= p14.X and (p13.Y <= p12.Y and p12.Y <= p14.Y))
end

function PointInSwipeArea(p15)
	-- upvalues: var34 (write)
	local absolutePosition = var34.AbsolutePosition
	local nameTag = var34.Content:FindFirstChild("NameTag")
	local vector2 = Vector2.new(absolutePosition.x + var34.AbsoluteSize.x, nameTag.AbsolutePosition.y + nameTag.AbsoluteSize.y)
	
	return absolutePosition.X <= p15.X and (p15.X <= vector2.X and (absolutePosition.Y <= p15.Y and p15.Y <= vector2.Y))
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

function clickedOnPoint(p16)
	-- upvalues: status (write), raycastParams (ref), localPlayer (write), contextMenuUtilModule (ref), var0 (ref), var27 (write)
	local currentCamera = workspace.CurrentCamera
	
	if not currentCamera then return end
	if LocalPlayerHasToolEquipped() then return end
	local var50
	local x = currentCamera:ScreenPointToRay(p16.X, p16.Y)
	
	if status then
		raycastParams.FilterDescendantsInstances = if shouldIgnoreLocalCharacter() then { localPlayer.Character } else {}
		local origin = workspace:Raycast(x.Origin, x.Direction * 100, raycastParams)
		var50 = if origin then contextMenuUtilModule:FindPlayerFromPart(origin.Instance) else nil
		
		if var50 and (var0 and var50 ~= localPlayer or var50 ~= localPlayer and var50.UserId > 0) then
			if var27 then
				SetSelectedPlayer(var50)
				
				return
			end
			OpenContextMenu(var50, origin.Position)
			
			return
		elseif var50 or not var27 then
			return
		else
			CloseContextMenu()
			
			return
		end
	else
		local var53
		x = Ray.new(x.Origin, x.Direction * 100)
		local _ = nil
		var50 = nil
		
		if shouldIgnoreLocalCharacter() then
			local var51, var52 = workspace:FindPartOnRay(x, localPlayer.Character, false, true)
			var53 = var51
			var50 = var52
		else
			local var54, var55 = workspace:FindPartOnRay(x, nil, false, true)
			var53 = var54
			var50 = var55
		end
		local var56 = contextMenuUtilModule:FindPlayerFromPart(var53)
		
		if var56 and (var0 and var56 ~= localPlayer or var56 ~= localPlayer and var56.UserId > 0) then
			if var27 then
				SetSelectedPlayer(var56)
				
				return
			end
			OpenContextMenu(var56, var50)
			
			return
		elseif not var56 and var27 then
			CloseContextMenu()
		end
	end
end

function OnUserInput(p17, p18)
	-- upvalues: var29 (write), var30 (write)
	if p18.UserInputState == Enum.UserInputState.Begin and var29 == nil then
		var29 = p18
		var30 = p17
		
		return
	elseif var29 == p18 and p18.UserInputState == Enum.UserInputState.Change then
		if (p17 - var30).magnitude > 5 then
			var29 = nil
			var30 = nil
			
			return
		end
	elseif p18.UserInputState == Enum.UserInputState.End and var29 == p18 then
		var29 = nil
		var30 = nil
		clickedOnPoint(p17)
	end
end

function OnMouseMoved(p19)
	-- upvalues: var27 (write), var29 (write), var30 (write)
	if not var27 and var29 and (p19 - var30).magnitude > 20 then
		var29 = nil
		var30 = nil
	end
end

function trackTouchSwipeInput(p20)
	-- upvalues: var31 (write)
	if p20.UserInputType == Enum.UserInputType.Touch then
		if not var31 and p20.UserInputState == Enum.UserInputState.Begin then
			if PointInSwipeArea(p20.Position) then
				var31 = p20
				
				return
			end
		elseif var31 == p20 and p20.UserInputState == Enum.UserInputState.End then
			spawn(function()
				-- upvalues: var31 (copy)
				var31 = nil
			end)
		end
	end
end

local function functionProcessInput(p21, p22)
	-- upvalues: var29 (write)
	trackTouchSwipeInput(p21)
	
	if p22 then
		if p21 == var29 then
			var29 = nil
		end
		return
	elseif p21.UserInputType == Enum.UserInputType.MouseButton1 or p21.UserInputType == Enum.UserInputType.Touch then
		OnUserInput(Vector2.new(p21.Position.X, p21.Position.Y), p21)
		
		return
	elseif p21.UserInputType == Enum.UserInputType.MouseMovement then
		OnMouseMoved(Vector2.new(p21.Position.X, p21.Position.Y))
	end
end

userInputService.InputBegan:Connect(functionProcessInput)
userInputService.InputChanged:Connect(functionProcessInput)
userInputService.InputEnded:Connect(functionProcessInput)
userInputService.TouchSwipe:Connect(function(p23, _, p24)
	-- upvalues: var27 (write), var31 (write), contextMenuGuiModule (ref)
	if not p24 then return end
	if not var27 then return end
	if not var31 then return end
	local var57 = 0
	
	if p23 == Enum.SwipeDirection.Left then
		var57 = 1
	elseif p23 == Enum.SwipeDirection.Right then
		var57 = -1
	end
	if var57 ~= 0 then
		contextMenuGuiModule:OffsetPlayerEntry(var57)
		SetSelectedPlayer(contextMenuGuiModule:GetSelectedPlayer())
	end
end)
localPlayer.FriendStatusChanged:Connect(function(p25, p26)
	-- upvalues: var28 (write), blockingUtilityModule (ref), var35 (write)
	if p25 and p25 == var28 then
		var35:UpdateFriendButton(p26, blockingUtilityModule:IsPlayerBlockedByUserId(p25.UserId))
	end
end)

if fFlagEnableNewBackpack then
	var21.onVisibilityChanged(var21.FeatureName.Backpack, function(p27)
		-- upvalues: var27 (write)
		if p27 and var27 then
			CloseContextMenu()
		end
	end)
else
	var22.StateChanged.Event:Connect(function(p28)
		-- upvalues: var27 (write)
		if p28 and var27 then
			CloseContextMenu()
		end
	end)
end
emotesMenuMasterModule.EmotesMenuToggled.Event:Connect(function(p29)
	-- upvalues: var27 (write)
	if p29 and var27 then
		CloseContextMenu()
	end
end)

function GetWorldPoint(p30)
	-- upvalues: localPlayer (write)
	if p30.Character then
		local humanoidRootPart = p30.Character:FindFirstChild("HumanoidRootPart")
		
		return if humanoidRootPart then humanoidRootPart.Position elseif p30 == localPlayer then Vector3.new(0, 0, 0) else GetWorldPoint(localPlayer)
	end
end

starterGuiService:RegisterGetCore("AvatarContextMenuTarget", function()
	-- upvalues: var28 (write)
	return var28
end)
starterGuiService:RegisterSetCore("AvatarContextMenuTarget", function(p31)
	-- upvalues: var27 (write), var26 (write)
	if typeof(p31) == "Instance" and p31:IsA("Player") then
		if p31.Parent == nil then
			error("AvatarContextMenuTarget Player must be in the game")
			
			return
		elseif var27 or var26 then
			SetSelectedPlayer(p31, true)
			
			return
		end
		OpenContextMenu(p31, GetWorldPoint(p31))
		
		return
	elseif p31 == nil then
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
	local var60 = nil
	local var61 = 1e999
	local position_1 = nil
	
	for i, v in ipairs(playersService:GetPlayers()) do
		if v ~= localPlayer and v.Character then
			local humanoidRootPart_1 = v.Character:FindFirstChild("HumanoidRootPart")
			
			if humanoidRootPart_1 and (humanoidRootPart_1.Position - position).magnitude < var61 then
				var60 = v
				var61 = (humanoidRootPart_1.Position - position).magnitude
				position_1 = humanoidRootPart_1.Position
			end
		end
	end
	return var60, position_1
end

contextActionService:BindCoreAction("GamepadOpenAvatarContextMenu", function(_, p32, _)
	-- upvalues: var1 (write), guiService (ref), var27 (write), getClosestPlayer (ref)
	if not var1 then
		return Enum.ContextActionResult.Pass
	elseif guiService.SelectedCoreObject or guiService.SelectedObject then
		return Enum.ContextActionResult.Pass
	elseif p32 ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Sink
	elseif var27 then
		CloseContextMenu()
	else
		local var63, var64 = getClosestPlayer()
		
		if var63 then
			OpenContextMenu(var63, var64)
		end
	end
	return Enum.ContextActionResult.Sink
end, false, Enum.KeyCode.DPadUp)