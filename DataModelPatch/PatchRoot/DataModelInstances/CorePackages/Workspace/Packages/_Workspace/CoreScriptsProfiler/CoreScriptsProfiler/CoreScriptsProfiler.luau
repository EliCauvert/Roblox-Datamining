local ScriptProfilerService = game:GetService("ScriptProfilerService")
local Players = game:GetService("Players")
local CoreScriptsProfilerModule = {}
CoreScriptsProfilerModule.__index = CoreScriptsProfilerModule

function CoreScriptsProfilerModule.new(Callback)
	-- upvalues: CoreScriptsProfilerModule (copy), Players (copy), ScriptProfilerService (copy)
	local self = setmetatable({}, CoreScriptsProfilerModule)
	self._isProfiling = false
	self._isClient = false
	self._player = Players.LocalPlayer
	self._connection = if Callback then ScriptProfilerService.OnNewData:Connect(function(Player, JsonString)
		-- upvalues: Callback (copy)
		local HasPlayer = Player ~= nil
		
		if Callback then
			Callback(HasPlayer, JsonString)
		end
	end) else nil
	
	return self
end

function CoreScriptsProfilerModule:ClientStart(Player)
	-- upvalues: ScriptProfilerService (copy)
	if not self._isProfiling then
		ScriptProfilerService:ClientStart(self._player, Player or 1000)
		self._isProfiling = true
		self._isClient = true
		
		return
	end
end

function CoreScriptsProfilerModule:ClientStop()
	-- upvalues: ScriptProfilerService (copy)
	if self._isProfiling and self._isClient then
		ScriptProfilerService:ClientStop(self._player)
		ScriptProfilerService:ClientRequestData(self._player)
		self._isProfiling = false
		self._isClient = false
		
		return
	end
end

function CoreScriptsProfilerModule:ServerStart(p1)
	-- upvalues: ScriptProfilerService (copy)
	if not self._isProfiling then
		ScriptProfilerService:ServerStart(p1 or 1000)
		self._isProfiling = true
		self._isClient = false
		
		return
	end
end

function CoreScriptsProfilerModule:ServerStop()
	-- upvalues: ScriptProfilerService (copy)
	if self._isProfiling and not self._isClient then
		ScriptProfilerService:ServerStop()
		ScriptProfilerService:ServerRequestData()
		self._isProfiling = false
		
		return
	end
end

function CoreScriptsProfilerModule:IsProfiling()
	return self._isProfiling
end

function CoreScriptsProfilerModule:Disconnect()
	if self._connection then
		self._connection:Disconnect()
		self._connection = nil
	end
end

return CoreScriptsProfilerModule