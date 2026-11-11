local _Color3 = Color3.new(0.35, 0.55, 0.35)
local _Color3_1 = Color3.new(0.15, 0.35, 0.15)
local _Color3_2 = Color3.new(1, 1, 1)
local _Color3_3 = Color3.new(1, 1, 1)
local _Color3_4 = Color3.new(1, 1, 1)
local _UDim2 = UDim2.new(0, 0, 0, 0)
local _UDim2_1 = UDim2.new(1, -18, 0, 2)
local _UDim2_2 = UDim2.new(0, 16, 0, 16)
local _UDim2_3 = UDim2.new(1, -100, 0, 0)
local _UDim2_4 = UDim2.new(0, 100, 0, 20)
local _ = game:GetService("CoreGui")

local function _(Label)
	-- upvalues: _Color3_2 (copy), _Color3_4 (copy), _UDim2_1 (copy), _UDim2_2 (copy)
	Label.TextXAlignment = Enum.TextXAlignment.Center
	Label.TextColor3 = _Color3_2
	Label.BackgroundTransparency = 1
	Label.BorderColor3 = _Color3_4
	Label.BorderSizePixel = 1
	Label.Position = _UDim2_1
	Label.Size = _UDim2_2
end

local _ = function(Label)
	-- upvalues: _Color3_2 (copy)
	Label.TextXAlignment = Enum.TextXAlignment.Left
	Label.TextColor3 = _Color3_2
	Label.BackgroundTransparency = 1
	Label.Position = UDim2.new(0, 5, 0, 0)
	Label.Size = UDim2.new(1, -10, 1, 0)
end

local _ = function(p1)
	-- upvalues: _Color3_3 (copy)
	p1.BorderColor3 = _Color3_3
	p1.BorderSizePixel = 1
	p1.BackgroundTransparency = 0.6
end

local Module = {}
Module.__index = Module

