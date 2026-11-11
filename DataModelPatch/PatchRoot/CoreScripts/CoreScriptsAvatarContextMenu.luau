local IsStudio = game:GetService("RunService"):IsStudio()
local Inverted = false
local _TweenInfo = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local _TweenInfo1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local UserInputService = game:GetService("UserInputService")
local ContextActionService = game:GetService("ContextActionService")
local Players = game:GetService("Players")
local TweenService = game:GetService("TweenService")
local CoreGui = game:GetService("CoreGui")
local StarterGui = game:GetService("StarterGui")
local GuiService = game:GetService("GuiService")
local RbxAnalyticsService = game:GetService("RbxAnalyticsService")
local RunService = game:GetService("RunService")
local Chat = game:GetService("Chat")
local CorePackages = game:GetService("CorePackages")
local Flag = false

function enableAvatarContextMenu(p1)
	-- upvalues: Inverted (ref), Flag (ref), RbxAnalyticsService (copy)
	Inverted = not not p1
	
	if Inverted and not Flag then
		Flag = true
		RbxAnalyticsService:TrackEvent("Game", "AvatarContextMenuEnabled", "placeId: " .. tostring(game.PlaceId))
	end
end

StarterGui:RegisterSetCore("SetAvatarContextMenuEnabled", enableAvatarContextMenu)
StarterGui:RegisterSetCore("AvatarContextMenuEnabled", enableAvatarContextMenu)
StarterGui:RegisterGetCore("AvatarContextMenuEnabled", function()
	-- upvalues: Inverted (ref)
	return Inverted
end)
local Modules = CoreGui.RobloxGui.Modules
local AvatarContextMenu = Modules.AvatarContextMenu
local ContextMenuGuiModule = require(AvatarContextMenu.ContextMenuGui)
local ContextMenuItemsModule = require(AvatarContextMenu.ContextMenuItems)
local ContextMenuUtilModule = require(AvatarContextMenu.ContextMenuUtil)
local SelectedCharacterIndicatorModule = require(AvatarContextMenu.SelectedCharacterIndicator)
local ThemeHandlerModule = require(AvatarContextMenu.ThemeHandler)
local FFlagEnableNewBackpack = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableNewBackpack
local Features = if FFlagEnableNewBackpack then require(CorePackages.Workspace.Packages.System).Features else nil
local BackpackScriptModule = if FFlagEnableNewBackpack then nil else require(Modules.BackpackScript)
local EmotesMenuMasterModule = require(Modules.EmotesMenu.EmotesMenuMaster)
local BlockingUtilityModule = require(CorePackages.Workspace.Packages.BlockingUtility)
local FFlagAvatarContextMenuItemsChatButtonRefactorModule = require(Modules.Flags.FFlagAvatarContextMenuItemsChatButtonRefactor)
local Success, Result = pcall(function()
	return UserSettings():IsUserFeatureEnabled("UserRaycastUpdateAPI2")
end)
local Result1 = Success and Result
local LocalPlayer = Players.LocalPlayer
while not LocalPlayer do
	Players.PlayerAdded:wait()
	LocalPlayer = Players.LocalPlayer
end
if LocalPlayer.UserId <= 0 and not IsStudio then return end
local NewContextMenuItems = nil
local MenuFrame = nil
local Flag1 = false
local Flag2 = false
local Player = nil
local Input = nil
local v1 = nil
local Input1 = nil
local SelectedPlayerChangedConnection = nil
local RaycastParams1 = RaycastParams.new()
RaycastParams1.FilterType = Enum.RaycastFilterType.Exclude
MenuFrame = ContextMenuGuiModule:CreateMenuFrame(ThemeHandlerModule:GetTheme())
NewContextMenuItems = ContextMenuItemsModule.new(MenuFrame.Content.ContextActionList)

function SetSelectedPlayer(p1, p2)
	-- upvalues: Player (ref), SelectedCharacterIndicatorModule (copy), ThemeHandlerModule (copy), FFlagAvatarContextMenuItemsChatButtonRefactorModule (copy), Chat (copy), LocalPlayer (ref), RunService (copy), ContextMenuUtilModule (copy), NewContextMenuItems (ref), ContextMenuGuiModule (copy)
	if Player == p1 then return end
	Player = p1
	SelectedCharacterIndicatorModule:ChangeSelectedPlayer(Player, ThemeHandlerModule:GetTheme())
	
	if FFlagAvatarContextMenuItemsChatButtonRefactorModule then
		local t = {}
		local Success, Result = pcall(function()
			-- upvalues: Chat (upval), LocalPlayer (upval)
			return Chat:CanUserChatAsync(LocalPlayer.UserId)
		end)
		
		if Success then
			Success = RunService:IsStudio() or Result
		end
		t.localPlayerChatEnabled = Success
		t.localPlayerCanChatWithSelectedPlayer = false
		
		if Player then
			t.localPlayerCanChatWithSelectedPlayer = ContextMenuUtilModule:GetCanChatWith(Player)
		end
		NewContextMenuItems:BuildContextMenuItems(Player, t)
	else
		NewContextMenuItems:BuildContextMenuItems(Player)
	end
	ContextMenuGuiModule:SwitchToPlayerEntry(Player, p2)
