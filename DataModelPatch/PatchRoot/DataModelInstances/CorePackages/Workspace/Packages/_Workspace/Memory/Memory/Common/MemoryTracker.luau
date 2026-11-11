local CorescriptMemoryPeriodSeconds = game:DefineFastInt("CorescriptMemoryPeriodSeconds", 30)
local FFlagEnableCorescriptMemoryTrackerModule = require(script.Parent.Parent.Flags.FFlagEnableCorescriptMemoryTracker)
local EnableMemorySnapshotCategories = game:DefineFastFlag("EnableMemorySnapshotCategories", false)
local StatsService = game:GetService("Stats")
local TelemetryService = game:GetService("TelemetryService")
local DeviceTier = require(script:FindFirstAncestor("Memory").Parent.Devices).DeviceTier
local MemoryScopeModule = require(script.Parent.MemoryScope)

local function _()
	-- upvalues: StatsService (copy)
	local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
	
	return if PerformanceStats then PerformanceStats:FindFirstChild("Memory") else nil
end

local function GetChildValue(Memory, Text: string): string
	if Text == nil then
		return (tostring(Memory:GetValue()))
	end
	local Object = Memory
	
	for _, ChildName in ipairs(string.split(Text, "#")) do
		local Child = Object:FindFirstChild(ChildName)
		
		if not Child or not Child:IsA("StatsItem") then
			return "-1"
		end
		Object = Child
	end
	return (tostring(Object:GetValue()))
end

local _ = function(): string
	local Success, Result = pcall(gcinfo)
	
	return if Success and Result then string.format("%.2f", Result / 1024) else "-1"
end

local function GetCorescriptMemory()
	-- upvalues: StatsService (copy)
	local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
	local Memory = if PerformanceStats then PerformanceStats:FindFirstChild("Memory") else nil
	
	if Memory then
		for _, StatsItem in Memory:GetChildren() do
			if StatsItem:IsA("StatsItem") and StatsItem.DisplayName == "CoreScriptMemory" then
				return StatsItem:GetValue()
			end
		end
	end
	return nil
end

local config = {
	eventName = "CorescriptMemory",
	throttlingPercentage = 10000,
	description = "Memory consumption for corescript, in MB",
	links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 7, 16 }
}
local config1 = {
	eventName = "CorescriptSessionMaxMemory",
	throttlingPercentage = 10000,
	description = "Maximum memory consumption for corescript in the session, in MB",
	links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 7, 16 }
}
local config2 = {
	eventName = "CorescriptSessionAvgMemory",
	throttlingPercentage = 10000,
	description = "Average memory consumption for corescript in the session, in MB",
	links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 3, 4 }
}
local Module = {}
Module.__index = Module

function Module.new(Context, MemoryScope)
	-- upvalues: Module (copy)
	return (setmetatable({
		memoryMb = 0,
		maxMemoryMb = 0,
		avgMemoryMb = 0,
		sampleCount = 0,
		status = 2,
		loggingTask = nil,
		context = Context,
		memoryScope = MemoryScope
	}, Module))
end

function Module:start()
	-- upvalues: CorescriptMemoryPeriodSeconds (copy), GetCorescriptMemory (copy)
	self.status = 1
	self.loggingTask = task.delay(CorescriptMemoryPeriodSeconds, function()
		-- upvalues: GetCorescriptMemory (upval), self (copy)
		local CorescriptMemory: number = GetCorescriptMemory()
		
		if CorescriptMemory then
			self.maxMemoryMb = math.max(CorescriptMemory, self.maxMemoryMb)
			self.sampleCount += 1
			self.avgMemoryMb += (CorescriptMemory - self.avgMemoryMb) / self.sampleCount
			self:report(self.context, CorescriptMemory)
		end
		if self.status == 1 then
			self:start()
		end
	end)
end

function Module:pause()
	if self.loggingTask then
		task.cancel(self.loggingTask)
		self.loggingTask = nil
	end
	self.status = 2
end

function Module:resume()
	if self.status == 2 then
		self:start()
	end
end

function Module:destroy()
	if self.loggingTask then
		task.cancel(self.loggingTask)
		self.loggingTask = nil
	end
	self.status = 3
	
	if self.maxMemoryMb > 0 then
		self:reportMaxMemoryUsed(self.context, self.maxMemoryMb)
	end
	if self.sampleCount > 0 then
		self:reportAvgMemoryUsed(self.context, self.avgMemoryMb)
	end
end

function Module:_buildCustomFields(Context)
	-- upvalues: DeviceTier (copy)
	return {
		deviceTier = DeviceTier.GetDeviceMemoryTier(),
		context = Context,
		memoryScope = self.memoryScope
	}
end

function Module:report(Context, Value)
	-- upvalues: TelemetryService (copy), config (copy)
	TelemetryService:LogStat(config, { customFields = self:_buildCustomFields(Context) }, Value)
end

function Module:reportMaxMemoryUsed(Context, MaxMemoryMb)
	-- upvalues: MemoryScopeModule (copy), TelemetryService (copy), config1 (copy)
	if self.memoryScope ~= MemoryScopeModule.UniversalApp then
		TelemetryService:LogStat(config1, { customFields = self:_buildCustomFields(Context) }, MaxMemoryMb)
		
		return
	end
