local CoreGui = game:GetService("CoreGui")
local BaseMemoryAnalyzerModule = require(CoreGui.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local TreeViewItemModule = require(CoreGui.RobloxGui.Modules.Stats.TreeViewItem)
local _ = require(CoreGui.RobloxGui.Modules.Common.CommonUtil)

local function __ReadAndSumValues(CoreTreeViewItem, List): number
	local Total = 0
	
	for i, value in pairs(List) do
		local Amount = value / 1048576
		Total += Amount
		CoreTreeViewItem:getOrMakeChildById(i):setLabelAndValue(i, Amount)
	end
	return Total
end

local ServerMemoryAnalyzerModule = {}
setmetatable(ServerMemoryAnalyzerModule, BaseMemoryAnalyzerModule)
ServerMemoryAnalyzerModule.__index = ServerMemoryAnalyzerModule

function ServerMemoryAnalyzerModule.new(p1)
	-- upvalues: BaseMemoryAnalyzerModule (copy), ServerMemoryAnalyzerModule (copy)
	local NewBaseMemoryAnalyzer = BaseMemoryAnalyzerModule.new(p1)
	setmetatable(NewBaseMemoryAnalyzer, ServerMemoryAnalyzerModule)
	NewBaseMemoryAnalyzer._cachedRootTreeViewItem = nil
	NewBaseMemoryAnalyzer._coreTreeViewItem = nil
	NewBaseMemoryAnalyzer._placeTreeViewItem = nil
	NewBaseMemoryAnalyzer._untrackedTreeViewItem = nil
	NewBaseMemoryAnalyzer._isVisible = false
	
	return NewBaseMemoryAnalyzer
end

function ServerMemoryAnalyzerModule:filterServerMemoryTreeStats(p1)
	return if p1.ServerMemoryTree == nil then {} else p1.ServerMemoryTree
end

function ServerMemoryAnalyzerModule:updateWithTreeStats(List)
	-- upvalues: TreeViewItemModule (copy), __ReadAndSumValues (copy)
	local v1 = 0
	
	if self._cachedRootTreeViewItem == nil then
		self._cachedRootTreeViewItem = TreeViewItemModule.new("root", nil)
		self._coreTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("CoreMemory")
		self._placeTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("PlaceMemory")
		self._untrackedTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("UntrackedMemory")
	end
	for i, value in pairs(List) do
		if i == "totalServerMemory" then
			v1 = value / 1048576
		elseif i == "developerTags" then
			self._placeTreeViewItem:setLabelAndValue("PlaceMemory", (__ReadAndSumValues(self._placeTreeViewItem, value)))
		elseif i == "internalCategories" then
			self._coreTreeViewItem:setLabelAndValue("CoreMemory", (__ReadAndSumValues(self._coreTreeViewItem, value)))
		end
	end
	self._cachedRootTreeViewItem:setLabelAndValue("Memory", v1)
	self._untrackedTreeViewItem:setLabelAndValue("UntrackedMemory", v1 - (self._coreTreeViewItem:getValue() + self._placeTreeViewItem:getValue()))
	self:renderUpdates()
end

function ServerMemoryAnalyzerModule:getMemoryUsageTree()
	return self._cachedRootTreeViewItem
end

function ServerMemoryAnalyzerModule:setVisible(_isVisible)
	self._isVisible = _isVisible
	
	if self._isVisible then
		self:renderUpdates()
	end
end

return ServerMemoryAnalyzerModule