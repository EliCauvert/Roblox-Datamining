local contextActionService = game:GetService("ContextActionService")
local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).ActionBindingsFormatting.ChartHeaderNames
local t = {
	[chartHeaderNames[1]] = function(p0, p1) --[[ line: 9 ]]
		return p0.counter < p1.counter
	end,
	[chartHeaderNames[2]] = function(p2, p3) --[[ line: 12 ]]
		return if p2.actionInfo.priorityLevel == p3.actionInfo.priorityLevel then p2.counter < p3.counter else p2.actionInfo.priorityLevel < p3.actionInfo.priorityLevel
	end,
	[chartHeaderNames[3]] = function(p4, p5) --[[ line: 18 ]]
		return if p4.actionInfo.isCore == p5.actionInfo.isCore then p4.counter < p5.counter else p4.actionInfo.isCore
	end,
	[chartHeaderNames[4]] = function(p6, p7) --[[ line: 25 ]]
		return p6.name:lower() < p7.name:lower()
	end,
	[chartHeaderNames[5]] = function(p8, p9) --[[ line: 28 ]]
		return tostring(p8.actionInfo.inputTypes[1]) < tostring(p9.actionInfo.inputTypes[1])
	end
}
local t_1 = {}
t_1.__index = t_1

function t_1.new() --[[ line: 36 ]]
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

function t_1:setSortType(p10) --[[ line: 49 ]]
	-- upvalues: t (ref)
	if t[p10] then
		self._sortType = p10
		table.sort(self._sortedBindingData, t[self._sortType])
		self._bindingsUpdated:Fire(self._sortedBindingData)
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p10)), 2)
end

function t_1:getSortType() --[[ line: 59 ]]
	return self._sortType
end

function t_1:Signal() --[[ line: 63 ]]
	return self._bindingsUpdated
end

function t_1:getCurrentData() --[[ line: 67 ]]
	return self._sortedBindingData
end

function t_1:updateBindingDataEntry(p11, p12) --[[ line: 73 ]]
	if p12 == nil then
		self._bindingsData[p11] = nil
		
		for i, v in pairs(self._sortedBindingData) do
			if v.name == p11 then
				table.remove(self._sortedBindingData, i)
				
				return
			end
		end
		return
	elseif self._bindingsData[p11] then
		self._bindingsData[p11] = p12
		
		return
	end
	self._bindingCounter += 1
	self._bindingsData[p11] = p12
	table.insert(self._sortedBindingData, {
		name = p11,
		actionInfo = self._bindingsData[p11],
		counter = self._bindingCounter
	})
end

function t_1:isRunning() --[[ line: 98 ]]
	return self._isRunning
end

function t_1:start() --[[ line: 102 ]]
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
		self._actionChangedConnection = contextActionService.BoundActionChanged:connect(function(p13, p14, p15) --[[ line: 117 ]]
			-- upvalues: self (ref)
			self:updateBindingDataEntry(p13, nil)
			self:updateBindingDataEntry(p14, p15)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	if not self._actionAddedConnection then
		self._actionAddedConnection = contextActionService.BoundActionAdded:connect(function(p16, _, p17, p18) --[[ line: 126 ]]
			-- upvalues: self (ref)
			p17.isCore = p18
			self:updateBindingDataEntry(p16, p17)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	if not self._actionRemovedConnection then
		self._actionRemovedConnection = contextActionService.BoundActionRemoved:connect(function(p19, _, _) --[[ line: 135 ]]
			-- upvalues: self (ref)
			self:updateBindingDataEntry(p19, nil)
			self._bindingsUpdated:Fire(self._sortedBindingData)
		end)
	end
	self._isRunning = true
end

function t_1:stop() --[[ line: 143 ]]
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