function Module.new(_treeViewItem)
	-- upvalues: Module (copy), _UDim2 (copy), _Color3_3 (copy), _Color3_2 (copy), _Color3_4 (copy), _UDim2_1 (copy), _UDim2_2 (copy), _UDim2_3 (copy), _UDim2_4 (copy)
	local t = {}
	setmetatable(t, Module)
	t._treeViewItem = _treeViewItem
	t._expanded = true
	t._expansionToggleCallback = nil
	t._frame = Instance.new("Frame")
	t._frame.Name = "MemoryAnalyzerRowClassFrame"
	t._frame.BackgroundTransparency = 1
	t._buttonFrame = Instance.new("Frame")
	t._buttonFrame.Name = "ButtonFrame"
	t._buttonFrame.Parent = t._frame
	t._buttonFrame.Position = _UDim2
	local ScaledStackDepth = (1 + _treeViewItem:getStackDepth()) * 20
	t._buttonFrame.Size = UDim2.new(0, ScaledStackDepth, 0, 20)
	local ButtonFrame = t._buttonFrame
	ButtonFrame.BorderColor3 = _Color3_3
	ButtonFrame.BorderSizePixel = 1
	ButtonFrame.BackgroundTransparency = 0.6
	t._button = Instance.new("TextButton")
	t._button.Name = "Button"
	t._button.Parent = t._buttonFrame
	local Button = t._button
	Button.TextXAlignment = Enum.TextXAlignment.Center
	Button.TextColor3 = _Color3_2
	Button.BackgroundTransparency = 1
	Button.BorderColor3 = _Color3_4
	Button.BorderSizePixel = 1
	Button.Position = _UDim2_1
	Button.Size = _UDim2_2
	t._button.MouseButton1Click:connect(function()
		-- upvalues: t (copy)
		t:__toggleExpansion()
	end)
	t:__updateButtonState()
	t._labelFrame = Instance.new("Frame")
	t._labelFrame.Name = "LabelFrame"
	t._labelFrame.Parent = t._frame
	t._labelFrame.Position = UDim2.new(0, ScaledStackDepth, 0, 0)
	t._labelFrame.Size = UDim2.new(1, -ScaledStackDepth - 100, 0, 20)
	local LabelFrame = t._labelFrame
	LabelFrame.BorderColor3 = _Color3_3
	LabelFrame.BorderSizePixel = 1
	LabelFrame.BackgroundTransparency = 0.6
	t._labelTextLabel = Instance.new("TextLabel")
	t._labelTextLabel.Name = "Label"
	t._labelTextLabel.Parent = t._labelFrame
	local LabelTextLabel = t._labelTextLabel
	LabelTextLabel.TextXAlignment = Enum.TextXAlignment.Left
	LabelTextLabel.TextColor3 = _Color3_2
	LabelTextLabel.BackgroundTransparency = 1
	LabelTextLabel.Position = UDim2.new(0, 5, 0, 0)
	LabelTextLabel.Size = UDim2.new(1, -10, 1, 0)
	t._labelTextLabel.Text = _treeViewItem:getLabel()
	t._valueFrame = Instance.new("Frame")
	t._valueFrame.Name = "ValueFrame"
	t._valueFrame.Parent = t._frame
	t._valueFrame.Position = _UDim2_3
	t._valueFrame.Size = _UDim2_4
	local ValueFrame = t._valueFrame
	ValueFrame.BorderColor3 = _Color3_3
	ValueFrame.BorderSizePixel = 1
	ValueFrame.BackgroundTransparency = 0.6
	t._valueTextLabel = Instance.new("TextLabel")
	t._valueTextLabel.Name = "Value"
	t._valueTextLabel.Parent = t._valueFrame
	local ValueTextLabel = t._valueTextLabel
	ValueTextLabel.TextXAlignment = Enum.TextXAlignment.Left
	ValueTextLabel.TextColor3 = _Color3_2
	ValueTextLabel.BackgroundTransparency = 1
	ValueTextLabel.Position = UDim2.new(0, 5, 0, 0)
	ValueTextLabel.Size = UDim2.new(1, -10, 1, 0)
	t._valueHasBeenNonZero = false
	t:updateValue()
	
	return t
end

function Module:isExpanded()
	return self._expanded
end

function Module:valueHasBeenNonZero()
	return self._valueHasBeenNonZero
end

function Module:setExpansionToggleCallback(_expansionToggleCallback)
	self._expansionToggleCallback = _expansionToggleCallback
end

function Module:__toggleExpansion()
	self._expanded = not self._expanded
	self:__updateButtonState()
	
	if self._expansionToggleCallback ~= nil then
		self._expansionToggleCallback()
	end
end

function Module:__updateButtonState()
	if #self._treeViewItem:getChildren() == 0 then
		self._button.Visible = false
		
		return
	end
	self._button.Visible = true
	
	if self._expanded then
		self._button.Text = "-"
		
		return
	else
		self._button.Text = "+"
	end
end

function Module:updateValue()
	if self._treeViewItem:getValue() >= 0.001 then
		self._valueHasBeenNonZero = true
	end
	self._valueTextLabel.Text = string.format("%.3f", self._treeViewItem:getValue())
end

function Module:setZIndex(ZIndex)
	self._frame.ZIndex = ZIndex
	self._labelTextLabel.ZIndex = ZIndex
	self._valueTextLabel.ZIndex = ZIndex
end

function Module:setRowValue(p1)
	self._valueTextLabel.Text = string.format("%.3f", p1)
end

function Module:getFrame()
	return self._frame
end

function Module:setRowNumber(HeightInPixRatio: number)
	-- upvalues: _Color3 (copy), _Color3_1 (copy)
	if HeightInPixRatio % 2 == 1 then
		self._buttonFrame.BackgroundColor3 = _Color3
		self._labelFrame.BackgroundColor3 = _Color3
		self._valueFrame.BackgroundColor3 = _Color3
		
		return
	else
		self._buttonFrame.BackgroundColor3 = _Color3_1
		self._labelFrame.BackgroundColor3 = _Color3_1
		self._valueFrame.BackgroundColor3 = _Color3_1
	end
