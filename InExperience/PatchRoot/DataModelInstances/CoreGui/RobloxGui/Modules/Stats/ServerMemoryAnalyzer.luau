local coreGuiService = game:GetService("CoreGui")
local baseMemoryAnalyzerModule = require(coreGuiService.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local treeViewItemModule = require(coreGuiService.RobloxGui.Modules.Stats.TreeViewItem)
local _ = require(coreGuiService.RobloxGui.Modules.Common.CommonUtil)

local function __ReadAndSumValues(p0, p1) --[[ line: 25 ]]
	local var5 = 0
	
	for i, v in pairs(p1) do
		local var6 = v / 1048576
		var5 += var6
		p0:getOrMakeChildById(i):setLabelAndValue(i, var6)
	end
	return var5
end

local t = {}
setmetatable(t, baseMemoryAnalyzerModule)
t.__index = t

function t.new(p2) --[[ line: 52 ]]
	-- upvalues: baseMemoryAnalyzerModule (ref), t (ref)
	local var7 = baseMemoryAnalyzerModule.new(p2)
	setmetatable(var7, t)
	var7._cachedRootTreeViewItem = nil
	var7._coreTreeViewItem = nil
	var7._placeTreeViewItem = nil
	var7._untrackedTreeViewItem = nil
	var7._isVisible = false
	
	return var7
end

function t.filterServerMemoryTreeStats(_, p3) --[[ line: 78 ]]
	return if p3.ServerMemoryTree == nil then {} else p3.ServerMemoryTree
end

function t:updateWithTreeStats(p4) --[[ line: 86 ]]
	-- upvalues: treeViewItemModule (ref), __ReadAndSumValues (ref)
	local var8 = 0
	
	if self._cachedRootTreeViewItem == nil then
		self._cachedRootTreeViewItem = treeViewItemModule.new("root", nil)
		self._coreTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("CoreMemory")
		self._placeTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("PlaceMemory")
		self._untrackedTreeViewItem = self._cachedRootTreeViewItem:getOrMakeChildById("UntrackedMemory")
	end
	for i, v in pairs(p4) do
		if i == "totalServerMemory" then
			var8 = v / 1048576
		elseif i == "developerTags" then
			self._placeTreeViewItem:setLabelAndValue("PlaceMemory", __ReadAndSumValues(self._placeTreeViewItem, v))
		elseif i == "internalCategories" then
			self._coreTreeViewItem:setLabelAndValue("CoreMemory", __ReadAndSumValues(self._coreTreeViewItem, v))
		end
	end
	self._cachedRootTreeViewItem:setLabelAndValue("Memory", var8)
	self._untrackedTreeViewItem:setLabelAndValue("UntrackedMemory", var8 - (self._coreTreeViewItem:getValue() + self._placeTreeViewItem:getValue()))
	self:renderUpdates()
end

function t:getMemoryUsageTree() --[[ line: 123 ]]
	return self._cachedRootTreeViewItem
end

function t:setVisible(p5) --[[ line: 127 ]]
	self._isVisible = p5
	
	if self._isVisible then
		self:renderUpdates()
	end
end

return t