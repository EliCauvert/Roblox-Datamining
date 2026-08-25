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

local function GetChildValue(p0, p1)
	if p1 == nil then
		return tostring(p0:GetValue())
	end
	local var14 = p0
	
	for i, v in ipairs(string.split(p1, "#")) do
		local var15 = var14:FindFirstChild(v)
		
		if var15 and var15:IsA("StatsItem") then
			var14 = var15
			continue
		end
		return "-1"
	end
	return tostring(var14:GetValue())
end

local _ = function()
	local ok, status = pcall(gcinfo)
	
	return if ok and status then string.format("%.2f", status / 1024) else "-1"
end

local function GetCorescriptMemory()
	-- upvalues: statsService (ref)
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	local var17 = if not performanceStats then nil else performanceStats:FindFirstChild("Memory")
	
	if var17 then
		for i, v in var17:GetChildren() do
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

function t_3.new(p2, p3)
	-- upvalues: t_3 (ref)
	return setmetatable({
		memoryMb = 0,
		maxMemoryMb = 0,
		avgMemoryMb = 0,
		sampleCount = 0,
		status = 2,
		loggingTask = nil,
		context = p2,
		memoryScope = p3
	}, t_3)
end

function t_3:start()
	-- upvalues: corescriptMemoryPeriodSeconds (ref), GetCorescriptMemory (ref)
	self.status = 1
	self.loggingTask = task.delay(corescriptMemoryPeriodSeconds, function()
		-- upvalues: GetCorescriptMemory (copy), self (ref)
		local var18 = GetCorescriptMemory()
		
		if var18 then
			self.maxMemoryMb = math.max(var18, self.maxMemoryMb)
			self.sampleCount += 1
			self.avgMemoryMb += (var18 - self.avgMemoryMb) / self.sampleCount
			self:report(self.context, var18)
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

function t_3:_buildCustomFields(p4)
	-- upvalues: deviceTier (ref)
	return {
		deviceTier = deviceTier.GetDeviceMemoryTier(),
		context = p4,
		memoryScope = self.memoryScope
	}
end

function t_3:report(p5, p6)
	-- upvalues: telemetryService (ref), t (ref)
	telemetryService:LogStat(t, { customFields = self:_buildCustomFields(p5) }, p6)
end

function t_3:reportMaxMemoryUsed(b, p7)
	-- upvalues: memoryScopeModule (ref), telemetryService (ref), t_1 (ref)
	if self.memoryScope == memoryScopeModule.UniversalApp then
		return
	end
	telemetryService:LogStat(t_1, { customFields = self:_buildCustomFields(b) }, p7)
end

function t_3:reportAvgMemoryUsed(p8, p9)
	-- upvalues: memoryScopeModule (ref), telemetryService (ref), t_2 (ref)
	if self.memoryScope == memoryScopeModule.UniversalApp then
		return
	end
	telemetryService:LogStat(t_2, { customFields = self:_buildCustomFields(p8) }, p9)
end

function t_3.getSnapshot()
	-- upvalues: statsService (ref), GetChildValue (ref), enableMemorySnapshotCategories (ref)
	local ok
	local performanceStats = statsService and statsService:FindFirstChild("PerformanceStats")
	local var20 = if not performanceStats then nil else performanceStats:FindFirstChild("Memory")
	
	if var20 then
		local t = {}
		ok, status = pcall(gcinfo)
		t.luaHeapMb = if ok and status then string.format("%.2f", status / 1024) else "-1"
		t.totalMemory = tostring(var20:GetValue())
		t.coreMemory = GetChildValue(var20, "CoreMemory")
		t.placeMemory = GetChildValue(var20, "PlaceMemory")
		t.placeLuaHeap = GetChildValue(var20, "PlaceMemory#LuaHeap")
		t.coreScriptMemory = GetChildValue(var20, "CoreScriptMemory")
		t.untrackedMemory = GetChildValue(var20, "UntrackedMemory")
		
		if enableMemorySnapshotCategories then
			t.placeInstances = GetChildValue(var20, "PlaceMemory#Instances")
			t.placeSignals = GetChildValue(var20, "PlaceMemory#Signals")
			t.placeScript = GetChildValue(var20, "PlaceMemory#Script")
			t.placePhysicsCollision = GetChildValue(var20, "PlaceMemory#PhysicsCollision")
			t.placeGraphicsSolidModels = GetChildValue(var20, "PlaceMemory#GraphicsSolidModels")
			t.placeGraphicsMeshParts = GetChildValue(var20, "PlaceMemory#GraphicsMeshParts")
			t.placeGraphicsParticles = GetChildValue(var20, "PlaceMemory#GraphicsParticles")
			t.placeGraphicsTerrain = GetChildValue(var20, "PlaceMemory#GraphicsTerrain")
			t.placeGraphicsTexture = GetChildValue(var20, "PlaceMemory#GraphicsTexture")
			t.placeGraphicsTextureCharacter = GetChildValue(var20, "PlaceMemory#GraphicsTextureCharacter")
			t.placeSounds = GetChildValue(var20, "PlaceMemory#Sounds")
			t.placeTerrainVoxels = GetChildValue(var20, "PlaceMemory#TerrainVoxels")
			t.placeGui = GetChildValue(var20, "PlaceMemory#Gui")
			t.placeAnimation = GetChildValue(var20, "PlaceMemory#Animation")
			t.placeNavigation = GetChildValue(var20, "PlaceMemory#Navigation")
			t.coreRenderTarget = GetChildValue(var20, "CoreMemory#render/target")
			t.coreRenderGpuGeomMgr = GetChildValue(var20, "CoreMemory#render/gpu_geom_mgr")
			t.coreRenderTextureLocal = GetChildValue(var20, "CoreMemory#render/texture/local")
			t.coreRenderFonts = GetChildValue(var20, "CoreMemory#render/fonts")
			t.coreRenderLightgrid = GetChildValue(var20, "CoreMemory#render/lightgrid")
			t.coreGuiFontData = GetChildValue(var20, "CoreMemory#gui/FontData")
			t.coreRenderEnvmap = GetChildValue(var20, "CoreMemory#render/envmap")
			t.coreRenderShader = GetChildValue(var20, "CoreMemory#render/shader")
			t.coreRenderSystem = GetChildValue(var20, "CoreMemory#render/system")
			t.coreDynamicTexture = GetChildValue(var20, "CoreMemory#dynamic/texture")
			t.coreDynamicMesh = GetChildValue(var20, "CoreMemory#dynamic/mesh")
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

local var12 = nil

return function(p10, p11)
	-- upvalues: fFlagEnableCorescriptMemoryTrackerModule (ref), var12 (write), t_3 (ref)
	if not fFlagEnableCorescriptMemoryTrackerModule then
		return nil
	elseif not var12 then
		var12 = t_3.new(p10, p11)
	end
	return var12
end