end

function OpenMenu(p1)
	-- upvalues: Flag1 (ref), MenuFrame (ref), SelectedPlayerChangedConnection (ref), ContextMenuGuiModule (copy), TweenService (copy), _TweenInfo (copy)
	Flag1 = true
	MenuFrame.Visible = true
	MenuFrame.Content.ContextActionList.CanvasPosition = Vector2.new(0, 0)
	MenuFrame.Position = p1.OffScreenPosition
	SelectedPlayerChangedConnection = ContextMenuGuiModule.SelectedPlayerChanged:connect(function()
		-- upvalues: ContextMenuGuiModule (upval)
		SetSelectedPlayer(ContextMenuGuiModule:GetSelectedPlayer())
	end)
	MenuFrame.Position = p1.OffScreenPosition
	local Tween = TweenService:Create(MenuFrame, _TweenInfo, { Position = p1.OnScreenPosition })
	Tween:Play()
	Tween.Completed:wait()
	Flag1 = false
end

function BindMenuActions()
	-- upvalues: ContextActionService (copy), ContextMenuGuiModule (copy), GuiService (copy)
	ContextActionService:BindCoreAction("EscapeAvatarContextMenu", function(_, UserInputState, _)
		if UserInputState == Enum.UserInputState.Begin then
			CloseContextMenu()
			
			return
		end
	end, false, Enum.KeyCode.Escape, Enum.KeyCode.ButtonB)
	ContextActionService:BindCoreAction("SwitchPageAvatarContextMenu", function(_, UserInputState, Input)
		-- upvalues: ContextMenuGuiModule (upval)
		if UserInputState == Enum.UserInputState.Begin then
			if Input.KeyCode == Enum.KeyCode.ButtonR1 then
				ContextMenuGuiModule:OffsetPlayerEntry(1)
				
				return
			end
			if Input.KeyCode == Enum.KeyCode.ButtonL1 then
				ContextMenuGuiModule:OffsetPlayerEntry(-1)
			end
		end
	end, false, Enum.KeyCode.ButtonR1, Enum.KeyCode.ButtonL1)
	local MenuOpenedConnection = nil
	MenuOpenedConnection = GuiService.MenuOpened:connect(function()
		-- upvalues: MenuOpenedConnection (ref)
		MenuOpenedConnection:disconnect()
		
		if Enum.UserInputState.Begin == Enum.UserInputState.Begin then
			CloseContextMenu()
			
			return
		end
	end)
end

function BuildPlayerCarousel(_, p1)
	-- upvalues: Players (copy), IsStudio (copy), LocalPlayer (ref), ContextMenuUtilModule (copy), ContextMenuGuiModule (copy), ThemeHandlerModule (copy)
	local List = {}
	local Players1 = Players:GetPlayers()
	
	for i = 1, #Players1 do
		if (Players1[i].UserId > 0 or IsStudio) and Players1[i] ~= LocalPlayer then
			local PlayerPosition = ContextMenuUtilModule:GetPlayerPosition(Players1[i])
			
			if PlayerPosition then
				table.insert(List, { Players1[i], (p1 - PlayerPosition).magnitude })
			end
		end
	end
	table.sort(List, function(Entry1, Entry): boolean
		return Entry[2] < Entry1[2]
	end)
	ContextMenuGuiModule:BuildPlayerCarousel(List, ThemeHandlerModule:GetTheme())
end

Players.PlayerRemoving:connect(function(Player1)
	-- upvalues: Flag2 (ref), Player (ref), ContextMenuGuiModule (copy)
	if Flag2 and Player1 ~= Player then
		ContextMenuGuiModule:RemovePlayerEntry(Player1)
	end
end)

