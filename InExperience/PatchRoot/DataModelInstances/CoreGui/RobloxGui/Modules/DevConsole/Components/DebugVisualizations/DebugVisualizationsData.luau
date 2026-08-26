local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).DebugVisualizationsFormatting.ChartHeaderNames
local debugVisualizationsStaticContentModule = require(script.Parent.DebugVisualizationsStaticContent)
local slimDevConsole2 = game:DefineFastFlag("SlimDevConsole2", false)
local slimTintContextFilter = game:DefineFastFlag("SlimTintContextFilter", false)
local t = {
	[chartHeaderNames[1]] = function(p1, p2)
		return p1.name < p2.name
	end,
	[chartHeaderNames[2]] = function(p1, p2)
		return if p1.settingInfo.Value == p2.settingInfo.Value then p1.name < p2.name else p1.settingInfo.Value
	end,
	[chartHeaderNames[3]] = function(p1, p2)
		return if p1.settingInfo.Type == p2.settingInfo.Type then p1.name < p2.name else p1.settingInfo.Type < p2.settingInfo.Type
	end,
	[chartHeaderNames[4]] = function(p1, p2)
		return p1.name < p2.name
	end
}
local t_1 = {}
t_1.__index = t_1

function t_1.new()
	-- upvalues: t_1 (ref), signalModule (ref), chartHeaderNames (ref)
	local t = {}
	setmetatable(t, t_1)
	t._visualizationsUpdated = signalModule.new()
	t._visualizationsData = {}
	t._visualizationCounter = 0
	t._sortedVisualizationData = {}
	t._sortType = chartHeaderNames[3]
	t._isRunning = false
	
	return t
end

function t_1:setSortType(p1)
	-- upvalues: t (ref)
	if t[p1] then
		self._sortType = p1
		table.sort(self._sortedVisualizationData, t[self._sortType])
		self._visualizationsUpdated:Fire(self._sortedVisualizationData)
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p1)), 2)
end

function t_1:getSortType()
	return self._sortType
end

function t_1:Signal()
	return self._visualizationsUpdated
end

function t_1:getCurrentData()
	return self._sortedVisualizationData
end

function t_1:updateDebugVisualizationDataEntry(p1, p2)
	if p2 == nil then
		self._visualizationsData[p1] = nil
		
		for i, v in pairs(self._sortedVisualizationData) do
			if v.name == p1 then
				table.remove(self._sortedVisualizationData, i)
				
				return
			end
		end
		return
	elseif self._visualizationsData[p1] then
		self._visualizationsData[p1] = p2
		
		return
	end
	self._visualizationCounter += 1
	self._visualizationsData[p1] = p2
	table.insert(self._sortedVisualizationData, {
		name = p1,
		settingInfo = self._visualizationsData[p1],
		valueChangeCallback = function(p3, p4)
			-- upvalues: self (ref)
			self:_toggleValue(p3, p4)
		end,
		counter = self._visualizationCounter
	})
end

function t_1:isRunning()
	return self._isRunning
end

function t_1:_toggleValue(p3, p4)
	-- upvalues: slimDevConsole2 (ref), t (ref)
	if slimDevConsole2 then
		local var1 = self._visualizationsData[p3]
		
		if var1 and var1.Kind == "Dropdown" then
			local service = settings():GetService(var1.Service)
			service[var1.Setter](service, p4)
			var1.Value = p4
			table.sort(self._sortedVisualizationData, t[self._sortType])
			self._visualizationsUpdated:Fire(self._sortedVisualizationData)
			
			return
		end
	end
	local physics = settings().Physics
	
	if physics[p3] ~= nil then
		if p4 and self._visualizationsData[p3].Type == "Box" then
			for i, v in pairs(self._visualizationsData) do
				if v.Type == "Box" and physics[v.Name] ~= nil then
					physics[v.Name] = false
					self._visualizationsData[v.Name].Value = false
				end
			end
		end
		physics[p3] = p4
		self._visualizationsData[p3].Value = p4
		table.sort(self._sortedVisualizationData, t[self._sortType])
		self._visualizationsUpdated:Fire(self._sortedVisualizationData)
	end
end

function _constructInfo(p5, p6)
	-- upvalues: slimDevConsole2 (ref), slimTintContextFilter (ref)
	local var2 = nil
	local t = nil
	local enumItems = nil
	
	if slimDevConsole2 and p6.kind == "Dropdown" then
		local ok, status = pcall(function()
			-- upvalues: p6 (ref)
			return settings():GetService(p6.service)
		end)
		
		if ok and status then
			var2 = status[p6.getter](status)
			
			if slimTintContextFilter then
				local playerAvailableTintModes = status:GetAvailableTintModes(Enum.SlimViewContext.Player, true)
				enumItems = {}
				t = {}
				
				for i, v in ipairs(playerAvailableTintModes) do
					enumItems[i] = Enum.SlimTintMode[v]
					t[i] = v
				end
			else
				enumItems = var2.EnumType:GetEnumItems()
				t = {}
				
				for i, v in ipairs(enumItems) do
					t[i] = v.Name
				end
			end
		end
	else
		local physics = settings().Physics
		var2 = physics[p5] ~= nil and physics[p5]
	end
	local var3 = ""
	
	for i, v in ipairs(p6.tags) do
		var3 = (var3 .. v) .. (if i ~= #p6.tags then "" else ", ")
	end
	local t_1 = {
		Name = p6.name,
		Value = var2,
		Type = p6.type,
		Kind = if slimDevConsole2 then p6.kind else nil,
		Tags = p6.tags,
		Tagstring = var3,
		Description = p6.description,
		LearnMoreUrl = if slimDevConsole2 then p6.learnMoreUrl else nil
	}
	
	if slimDevConsole2 and p6.kind == "Dropdown" then
		t_1.DropDownList = t
		t_1.EnumItems = enumItems
		t_1.Service = p6.service
		t_1.Setter = p6.setter
	end
	return t_1
end

function t_1:start()
	-- upvalues: debugVisualizationsStaticContentModule (ref), t (ref)
	for i, v in pairs(debugVisualizationsStaticContentModule) do
		self:updateDebugVisualizationDataEntry(i, _constructInfo(i, v))
	end
	table.sort(self._sortedVisualizationData, t[self._sortType])
	self._isRunning = true
end

function t_1:stop()
	self._isRunning = false
end

return t_1