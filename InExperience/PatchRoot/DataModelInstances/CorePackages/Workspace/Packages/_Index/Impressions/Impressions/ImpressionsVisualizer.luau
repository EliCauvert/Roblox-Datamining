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
local var6 = 1
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

local function getTaggedInstances(p0) --[[ line: 82 ]]
	-- upvalues: collectionService (ref), constantsModule (ref)
	local t = {}
	
	for i, v in ipairs(collectionService:GetTagged(p0)) do
		local itemIndexAttribute = v:GetAttribute(constantsModule.ItemIndex)
		
		if itemIndexAttribute and v:IsA("GuiObject") then
			t[itemIndexAttribute] = v
		end
	end
	return t
end

function t_2.new(p1, p2) --[[ line: 95 ]]
	-- upvalues: list (ref), var6 (write), t_2 (ref), debugEnableImpressionsVisualizer (ref), runService (ref)
	local t = {
		impressionsTag = p1,
		highlightedInstances = {},
		originalInstances = {},
		highlightColor = list[var6],
		customKeyMapper = p2 or function(p3) --[[ line: 101 ]]
			return p3
		end
	}
	setmetatable(t, t_2)
	
	if debugEnableImpressionsVisualizer then
		var6 += 1
		
		if #list < var6 then
			var6 %= #list
		end
		if p1 then
			local var14 = nil
			t.renderConnection = runService.RenderStepped:Connect(function(p4) --[[ line: 115 ]]
				-- upvalues: t (ref), var14 (write)
				if t then
					t:_step(p4)
					
					return
				elseif var14 then
					var14:Disconnect()
				end
			end)
		end
	end
	return t
end

function t_2:destroy() --[[ line: 131 ]]
	if self.renderConnection then
		self.renderConnection:Disconnect()
	end
end

function t_2:_startHighlightState(p5, p6, p7, p8, p9) --[[ line: 137 ]]
	local var15 = self.highlightedInstances[p5]
	
	if var15 == nil then
		self.highlightedInstances[p5] = { highlightState = p6, currentFields = {} }
		var15 = self.highlightedInstances[p5]
	else
		var15.highlightState = p6
	end
	var15.totalDuration = p7
	var15.duration = p7
	var15.doLerp = p9
	
	if p9 then
		local t = {}
		local t_1 = {}
		
		for i, v in pairs(p8) do
			t[i] = var15.currentFields[i]
			t_1[i] = v
		end
		var15.startFields = t
		var15.targetFields = t_1
	else
		var15.startFields = nil
		var15.targetFields = nil
		
		for i, v in pairs(p8) do
			var15.currentFields[i] = v
		end
	end
	self.highlightedInstances[p5] = var15
end

function t_2:_step(p10) --[[ line: 172 ]]
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
					local var21 = v.startFields[v_1]
					v.currentFields[v_1] = var21 + (v_4 - var21) * clampedValue
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
			v.duration -= p10
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
			local var18 = self.customKeyMapper(i_1)
			local var19 = self.highlightedInstances[var18]
			
			if var19 == nil then
				var19 = { highlightState = "None", currentFields = {} }
				assert(self.originalInstances[v_1], "self.originalInstances[instance] is nil")
				
				for i_2, v_2 in pairs(self.originalInstances[v_1]) do
					var19.currentFields[i_2] = v_2
				end
				self.highlightedInstances[var18] = var19
			end
			assert(var19 ~= nil, "stateData is nil")
			
			if var19.currentFields then
				for i_2, v_2 in pairs(var19.currentFields) do
					v_1[i_2] = v_2
				end
			end
		end
	end
end

function t_2:_highlightImpression(p11) --[[ line: 260 ]]
	-- upvalues: cryoModule (ref), t (ref)
	if self.highlightedInstances[p11] == nil or self.highlightedInstances[p11].highlightState == "None" then
		self:_startHighlightState(p11, "Highlight", 1, cryoModule.Dictionary.join(t, {
			BackgroundColor3 = self.highlightColor,
			BorderColor3 = self.highlightColor
		}), false)
		
		return
	end
end

function t_2:_clearImpression(p12) --[[ line: 275 ]]
	self.highlightedInstances[p12] = nil
end

function t_2:onSendImpressions(p13) --[[ line: 279 ]]
	-- upvalues: debugEnableImpressionsVisualizer (ref)
	if not debugEnableImpressionsVisualizer then return end
	if not self.impressionsTag or p13 == nil or #p13 <= 0 then return end
	for i, v in ipairs(p13) do
		self:_highlightImpression(self.customKeyMapper(v))
	end
end

function t_2:onClearImpressions(p14) --[[ line: 294 ]]
	-- upvalues: debugEnableImpressionsVisualizer (ref)
	if not debugEnableImpressionsVisualizer then return end
	if not self.impressionsTag or p14 == nil or #p14 <= 0 then return end
	for i, v in ipairs(p14) do
		self:_clearImpression(self.customKeyMapper(v))
	end
end

function t_2:onClearAllImpressions() --[[ line: 309 ]]
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

function t_2:setCustomKeyMapper(p15) --[[ line: 329 ]]
	self.customKeyMapper = p15 or function(p16) --[[ line: 330 ]]
		return p16
	end
end

function t_2:setImpressionsTag(p17) --[[ line: 335 ]]
	self.impressionsTag = p17
end

return t_2