local function _()
	-- upvalues: EmotesMenuMasterModule (copy), FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy)
	if EmotesMenuMasterModule:isOpen() then
		EmotesMenuMasterModule:close()
	end
	if FFlagEnableNewBackpack then
		Features.setVisibility(Features.FeatureName.Backpack, false)
		
		return
	end
	if BackpackScriptModule.IsOpen then
		BackpackScriptModule.OpenClose()
	end
end

function OpenContextMenu(p2, p3)
	-- upvalues: Flag1 (ref), Flag2 (ref), Inverted (ref), EmotesMenuMasterModule (copy), FFlagEnableNewBackpack (copy), Features (copy), BackpackScriptModule (copy), ContextMenuUtilModule (copy), ContextMenuGuiModule (copy), ThemeHandlerModule (copy)
	if Flag1 or Flag2 or not Inverted then return end
	Flag2 = true
	
	if EmotesMenuMasterModule:isOpen() then
		EmotesMenuMasterModule:close()
	end
	if FFlagEnableNewBackpack then
		Features.setVisibility(Features.FeatureName.Backpack, false)
	elseif BackpackScriptModule.IsOpen then
		BackpackScriptModule.OpenClose()
	end
	BuildPlayerCarousel(p2, p3)
	ContextMenuUtilModule:DisablePlayerMovement()
	BindMenuActions()
	SetSelectedPlayer(p2, true)
	ContextMenuGuiModule:UpdateGuiTheme(ThemeHandlerModule:GetTheme())
	OpenMenu(ThemeHandlerModule:GetTheme())
end

function CloseContextMenu()
	-- upvalues: GuiService (copy), ContextActionService (copy), ContextMenuUtilModule (copy), SelectedPlayerChangedConnection (ref), TweenService (copy), MenuFrame (ref), _TweenInfo1 (copy), Flag2 (ref)
	GuiService.SelectedCoreObject = nil
	ContextActionService:UnbindCoreAction("EscapeAvatarContextMenu")
	ContextActionService:UnbindCoreAction("SwitchPageAvatarContextMenu")
	ContextMenuUtilModule:EnablePlayerMovement()
	
	if SelectedPlayerChangedConnection then
		SelectedPlayerChangedConnection:disconnect()
	end
	local Tween = TweenService:Create(MenuFrame, _TweenInfo1, {
		Position = UDim2.new(0.5, 0, 1, MenuFrame.AbsoluteSize.Y)
	})
	Tween:Play()
	Tween.Completed:wait()
	MenuFrame.Visible = false
	SetSelectedPlayer(nil)
	Flag2 = false
end

ContextMenuGuiModule:SetCloseMenuFunc(CloseContextMenu)
NewContextMenuItems:SetCloseMenuFunc(CloseContextMenu)

local _ = function(Vector, Vector1, Vector3): boolean
	return Vector1.X <= Vector.X and (Vector.X <= Vector3.X and Vector1.Y <= Vector.Y) and Vector.Y <= Vector3.Y
end

function PointInSwipeArea(Vector): boolean
	-- upvalues: MenuFrame (ref)
	local AbsolutePosition = MenuFrame.AbsolutePosition
	local NameTag = MenuFrame.Content:FindFirstChild("NameTag")
	local _Vector2 = Vector2.new(AbsolutePosition.x + MenuFrame.AbsoluteSize.x, NameTag.AbsolutePosition.y + NameTag.AbsoluteSize.y)
	
	return AbsolutePosition.X <= Vector.X and (Vector.X <= _Vector2.X and AbsolutePosition.Y <= Vector.Y) and Vector.Y <= _Vector2.Y
end

function LocalPlayerHasToolEquipped(): boolean
	-- upvalues: LocalPlayer (ref)
	if not LocalPlayer.Character then
		return false
	end
	for _, BackpackItem in ipairs(LocalPlayer.Character:GetChildren()) do
		if BackpackItem:IsA("BackpackItem") then
			return true
		end
	end
	return false
end

function shouldIgnoreLocalCharacter(): boolean?
	-- upvalues: LocalPlayer (ref)
	if LocalPlayer.Character then
		local Head = LocalPlayer.Character:FindFirstChild("Head")
		
		if Head and Head:IsA("BasePart") then
			return Head.LocalTransparencyModifier >= 0.95
		end
	end
end

