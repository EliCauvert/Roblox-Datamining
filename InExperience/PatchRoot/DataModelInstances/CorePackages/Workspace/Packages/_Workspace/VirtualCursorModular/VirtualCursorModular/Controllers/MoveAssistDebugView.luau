local virtualCursorModular = script:FindFirstAncestor("VirtualCursorModular")
local coreGuiService = game:GetService("CoreGui")
local userInputService = game:GetService("UserInputService")
local _ = require(virtualCursorModular.Controllers.MoveAssistController)
local m = Enum.KeyCode.M
local color = Color3.fromRGB(0, 200, 255)
local color_1 = Color3.fromRGB(40, 230, 100)
local color_2 = Color3.fromRGB(255, 255, 255)
local color_3 = Color3.fromRGB(0, 200, 255)
local color_4 = Color3.fromRGB(40, 230, 100)
local color_5 = Color3.fromRGB(110, 110, 110)
local color_6 = Color3.fromRGB(120, 90, 0)
local color_7 = Color3.fromRGB(255, 220, 0)
local t = {}
t.__index = t

local function makeOutline(p1, p2, p3)
	local frame = Instance.new("Frame")
	frame.Name = p1
	frame.BackgroundTransparency = 1
	frame.BorderSizePixel = 0
	frame.Visible = false
	local UIStroke = Instance.new("UIStroke")
	UIStroke.Color = p2
	UIStroke.Thickness = 2
	UIStroke.Parent = frame
	frame.Parent = p3
	
	return { rect = frame, stroke = UIStroke }
end

local function _(p1, p2, p3)
	local frame = Instance.new("Frame")
	frame.Name = p1
	frame.AnchorPoint = Vector2.new(0.5, 0.5)
	frame.Size = UDim2.fromOffset(80, 2)
	frame.BackgroundColor3 = p2
	frame.BorderSizePixel = 0
	frame.Visible = false
	frame.Parent = p3
	
	return frame
end

local function makeCandidateVisual(p1)
	-- upvalues: makeOutline (ref), color_5 (ref)
	local var1 = makeOutline("CandidateRect", color_5, p1)
	local aimDot = Instance.new("Frame")
	aimDot.Name = "AimDot"
	aimDot.AnchorPoint = Vector2.new(0.5, 0.5)
	aimDot.Size = UDim2.fromOffset(8, 8)
	aimDot.BorderSizePixel = 0
	aimDot.Visible = false
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = aimDot
	aimDot.Parent = p1
	
	return {
		rect = var1.rect,
		stroke = var1.stroke,
		aimDot = aimDot
	}
end

function t.new()
	-- upvalues: makeOutline (ref), color (ref), color_2 (ref), color_3 (ref), coreGuiService (ref), t (ref), userInputService (ref), m (ref)
	local moveAssistDebug = Instance.new("ScreenGui")
	moveAssistDebug.Name = "MoveAssistDebug"
	moveAssistDebug.IgnoreGuiInset = true
	moveAssistDebug.DisplayOrder = 100000
	moveAssistDebug.ResetOnSpawn = false
	moveAssistDebug.Enabled = false
	local rect = makeOutline("AssistRadius", color, moveAssistDebug).rect
	rect.AnchorPoint = Vector2.new(0.5, 0.5)
	rect.Visible = true
	local UICorner = Instance.new("UICorner")
	UICorner.CornerRadius = UDim.new(1, 0)
	UICorner.Parent = rect
	local inputRay = Instance.new("Frame")
	inputRay.Name = "InputRay"
	inputRay.AnchorPoint = Vector2.new(0.5, 0.5)
	inputRay.Size = UDim2.fromOffset(80, 2)
	inputRay.BackgroundColor3 = color_2
	inputRay.BorderSizePixel = 0
	inputRay.Visible = false
	inputRay.Parent = moveAssistDebug
	local finalRay = Instance.new("Frame")
	finalRay.Name = "FinalRay"
	finalRay.AnchorPoint = Vector2.new(0.5, 0.5)
	finalRay.Size = UDim2.fromOffset(80, 2)
	finalRay.BackgroundColor3 = color_3
	finalRay.BorderSizePixel = 0
	finalRay.Visible = false
	finalRay.Parent = moveAssistDebug
	local statsPanel = Instance.new("TextLabel")
	statsPanel.Name = "StatsPanel"
	statsPanel.Position = UDim2.fromOffset(12, 12)
	statsPanel.Size = UDim2.fromOffset(260, 228)
	statsPanel.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	statsPanel.BackgroundTransparency = 0.4
	statsPanel.TextColor3 = Color3.fromRGB(255, 255, 255)
	statsPanel.TextXAlignment = Enum.TextXAlignment.Left
	statsPanel.TextYAlignment = Enum.TextYAlignment.Top
	statsPanel.Font = Enum.Font.Code
	statsPanel.TextSize = 14
	statsPanel.Text = ""
	statsPanel.Parent = moveAssistDebug
	moveAssistDebug.Parent = coreGuiService
	finalRay = setmetatable({
		_mode = 0,
		_toggleConnection = nil,
		_container = moveAssistDebug,
		_radius = rect,
		_inputRay = inputRay,
		_finalRay = finalRay,
		_label = statsPanel,
		_candidateVisuals = {}
	}, t)
	finalRay._toggleConnection = userInputService.InputBegan:Connect(function(p1)
		-- upvalues: m (copy), finalRay (ref)
		if p1.KeyCode == m then
			finalRay:cycleMode()
		end
	end)
	
	return finalRay
end

function t:cycleMode()
	self._mode = (self._mode + 1) % 3
