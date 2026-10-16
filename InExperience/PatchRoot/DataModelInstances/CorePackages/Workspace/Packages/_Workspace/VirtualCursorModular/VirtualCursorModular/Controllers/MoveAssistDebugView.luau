local CoreGui = game:GetService("CoreGui")
local UserInputService = game:GetService("UserInputService")
local _ = require(script:FindFirstAncestor("VirtualCursorModular").Controllers.MoveAssistController)
local M = Enum.KeyCode.M
local _Color3 = Color3.fromRGB(0, 200, 255)
local _Color3_1 = Color3.fromRGB(40, 230, 100)
local _Color3_2 = Color3.fromRGB(255, 255, 255)
local _Color3_3 = Color3.fromRGB(0, 200, 255)
local _Color3_4 = Color3.fromRGB(40, 230, 100)
local _Color3_5 = Color3.fromRGB(110, 110, 110)
local _Color3_6 = Color3.fromRGB(120, 90, 0)
local _Color3_7 = Color3.fromRGB(255, 220, 0)
local MoveAssistDebugViewModule = {}
MoveAssistDebugViewModule.__index = MoveAssistDebugViewModule

local function makeOutline(Name, Color, Parent) --[[ Line: 49 ]]
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.BackgroundTransparency = 1
	Frame.BorderSizePixel = 0
	Frame.Visible = false
	local Stroke = Instance.new("UIStroke")
	Stroke.Color = Color
	Stroke.Thickness = 2
	Stroke.Parent = Frame
	Frame.Parent = Parent
	
	return { rect = Frame, stroke = Stroke }
end

local function _(Name, BackgroundColor3, Parent) --[[ Line: 63 | Named "makeRay" ]]
	local Frame = Instance.new("Frame")
	Frame.Name = Name
	Frame.AnchorPoint = Vector2.new(0.5, 0.5)
	Frame.Size = UDim2.fromOffset(80, 2)
	Frame.BackgroundColor3 = BackgroundColor3
	Frame.BorderSizePixel = 0
	Frame.Visible = false
	Frame.Parent = Parent
	
	return Frame
end

local function makeCandidateVisual(Parent) --[[ Line: 78 ]]
	-- upvalues: makeOutline (copy), _Color3_5 (copy)
	local CandidateRect = makeOutline("CandidateRect", _Color3_5, Parent)
	local AimDot = Instance.new("Frame")
	AimDot.Name = "AimDot"
	AimDot.AnchorPoint = Vector2.new(0.5, 0.5)
	AimDot.Size = UDim2.fromOffset(8, 8)
	AimDot.BorderSizePixel = 0
	AimDot.Visible = false
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(1, 0)
	Corner.Parent = AimDot
	AimDot.Parent = Parent
	
	return {
		rect = CandidateRect.rect,
		stroke = CandidateRect.stroke,
		aimDot = AimDot
	}
end

