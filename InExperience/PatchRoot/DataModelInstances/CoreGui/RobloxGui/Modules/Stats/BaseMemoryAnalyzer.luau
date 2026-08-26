local color3 = Color3.new(0.35, 0.55, 0.35)
local color3_1 = Color3.new(0.15, 0.35, 0.15)
local color3_2 = Color3.new(1, 1, 1)
local color3_3 = Color3.new(1, 1, 1)
local color3_4 = Color3.new(1, 1, 1)
local uDim2 = UDim2.new(0, 0, 0, 0)
local uDim2_1 = UDim2.new(1, -18, 0, 2)
local uDim2_2 = UDim2.new(0, 16, 0, 16)
local uDim2_3 = UDim2.new(1, -100, 0, 0)
local uDim2_4 = UDim2.new(0, 100, 0, 20)
local _ = game:GetService("CoreGui")

local function _(p1)
	-- upvalues: color3_2 (ref), color3_4 (ref), uDim2_1 (ref), uDim2_2 (ref)
	p1.TextXAlignment = Enum.TextXAlignment.Center
	p1.TextColor3 = color3_2
	p1.BackgroundTransparency = 1
	p1.BorderColor3 = color3_4
	p1.BorderSizePixel = 1
	p1.Position = uDim2_1
	p1.Size = uDim2_2
end

local _ = function(p1)
	-- upvalues: color3_2 (ref)
	p1.TextXAlignment = Enum.TextXAlignment.Left
	p1.TextColor3 = color3_2
	p1.BackgroundTransparency = 1
	p1.Position = UDim2.new(0, 5, 0, 0)
	p1.Size = UDim2.new(1, -10, 1, 0)
end

local _ = function(p1)
	-- upvalues: color3_3 (ref)
	p1.BorderColor3 = color3_3
	p1.BorderSizePixel = 1
	p1.BackgroundTransparency = 0.6
end

local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), uDim2 (ref), color3_3 (ref), color3_2 (ref), color3_4 (ref), uDim2_1 (ref), uDim2_2 (ref), uDim2_3 (ref), uDim2_4 (ref)
	local value = {}
	setmetatable(value, t)
	value._treeViewItem = p1
	value._expanded = true
	value._expansionToggleCallback = nil
	value._frame = Instance.new("Frame")
	value._frame.Name = "MemoryAnalyzerRowClassFrame"
	value._frame.BackgroundTransparency = 1
	value._buttonFrame = Instance.new("Frame")
	value._buttonFrame.Name = "ButtonFrame"
	value._buttonFrame.Parent = value._frame
	value._buttonFrame.Position = uDim2
	local var1 = (1 + p1:getStackDepth()) * 20
	value._buttonFrame.Size = UDim2.new(0, var1, 0, 20)
	local buttonFrame_1 = value._buttonFrame
	buttonFrame_1.BorderColor3 = color3_3
	buttonFrame_1.BorderSizePixel = 1
	buttonFrame_1.BackgroundTransparency = 0.6
	value._button = Instance.new("TextButton")
	value._button.Name = "Button"
	value._button.Parent = value._buttonFrame
	local button_1 = value._button
	button_1.TextXAlignment = Enum.TextXAlignment.Center
	button_1.TextColor3 = color3_2
	button_1.BackgroundTransparency = 1
	button_1.BorderColor3 = color3_4
	button_1.BorderSizePixel = 1
	button_1.Position = uDim2_1
	button_1.Size = uDim2_2
	value._button.MouseButton1Click:connect(function()
		-- upvalues: value (ref)
		value:__toggleExpansion()
	end)
	value:__updateButtonState()
	value._labelFrame = Instance.new("Frame")
	value._labelFrame.Name = "LabelFrame"
	value._labelFrame.Parent = value._frame
	value._labelFrame.Position = UDim2.new(0, var1, 0, 0)
	value._labelFrame.Size = UDim2.new(1, (-var1) - 100, 0, 20)
	local labelFrame_1 = value._labelFrame
	labelFrame_1.BorderColor3 = color3_3
	labelFrame_1.BorderSizePixel = 1
	labelFrame_1.BackgroundTransparency = 0.6
	value._labelTextLabel = Instance.new("TextLabel")
	value._labelTextLabel.Name = "Label"
	value._labelTextLabel.Parent = value._labelFrame
	local labelTextLabel = value._labelTextLabel
	labelTextLabel.TextXAlignment = Enum.TextXAlignment.Left
	labelTextLabel.TextColor3 = color3_2
	labelTextLabel.BackgroundTransparency = 1
	labelTextLabel.Position = UDim2.new(0, 5, 0, 0)
	labelTextLabel.Size = UDim2.new(1, -10, 1, 0)
	value._labelTextLabel.Text = p1:getLabel()
	value._valueFrame = Instance.new("Frame")
	value._valueFrame.Name = "ValueFrame"
	value._valueFrame.Parent = value._frame
	value._valueFrame.Position = uDim2_3
	value._valueFrame.Size = uDim2_4
	local valueFrame_1 = value._valueFrame
	valueFrame_1.BorderColor3 = color3_3
	valueFrame_1.BorderSizePixel = 1
	valueFrame_1.BackgroundTransparency = 0.6
	value._valueTextLabel = Instance.new("TextLabel")
	value._valueTextLabel.Name = "Value"
	value._valueTextLabel.Parent = value._valueFrame
	local valueTextLabel = value._valueTextLabel
	valueTextLabel.TextXAlignment = Enum.TextXAlignment.Left
	valueTextLabel.TextColor3 = color3_2
	valueTextLabel.BackgroundTransparency = 1
	valueTextLabel.Position = UDim2.new(0, 5, 0, 0)
	valueTextLabel.Size = UDim2.new(1, -10, 1, 0)
	value._valueHasBeenNonZero = false
	value:updateValue()
	
	return value