function clickedOnPoint(Vector)
	-- upvalues: Result1 (ref), RaycastParams1 (copy), LocalPlayer (ref), ContextMenuUtilModule (copy), IsStudio (copy), Flag2 (ref)
	local CurrentCamera = workspace.CurrentCamera
	
	if not CurrentCamera then return end
	if LocalPlayerHasToolEquipped() then return end
	local v2 = CurrentCamera:ScreenPointToRay(Vector.X, Vector.Y)
	
	if Result1 then
		RaycastParams1.FilterDescendantsInstances = if shouldIgnoreLocalCharacter() then { LocalPlayer.Character } else {}
		local RaycastResult = workspace:Raycast(v2.Origin, v2.Direction * 100, RaycastParams1)
		local PlayerFromPart = if RaycastResult then ContextMenuUtilModule:FindPlayerFromPart(RaycastResult.Instance) else nil
		
		if PlayerFromPart and (IsStudio and PlayerFromPart ~= LocalPlayer or PlayerFromPart ~= LocalPlayer and PlayerFromPart.UserId > 0) then
			if Flag2 then
				SetSelectedPlayer(PlayerFromPart)
				
				return
			else
				OpenContextMenu(PlayerFromPart, RaycastResult.Position)
				
				return
			end
		elseif not PlayerFromPart and Flag2 then
			CloseContextMenu()
			
			return
		end
	else
		local _Ray = Ray.new(v2.Origin, v2.Direction * 100)
		local Hit = nil
		local HitPosition = nil
		
		if shouldIgnoreLocalCharacter() then
			Hit, HitPosition = workspace:FindPartOnRay(_Ray, LocalPlayer.Character, false, true)
		else
			Hit, HitPosition = workspace:FindPartOnRay(_Ray, nil, false, true)
		end
		local PlayerFromPart = ContextMenuUtilModule:FindPlayerFromPart(Hit)
		
		if PlayerFromPart and (IsStudio and PlayerFromPart ~= LocalPlayer or PlayerFromPart ~= LocalPlayer and PlayerFromPart.UserId > 0) then
			if Flag2 then
				SetSelectedPlayer(PlayerFromPart)
				
				return
			else
				OpenContextMenu(PlayerFromPart, HitPosition)
				
				return
			end
		elseif not PlayerFromPart and Flag2 then
			CloseContextMenu()
		end
	end
end

function OnUserInput(p2, Input1)
	-- upvalues: Input (ref), v1 (ref)
	if Input1.UserInputState == Enum.UserInputState.Begin and Input == nil then
		Input = Input1
		v1 = p2
		
		return
	end
	if Input == Input1 and Input1.UserInputState == Enum.UserInputState.Change then
		if (p2 - v1).magnitude > 5 then
			Input = nil
			v1 = nil
			
			return
		end
	elseif Input1.UserInputState == Enum.UserInputState.End and Input == Input1 then
		Input = nil
		v1 = nil
		clickedOnPoint(p2)
	end
end

function OnMouseMoved(p2)
	-- upvalues: Flag2 (ref), Input (ref), v1 (ref)
	if not Flag2 and Input and (p2 - v1).magnitude > 20 then
		Input = nil
		v1 = nil
	end
end

function trackTouchSwipeInput(Input)
	-- upvalues: Input1 (ref)
	if Input.UserInputType == Enum.UserInputType.Touch then
		if Input1 or Input.UserInputState ~= Enum.UserInputState.Begin then
			if Input1 == Input and Input.UserInputState == Enum.UserInputState.End then
				spawn(function()
					-- upvalues: Input1 (upval)
					Input1 = nil
				end)
			end
		elseif PointInSwipeArea(Input.Position) then
			Input1 = Input
			
			return
		end
	end
end

local function functionProcessInput(Input1, GameProcessed)
	-- upvalues: Input (ref)
	trackTouchSwipeInput(Input1)
	
	if GameProcessed then
		if Input1 == Input then
			Input = nil
		end
		return
	elseif Input1.UserInputType == Enum.UserInputType.MouseButton1 or Input1.UserInputType == Enum.UserInputType.Touch then
		OnUserInput(Vector2.new(Input1.Position.X, Input1.Position.Y), Input1)
		
		return
	else
		if Input1.UserInputType == Enum.UserInputType.MouseMovement then
			OnMouseMoved(Vector2.new(Input1.Position.X, Input1.Position.Y))
		end
	end
end