end

function Module:reportAvgMemoryUsed(Context, AvgMemoryMb)
	-- upvalues: MemoryScopeModule (copy), TelemetryService (copy), config2 (copy)
	if self.memoryScope ~= MemoryScopeModule.UniversalApp then
		TelemetryService:LogStat(config2, { customFields = self:_buildCustomFields(Context) }, AvgMemoryMb)
		
		return
	end
end

function Module.getSnapshot()
	-- upvalues: StatsService (copy), GetChildValue (copy), EnableMemorySnapshotCategories (copy)
	local PerformanceStats = StatsService and StatsService:FindFirstChild("PerformanceStats")
	local Memory = if PerformanceStats then PerformanceStats:FindFirstChild("Memory") else nil
	
	if not Memory then
		local Success, Result = pcall(gcinfo)
		
		return {
			luaHeapMb = if Success and Result then string.format("%.2f", Result / 1024) else "-1"
		}
	end
	local Success1, Result1 = pcall(gcinfo)
	local config = {
		luaHeapMb = if Success1 and Result1 then string.format("%.2f", Result1 / 1024) else "-1",
		totalMemory = tostring(Memory:GetValue()),
		coreMemory = GetChildValue(Memory, "CoreMemory"),
		placeMemory = GetChildValue(Memory, "PlaceMemory"),
		placeLuaHeap = GetChildValue(Memory, "PlaceMemory#LuaHeap"),
		coreScriptMemory = GetChildValue(Memory, "CoreScriptMemory"),
		untrackedMemory = GetChildValue(Memory, "UntrackedMemory")
	}
	
	if EnableMemorySnapshotCategories then
		config.placeInstances = GetChildValue(Memory, "PlaceMemory#Instances")
		config.placeSignals = GetChildValue(Memory, "PlaceMemory#Signals")
		config.placeScript = GetChildValue(Memory, "PlaceMemory#Script")
		config.placePhysicsCollision = GetChildValue(Memory, "PlaceMemory#PhysicsCollision")
		config.placeGraphicsSolidModels = GetChildValue(Memory, "PlaceMemory#GraphicsSolidModels")
		config.placeGraphicsMeshParts = GetChildValue(Memory, "PlaceMemory#GraphicsMeshParts")
		config.placeGraphicsParticles = GetChildValue(Memory, "PlaceMemory#GraphicsParticles")
		config.placeGraphicsTerrain = GetChildValue(Memory, "PlaceMemory#GraphicsTerrain")
		config.placeGraphicsTexture = GetChildValue(Memory, "PlaceMemory#GraphicsTexture")
		config.placeGraphicsTextureCharacter = GetChildValue(Memory, "PlaceMemory#GraphicsTextureCharacter")
		config.placeSounds = GetChildValue(Memory, "PlaceMemory#Sounds")
		config.placeTerrainVoxels = GetChildValue(Memory, "PlaceMemory#TerrainVoxels")
		config.placeGui = GetChildValue(Memory, "PlaceMemory#Gui")
		config.placeAnimation = GetChildValue(Memory, "PlaceMemory#Animation")
		config.placeNavigation = GetChildValue(Memory, "PlaceMemory#Navigation")
		config.coreRenderTarget = GetChildValue(Memory, "CoreMemory#render/target")
		config.coreRenderGpuGeomMgr = GetChildValue(Memory, "CoreMemory#render/gpu_geom_mgr")
		config.coreRenderTextureLocal = GetChildValue(Memory, "CoreMemory#render/texture/local")
		config.coreRenderFonts = GetChildValue(Memory, "CoreMemory#render/fonts")
		config.coreRenderLightgrid = GetChildValue(Memory, "CoreMemory#render/lightgrid")
		config.coreGuiFontData = GetChildValue(Memory, "CoreMemory#gui/FontData")
		config.coreRenderEnvmap = GetChildValue(Memory, "CoreMemory#render/envmap")
		config.coreRenderShader = GetChildValue(Memory, "CoreMemory#render/shader")
		config.coreRenderSystem = GetChildValue(Memory, "CoreMemory#render/system")
		config.coreDynamicTexture = GetChildValue(Memory, "CoreMemory#dynamic/texture")
		config.coreDynamicMesh = GetChildValue(Memory, "CoreMemory#dynamic/mesh")
	end
	return config
end

function Module.getLuaHeapOnly()
	local Success, Result = pcall(gcinfo)
	
	return {
		luaHeapMb = if Success and Result then string.format("%.2f", Result / 1024) else "-1"
	}
end

local NewResult = nil

return function(Context, MemoryScope)
	-- upvalues: FFlagEnableCorescriptMemoryTrackerModule (copy), NewResult (ref), Module (copy)
	if not FFlagEnableCorescriptMemoryTrackerModule then
		return nil
	end
	if not NewResult then
		NewResult = Module.new(Context, MemoryScope)
	end
	return NewResult
end