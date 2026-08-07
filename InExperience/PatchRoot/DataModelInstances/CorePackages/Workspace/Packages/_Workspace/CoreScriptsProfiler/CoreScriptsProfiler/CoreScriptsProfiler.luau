local scriptProfilerService = game:GetService("ScriptProfilerService")
local playersService = game:GetService("Players")
local t = {}
t.__index = t

function t.new(p0) --[[ line: 37 ]]
	-- upvalues: t (ref), playersService (ref), scriptProfilerService (ref)
	local tbl = setmetatable({}, t)
	tbl._isProfiling = false
	tbl._isClient = false
	tbl._player = playersService.LocalPlayer
	tbl._connection = if p0 then scriptProfilerService.OnNewData:Connect(function(p1, p2) --[[ line: 45 ]]
		-- upvalues: p0 (ref)
		local var4 = p1 ~= nil
		
		if p0 then
			p0(var4, p2)
		end
	end) else nil
	
	return tbl
end

function t:ClientStart(p3) --[[ line: 58 ]]
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling then
		return
	end
	scriptProfilerService:ClientStart(self._player, p3 or 1000)
	self._isProfiling = true
	self._isClient = true
end

function t:ClientStop() --[[ line: 70 ]]
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling and self._isClient then
		scriptProfilerService:ClientStop(self._player)
		scriptProfilerService:ClientRequestData(self._player)
		self._isProfiling = false
		self._isClient = false
		
		return
	end
end

function t:ServerStart(p4) --[[ line: 82 ]]
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling then
		return
	end
	scriptProfilerService:ServerStart(p4 or 1000)
	self._isProfiling = true
	self._isClient = false
end

function t:ServerStop() --[[ line: 94 ]]
	-- upvalues: scriptProfilerService (ref)
	if self._isProfiling and not self._isClient then
		scriptProfilerService:ServerStop()
		scriptProfilerService:ServerRequestData()
		self._isProfiling = false
		
		return
	end
end

function t:IsProfiling() --[[ line: 105 ]]
	return self._isProfiling
end

function t:Disconnect() --[[ line: 109 ]]
	if self._connection then
		self._connection:Disconnect()
		self._connection = nil
	end
end

return t