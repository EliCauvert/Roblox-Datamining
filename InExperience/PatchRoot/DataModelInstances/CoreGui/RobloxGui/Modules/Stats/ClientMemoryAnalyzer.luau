local statsService = game:GetService("Stats")
local coreGuiService = game:GetService("CoreGui")
local baseMemoryAnalyzerModule = require(coreGuiService.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local commonUtilModule = require(coreGuiService.RobloxGui.Modules.Common.CommonUtil)
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local treeViewItemModule = require(coreGuiService.RobloxGui.Modules.Stats.TreeViewItem)

local function _()
	-- upvalues: statsService (ref), statsUtilsModule (ref)
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	
	return if performanceStats == nil then nil else performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory])
end

local function __FillInMemoryUsageTreeRecursive(p1, p2)
	-- upvalues: statsUtilsModule (ref), commonUtilModule (ref), __FillInMemoryUsageTreeRecursive (ref)
	p1:setLabelAndValue(statsUtilsModule.GetMemoryAnalyzerStatName(p2.Name), p2:GetValue())
	
	for i, v in ipairs(commonUtilModule.SortByName(p2:GetChildren())) do
		__FillInMemoryUsageTreeRecursive(p1:getOrMakeChildById(v.Name), v)
	end
end

local t = {}
setmetatable(t, baseMemoryAnalyzerModule)
t.__index = t

function t.new(p3)
	-- upvalues: baseMemoryAnalyzerModule (ref), t (ref)
	local var1 = baseMemoryAnalyzerModule.new(p3)
	setmetatable(var1, t)
	var1._rootTreeViewItem = nil
	var1._shouldListenForUpdates = false
	var1._spawnedLoopScheduled = false
	
	return var1
end

function t:startListeningForUpdates()
	self._shouldListenForUpdates = true
	
	if self._spawnedLoopScheduled then
		return
	end
	self._spawnedLoopScheduled = true
	spawn(function()
		-- upvalues: self (ref)
		while self._shouldListenForUpdates do
			self:refreshMemoryUsageTree()
			self:renderUpdates()
			wait(1)
		end
		self._spawnedLoopScheduled = false
	end)
end

function t:stopListeningForUpdates()
	self._shouldListenForUpdates = false
end

function t:refreshMemoryUsageTree()
	-- upvalues: treeViewItemModule (ref), statsService (ref), statsUtilsModule (ref), __FillInMemoryUsageTreeRecursive (ref)
	if self._rootTreeViewItem == nil then
		self._rootTreeViewItem = treeViewItemModule.new("root", nil)
	end
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	local var1 = if performanceStats == nil then nil else performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory])
	
	if var1 == nil then
		return nil
	end
	__FillInMemoryUsageTreeRecursive(self._rootTreeViewItem, var1)
end

function t:getMemoryUsageTree()
	return self._rootTreeViewItem
end

return t