UserInputService.InputBegan:Connect(functionProcessInput)
UserInputService.InputChanged:Connect(functionProcessInput)
UserInputService.InputEnded:Connect(functionProcessInput)
UserInputService.TouchSwipe:Connect(function(SwipeDirection, _, GameProcessedEvent)
	-- upvalues: Flag2 (ref), Input1 (ref), ContextMenuGuiModule (copy)
	if not GameProcessedEvent then return end
	if not Flag2 then return end
	if not Input1 then return end
	local v2 = 0
	
	if SwipeDirection == Enum.SwipeDirection.Left then
		v2 = 1
	elseif SwipeDirection == Enum.SwipeDirection.Right then
		v2 = -1
	end
	if v2 ~= 0 then
		ContextMenuGuiModule:OffsetPlayerEntry(v2)
		SetSelectedPlayer(ContextMenuGuiModule:GetSelectedPlayer())
	end
end)
LocalPlayer.FriendStatusChanged:Connect(function(Player1, FriendStatus)
	-- upvalues: Player (ref), BlockingUtilityModule (copy), NewContextMenuItems (ref)
	if Player1 and Player1 == Player then
		NewContextMenuItems:UpdateFriendButton(FriendStatus, (BlockingUtilityModule:IsPlayerBlockedByUserId(Player1.UserId)))
	end
end)

if FFlagEnableNewBackpack then
	Features.onVisibilityChanged(Features.FeatureName.Backpack, function(p2)
		-- upvalues: Flag2 (ref)
		if p2 and Flag2 then
			CloseContextMenu()
		end
	end)
else
	BackpackScriptModule.StateChanged.Event:Connect(function(p2)
		-- upvalues: Flag2 (ref)
		if p2 and Flag2 then
			CloseContextMenu()
		end
	end)
end
EmotesMenuMasterModule.EmotesMenuToggled.Event:Connect(function(p2)
	-- upvalues: Flag2 (ref)
	if p2 and Flag2 then
		CloseContextMenu()
	end
end)

function GetWorldPoint(Player: Player)
	-- upvalues: LocalPlayer (ref)
	if Player.Character then
		local HumanoidRootPart = Player.Character:FindFirstChild("HumanoidRootPart")
		
		if HumanoidRootPart then
			return HumanoidRootPart.Position
		end
	end
	return if Player == LocalPlayer then vector.create(0, 0, 0) else GetWorldPoint(LocalPlayer)
end

StarterGui:RegisterGetCore("AvatarContextMenuTarget", function()
	-- upvalues: Player (ref)
	return Player
end)
StarterGui:RegisterSetCore("AvatarContextMenuTarget", function(Player: Player)
	-- upvalues: Flag2 (ref), Flag1 (ref)
	if typeof(Player) == "Instance" and Player:IsA("Player") then
		if Player.Parent == nil then
			error("AvatarContextMenuTarget Player must be in the game")
			
			return
		end
		if Flag2 or Flag1 then
			SetSelectedPlayer(Player, true)
			
			return
		else
			OpenContextMenu(Player, GetWorldPoint(Player))
			
			return
		end
	elseif Player == nil then
		CloseContextMenu()
		
		return
	else
		error("AvatarContextMenuTarget argument must be a Player or nil")
	end
end)

local function getClosestPlayer()
	-- upvalues: LocalPlayer (ref), Players (copy)
	if not LocalPlayer.Character then return end
	local HumanoidRootPart = LocalPlayer.Character:FindFirstChild("HumanoidRootPart")
	
	if not HumanoidRootPart then return end
	local Position = HumanoidRootPart.Position
	local v2 = nil
	local Magnitude = 1e999
	local Position1 = nil
	
	for _, player in ipairs((Players:GetPlayers())) do
		if player ~= LocalPlayer and player.Character then
			local HumanoidRootPart1 = player.Character:FindFirstChild("HumanoidRootPart")
			
			if HumanoidRootPart1 and (HumanoidRootPart1.Position - Position).magnitude < Magnitude then
				v2 = player
				Magnitude = (HumanoidRootPart1.Position - Position).magnitude
				Position1 = HumanoidRootPart1.Position
			end
		end
	end
	return v2, Position1
end

ContextActionService:BindCoreAction("GamepadOpenAvatarContextMenu", function(_, UserInputState, _)
	-- upvalues: Inverted (ref), GuiService (copy), Flag2 (ref), getClosestPlayer (copy)
	if not Inverted then
		return Enum.ContextActionResult.Pass
	end
	if GuiService.SelectedCoreObject or GuiService.SelectedObject then
		return Enum.ContextActionResult.Pass
	end
	if UserInputState ~= Enum.UserInputState.Begin then
		return Enum.ContextActionResult.Sink
	end
	if Flag2 then
		CloseContextMenu()
	else
		local ClosestPlayer, ClosestPlayer2 = getClosestPlayer()
		
		if ClosestPlayer then
			OpenContextMenu(ClosestPlayer, ClosestPlayer2)
		end
	end
	return Enum.ContextActionResult.Sink
end, false, Enum.KeyCode.DPadUp)