local CollectionService = game:GetService("CollectionService")
local RunService = game:GetService("RunService")
local CryoModule = require(script:FindFirstAncestor("Impressions").Parent.Cryo)
local ConstantsModule = require(script.Parent.Constants)
local DebugEnableImpressionsVisualizer = game:DefineFastFlag("DebugEnableImpressionsVisualizer", false)
local list = {
	Color3.new(0.941176, 0.941176, 0.015686),
	Color3.new(0.890196, 0.058823, 0.058823),
	Color3.new(0.031372, 0.870588, 0.031372),
	Color3.new(0.866666, 0.039215, 0.647058),
	Color3.new(0.035294, 0.631372, 0.866666),
	Color3.new(0.882352, 0.556862, 0.035294),
	Color3.new(0.729411, 0.043137, 0.835294)
}
local Count = 1
local config = {
	BackgroundTransparency = 0,
	BorderSizePixel = 15,
	ZIndex = 100,
	BackgroundColor3 = Color3.new(1, 1, 1),
	BorderColor3 = Color3.new(1, 1, 1),
	BorderMode = Enum.BorderMode.Outline
}
local config1 = { BackgroundTransparency = 0.65, BorderSizePixel = 8 }
local ImpressionsVisualizerModule = {}
ImpressionsVisualizerModule.__index = ImpressionsVisualizerModule

local function getTaggedInstances(Tag)
	-- upvalues: CollectionService (copy), ConstantsModule (copy)
	local Guis = {}
	
	for _, Gui in ipairs((CollectionService:GetTagged(Tag))) do
		local Attribute = Gui:GetAttribute(ConstantsModule.ItemIndex)
		
		if Attribute and Gui:IsA("GuiObject") then
			Guis[Attribute] = Gui
		end
	end
	return Guis
end

function ImpressionsVisualizerModule.new(ImpressionsTag, p1)
	-- upvalues: list (copy), Count (ref), ImpressionsVisualizerModule (copy), DebugEnableImpressionsVisualizer (copy), RunService (copy)
	local config = {
		impressionsTag = ImpressionsTag,
		highlightedInstances = {},
		originalInstances = {},
		highlightColor = list[Count],
		customKeyMapper = p1 or function(p2)
			return p2
		end
	}
	setmetatable(config, ImpressionsVisualizerModule)
	
	if DebugEnableImpressionsVisualizer then
		Count += 1
		
		if #list < Count then
			Count %= #list
		end
		if ImpressionsTag then
			local Connection = nil
			Connection = RunService.RenderStepped:Connect(function(DeltaTime)
				-- upvalues: config (copy), Connection (ref)
				if config then
					config:_step(DeltaTime)
					
					return
				end
				if Connection then
					Connection:Disconnect()
				end
			end)
			config.renderConnection = Connection
		end
	end
	return config
end

function ImpressionsVisualizerModule:destroy()
	if self.renderConnection then
		self.renderConnection:Disconnect()
	end
end

function ImpressionsVisualizerModule:_startHighlightState(p1, HighlightState, Duration, List, DoLerp)
	local HighlightedInstance = self.highlightedInstances[p1]
	
	if HighlightedInstance == nil then
		self.highlightedInstances[p1] = { highlightState = HighlightState, currentFields = {} }
		HighlightedInstance = self.highlightedInstances[p1]
	else
		HighlightedInstance.highlightState = HighlightState
	end
	HighlightedInstance.totalDuration = Duration
	HighlightedInstance.duration = Duration
	HighlightedInstance.doLerp = DoLerp
	
	if DoLerp then
		local StartFields = {}
		local TargetFields = {}
		
		for i, value in pairs(List) do
			StartFields[i] = HighlightedInstance.currentFields[i]
			TargetFields[i] = value
		end
		HighlightedInstance.startFields = StartFields
		HighlightedInstance.targetFields = TargetFields
	else
		HighlightedInstance.startFields = nil
		HighlightedInstance.targetFields = nil
		
		for i1, value1 in pairs(List) do
			HighlightedInstance.currentFields[i1] = value1
		end
	end
	self.highlightedInstances[p1] = HighlightedInstance
end

