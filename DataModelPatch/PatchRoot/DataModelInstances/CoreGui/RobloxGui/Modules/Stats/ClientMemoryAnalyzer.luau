local StatsService = game:GetService("Stats")
local CoreGui = game:GetService("CoreGui")
local BaseMemoryAnalyzerModule = require(CoreGui.RobloxGui.Modules.Stats.BaseMemoryAnalyzer)
local CommonUtilModule = require(CoreGui.RobloxGui.Modules.Common.CommonUtil)
local StatsUtilsModule = require(CoreGui.RobloxGui.Modules.Stats.StatsUtils)
local TreeViewItemModule = require(CoreGui.RobloxGui.Modules.Stats.TreeViewItem)

local function _()
	-- upvalues: StatsService (copy), StatsUtilsModule (copy)
	local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
	
	return if PerformanceStats == nil then nil else PerformanceStats:FindFirstChild(StatsUtilsModule.StatNames[StatsUtilsModule.StatType_Memory])
end

local function __FillInMemoryUsageTreeRecursive(OrMakeChildById, Child)
	-- upvalues: StatsUtilsModule (copy), CommonUtilModule (copy), __FillInMemoryUsageTreeRecursive (copy)
	OrMakeChildById:setLabelAndValue(StatsUtilsModule.GetMemoryAnalyzerStatName(Child.Name), (Child:GetValue()))
	
	for _, value in ipairs((CommonUtilModule.SortByName((Child:GetChildren())))) do
		__FillInMemoryUsageTreeRecursive(OrMakeChildById:getOrMakeChildById(value.Name), value)
	end
end

local ClientMemoryAnalyzerModule = {}
setmetatable(ClientMemoryAnalyzerModule, BaseMemoryAnalyzerModule)
ClientMemoryAnalyzerModule.__index = ClientMemoryAnalyzerModule

function ClientMemoryAnalyzerModule.new(p1)
	-- upvalues: BaseMemoryAnalyzerModule (copy), ClientMemoryAnalyzerModule (copy)
	local NewBaseMemoryAnalyzer = BaseMemoryAnalyzerModule.new(p1)
	setmetatable(NewBaseMemoryAnalyzer, ClientMemoryAnalyzerModule)
	NewBaseMemoryAnalyzer._rootTreeViewItem = nil
	NewBaseMemoryAnalyzer._shouldListenForUpdates = false
	NewBaseMemoryAnalyzer._spawnedLoopScheduled = false
	
	return NewBaseMemoryAnalyzer
end

function ClientMemoryAnalyzerModule:startListeningForUpdates()
	self._shouldListenForUpdates = true
	
	if not self._spawnedLoopScheduled then
		self._spawnedLoopScheduled = true
		spawn(function()
			-- upvalues: self (copy)
			while self._shouldListenForUpdates do
				self:refreshMemoryUsageTree()
				self:renderUpdates()
				wait(1)
			end
			self._spawnedLoopScheduled = false
		end)
		
		return
	end
end

function ClientMemoryAnalyzerModule:stopListeningForUpdates()
	self._shouldListenForUpdates = false
end

function ClientMemoryAnalyzerModule:refreshMemoryUsageTree()
	-- upvalues: TreeViewItemModule (copy), StatsService (copy), StatsUtilsModule (copy), __FillInMemoryUsageTreeRecursive (copy)
	if self._rootTreeViewItem == nil then
		self._rootTreeViewItem = TreeViewItemModule.new("root", nil)
	end
	local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
	local Child = if PerformanceStats == nil then nil else PerformanceStats:FindFirstChild(StatsUtilsModule.StatNames[StatsUtilsModule.StatType_Memory])
	
	if Child == nil then
		return nil
	else
		__FillInMemoryUsageTreeRecursive(self._rootTreeViewItem, Child)
	end
end

function ClientMemoryAnalyzerModule:getMemoryUsageTree()
	return self._rootTreeViewItem
end

return ClientMemoryAnalyzerModule