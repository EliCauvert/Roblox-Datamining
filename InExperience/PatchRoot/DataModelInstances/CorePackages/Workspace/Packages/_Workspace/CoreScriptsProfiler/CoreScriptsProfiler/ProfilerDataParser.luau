local scriptProfilerService = game:GetService("ScriptProfilerService")
local t = {}
t.__index = t

function t.new(p0)
	-- upvalues: t (ref), scriptProfilerService (ref)
	local tbl = setmetatable({ _data = nil }, t)
	local ok, status = pcall(function()
		-- upvalues: scriptProfilerService (copy), p0 (ref)
		return scriptProfilerService:DeserializeJSON(p0)
	end)
	
	if ok then
		tbl._data = status
		
		return tbl
	end
	warn("[ProfilerDataParser] Failed to deserialize JSON:", status)
	
	return tbl
end

function t:getFunctionById(p1)
	return if self._data then self._data.Functions[p1] else nil
end

function t:getNodeById(p2)
	local data = self._data
	
	return if data then data.Nodes[p2] else nil
end

function t:getSessionDuration()
	local data = self._data
	
	if not data then
		return nil
	end
	local sessionStartTime = data.SessionStartTime
	local sessionEndTime = data.SessionEndTime
	
	return if sessionStartTime and sessionEndTime then sessionEndTime - sessionStartTime else nil
end

function t:getTotalFunctions()
	return if self._data then #self._data.Functions else 0
end

function t:getTotalNodes()
	local data = self._data
	
	return if data then #data.Nodes else 0
end

function t:parsePackageName()
	if not self or self == "" then
		return "Unknown"
	end
	local match = string.match(self, "^CorePackages%.Packages%._Index%.([^%.%-]+)")
	
	if match then
		return match
	end
	local match_1 = string.match(self, "^CorePackages%.Workspace%.Packages%._Workspace%.([^%.]+)")
	
	return match_1 or (if string.match(self, "^CoreGui%.RobloxGui") then self:match("^CoreGui%.RobloxGui%.(.*)") elseif string.match(self, "^Players%.") then if string.match(self, "CameraModule") then "CameraModule" elseif string.match(self, "ControlModule") then "ControlModule" else "Players" else "Unknown")
end

function t:getPackageStatistics()
	-- upvalues: t (ref)
	if not self._data then
		return {}
	end
	local var6, var9
	local t_1 = {}
	
	for i, v in self._data.Categories do
		for i_1, v_1 in self._data.Nodes[v.NodeId].Children do
			var6 = self._data.Nodes[v_1]
			
			for i_2, v_2 in var6.Children do
				local var7 = tonumber(i_2)
				
				if not var7 then break end
				local var8 = self._data.Functions[var7]
				
				if not var8 then break end
				var9 = t.parsePackageName(var8.Source)
				
				if not var9 then break end
				if not t_1[var9] then
					t_1[var9] = { count = 0, totalDuration = 0 }
				end
				t_1[var9].count += 1
				t_1[var9].totalDuration += var6.TotalDuration
				break
			end
		end
	end
	return t_1
end

return t