end

function t:_getCandidateVisual(p1)
	-- upvalues: makeCandidateVisual (ref)
	local var1 = self._candidateVisuals[p1]
	
	if var1 then
		return var1
	end
	local var2 = makeCandidateVisual(self._container)
	self._candidateVisuals[p1] = var2
	
	return var2
end

local _ = function(p1, p2, p3)
	if p3.Magnitude < 0.001 then
		p1.Visible = false
		
		return
	end
	local unit = p3.Unit
	local var1 = p2 + unit * 40
	p1.Position = UDim2.fromOffset(var1.X, var1.Y)
	p1.Rotation = math.deg(math.atan2(unit.Y, unit.X))
	p1.Visible = true
end

local _ = function(p1, p2)
	-- upvalues: color_1 (ref), color_6 (ref), color_7 (ref), color_5 (ref)
	return if p1.state == "committed" then color_1 elseif p1.state == "scored" then color_6:Lerp(color_7, if p2 > 0 then math.clamp(p1.influence / p2, 0, 1) else 0) else color_5
end

local _ = function(p1)
	return string.format("%.2f", p1)
end

function t:update(p1, p2)
	-- upvalues: color_1 (ref), color_6 (ref), color_7 (ref), color_5 (ref), color_4 (ref), color_3 (ref)
	if self._mode == 0 or not p1 then
		self._container.Enabled = false
		
		return
	end
	self._container.Enabled = true
	self._label.Visible = self._mode == 1
	local var1 = p1.cursorPosition - p2
	local var2 = p1.radius * 2
	self._radius.Size = UDim2.fromOffset(var2, var2)
	self._radius.Position = UDim2.fromOffset(var1.X, var1.Y)
	local var3 = 0
	
	for i, v in p1.candidates do
		if var3 < v.influence then
			var3 = v.influence
		end
	end
	local var4 = 0
	
	for i_1, v_1 in p1.candidates do
		var4 += 1
		local var5 = self:_getCandidateVisual(var4)
		local var6 = if v_1.state == "committed" then color_1 elseif v_1.state == "scored" then color_6:Lerp(color_7, if var3 > 0 then math.clamp(v_1.influence / var3, 0, 1) else 0) else color_5
		local var7 = v_1.position - p2
		var5.rect.Position = UDim2.fromOffset(var7.X, var7.Y)
		var5.rect.Size = UDim2.fromOffset(v_1.size.X, v_1.size.Y)
		var5.rect.Visible = true
		var5.stroke.Color = var6
		local aimPoint = v_1.aimPoint
		
		if aimPoint and v_1.state ~= "skipped" then
			local var8 = aimPoint - p2
			var5.aimDot.Position = UDim2.fromOffset(var8.X, var8.Y)
			var5.aimDot.BackgroundColor3 = var6
			var5.aimDot.Visible = true
		else
			var5.aimDot.Visible = false
		end
	end
	for i_2 = var4 + 1, #self._candidateVisuals do
		self._candidateVisuals[i_2].rect.Visible = false
		self._candidateVisuals[i_2].aimDot.Visible = false
	end
	local inputRay = self._inputRay
	local inputDir = p1.inputDir
	
	if inputDir.Magnitude < 0.001 then
		inputRay.Visible = false
	else
		local unit = inputDir.Unit
		local var9 = var1 + unit * 40
		inputRay.Position = UDim2.fromOffset(var9.X, var9.Y)
		inputRay.Rotation = math.deg(math.atan2(unit.Y, unit.X))
		inputRay.Visible = true
	end
	local finalRay = self._finalRay
	local finalDir = p1.finalDir
	
	if finalDir.Magnitude < 0.001 then
		finalRay.Visible = false
	else
		local unit = finalDir.Unit
		local var10 = var1 + unit * 40
		finalRay.Position = UDim2.fromOffset(var10.X, var10.Y)
		finalRay.Rotation = math.deg(math.atan2(unit.Y, unit.X))
		finalRay.Visible = true
	end
	self._finalRay.BackgroundColor3 = if p1.active then color_4 else color_3
	local committed = p1.committed
	local var11 = (p1.finalDir - p1.inputDir) * p1.inputMagnitude
	self._label.Text = string.format("MoveAssist: %s\nmoveDir: (%s, %s)  mag %s\nbend: (%s, %s)  %s deg\ncommitted: %s\ninfluence: %s\nconfidence: %s (str %s)\ninputFollow: %s\narrival: %s\nintent: %s\nmasterGain: %s\nassistStrength: %s\ncandidates: %d", if p1.active then "ACTIVE" else "idle", string.format("%.2f", p1.finalDir.X), string.format("%.2f", p1.finalDir.Y), string.format("%.2f", p1.inputMagnitude), string.format("%.2f", var11.X), string.format("%.2f", var11.Y), string.format("%.2f", math.deg(math.acos(math.clamp(p1.inputDir:Dot(p1.finalDir), -1, 1)))), if committed then committed.Name else "-", string.format("%.2f", p1.bestInfluence), string.format("%.2f", p1.confidence), string.format("%.2f", p1.confidenceStrength), string.format("%.2f", p1.inputFollowStrength), string.format("%.2f", p1.arrivalFactor), string.format("%.2f", p1.intentFactor), string.format("%.2f", p1.masterGain), string.format("%.2f", p1.assistStrength), var4)
end

function t:Destroy()
	local toggleConnection = self._toggleConnection
	
	if toggleConnection then
		toggleConnection:Disconnect()
		self._toggleConnection = nil
	end
	self._container:Destroy()
end

return t