local corescriptMemoryPeriodSeconds = game:DefineFastInt("CorescriptMemoryPeriodSeconds", 30)
local fFlagEnableCorescriptMemoryTrackerModule = require(script.Parent.Parent.Flags.FFlagEnableCorescriptMemoryTracker)
local enableMemorySnapshotCategories = game:DefineFastFlag("EnableMemorySnapshotCategories", false)
local statsService = game:GetService("Stats")
local telemetryService = game:GetService("TelemetryService")
local deviceTier = require(script:FindFirstAncestor("Memory").Parent.Devices).DeviceTier
local memoryScopeModule = require(script.Parent.MemoryScope)

local function _()
	-- upvalues: statsService (ref)
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	
	return if performanceStats then performanceStats:FindFirstChild("Memory") else nil
end

local function GetChildValue(p1, p2)
	if p2 == nil then
		return tostring(p1:GetValue())
	end
	local var1 = p1
	
	for i, v in ipairs(string.split(p2, "#")) do
		local var2 = var1:FindFirstChild(v)
		
		if var2 and var2:IsA("StatsItem") then
			var1 = var2
			continue
		end
		return "-1"
	end
	return tostring(var1:GetValue())
end

local _ = function()
	local ok, status = pcall(gcinfo)
	
	return if ok and status then string.format("%.2f", status / 1024) else "-1"
end

local function GetCorescriptMemory()
	-- upvalues: statsService (ref)
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	local var3 = if not performanceStats then nil else performanceStats:FindFirstChild("Memory")
	
	if var3 then
		for i, v in var3:GetChildren() do
			if v:IsA("StatsItem") and v.DisplayName == "CoreScriptMemory" then
				return v:GetValue()
			end
		end
	end
	return nil
end

local t = {
	eventName = "CorescriptMemory",
	throttlingPercentage = 10000,
	description = "Memory consumption for corescript, in MB",
	links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 7, 16 }
}
local t_1 = {
	eventName = "CorescriptSessionMaxMemory",
	throttlingPercentage = 10000,
	description = "Maximum memory consumption for corescript in the session, in MB",
	links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2025, 7, 16 }
}
local t_2 = {
	eventName = "CorescriptSessionAvgMemory",
	throttlingPercentage = 10000,
	description = "Average memory consumption for corescript in the session, in MB",
	links = "https://docs.google.com/document/d/1BEOgxPzSelCLEHdrHdD_8Kh4ssIcGLlndDXrLmIBNmk",
	backends = { "RobloxTelemetryStat" },
	lastUpdated = { 2026, 3, 4 }
}
local _ = { ACTIVE = 1, PAUSED = 2, STOPPED = 3 }
local t_3 = {}
t_3.__index = t_3

function t_3.new(p3, p4)
	-- upvalues: t_3 (ref)
	return setmetatable({
		memoryMb = 0,
		maxMemoryMb = 0,
		avgMemoryMb = 0,
		sampleCount = 0,
		status = 2,
		loggingTask = nil,
		context = p3,
		memoryScope = p4
	}, t_3)
end

function t_3:start()
	-- upvalues: corescriptMemoryPeriodSeconds (ref), GetCorescriptMemory (ref)
	self.status = 1
	self.loggingTask = task.delay(corescriptMemoryPeriodSeconds, function()
		-- upvalues: GetCorescriptMemory (copy), self (ref)
		local var4 = GetCorescriptMemory()
		
		if var4 then
			self.maxMemoryMb = math.max(var4, self.maxMemoryMb)
			self.sampleCount += 1
			self.avgMemoryMb += (var4 - self.avgMemoryMb) / self.sampleCount
			self:report(self.context, var4)
		end
		if self.status == 1 then
			self:start()
		end
	end)
end

function t_3:pause()
	if self.loggingTask then
		task.cancel(self.loggingTask)
		self.loggingTask = nil
	end
	self.status = 2
end

function t_3:resume()
	if self.status == 2 then
		self:start()
	end
end

function t_3:destroy()
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

function t_3:_buildCustomFields(p3)
	-- upvalues: deviceTier (ref)
	return {
		deviceTier = deviceTier.GetDeviceMemoryTier(),
		context = p3,
		memoryScope = self.memoryScope
	}
end

function t_3:report(p3, p4)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogStat(t, { customFields = self:_buildCustomFields(p3) }, p4)
end

function t_3:reportMaxMemoryUsed(b, p3)
	-- upvalues: memoryScopeModule (ref), telemetryService (ref), t_1 (ref)
	if self.memoryScope == memoryScopeModule.UniversalApp then
		return
	end
	telemetryService:LogStat(t_1, { customFields = self:_buildCustomFields(b) }, p3)
