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

function t.new() --[[ line: 45 ]]
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

function t:Destroy() --[[ line: 96 ]]
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

function t:SetCursorSize(p0) --[[ line: 113 ]]
	-- upvalues: t_1 (ref), propertiesModule (ref)
	local var10 = t_1[p0] * propertiesModule.CursorRadius
	self._cursor.Size = UDim2.fromOffset(var10, var10)
end

function t:PlayTweenActivate() --[[ line: 118 ]]
	self._activeSelectionTweenIn:Play()
end

function t:PlayTweenDefault() --[[ line: 122 ]]
	self._activeSelectionTweenOut:Play()
end

function t:SetHighlight(p1) --[[ line: 126 ]]
	if p1 then
		self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorHover.png"
		
		return
	end
	self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorDefault.png"
end

function t:SetPosition(p2) --[[ line: 134 ]]
	self._cursor.Position = UDim2.fromOffset(p2.X, p2.Y)
end

function t:GetCursorScreenGuiOffset() --[[ line: 138 ]]
	return self._cursorContainer.AbsolutePosition
end

function t:TweenPosition(p3) --[[ line: 142 ]]
	-- upvalues: tweenService (ref)
	self._activePreviewPositionTween = tweenService:Create(self._cursor, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { Position = UDim2.fromOffset(p3.X, p3.Y) })
	self._activePreviewPositionTween:Play()
end

function t:TweenOpacity(p4) --[[ line: 149 ]]
	-- upvalues: tweenService (ref)
	local activeOpacityTweenCompletedConnection = self._activeOpacityTweenCompletedConnection
	
	if activeOpacityTweenCompletedConnection then
		activeOpacityTweenCompletedConnection:Disconnect()
		self._activeOpacityTweenCompletedConnection = nil
	end
	local cursor = tweenService:Create(self._cursor, TweenInfo.new(0.15, Enum.EasingStyle.Sine, Enum.EasingDirection.Out, 0, false, 0), { ImageTransparency = if p4 then 0 else 1 })
	self._activeOpacityTweenCompletedConnection = cursor.Completed:Connect(function() --[[ line: 162 ]]
		-- upvalues: self (ref), p4 (ref)
		self._cursor.Visible = p4
		self._cursorContainer.Enabled = p4
	end)
	cursor:Play()
end

function t:SetArrow(p5, p6) --[[ line: 170 ]]
	if p5 == -1 and p6 == 0 then
		self._cursor.Rotation = 90
	elseif p6 == 0 then
		self._cursor.Rotation = 270
	end
	if p5 == 0 and p6 == 1 then
		self._cursor.Rotation = 0
	elseif p5 == 0 then
		self._cursor.Rotation = 180
	end
	self._cursor.Image = "rbxasset://textures/ui/VirtualCursor/cursorArrow.png"
end

function t:GetEnabled() --[[ line: 186 ]]
	return self._enabled
end

function t:Enable(p7) --[[ line: 190 ]]
	-- upvalues: VRService (ref)
	if VRService.VREnabled then
		return
	end
	local var12 = not VRService.VREnabled
	self._cursorContainer.Enabled = var12
	self:SetCursorSize("Default")
	self:SetPosition(p7)
	self._cursor.Visible = var12
	self:TweenOpacity(true)
	self._enabled = true
end

function t:Disable() --[[ line: 206 ]]
	self:SetHighlight(false)
	self:TweenOpacity(false)
	self._enabled = false
end

return t