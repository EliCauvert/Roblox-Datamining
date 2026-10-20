local VirtualCursorModular = script:FindFirstAncestor("VirtualCursorModular")
local TweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local CoreGui = game:GetService("CoreGui")
local PropertiesModule = require(VirtualCursorModular.Properties)
local GetFFlagVirtualCursorDisplayOrderFunction = require(VirtualCursorModular.Parent.SharedFlags).getFFlagVirtualCursorDisplayOrder
local CursorController = {}
CursorController.__index = CursorController
local config = { Default = 2, Hover = 2, Pressed = 1.7, Arrow = 2 }

function CursorController.new()
	-- upvalues: GetFFlagVirtualCursorDisplayOrderFunction (copy), PropertiesModule (copy), CoreGui (copy), TweenService (copy), CursorController (copy)
	local CursorContainer = Instance.new("ScreenGui")
	CursorContainer.Enabled = false
	CursorContainer.IgnoreGuiInset = true
	CursorContainer.DisplayOrder = if GetFFlagVirtualCursorDisplayOrderFunction() then 1e999 else 100
	
	if GetFFlagVirtualCursorDisplayOrderFunction() then
		CursorContainer.OnTopOfCoreBlur = true
	end
	CursorContainer.Name = "CursorContainer"
	local Image = Instance.new("ImageLabel")
	Image.Active = false
	Image.AnchorPoint = Vector2.new(0.5, 0.5)
	Image.Size = UDim2.fromOffset(2 * PropertiesModule.CursorRadius, 2 * PropertiesModule.CursorRadius)
	Image.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
	Image.Visible = false
	Image.BackgroundTransparency = 1
	Image.Parent = CursorContainer
	CursorContainer.Parent = CoreGui
	local _TweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
	
	return (setmetatable({
		_activePreviewPositionTween = nil,
		_activeOpacityTweenCompletedConnection = nil,
		_enabled = false,
		_cursor = Image,
		_cursorContainer = CursorContainer,
		_activeSelectionTweenIn = TweenService:Create(Image, _TweenInfo, {
			Size = UDim2.fromOffset(1.7 * PropertiesModule.CursorRadius, 1.7 * PropertiesModule.CursorRadius)
		}),
		_activeSelectionTweenOut = TweenService:Create(Image, _TweenInfo, {
			Size = UDim2.fromOffset(2 * PropertiesModule.CursorRadius, 2 * PropertiesModule.CursorRadius)
		})
	}, CursorController))
end

function CursorController:Destroy()
	self._cursorContainer:Destroy()
	self._activeSelectionTweenIn:Destroy()
	self._activeSelectionTweenOut:Destroy()
	
	if self._activePreviewPositionTween then
		self._activePreviewPositionTween:Destroy()
	end
	local ActiveOpacityTweenCompletedConnection = self._activeOpacityTweenCompletedConnection
	
	if ActiveOpacityTweenCompletedConnection then
		ActiveOpacityTweenCompletedConnection:Disconnect()
		self._activeOpacityTweenCompletedConnection = nil
	end
end

function CursorController:SetCursorSize(p1)
	-- upvalues: config (copy), PropertiesModule (copy)
	local ScaledEntry = config[p1] * PropertiesModule.CursorRadius
	self._cursor.Size = UDim2.fromOffset(ScaledEntry, ScaledEntry)
end

function CursorController:PlayTweenActivate()
	self._activeSelectionTweenIn:Play()
end

function CursorController:PlayTweenDefault()
	self._activeSelectionTweenOut:Play()
end

function CursorController:SetHighlight(p1)
	if p1 then
		self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorHover.png"
		
		return
	else
		self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
	end
end

function CursorController:SetPosition(Vector)
	self._cursor.Position = UDim2.fromOffset(Vector.X, Vector.Y)
end

function CursorController:GetCursorScreenGuiOffset()
	return self._cursorContainer.AbsolutePosition
end

function CursorController:TweenPosition(Vector)
	-- upvalues: TweenService (copy)
	self._activePreviewPositionTween = TweenService:Create(self._cursor, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { Position = UDim2.fromOffset(Vector.X, Vector.Y) })
	self._activePreviewPositionTween:Play()
end

function CursorController:TweenOpacity(Enabled)
	-- upvalues: TweenService (copy)
	local ActiveOpacityTweenCompletedConnection = self._activeOpacityTweenCompletedConnection
	
	if ActiveOpacityTweenCompletedConnection then
		ActiveOpacityTweenCompletedConnection:Disconnect()
		self._activeOpacityTweenCompletedConnection = nil
	end
	local Tween = TweenService:Create(self._cursor, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = if Enabled then 0 else 1 })
	self._activeOpacityTweenCompletedConnection = Tween.Completed:Connect(function()
		-- upvalues: self (copy), Enabled (copy)
		self._cursor.Visible = Enabled
		self._cursorContainer.Enabled = Enabled
	end)
	Tween:Play()
end

function CursorController:SetArrow(p1, p2)
	if p1 == -1 and p2 == 0 then
		self._cursor.Rotation = 90
	elseif p2 == 0 then
		self._cursor.Rotation = 270
	end
	if p1 == 0 and p2 == 1 then
		self._cursor.Rotation = 0
	elseif p1 == 0 then
		self._cursor.Rotation = 180
	end
	self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
end

function CursorController:GetEnabled()
	return self._enabled
end

function CursorController:Enable(p1)
	-- upvalues: VRService (copy)
	if not VRService.VREnabled then
		local NoVREnabled = not VRService.VREnabled
		self._cursorContainer.Enabled = NoVREnabled
		self:SetCursorSize("Default")
		self:SetPosition(p1)
		self._cursor.Visible = NoVREnabled
		self:TweenOpacity(true)
		self._enabled = true
		
		return
	end
end

function CursorController:Disable()
	self:SetHighlight(false)
	self:TweenOpacity(false)
	self._enabled = false
end

return CursorController