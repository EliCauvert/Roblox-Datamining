local contextActionService = game:GetService("ContextActionService")
local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).ActionBindingsFormatting.ChartHeaderNames
local t = {
	[chartHeaderNames[1]] = function(p1, p2)
		return p1.counter < p2.counter
	end,
	[chartHeaderNames[2]] = function(p1, p2)
		return if p1.actionInfo.priorityLevel == p2.actionInfo.priorityLevel then p1.counter < p2.counter else p1.actionInfo.priorityLevel < p2.actionInfo.priorityLevel
	end,
	[chartHeaderNames[3]] = function(p1, p2)
		return if p1.actionInfo.isCore == p2.actionInfo.isCore then p1.counter < p2.counter else p1.actionInfo.isCore
	end,
	[chartHeaderNames[4]] = function(p1, p2)
		return p1.name:lower() < p2.name:lower()
	end,
	[chartHeaderNames[5]] = function(p1, p2)
		return tostring(p1.actionInfo.inputTypes[1]) < tostring(p2.actionInfo.inputTypes[1])
	end
}
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), signalModule (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._bindingsUpdated = signalModule.new()
	t._bindingsData = {}
	t._bindingCounter = 0
	t._sortedBindingData = {}
	t._sortType = chartHeaderNames[1]
	t._isRunning = false
	
	return t
end

function t_1:setSortType(p1)
	-- upvalues: t (ref)
	if t[p1] then
		self._sortType = p1
		table.sort(self._sortedBindingData, t[self._sortType])
		self._bindingsUpdated:Fire(self._sortedBindingData)
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p1)), 2)
end

function t_1:getSortType()
	return self._sortType
end

function t_1:Signal()
	return self._bindingsUpdated
end

function t_1:getCurrentData()
	return self._sortedBindingData
end

function t_1:updateBindingDataEntry(p1, p2)
	if p2 == nil then
		self._bindingsData[p1] = nil
		
		for i, v in pairs(self._sortedBindingData) do
			if v.name == p1 then
				table.remove(self._sortedBindingData, i)
				
				return
			end
		end
		return
	elseif self._bindingsData[p1] then
		self._bindingsData[p1] = p2
		
		return
	end
	self._bindingCounter += 1
	self._bindingsData[p1] = p2
	table.insert(self._sortedBindingData, {
		name = p1,
		actionInfo = self._bindingsData[p1],
		counter = self._bindingCounter
	})
end

function t_1:isRunning()
	return self._isRunning
end

function t_1:start()
	-- upvalues: contextActionService (ref)
	for i, v in pairs(contextActionService:GetAllBoundActionInfo()) do
		v.isCore = false
		self:updateBindingDataEntry(i, v)
	end
	for i_1, v_1 in pairs(contextActionService:GetAllBoundCoreActionInfo()) do
		v_1.isCore = true
		self:updateBindingDataEntry(i_1, v_1)
	end
	if not self._actionChangedConnection then
		self._actionChangedConnection = contextActionService.BoundActionChanged:connect(function(p3, p4, p5)
			-- upvalues: self (ref)
			self:updateBindingDataEntry(p3, nil)
			self:updateBindingDataEntry(p4, p5)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	if not self._actionAddedConnection then
		self._actionAddedConnection = contextActionService.BoundActionAdded:connect(function(p3, _, p4, p5)
			-- upvalues: self (ref)
			p4.isCore = p5
			self:updateBindingDataEntry(p3, p4)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	if not self._actionRemovedConnection then
		self._actionRemovedConnection = contextActionService.BoundActionRemoved:connect(function(p3, _, _)
			-- upvalues: self (ref)
			self:updateBindingDataEntry(p3, nil)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	self._isRunning = true
end

function t_1:stop()
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

return t_1