function ImpressionsVisualizerModule:_step(p2)
	-- upvalues: config1 (copy), getTaggedInstances (copy), config (copy)
	assert(self.impressionsTag, "impressionsTag is nil")
	
	for i, highlightedInstance in pairs(self.highlightedInstances) do
		if highlightedInstance.doLerp and highlightedInstance.duration ~= nil and highlightedInstance.totalDuration ~= nil then
			assert(highlightedInstance.startFields, "startFields is nil")
			assert(highlightedInstance.targetFields, "targetFields is nil")
			
			if highlightedInstance.duration <= 0 then
				highlightedInstance.doLerp = nil
				highlightedInstance.duration = nil
				
				for i1, targetField in pairs(highlightedInstance.targetFields) do
					highlightedInstance.currentFields[i1] = targetField
				end
			else
				local ClampedValue = math.clamp((highlightedInstance.totalDuration - highlightedInstance.duration) / highlightedInstance.totalDuration, 0, 1)
				
				for i2, targetField1 in pairs(highlightedInstance.targetFields) do
					local StartField = highlightedInstance.startFields[i2]
					highlightedInstance.currentFields[i2] = StartField + (targetField1 - StartField) * ClampedValue
				end
			end
		end
		if highlightedInstance.highlightState == "Highlight" then
			assert(highlightedInstance.duration ~= nil, "duration is nil")
			
			if highlightedInstance.duration <= 0 then
				self:_startHighlightState(i, "FadeOut", 2.5, config1, true)
			end
		end
		if highlightedInstance.duration then
			highlightedInstance.duration -= p2
		end
	end
	for i3, value in pairs((getTaggedInstances(self.impressionsTag))) do
		if value ~= nil then
			if self.originalInstances[value] == nil then
				self.originalInstances[value] = {}
				
				for i4, _ in pairs(config) do
					self.originalInstances[value][i4] = value[i4]
				end
			end
			local CustomKeyMapperResult = self.customKeyMapper(i3)
			local HighlightedInstance = self.highlightedInstances[CustomKeyMapperResult]
			
			if HighlightedInstance == nil then
				HighlightedInstance = { highlightState = "None", currentFields = {} }
				assert(self.originalInstances[value], "self.originalInstances[instance] is nil")
				
				for i5, value1 in pairs(self.originalInstances[value]) do
					HighlightedInstance.currentFields[i5] = value1
				end
				self.highlightedInstances[CustomKeyMapperResult] = HighlightedInstance
			end
			assert(HighlightedInstance ~= nil, "stateData is nil")
			
			if HighlightedInstance.currentFields then
				for i6, currentField in pairs(HighlightedInstance.currentFields) do
					value[i6] = currentField
				end
			end
		end
	end
end

function ImpressionsVisualizerModule:_highlightImpression(CustomKeyMapperResult)
	-- upvalues: CryoModule (copy), config (copy)
	if self.highlightedInstances[CustomKeyMapperResult] == nil or self.highlightedInstances[CustomKeyMapperResult].highlightState == "None" then
		self:_startHighlightState(CustomKeyMapperResult, "Highlight", 1, CryoModule.Dictionary.join(config, {
			BackgroundColor3 = self.highlightColor,
			BorderColor3 = self.highlightColor
		}), false)
		
		return
	end
end

function ImpressionsVisualizerModule:_clearImpression(CustomKeyMapperResult)
	self.highlightedInstances[CustomKeyMapperResult] = nil
end

function ImpressionsVisualizerModule:onSendImpressions(List)
	-- upvalues: DebugEnableImpressionsVisualizer (copy)
	if not DebugEnableImpressionsVisualizer then return end
	if not self.impressionsTag or List == nil or #List <= 0 then return end
	for _, value in ipairs(List) do
		self:_highlightImpression((self.customKeyMapper(value)))
	end
end

function ImpressionsVisualizerModule:onClearImpressions(List)
	-- upvalues: DebugEnableImpressionsVisualizer (copy)
	if not DebugEnableImpressionsVisualizer then return end
	if not self.impressionsTag or List == nil or #List <= 0 then return end
	for _, value in ipairs(List) do
		self:_clearImpression((self.customKeyMapper(value)))
	end
end

function ImpressionsVisualizerModule:onClearAllImpressions()
	-- upvalues: DebugEnableImpressionsVisualizer (copy)
	if not DebugEnableImpressionsVisualizer then return end
	if not self.impressionsTag then return end
	for i, originalInstance in pairs(self.originalInstances) do
		for i1, value in pairs(originalInstance) do
			i[i1] = value
		end
	end
	self.highlightedInstances = {}
	self.originalInstances = {}
end

function ImpressionsVisualizerModule:setCustomKeyMapper(p3)
	self.customKeyMapper = p3 or function(p4)
		return p4
	end
end

function ImpressionsVisualizerModule:setImpressionsTag(ImpressionsTag)
	self.impressionsTag = ImpressionsTag
end

return ImpressionsVisualizerModule