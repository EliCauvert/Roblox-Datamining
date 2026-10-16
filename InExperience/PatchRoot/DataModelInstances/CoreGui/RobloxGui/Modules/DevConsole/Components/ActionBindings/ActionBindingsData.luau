local ContextActionService = game:GetService("ContextActionService")
local SignalModule = require(script.Parent.Parent.Parent.Signal)
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).ActionBindingsFormatting.ChartHeaderNames
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean --[[ Line: 9 ]]
		return p1.counter < p2.counter
	end,
	[ChartHeaderNames[2]] = function(p1, p2): boolean --[[ Line: 12 ]]
		return if p1.actionInfo.priorityLevel == p2.actionInfo.priorityLevel then p1.counter < p2.counter else p1.actionInfo.priorityLevel < p2.actionInfo.priorityLevel
	end,
	[ChartHeaderNames[3]] = function(p1, p2) --[[ Line: 18 ]]
		return if p1.actionInfo.isCore == p2.actionInfo.isCore then p1.counter < p2.counter else p1.actionInfo.isCore
	end,
	[ChartHeaderNames[4]] = function(p1, p2): boolean --[[ Line: 25 ]]
		return p1.name:lower() < p2.name:lower()
	end,
	[ChartHeaderNames[5]] = function(p1, p2): boolean --[[ Line: 28 ]]
		return tostring(p1.actionInfo.inputTypes[1]) < tostring(p2.actionInfo.inputTypes[1])
	end
}
local ActionBindingsDataModule = {}
ActionBindingsDataModule.__index = ActionBindingsDataModule

function ActionBindingsDataModule.new() --[[ Line: 36 ]]
	-- upvalues: ActionBindingsDataModule (copy), SignalModule (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, ActionBindingsDataModule)
	t._bindingsUpdated = SignalModule.new()
	t._bindingsData = {}
	t._bindingCounter = 0
	t._sortedBindingData = {}
	t._sortType = ChartHeaderNames[1]
	t._isRunning = false
	
	return t
end

function ActionBindingsDataModule:setSortType(_sortType) --[[ Line: 49 ]]
	-- upvalues: config (copy)
	if config[_sortType] then
		self._sortType = _sortType
		table.sort(self._sortedBindingData, config[self._sortType])
		self._bindingsUpdated:Fire(self._sortedBindingData)
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function ActionBindingsDataModule:getSortType() --[[ Line: 59 ]]
	return self._sortType
end

function ActionBindingsDataModule:Signal() --[[ Line: 63 ]]
	return self._bindingsUpdated
end

function ActionBindingsDataModule:getCurrentData() --[[ Line: 67 ]]
	return self._sortedBindingData
end

function ActionBindingsDataModule:updateBindingDataEntry(Name, p1) --[[ Line: 73 ]]
	if p1 == nil then
		self._bindingsData[Name] = nil
		
		for i, value in pairs(self._sortedBindingData) do
			if value.name == Name then
				table.remove(self._sortedBindingData, i)
				break
			end
		end
		return
	elseif self._bindingsData[Name] then
		self._bindingsData[Name] = p1
		
		return
	else
		self._bindingCounter += 1
		self._bindingsData[Name] = p1
		table.insert(self._sortedBindingData, {
			name = Name,
			actionInfo = self._bindingsData[Name],
			counter = self._bindingCounter
		})
	end
end

function ActionBindingsDataModule:isRunning() --[[ Line: 98 ]]
	return self._isRunning
end

function ActionBindingsDataModule:start() --[[ Line: 102 ]]
	-- upvalues: ContextActionService (copy)
	for i, value in pairs((ContextActionService:GetAllBoundActionInfo())) do
		value.isCore = false
		self:updateBindingDataEntry(i, value)
	end
	for i1, value1 in pairs((ContextActionService:GetAllBoundCoreActionInfo())) do
		value1.isCore = true
		self:updateBindingDataEntry(i1, value1)
	end
	if not self._actionChangedConnection then
		self._actionChangedConnection = ContextActionService.BoundActionChanged:connect(function(ActionChanged, ChangeName, ChangeTable) --[[ Line: 117 ]]
			-- upvalues: self (copy)
			self:updateBindingDataEntry(ActionChanged, nil)
			self:updateBindingDataEntry(ChangeName, ChangeTable)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	if not self._actionAddedConnection then
		self._actionAddedConnection = ContextActionService.BoundActionAdded:connect(function(ActionAdded, _, FunctionInfoTable, IsCore) --[[ Line: 126 ]]
			-- upvalues: self (copy)
			FunctionInfoTable.isCore = IsCore
			self:updateBindingDataEntry(ActionAdded, FunctionInfoTable)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	if not self._actionRemovedConnection then
		self._actionRemovedConnection = ContextActionService.BoundActionRemoved:connect(function(ActionRemoved, _, _) --[[ Line: 135 ]]
			-- upvalues: self (copy)
			self:updateBindingDataEntry(ActionRemoved, nil)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	self._isRunning = true
end

function ActionBindingsDataModule:stop() --[[ Line: 143 ]]
	if self.actionChangedConnector then
		self.actionChangedConnector:Disconnect()
		self.actionChangedConnector = nil
	end
	if self.actionAddedConnector then
		self.actionAddedConnector:Disconnect()
		self.actionAddedConnector = nil
	end
	if self.actionRemovedConnector then
		self.actionRemovedConnector:Disconnect()
		self.actionRemovedConnector = nil
	end
	self._isRunning = false
end

return ActionBindingsDataModule