end

function t:isExpanded()
	return self._expanded
end

function t:valueHasBeenNonZero()
	return self._valueHasBeenNonZero
end

function t:setExpansionToggleCallback(p1)
	self._expansionToggleCallback = p1
end

function t:__toggleExpansion()
	self._expanded = not self._expanded
	self:__updateButtonState()
	
	if self._expansionToggleCallback ~= nil then
		self._expansionToggleCallback()
	end
end

function t:__updateButtonState()
	if #self._treeViewItem:getChildren() == 0 then
		self._button.Visible = false
		
		return
	end
	self._button.Visible = true
	
	if self._expanded then
		self._button.Text = "-"
		
		return
	end
	self._button.Text = "+"
end

function t:updateValue()
	if self._treeViewItem:getValue() >= 0.001 then
		self._valueHasBeenNonZero = true
	end
	self._valueTextLabel.Text = string.format("%.3f", self._treeViewItem:getValue())
end

function t:setZIndex(p1)
	self._frame.ZIndex = p1
	self._labelTextLabel.ZIndex = p1
	self._valueTextLabel.ZIndex = p1
end

function t:setRowValue(p1)
	self._valueTextLabel.Text = string.format("%.3f", p1)
end

function t:getFrame()
	return self._frame
end

function t:setRowNumber(p1)
	-- upvalues: color3 (ref), color3_1 (ref)
	if p1 % 2 == 1 then
		self._buttonFrame.BackgroundColor3 = color3
		self._labelFrame.BackgroundColor3 = color3
		self._valueFrame.BackgroundColor3 = color3
		
		return
	end
	self._buttonFrame.BackgroundColor3 = color3_1
	self._labelFrame.BackgroundColor3 = color3_1
	self._valueFrame.BackgroundColor3 = color3_1
end

local t_1 = {}
t_1.__index = t_1
t_1.Indent = string.rep(" ", 4)

function t_1.new(p1)
	-- upvalues: t_1 (ref)
	local memoryAnalyzerClassFrame = {}
	setmetatable(memoryAnalyzerClassFrame, t_1)
	memoryAnalyzerClassFrame._frame = Instance.new("Frame")
	memoryAnalyzerClassFrame._frame.Name = "MemoryAnalyzerClassFrame"
	memoryAnalyzerClassFrame._frame.ZIndex = p1.ZIndex
	memoryAnalyzerClassFrame._frame.BackgroundTransparency = 1
	memoryAnalyzerClassFrame._rowsByTreeViewItem = {}
	memoryAnalyzerClassFrame._layoutDirty = false
	memoryAnalyzerClassFrame._heightChangedCallback = nil
	memoryAnalyzerClassFrame._heightInPix = 0
	memoryAnalyzerClassFrame._frame.Parent = p1
	
	return memoryAnalyzerClassFrame
end

function t_1.getMemoryUsageTree(_)
	return nil
end

function t_1:setHeightChangedCallback(p1)
	self._heightChangedCallback = p1
end

function t_1:__getOrMakeRowForTreeViewItem(p1)
	-- upvalues: t (ref)
	if self._rowsByTreeViewItem[p1] == nil then
		local var1 = t.new(p1)
		var1:setExpansionToggleCallback(function()
			-- upvalues: self (ref)
			self:__layoutRows()
		end)
		var1:getFrame().Parent = self._frame
		self._rowsByTreeViewItem[p1] = var1
		self._layoutDirty = true
	end
	return self._rowsByTreeViewItem[p1]
end

function t_1:__recursiveUpdateStatValue(p1)
	self:__getOrMakeRowForTreeViewItem(p1):updateValue()
	
	for i, v in ipairs(p1:getChildren()) do
		self:__recursiveUpdateStatValue(v)
	end
end

function t_1:renderUpdates()
	local memoryUsageTree = self:getMemoryUsageTree()
	
	if memoryUsageTree ~= nil then
		self:__recursiveUpdateStatValue(memoryUsageTree)
	end
	if self._layoutDirty then
		self:__layoutRows()
	end
end

function t_1:__layoutRows()
	self._layoutDirty = false
	self._heightInPix = 0
	
	if self:getMemoryUsageTree() ~= nil then
		self:__recursiveLayoutTreeViewItem(self:getMemoryUsageTree(), true)
	end
	self._frame.Size = UDim2.new(1, 0, 0, self._heightInPix)
	self._frame.Position = UDim2.new(0, 0, 0, 0)
	
	if self._heightChangedCallback then
		self._heightChangedCallback(self._heightInPix)
	end
end

function t_1:__recursiveLayoutTreeViewItem(p2, p3)
	local var1 = self:__getOrMakeRowForTreeViewItem(p2)
	local frame = var1:getFrame()
	local var2 = p3 and var1:valueHasBeenNonZero()
	
	if var2 then
		frame.Visible = true
		frame.Size = UDim2.new(1, 0, 0, 20)
		frame.Position = UDim2.new(0, 0, 0, self._heightInPix)
		var1:setZIndex(self._frame.ZIndex)
		var1:setRowNumber(self._heightInPix / 20)
		self._heightInPix += 20
	else
		frame.Visible = false
	end
	for i, v in ipairs(p2:getChildren()) do
		self:__recursiveLayoutTreeViewItem(v, var1:isExpanded() and var2)
	end
end

function t_1:getHeightInPix()
	return self._heightInPix
end

return t_1