end

function t_3:reportAvgMemoryUsed(p3, p4)
	-- upvalues: memoryScopeModule (ref), telemetryService (ref), t_2 (ref)
	if self.memoryScope == memoryScopeModule.UniversalApp then
		return
	end
	telemetryService:LogStat(t_2, { customFields = self:_buildCustomFields(p3) }, p4)
end

function t_3.getSnapshot()
	-- upvalues: statsService (ref), GetChildValue (ref), enableMemorySnapshotCategories (ref)
	local ok
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	local var4 = if not performanceStats then nil else performanceStats:FindFirstChild("Memory")
	
	if var4 then
		local t = {}
		ok, status = pcall(gcinfo)
		t.luaHeapMb = if ok and status then string.format("%.2f", status / 1024) else "-1"
		t.totalMemory = tostring(var4:GetValue())
		t.coreMemory = GetChildValue(var4, "CoreMemory")
		t.placeMemory = GetChildValue(var4, "PlaceMemory")
		t.placeLuaHeap = GetChildValue(var4, "PlaceMemory#LuaHeap")
		t.coreScriptMemory = GetChildValue(var4, "CoreScriptMemory")
		t.untrackedMemory = GetChildValue(var4, "UntrackedMemory")
		
		if enableMemorySnapshotCategories then
			t.placeInstances = GetChildValue(var4, "PlaceMemory#Instances")
			t.placeSignals = GetChildValue(var4, "PlaceMemory#Signals")
			t.placeScript = GetChildValue(var4, "PlaceMemory#Script")
			t.placePhysicsCollision = GetChildValue(var4, "PlaceMemory#PhysicsCollision")
			t.placeGraphicsSolidModels = GetChildValue(var4, "PlaceMemory#GraphicsSolidModels")
			t.placeGraphicsMeshParts = GetChildValue(var4, "PlaceMemory#GraphicsMeshParts")
			t.placeGraphicsParticles = GetChildValue(var4, "PlaceMemory#GraphicsParticles")
			t.placeGraphicsTerrain = GetChildValue(var4, "PlaceMemory#GraphicsTerrain")
			t.placeGraphicsTexture = GetChildValue(var4, "PlaceMemory#GraphicsTexture")
			t.placeGraphicsTextureCharacter = GetChildValue(var4, "PlaceMemory#GraphicsTextureCharacter")
			t.placeSounds = GetChildValue(var4, "PlaceMemory#Sounds")
			t.placeTerrainVoxels = GetChildValue(var4, "PlaceMemory#TerrainVoxels")
			t.placeGui = GetChildValue(var4, "PlaceMemory#Gui")
			t.placeAnimation = GetChildValue(var4, "PlaceMemory#Animation")
			t.placeNavigation = GetChildValue(var4, "PlaceMemory#Navigation")
			t.coreRenderTarget = GetChildValue(var4, "CoreMemory#render/target")
			t.coreRenderGpuGeomMgr = GetChildValue(var4, "CoreMemory#render/gpu_geom_mgr")
			t.coreRenderTextureLocal = GetChildValue(var4, "CoreMemory#render/texture/local")
			t.coreRenderFonts = GetChildValue(var4, "CoreMemory#render/fonts")
			t.coreRenderLightgrid = GetChildValue(var4, "CoreMemory#render/lightgrid")
			t.coreGuiFontData = GetChildValue(var4, "CoreMemory#gui/FontData")
			t.coreRenderEnvmap = GetChildValue(var4, "CoreMemory#render/envmap")
			t.coreRenderShader = GetChildValue(var4, "CoreMemory#render/shader")
			t.coreRenderSystem = GetChildValue(var4, "CoreMemory#render/system")
			t.coreDynamicTexture = GetChildValue(var4, "CoreMemory#dynamic/texture")
			t.coreDynamicMesh = GetChildValue(var4, "CoreMemory#dynamic/mesh")
		end
		return t
	else
		local t = {}
		ok, status = pcall(gcinfo)
		t.luaHeapMb = if ok and status then string.format("%.2f", status / 1024) else "-1"
		
		return t
	end
end

function t_3.getLuaHeapOnly()
	local t = {}
	local ok, status = pcall(gcinfo)
	t.luaHeapMb = if ok and status then string.format("%.2f", status / 1024) else "-1"
	
	return t
end

local var4 = nil

return function(p3, p4)
	-- upvalues: fFlagEnableCorescriptMemoryTrackerModule (ref), var4 (write), t_3 (ref)
	if not fFlagEnableCorescriptMemoryTrackerModule then
		return nil
	elseif not var4 then
		var4 = t_3.new(p3, p4)
	end
	return var4
end