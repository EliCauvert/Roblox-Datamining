local SignalModule = require(script.Parent.Parent.Parent.Signal)
local ChartHeaderNames = require(script.Parent.Parent.Parent.Constants).DebugVisualizationsFormatting.ChartHeaderNames
local DebugVisualizationsStaticContentModule = require(script.Parent.DebugVisualizationsStaticContent)
local SlimDevConsole2 = game:DefineFastFlag("SlimDevConsole2", false)
local SlimTintContextFilter = game:DefineFastFlag("SlimTintContextFilter", false)
local SlimTintModeTelemetry = game:DefineFastFlag("SlimTintModeTelemetry", false)
local DebugVisualizationsTelemetryModule = require(script.Parent.DebugVisualizationsTelemetry)
local config = {
	[ChartHeaderNames[1]] = function(p1, p2): boolean
		return p1.name < p2.name
	end,
	[ChartHeaderNames[2]] = function(p1, p2)
		return if p1.settingInfo.Value == p2.settingInfo.Value then p1.name < p2.name else p1.settingInfo.Value
	end,
	[ChartHeaderNames[3]] = function(p1, p2): boolean
		return if p1.settingInfo.Type == p2.settingInfo.Type then p1.name < p2.name else p1.settingInfo.Type < p2.settingInfo.Type
	end,
	[ChartHeaderNames[4]] = function(p1, p2): boolean
		return p1.name < p2.name
	end
}
local DebugVisualizationsDataModule = {}
DebugVisualizationsDataModule.__index = DebugVisualizationsDataModule

function DebugVisualizationsDataModule.new()
	-- upvalues: DebugVisualizationsDataModule (copy), SignalModule (copy), ChartHeaderNames (copy)
	local t = {}
	setmetatable(t, DebugVisualizationsDataModule)
	t._visualizationsUpdated = SignalModule.new()
	t._visualizationsData = {}
	t._visualizationCounter = 0
	t._sortedVisualizationData = {}
	t._sortType = ChartHeaderNames[3]
	t._isRunning = false
	
	return t
end

function DebugVisualizationsDataModule:setSortType(_sortType)
	-- upvalues: config (copy)
	if config[_sortType] then
		self._sortType = _sortType
		table.sort(self._sortedVisualizationData, config[self._sortType])
		self._visualizationsUpdated:Fire(self._sortedVisualizationData)
		
		return
	else
		error(string.format("attempted to pass invalid sortType: %s", (tostring(_sortType))), 2)
	end
end

function DebugVisualizationsDataModule:getSortType()
	return self._sortType
end

function DebugVisualizationsDataModule:Signal()
	return self._visualizationsUpdated
end

function DebugVisualizationsDataModule:getCurrentData()
	return self._sortedVisualizationData
end

function DebugVisualizationsDataModule:updateDebugVisualizationDataEntry(Name, ConstructInfoResult)
	if ConstructInfoResult == nil then
		self._visualizationsData[Name] = nil
		
		for i, value in pairs(self._sortedVisualizationData) do
			if value.name == Name then
				table.remove(self._sortedVisualizationData, i)
				break
			end
		end
		return
	elseif self._visualizationsData[Name] then
		self._visualizationsData[Name] = ConstructInfoResult
		
		return
	else
		self._visualizationCounter += 1
		self._visualizationsData[Name] = ConstructInfoResult
		table.insert(self._sortedVisualizationData, {
			name = Name,
			settingInfo = self._visualizationsData[Name],
			valueChangeCallback = function(p1, p2)
				-- upvalues: self (copy)
				self:_toggleValue(p1, p2)
			end,
			counter = self._visualizationCounter
		})
	end
end

function DebugVisualizationsDataModule:isRunning()
	return self._isRunning
end

function DebugVisualizationsDataModule:_toggleValue(Key, Value)
	-- upvalues: SlimDevConsole2 (copy), SlimTintModeTelemetry (copy), DebugVisualizationsTelemetryModule (copy), config (copy)
	if SlimDevConsole2 then
		local Visualizations = self._visualizationsData[Key]
		
		if Visualizations and Visualizations.Kind == "Dropdown" then
			local Service = settings():GetService(Visualizations.Service)
			Service[Visualizations.Setter](Service, Value)
			Visualizations.Value = Value
			
			if SlimTintModeTelemetry and Key == "SlimTintMode" then
				DebugVisualizationsTelemetryModule.logSlimTintModeSelected(Value)
			end
			table.sort(self._sortedVisualizationData, config[self._sortType])
			self._visualizationsUpdated:Fire(self._sortedVisualizationData)
			
			return
		end
	end
	local Physics = settings().Physics
	
	if Physics[Key] ~= nil then
		if Value and self._visualizationsData[Key].Type == "Box" then
			for _, value in pairs(self._visualizationsData) do
				if value.Type == "Box" and Physics[value.Name] ~= nil then
					Physics[value.Name] = false
					self._visualizationsData[value.Name].Value = false
				end
			end
		end
		Physics[Key] = Value
		self._visualizationsData[Key].Value = Value
		table.sort(self._sortedVisualizationData, config[self._sortType])
		self._visualizationsUpdated:Fire(self._sortedVisualizationData)
	end
end

function _constructInfo(p1, p2)
	-- upvalues: SlimDevConsole2 (copy), SlimTintContextFilter (copy)
	local Value = nil
	local DropDownList = nil
	local EnumItems = nil
	
	if SlimDevConsole2 and p2.kind == "Dropdown" then
		local Success, Result = pcall(function()
			-- upvalues: p2 (copy)
			return settings():GetService(p2.service)
		end)
		
		if Success and Result then
			Value = Result[p2.getter](Result)
			
			if SlimTintContextFilter then
				EnumItems = {}
				DropDownList = {}
				
				for i, availableTintMode in ipairs((Result:GetAvailableTintModes(Enum.SlimViewContext.Player, true))) do
					EnumItems[i] = Enum.SlimTintMode[availableTintMode]
					DropDownList[i] = availableTintMode
				end
			else
				EnumItems = Value.EnumType:GetEnumItems()
				DropDownList = {}
				
				for i1, enumItem in ipairs(EnumItems) do
					DropDownList[i1] = enumItem.Name
				end
			end
		end
	else
		local Physics = settings().Physics
		Value = Physics[p1] ~= nil and Physics[p1]
	end
	local Tagstring = ""
	
	for i2, tag in ipairs(p2.tags) do
		Tagstring = (Tagstring .. tag) .. (if i2 == #p2.tags then "" else ", ")
	end
	local config = {
		Name = p2.name,
		Value = Value,
		Type = p2.type,
		Kind = if SlimDevConsole2 then p2.kind else nil,
		Tags = p2.tags,
		Tagstring = Tagstring,
		Description = p2.description,
		LearnMoreUrl = if SlimDevConsole2 then p2.learnMoreUrl else nil
	}
	
	if SlimDevConsole2 and p2.kind == "Dropdown" then
		config.DropDownList = DropDownList
		config.EnumItems = EnumItems
		config.Service = p2.service
		config.Setter = p2.setter
	end
	return config
end

function DebugVisualizationsDataModule:start()
	-- upvalues: DebugVisualizationsStaticContentModule (copy), config (copy)
	for i, value in pairs(DebugVisualizationsStaticContentModule) do
		self:updateDebugVisualizationDataEntry(i, _constructInfo(i, value))
	end
	table.sort(self._sortedVisualizationData, config[self._sortType])
	self._isRunning = true
end

function DebugVisualizationsDataModule:stop()
	self._isRunning = false
end

return DebugVisualizationsDataModule