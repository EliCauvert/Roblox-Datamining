local collectionService = game:GetService("CollectionService")
local runService = game:GetService("RunService")
local cryoModule = require(script:FindFirstAncestor("Impressions").Parent.Cryo)
local constantsModule = require(script.Parent.Constants)
local debugEnableImpressionsVisualizer = game:DefineFastFlag("DebugEnableImpressionsVisualizer", false)
local list = {
	Color3.new(0.941176, 0.941176, 0.015686),
	Color3.new(0.890196, 0.058823, 0.058823),
	Color3.new(0.031372, 0.870588, 0.031372),
	Color3.new(0.866666, 0.039215, 0.647058),
	Color3.new(0.035294, 0.631372, 0.866666),
	Color3.new(0.882352, 0.556862, 0.035294),
	Color3.new(0.729411, 0.043137, 0.835294)
}
local var1 = 1
local _ = {
	None = "None",
	Highlight = "Highlight",
	FadeOut = "FadeOut"
}
local t = {
	BackgroundTransparency = 0,
	BorderSizePixel = 15,
	ZIndex = 100,
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderMode = Enum.BorderMode.Outline
}
local t_1 = { BackgroundTransparency = 0.65, BorderSizePixel = 8 }
local t_2 = {}
t_2.__index = t_2

local function getTaggedInstances(p1)
	-- upvalues: collectionService (ref), constantsModule (ref)
	local t = {}
	
	for i, v in ipairs(collectionService:GetTagged(p1)) do
		local itemIndexAttribute = v:GetAttribute(constantsModule.ItemIndex)
		
		if itemIndexAttribute and v:IsA("GuiObject") then
			t[itemIndexAttribute] = v
		end
	end
	return t
end

function t_2.new(p2, p3)
	-- upvalues: list (ref), var1 (write), t_2 (ref), debugEnableImpressionsVisualizer (ref), runService (ref)
	local t = {
		impressionsTag = p2,
		highlightedInstances = {},
		originalInstances = {},
		highlightColor = list[var1],
		customKeyMapper = p3 or function(p4)
			return p4
		end
	}
	setmetatable(t, t_2)
	
	if debugEnableImpressionsVisualizer then
		var1 += 1
		
		if #list < var1 then
			var1 %= #list
		end
		if p2 then
			local var2 = nil
			t.renderConnection = runService.RenderStepped:Connect(function(p4)
				-- upvalues: t (ref), var2 (write)
				if t then
					t:_step(p4)
					
					return
				elseif var2 then
					var2:Disconnect()
				end
			end)
		end
	end
	return t
end

function t_2:destroy()
	if self.renderConnection then
		self.renderConnection:Disconnect()
	end
end

function t_2:_startHighlightState(p2, p3, p4, p5, p6)
	local var2 = self.highlightedInstances[p2]
	
	if var2 == nil then
		self.highlightedInstances[p2] = { highlightState = p3, currentFields = {} }
		var2 = self.highlightedInstances[p2]
	else
		var2.highlightState = p3
	end
	var2.totalDuration = p4
	var2.duration = p4
	var2.doLerp = p6
	
	if p6 then
		local t = {}
		local t_1 = {}
		
		for i, v in pairs(p5) do
			t[i] = var2.currentFields[i]
			t_1[i] = v
		end
		var2.startFields = t
		var2.targetFields = t_1
	else
		var2.startFields = nil
		var2.targetFields = nil
		
		for i, v in pairs(p5) do
			var2.currentFields[i] = v
		end
	end
	self.highlightedInstances[p2] = var2
end

function t_2:_step(p7)
	-- upvalues: t_1 (ref), getTaggedInstances (ref), t (ref)
	assert(self.impressionsTag, "impressionsTag is nil")
	
	for i, v in pairs(self.highlightedInstances) do
		if v.doLerp and v.duration ~= nil and v.totalDuration ~= nil then
			assert(v.startFields, "startFields is nil")
			assert(v.targetFields, "targetFields is nil")
			
			if v.duration <= 0 then
				v.doLerp = nil
				v.duration = nil
				
				for i_1, v_1 in pairs(v.targetFields) do
					v.currentFields[i_1] = v_1
				end
			else
				local clampedValue = math.clamp((v.totalDuration - v.duration) / v.totalDuration, 0, 1)
				
				for v_1, v_4 in pairs(v.targetFields) do
					local var3 = v.startFields[v_1]
					v.currentFields[v_1] = var3 + (v_4 - var3) * clampedValue
				end
			end
		end
		if v.highlightState == "Highlight" then
			assert(v.duration ~= nil, "duration is nil")
			
			if v.duration <= 0 then
				self:_startHighlightState(i, "FadeOut", 2.5, t_1, true)
			end
		end
		if v.duration then
			v.duration -= p7
		end
	end
	for i_1, v_1 in pairs(getTaggedInstances(self.impressionsTag)) do
		if v_1 ~= nil then
			if self.originalInstances[v_1] == nil then
				self.originalInstances[v_1] = {}
				
				for i_2, v_2 in pairs(t) do
					self.originalInstances[v_1][i_2] = v_1[i_2]
				end
			end
			local var4 = self.customKeyMapper(i_1)
			local var5 = self.highlightedInstances[var4]
			
			if var5 == nil then
				var5 = { highlightState = "None", currentFields = {} }
				assert(self.originalInstances[v_1], "self.originalInstances[instance] is nil")
				
				for i_2, v_2 in pairs(self.originalInstances[v_1]) do
					var5.currentFields[i_2] = v_2
				end
				self.highlightedInstances[var4] = var5
			end
			assert(var5 ~= nil, "stateData is nil")
			
			if var5.currentFields then
				for i_2, v_2 in pairs(var5.currentFields) do
					v_1[i_2] = v_2
				end
			end
		end
	end
end

function t_2:_highlightImpression(p8)
	-- upvalues: cryoModule (ref), t (ref)
	if self.highlightedInstances[p8] == nil or self.highlightedInstances[p8].highlightState == "None" then
		self:_startHighlightState(p8, "Highlight", 1, cryoModule.Dictionary.join(t, {
			BackgroundColor3 = self.highlightColor,
			BorderColor3 = self.highlightColor
		}), false)
		
		return
	end
end

function t_2:_clearImpression(p8)
	self.highlightedInstances[p8] = nil
end

function t_2:onSendImpressions(p8)
	-- upvalues: debugEnableImpressionsVisualizer (ref)
	if not debugEnableImpressionsVisualizer then return end
	if not self.impressionsTag or p8 == nil or #p8 <= 0 then return end
	for i, v in ipairs(p8) do
		self:_highlightImpression(self.customKeyMapper(v))
	end
end

function t_2:onClearImpressions(p9)
	-- upvalues: debugEnableImpressionsVisualizer (ref)
	if not debugEnableImpressionsVisualizer then return end
	if not self.impressionsTag or p9 == nil or #p9 <= 0 then return end
	for i, v in ipairs(p9) do
		self:_clearImpression(self.customKeyMapper(v))
	end
end

function t_2:onClearAllImpressions()
	-- upvalues: debugEnableImpressionsVisualizer (ref)
	if not debugEnableImpressionsVisualizer then return end
	if not self.impressionsTag then return end
	for i, v in pairs(self.originalInstances) do
		for i_1, v_1 in pairs(v) do
			i[i_1] = v_1
		end
	end
	self.highlightedInstances = {}
	self.originalInstances = {}
end

function t_2:setCustomKeyMapper(p10)
	self.customKeyMapper = p10 or function(p11)
		return p11
	end
end

function t_2:setImpressionsTag(p10)
	self.impressionsTag = p10
end

return t_2