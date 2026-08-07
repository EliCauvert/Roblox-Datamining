local statsService = game:GetService("Stats")
local coreGuiService = game:GetService("CoreGui")
local baseMemoryAnalyzerModule = require(coreGuiService.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local commonUtilModule = require(coreGuiService.RobloxGui.Modules.Common.CommonUtil)
local statsUtilsModule = require(coreGuiService.RobloxGui.Modules.Stats.StatsUtils)
local treeViewItemModule = require(coreGuiService.RobloxGui.Modules.Stats.TreeViewItem)

local function _() --[[ line: 19 | named "__GetMemoryPerformanceStatsItem" ]]
	-- upvalues: statsService (ref), statsUtilsModule (ref)
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	
	return if performanceStats == nil then nil else performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory])
end

local function __FillInMemoryUsageTreeRecursive(p0, p1) --[[ line: 30 ]]
	-- upvalues: statsUtilsModule (ref), commonUtilModule (ref), __FillInMemoryUsageTreeRecursive (ref)
	p0:setLabelAndValue(statsUtilsModule.GetMemoryAnalyzerStatName(p1.Name), p1:GetValue())
	
	for i, v in ipairs(commonUtilModule.SortByName(p1:GetChildren())) do
		__FillInMemoryUsageTreeRecursive(p0:getOrMakeChildById(v.Name), v)
	end
end

local t = {}
setmetatable(t, baseMemoryAnalyzerModule)
t.__index = t

function t.new(p2) --[[ line: 61 ]]
	-- upvalues: baseMemoryAnalyzerModule (ref), t (ref)
	local var9 = baseMemoryAnalyzerModule.new(p2)
	setmetatable(var9, t)
	var9._rootTreeViewItem = nil
	var9._shouldListenForUpdates = false
	var9._spawnedLoopScheduled = false
	
	return var9
end

function t:startListeningForUpdates() --[[ line: 86 ]]
	self._shouldListenForUpdates = true
	
	if self._spawnedLoopScheduled then
		return
	end
	self._spawnedLoopScheduled = true
	spawn(function() --[[ line: 95 ]]
		-- upvalues: self (ref)
		while self._shouldListenForUpdates do
			self:refreshMemoryUsageTree()
			self:renderUpdates()
			wait(1)
		end
		self._spawnedLoopScheduled = false
	end)
end

function t:stopListeningForUpdates() --[[ line: 107 ]]
	self._shouldListenForUpdates = false
end

function t:refreshMemoryUsageTree() --[[ line: 112 ]]
	-- upvalues: treeViewItemModule (ref), statsService (ref), statsUtilsModule (ref), __FillInMemoryUsageTreeRecursive (ref)
	if self._rootTreeViewItem == nil then
		self._rootTreeViewItem = treeViewItemModule.new("root", nil)
	end
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	local var11 = if performanceStats == nil then nil else performanceStats:FindFirstChild(statsUtilsModule.StatNames[statsUtilsModule.StatType_Memory])
	
	if var11 == nil then
		return nil
	end
	__FillInMemoryUsageTreeRecursive(self._rootTreeViewItem, var11)
end

function t:getMemoryUsageTree() --[[ line: 125 ]]
	return self._rootTreeViewItem
end

return t