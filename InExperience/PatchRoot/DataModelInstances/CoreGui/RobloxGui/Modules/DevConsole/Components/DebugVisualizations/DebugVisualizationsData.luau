local signalModule = require(script.Parent.Parent.Parent.Signal)
local chartHeaderNames = require(script.Parent.Parent.Parent.Constants).DebugVisualizationsFormatting.ChartHeaderNames
local debugVisualizationsStaticContentModule = require(script.Parent.DebugVisualizationsStaticContent)
local slimDevConsole2 = game:DefineFastFlag("SlimDevConsole2", false)
local slimTintContextFilter = game:DefineFastFlag("SlimTintContextFilter", false)
local t = {
	[chartHeaderNames[1]] = function(p0, p1)
		return p0.name < p1.name
	end,
	[chartHeaderNames[2]] = function(p2, p3)
		return if p2.settingInfo.Value == p3.settingInfo.Value then p2.name < p3.name else p2.settingInfo.Value
	end,
	[chartHeaderNames[3]] = function(p4, p5)
		return if p4.settingInfo.Type == p5.settingInfo.Type then p4.name < p5.name else p4.settingInfo.Type < p5.settingInfo.Type
	end,
	[chartHeaderNames[4]] = function(p6, p7)
		return p6.name < p7.name
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

function t_1:setSortType(p8)
	-- upvalues: t (ref)
	if t[p8] then
		self._sortType = p8
		table.sort(self._sortedVisualizationData, t[self._sortType])
		self._visualizationsUpdated:Fire(self._sortedVisualizationData)
		
		return
	end
	error(string.format("attempted to pass invalid sortType: %s", tostring(p8)), 2)
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

function t_1:updateDebugVisualizationDataEntry(p9, p10)
	if p10 == nil then
		self._visualizationsData[p9] = nil
		
		for i, v in pairs(self._sortedVisualizationData) do
			if v.name == p9 then
				table.remove(self._sortedVisualizationData, i)
				
				return
			end
		end
		return
	elseif self._visualizationsData[p9] then
		self._visualizationsData[p9] = p10
		
		return
	end
	self._visualizationCounter += 1
	self._visualizationsData[p9] = p10
	table.insert(self._sortedVisualizationData, {
		name = p9,
		settingInfo = self._visualizationsData[p9],
		valueChangeCallback = function(p11, p12)
			-- upvalues: self (ref)
			self:_toggleValue(p11, p12)
		end,
		counter = self._visualizationCounter
	})
end

function t_1:isRunning()
	return self._isRunning
end

function t_1:_toggleValue(p13, p14)
	-- upvalues: slimDevConsole2 (ref), t (ref)
	if slimDevConsole2 then
		local var7 = self._visualizationsData[p13]
		
		if var7 and var7.Kind == "Dropdown" then
			local service = settings():GetService(var7.Service)
			service[var7.Setter](service, p14)
			var7.Value = p14
			table.sort(self._sortedVisualizationData, t[self._sortType])
			self._visualizationsUpdated:Fire(self._sortedVisualizationData)
			
			return
		end
	end
	local physics = settings().Physics
	
	if physics[p13] ~= nil then
		if p14 and self._visualizationsData[p13].Type == "Box" then
			for i, v in pairs(self._visualizationsData) do
				if v.Type == "Box" and physics[v.Name] ~= nil then
					physics[v.Name] = false
					self._visualizationsData[v.Name].Value = false
				end
			end
		end
		physics[p13] = p14
		self._visualizationsData[p13].Value = p14
		table.sort(self._sortedVisualizationData, t[self._sortType])
		self._visualizationsUpdated:Fire(self._sortedVisualizationData)
	end
end

function _constructInfo(p15, p16)
	-- upvalues: slimDevConsole2 (ref), slimTintContextFilter (ref)
	local var9 = nil
	local t = nil
	local enumItems = nil
	
	if slimDevConsole2 and p16.kind == "Dropdown" then
		local ok, status = pcall(function()
			-- upvalues: p16 (ref)
			return settings():GetService(p16.service)
		end)
		
		if ok and status then
			var9 = status[p16.getter](status)
			
			if slimTintContextFilter then
				local playerAvailableTintModes = status:GetAvailableTintModes(Enum.SlimViewContext.Player, true)
				enumItems = {}
				t = {}
				
				for i, v in ipairs(playerAvailableTintModes) do
					enumItems[i] = Enum.SlimTintMode[v]
					t[i] = v
				end
			else
				enumItems = var9.EnumType:GetEnumItems()
				t = {}
				
				for i, v in ipairs(enumItems) do
					t[i] = v.Name
				end
			end
		end
	else
		local physics = settings().Physics
		var9 = physics[p15] ~= nil and physics[p15]
	end
	local var13 = ""
	
	for i, v in ipairs(p16.tags) do
		var13 = (var13 .. v) .. (if i ~= #p16.tags then "" else ", ")
	end
	local t_1 = {
		Name = p16.name,
		Value = var9,
		Type = p16.type,
		Kind = if slimDevConsole2 then p16.kind else nil,
		Tags = p16.tags,
		Tagstring = var13,
		Description = p16.description,
		LearnMoreUrl = if slimDevConsole2 then p16.learnMoreUrl else nil
	}
	
	if slimDevConsole2 and p16.kind == "Dropdown" then
		t_1.DropDownList = t
		t_1.EnumItems = enumItems
		t_1.Service = p16.service
		t_1.Setter = p16.setter
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