end

local BaseMemoryAnalyzerModule = {}
BaseMemoryAnalyzerModule.__index = BaseMemoryAnalyzerModule
BaseMemoryAnalyzerModule.Indent = string.rep(" ", 4)

function BaseMemoryAnalyzerModule.new(Parent)
	-- upvalues: BaseMemoryAnalyzerModule (copy)
	local t = {}
	setmetatable(t, BaseMemoryAnalyzerModule)
	t._frame = Instance.new("Frame")
	t._frame.Name = "MemoryAnalyzerClassFrame"
	t._frame.ZIndex = Parent.ZIndex
	t._frame.BackgroundTransparency = 1
	t._rowsByTreeViewItem = {}
	t._layoutDirty = false
	t._heightChangedCallback = nil
	t._heightInPix = 0
	t._frame.Parent = Parent
	
	return t
end

function BaseMemoryAnalyzerModule:getMemoryUsageTree()
	return nil
end

function BaseMemoryAnalyzerModule:setHeightChangedCallback(_heightChangedCallback)
	self._heightChangedCallback = _heightChangedCallback
end

function BaseMemoryAnalyzerModule:__getOrMakeRowForTreeViewItem(TreeViewItem)
	-- upvalues: Module (copy)
	if self._rowsByTreeViewItem[TreeViewItem] == nil then
		local NewModule = Module.new(TreeViewItem)
		NewModule:setExpansionToggleCallback(function()
			-- upvalues: self (copy)
			self:__layoutRows()
		end)
		NewModule:getFrame().Parent = self._frame
		self._rowsByTreeViewItem[TreeViewItem] = NewModule
		self._layoutDirty = true
	end
	return self._rowsByTreeViewItem[TreeViewItem]
end

function BaseMemoryAnalyzerModule:__recursiveUpdateStatValue(MemoryUsageTree)
	self:__getOrMakeRowForTreeViewItem(MemoryUsageTree):updateValue()
	
	for _, child in ipairs((MemoryUsageTree:getChildren())) do
		self:__recursiveUpdateStatValue(child)
	end
end

function BaseMemoryAnalyzerModule:renderUpdates()
	local MemoryUsageTree = self:getMemoryUsageTree()
	
	if MemoryUsageTree ~= nil then
		self:__recursiveUpdateStatValue(MemoryUsageTree)
	end
	if self._layoutDirty then
		self:__layoutRows()
	end
end

function BaseMemoryAnalyzerModule:__layoutRows()
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

function BaseMemoryAnalyzerModule:__recursiveLayoutTreeViewItem(MemoryUsageTree, p1)
	local OrMakeRowForTreeViewItem = self:__getOrMakeRowForTreeViewItem(MemoryUsageTree)
	local Frame = OrMakeRowForTreeViewItem:getFrame()
	local ValueHasBeenNonZeroResult = p1 and OrMakeRowForTreeViewItem:valueHasBeenNonZero()
	
	if ValueHasBeenNonZeroResult then
		Frame.Visible = true
		Frame.Size = UDim2.new(1, 0, 0, 20)
		Frame.Position = UDim2.new(0, 0, 0, self._heightInPix)
		OrMakeRowForTreeViewItem:setZIndex(self._frame.ZIndex)
		OrMakeRowForTreeViewItem:setRowNumber(self._heightInPix / 20)
		self._heightInPix += 20
	else
		Frame.Visible = false
	end
	for _, child in ipairs((MemoryUsageTree:getChildren())) do
		self:__recursiveLayoutTreeViewItem(child, OrMakeRowForTreeViewItem:isExpanded() and ValueHasBeenNonZeroResult)
	end
end

function BaseMemoryAnalyzerModule:getHeightInPix()
	return self._heightInPix
end

return BaseMemoryAnalyzerModule