function MoveAssistDebugViewModule.new() --[[ Line: 95 ]]
	-- upvalues: makeOutline (copy), _Color3 (copy), _Color3_2 (copy), _Color3_3 (copy), CoreGui (copy), MoveAssistDebugViewModule (copy), UserInputService (copy), M (copy)
	local MoveAssistDebug = Instance.new("ScreenGui")
	MoveAssistDebug.Name = "MoveAssistDebug"
	MoveAssistDebug.IgnoreGuiInset = true
	MoveAssistDebug.DisplayOrder = 100000
	MoveAssistDebug.ResetOnSpawn = false
	MoveAssistDebug.Enabled = false
	local _Rect = makeOutline("AssistRadius", _Color3, MoveAssistDebug).rect
	_Rect.AnchorPoint = Vector2.new(0.5, 0.5)
	_Rect.Visible = true
	local Corner = Instance.new("UICorner")
	Corner.CornerRadius = UDim.new(1, 0)
	Corner.Parent = _Rect
	local InputRay = Instance.new("Frame")
	InputRay.Name = "InputRay"
	InputRay.AnchorPoint = Vector2.new(0.5, 0.5)
	InputRay.Size = UDim2.fromOffset(80, 2)
	InputRay.BackgroundColor3 = _Color3_2
	InputRay.BorderSizePixel = 0
	InputRay.Visible = false
	InputRay.Parent = MoveAssistDebug
	local FinalRay = Instance.new("Frame")
	FinalRay.Name = "FinalRay"
	FinalRay.AnchorPoint = Vector2.new(0.5, 0.5)
	FinalRay.Size = UDim2.fromOffset(80, 2)
	FinalRay.BackgroundColor3 = _Color3_3
	FinalRay.BorderSizePixel = 0
	FinalRay.Visible = false
	FinalRay.Parent = MoveAssistDebug
	local StatsPanel = Instance.new("TextLabel")
	StatsPanel.Name = "StatsPanel"
	StatsPanel.Position = UDim2.fromOffset(12, 12)
	StatsPanel.Size = UDim2.fromOffset(260, 228)
	StatsPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	StatsPanel.BackgroundTransparency = 0.4
	StatsPanel.TextColor3 = Color3.fromRGB(255, 255, 255)
	StatsPanel.TextXAlignment = Enum.TextXAlignment.Left
	StatsPanel.TextYAlignment = Enum.TextYAlignment.Top
	StatsPanel.Font = Enum.Font.Code
	StatsPanel.TextSize = 14
	StatsPanel.Text = ""
	StatsPanel.Parent = MoveAssistDebug
	MoveAssistDebug.Parent = CoreGui
	local self = setmetatable({
		_mode = 0,
		_toggleConnection = nil,
		_container = MoveAssistDebug,
		_radius = _Rect,
		_inputRay = InputRay,
		_finalRay = FinalRay,
		_label = StatsPanel,
		_candidateVisuals = {}
	}, MoveAssistDebugViewModule)
	self._toggleConnection = UserInputService.InputBegan:Connect(function(Input) --[[ Line: 141 ]]
		-- upvalues: M (upval), self (copy)
		if Input.KeyCode == M then
			self:cycleMode()
		end
	end)
	
	return self
end

function MoveAssistDebugViewModule:cycleMode() --[[ Line: 151 ]]
	self._mode = (self._mode + 1) % 3
end

function MoveAssistDebugViewModule:_getCandidateVisual(Count) --[[ Line: 155 ]]
	-- upvalues: makeCandidateVisual (copy)
	local CandidateVisual = self._candidateVisuals[Count]
	
	if CandidateVisual then
		return CandidateVisual
	else
		local CandidateVisual1 = makeCandidateVisual(self._container)
		self._candidateVisuals[Count] = CandidateVisual1
		
		return CandidateVisual1
	end
end

local _ = function(p1, p2, Direction) --[[ Line: 165 | Named "positionRay" ]]
	if Direction.Magnitude < 0.001 then
		p1.Visible = false
		
		return
	else
		local Direction1: number = Direction.Unit
		local NewDirection = p2 + Direction1 * 40
		p1.Position = UDim2.fromOffset(NewDirection.X, NewDirection.Y)
		p1.Rotation = math.deg((math.atan2(Direction1.Y, Direction1.X)))
		p1.Visible = true
	end
end

local _ = function(p1, p2: number) --[[ Line: 178 | Named "candidateColor" ]]
	-- upvalues: _Color3_1 (copy), _Color3_6 (copy), _Color3_7 (copy), _Color3_5 (copy)
	return if p1.state == "committed" then _Color3_1 elseif p1.state == "scored" then _Color3_6:Lerp(_Color3_7, if p2 > 0 then math.clamp(p1.influence / p2, 0, 1) else 0) else _Color3_5
end

local _ = function(p1): string --[[ Line: 188 | Named "fmt" ]]
	return string.format("%.2f", p1)
end

