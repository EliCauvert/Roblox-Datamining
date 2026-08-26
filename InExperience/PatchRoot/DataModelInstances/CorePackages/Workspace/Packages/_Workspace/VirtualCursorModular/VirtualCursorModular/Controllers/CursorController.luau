local virtualCursorModular = script:FindFirstAncestor("VirtualCursorModular")
local parent = virtualCursorModular.Parent
local tweenService = game:GetService("TweenService")
local VRService = game:GetService("VRService")
local coreGuiService = game:GetService("CoreGui")
local propertiesModule = require(virtualCursorModular.Properties)
local getFFlagVirtualCursorDisplayOrder = require(parent.SharedFlags).getFFlagVirtualCursorDisplayOrder
local t = {}
t.__index = t
local _ = {
	Default = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png",
	Hover = "rbxasset://textures/ui/VirtualCursor/cursorHover.png",
	Pressed = "rbxasset://textures/ui/VirtualCursor/cursorPressed.png",
	Arrow = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
}
local t_1 = { Default = 2, Hover = 2, Pressed = 1.7, Arrow = 2 }

function t.new()
	-- upvalues: getFFlagVirtualCursorDisplayOrder (ref), propertiesModule (ref), coreGuiService (ref), tweenService (ref), t (ref)
	local cursorContainer = Instance.new("ScreenGui")
	cursorContainer.Enabled = false
	cursorContainer.IgnoreGuiInset = true
	cursorContainer.DisplayOrder = if getFFlagVirtualCursorDisplayOrder() then 1e999 else 100
	
	if getFFlagVirtualCursorDisplayOrder() then
		cursorContainer.OnTopOfCoreBlur = true
	end
	cursorContainer.Name = "CursorContainer"
	local imageLabel = Instance.new("ImageLabel")
	imageLabel.Active = false
	imageLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	imageLabel.Size = UDim2.fromOffset(2 * propertiesModule.CursorRadius, 2 * propertiesModule.CursorRadius)
	imageLabel.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
	imageLabel.Visible = false
	imageLabel.BackgroundTransparency = 1
	imageLabel.Parent = cursorContainer
	cursorContainer.Parent = coreGuiService
	local tweenInfo = TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0)
	
	return setmetatable({
		_activePreviewPositionTween = nil,
		_activeOpacityTweenCompletedConnection = nil,
		_enabled = false,
		_cursor = imageLabel,
		_cursorContainer = cursorContainer,
		_activeSelectionTweenIn = tweenService:Create(imageLabel, tweenInfo, {
			Size = UDim2.fromOffset(1.7 * propertiesModule.CursorRadius, 1.7 * propertiesModule.CursorRadius)
		}),
		_activeSelectionTweenOut = tweenService:Create(imageLabel, tweenInfo, {
			Size = UDim2.fromOffset(2 * propertiesModule.CursorRadius, 2 * propertiesModule.CursorRadius)
		})
	}, t)
end

function t:Destroy()
	self._cursorContainer:Destroy()
	self._activeSelectionTweenIn:Destroy()
	self._activeSelectionTweenOut:Destroy()
	
	if self._activePreviewPositionTween then
		self._activePreviewPositionTween:Destroy()
	end
	local activeOpacityTweenCompletedConnection = self._activeOpacityTweenCompletedConnection
	
	if activeOpacityTweenCompletedConnection then
		activeOpacityTweenCompletedConnection:Disconnect()
		self._activeOpacityTweenCompletedConnection = nil
	end
end

function t:SetCursorSize(p1)
	-- upvalues: t_1 (ref), propertiesModule (ref)
	local var1 = t_1[p1] * propertiesModule.CursorRadius
	self._cursor.Size = UDim2.fromOffset(var1, var1)
end

function t:PlayTweenActivate()
	self._activeSelectionTweenIn:Play()
end

function t:PlayTweenDefault()
	self._activeSelectionTweenOut:Play()
end

function t:SetHighlight(p1)
	if p1 then
		self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorHover.png"
		
		return
	end
	self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
end

function t:SetPosition(p1)
	self._cursor.Position = UDim2.fromOffset(p1.X, p1.Y)
end

function t:GetCursorScreenGuiOffset()
	return self._cursorContainer.AbsolutePosition
end

function t:TweenPosition(p1)
	-- upvalues: tweenService (ref)
	self._activePreviewPositionTween = tweenService:Create(self._cursor, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { Position = UDim2.fromOffset(p1.X, p1.Y) })
	self._activePreviewPositionTween:Play()
end

function t:TweenOpacity(p1)
	-- upvalues: tweenService (ref)
	local activeOpacityTweenCompletedConnection = self._activeOpacityTweenCompletedConnection
	
	if activeOpacityTweenCompletedConnection then
		activeOpacityTweenCompletedConnection:Disconnect()
		self._activeOpacityTweenCompletedConnection = nil
	end
	local cursor = tweenService:Create(self._cursor, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = if p1 then 0 else 1 })
	self._activeOpacityTweenCompletedConnection = cursor.Completed:Connect(function()
		-- upvalues: self (ref), p1 (ref)
		self._cursor.Visible = p1
		self._cursorContainer.Enabled = p1
	end)
	cursor:Play()
end

function t:SetArrow(p1, p2)
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

function t:GetEnabled()
	return self._enabled
end

function t:Enable(p1)
	-- upvalues: VRService (ref)
	if VRService.VREnabled then
		return
	end
	local var1 = not VRService.VREnabled
	self._cursorContainer.Enabled = var1
	self:SetCursorSize("Default")
	self:SetPosition(p1)
	self._cursor.Visible = var1
	self:TweenOpacity(true)
	self._enabled = true
end

function t:Disable()
	self:SetHighlight(false)
	self:TweenOpacity(false)
	self._enabled = false
end

return t