local scriptProfilerService = game:GetService("ScriptProfilerService")
local playersService = game:GetService("Players")
local t = {}
t.__index = t

function t.new(p1)
	-- upvalues: t (ref), playersService (ref), scriptProfilerService (ref)
	local tbl = setmetatable({}, t)
	tbl._isProfiling = false
	tbl._isClient = false
	tbl._player = playersService.LocalPlayer
	tbl._connection = if p1 then scriptProfilerService.OnNewData:Connect(function(p2, p3)
		-- upvalues: p1 (ref)
		local var1 = p2 ~= nil
		
		if p1 then
			p1(var1, p3)
		end
	end) else nil
	
	return tbl
end

function t:ClientStart(p1)
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling then
		return
	end
	scriptProfilerService:ClientStart(self._player, p1 or 1000)
	self._isProfiling = true
	self._isClient = true
end

function t:ClientStop()
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling and self._isClient then
		scriptProfilerService:ClientStop(self._player)
		scriptProfilerService:ClientRequestData(self._player)
		self._isProfiling = false
		self._isClient = false
		
		return
	end
end

function t:ServerStart(p1)
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling then
		return
	end
	scriptProfilerService:ServerStart(p1 or 1000)
	self._isProfiling = true
	self._isClient = false
end

function t:ServerStop()
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling and not self._isClient then
		scriptProfilerService:ServerStop()
		scriptProfilerService:ServerRequestData()
		self._isProfiling = false
		
		return
	end
end

function t:IsProfiling()
	return self._isProfiling
end

function t:Disconnect()
	if self._connection then
		self._connection:Disconnect()
		self._connection = nil
	end
end

return t