function MoveAssistDebugViewModule:update(p1, p2) --[[ Line: 195 ]]
	-- upvalues: _Color3_1 (copy), _Color3_6 (copy), _Color3_7 (copy), _Color3_5 (copy), _Color3_4 (copy), _Color3_3 (copy)
	if self._mode == 0 or not p1 then
		self._container.Enabled = false
		
		return
	end
	self._container.Enabled = true
	self._label.Visible = self._mode == 1
	local CursorPositionDelta = p1.cursorPosition - p2
	local ScaledRadius = p1.radius * 2
	self._radius.Size = UDim2.fromOffset(ScaledRadius, ScaledRadius)
	self._radius.Position = UDim2.fromOffset(CursorPositionDelta.X, CursorPositionDelta.Y)
	local Influence = 0
	
	for _, candidate in p1.candidates do
		if Influence < candidate.influence then
			Influence = candidate.influence
		end
	end
	local Count = 0
	
	for _, candidate1 in p1.candidates do
		Count += 1
		local CandidateVisual = self:_getCandidateVisual(Count)
		local Color = if candidate1.state == "committed" then _Color3_1 elseif candidate1.state == "scored" then _Color3_6:Lerp(_Color3_7, if Influence > 0 then math.clamp(candidate1.influence / Influence, 0, 1) else 0) else _Color3_5
		local PositionDelta = candidate1.position - p2
		CandidateVisual.rect.Position = UDim2.fromOffset(PositionDelta.X, PositionDelta.Y)
		CandidateVisual.rect.Size = UDim2.fromOffset(candidate1.size.X, candidate1.size.Y)
		CandidateVisual.rect.Visible = true
		CandidateVisual.stroke.Color = Color
		local AimPoint = candidate1.aimPoint
		
		if AimPoint and candidate1.state ~= "skipped" then
			local AimPointDelta = AimPoint - p2
			CandidateVisual.aimDot.Position = UDim2.fromOffset(AimPointDelta.X, AimPointDelta.Y)
			CandidateVisual.aimDot.BackgroundColor3 = Color
			CandidateVisual.aimDot.Visible = true
		else
			CandidateVisual.aimDot.Visible = false
		end
	end
	for i = Count + 1, #self._candidateVisuals do
		self._candidateVisuals[i].rect.Visible = false
		self._candidateVisuals[i].aimDot.Visible = false
	end
	local InputRay = self._inputRay
	local InputDir = p1.inputDir
	
	if InputDir.Magnitude < 0.001 then
		InputRay.Visible = false
	else
		local Direction: number = InputDir.Unit
		local NewCursorPositionDelta = CursorPositionDelta + Direction * 40
		InputRay.Position = UDim2.fromOffset(NewCursorPositionDelta.X, NewCursorPositionDelta.Y)
		InputRay.Rotation = math.deg((math.atan2(Direction.Y, Direction.X)))
		InputRay.Visible = true
	end
	local FinalRay = self._finalRay
	local FinalDir = p1.finalDir
	
	if FinalDir.Magnitude < 0.001 then
		FinalRay.Visible = false
	else
		local Direction: number = FinalDir.Unit
		local NewCursorPositionDelta = CursorPositionDelta + Direction * 40
		FinalRay.Position = UDim2.fromOffset(NewCursorPositionDelta.X, NewCursorPositionDelta.Y)
		FinalRay.Rotation = math.deg((math.atan2(Direction.Y, Direction.X)))
		FinalRay.Visible = true
	end
	self._finalRay.BackgroundColor3 = if p1.active then _Color3_4 else _Color3_3
	local Committed = p1.committed
	local ScaledFinalDir = (p1.finalDir - p1.inputDir) * p1.inputMagnitude
	self._label.Text = string.format("MoveAssist: %s\nmoveDir: (%s, %s)  mag %s\nbend: (%s, %s)  %s deg\ncommitted: %s\ninfluence: %s\nconfidence: %s (str %s)\ninputFollow: %s\narrival: %s\nintent: %s\nmasterGain: %s\nassistStrength: %s\ncandidates: %d", if p1.active then "ACTIVE" else "idle", string.format("%.2f", p1.finalDir.X), string.format("%.2f", p1.finalDir.Y), string.format("%.2f", p1.inputMagnitude), string.format("%.2f", ScaledFinalDir.X), string.format("%.2f", ScaledFinalDir.Y), string.format("%.2f", (math.deg((math.acos((math.clamp(p1.inputDir:Dot(p1.finalDir), -1, 1))))))), if Committed then Committed.Name else "-", string.format("%.2f", p1.bestInfluence), string.format("%.2f", p1.confidence), string.format("%.2f", p1.confidenceStrength), string.format("%.2f", p1.inputFollowStrength), string.format("%.2f", p1.arrivalFactor), string.format("%.2f", p1.intentFactor), string.format("%.2f", p1.masterGain), string.format("%.2f", p1.assistStrength), Count)
end

function MoveAssistDebugViewModule:Destroy() --[[ Line: 278 ]]
	local ToggleConnection = self._toggleConnection
	
	if ToggleConnection then
		ToggleConnection:Disconnect()
		self._toggleConnection = nil
	end
	self._container:Destroy()
end

return MoveAssistDebugViewModule