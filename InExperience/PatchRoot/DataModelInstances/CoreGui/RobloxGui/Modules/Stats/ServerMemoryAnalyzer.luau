local coreGuiService = game:GetService("CoreGui")
local baseMemoryAnalyzerModule = require(coreGuiService.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local treeViewItemModule = require(coreGuiService.RobloxGui.Modules.Stats.TreeViewItem)
local _ = require(coreGuiService.RobloxGui.Modules.Common.CommonUtil)

local function __ReadAndSumValues(p1, p2)
	local var1 = 0
	
	for i, v in pairs(p2) do
		local var2 = v / 1048576
		var1 += var2
		p1:getOrMakeChildById(i):setLabelAndValue(i, var2)
	end
	return var1
end

local t = {}
setmetatable(t, baseMemoryAnalyzerModule)
t.__index = t

function t.new(p3)
	-- upvalues: baseMemoryAnalyzerModule (ref), t (ref)
	local var3 = baseMemoryAnalyzerModule.new(p3)
	setmetatable(var3, t)
	var3._cachedRootTreeViewItem = nil
	var3._coreTreeViewItem = nil
	var3._placeTreeViewItem = nil
	var3._untrackedTreeViewItem = nil
	var3._isVisible = false
	
	return var3
end

function t.filterServerMemoryTreeStats(_, p3)
	return if p3.ServerMemoryTree == nil then {} else p3.ServerMemoryTree
end

function t:updateWithTreeStats(p3)
	-- upvalues: treeViewItemModule (ref), __ReadAndSumValues (ref)
	local var3 = 0
	
	if self._cachedRootTreeViewItem == nil then
		self._cachedRootTreeViewItem = treeViewItemModule.new("root", nil)
		self._coreTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("CoreMemory")
		self._placeTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("PlaceMemory")
		self._untrackedTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("UntrackedMemory")
	end
	for i, v in pairs(p3) do
		if i == "totalServerMemory" then
			var3 = v / 1048576
		elseif i == "developerTags" then
			self._placeTreeViewItem:setLabelAndValue("PlaceMemory", __ReadAndSumValues(self._placeTreeViewItem, v))
		elseif i == "internalCategories" then
			self._coreTreeViewItem:setLabelAndValue("CoreMemory", __ReadAndSumValues(self._coreTreeViewItem, v))
		end
	end
	self._cachedRootTreeViewItem:setLabelAndValue("Memory", var3)
	self._untrackedTreeViewItem:setLabelAndValue("UntrackedMemory", var3 - (self._coreTreeViewItem:getValue() + self._placeTreeViewItem:getValue()))
	self:renderUpdates()
end

function t:getMemoryUsageTree()
	return self._cachedRootTreeViewItem
end

function t:setVisible(p4)
	self._isVisible = p4
	
	if self._isVisible then
		self:renderUpdates()
	end
end

return t