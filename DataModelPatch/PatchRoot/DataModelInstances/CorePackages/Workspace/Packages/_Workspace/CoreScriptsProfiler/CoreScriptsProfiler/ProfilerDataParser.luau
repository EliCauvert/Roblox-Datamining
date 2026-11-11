local ScriptProfilerService = game:GetService("ScriptProfilerService")
local ProfilerDataParserModule = {}
ProfilerDataParserModule.__index = ProfilerDataParserModule

function ProfilerDataParserModule.new(JsonString)
	-- upvalues: ProfilerDataParserModule (copy), ScriptProfilerService (copy)
	local self = setmetatable({ _data = nil }, ProfilerDataParserModule)
	local Success, Result = pcall(function()
		-- upvalues: ScriptProfilerService (upval), JsonString (copy)
		return ScriptProfilerService:DeserializeJSON(JsonString)
	end)
	
	if Success then
		self._data = Result
		
		return self
	else
		warn("[ProfilerDataParser] Failed to deserialize JSON:", Result)
		
		return self
	end
end

function ProfilerDataParserModule.getFunctionById(p1, p2)
	return if p1._data then p1._data.Functions[p2] else nil
end

function ProfilerDataParserModule:getNodeById(p1)
	local Data = self._data
	
	return if Data then Data.Nodes[p1] else nil
end

function ProfilerDataParserModule:getSessionDuration()
	local Data = self._data
	
	if Data then
		local SessionStartTime = Data.SessionStartTime
		local SessionEndTime = Data.SessionEndTime
		
		return if SessionStartTime and SessionEndTime then SessionEndTime - SessionStartTime else nil
	else
		return nil
	end
end

function ProfilerDataParserModule.getTotalFunctions(p1): number
	return if p1._data then #p1._data.Functions else 0
end

function ProfilerDataParserModule:getTotalNodes(): number
	local Data = self._data
	
	return if Data then #Data.Nodes else 0
end

function ProfilerDataParserModule.parsePackageName(Text: string): string
	if not Text or Text == "" then
		return "Unknown"
	end
	local Match: string? = string.match(Text, "^CorePackages%.Packages%._Index%.([^%.%-]+)")
	
	if Match then
		return Match
	else
		local Match1: string? = string.match(Text, "^CorePackages%.Workspace%.Packages%._Workspace%.([^%.]+)")
		
		return if Match1 then Match1 elseif string.match(Text, "^CoreGui%.RobloxGui") then Text:match("^CoreGui%.RobloxGui%.(.*)") elseif string.match(Text, "^Players%.") then if string.match(Text, "CameraModule") then "CameraModule" elseif string.match(Text, "ControlModule") then "ControlModule" else "Players" else "Unknown"
	end
end

function ProfilerDataParserModule:getPackageStatistics()
	-- upvalues: ProfilerDataParserModule (copy)
	if not self._data then
		return {}
	end
	local t = {}
	local ParsePackageNameResult = nil
	local Node = nil
	
	for _, category in self._data.Categories do
		for _, child in self._data.Nodes[category.NodeId].Children do
			Node = self._data.Nodes[child]
			
			for i, _ in Node.Children do
				local Number: number? = tonumber(i)
				
				if not Number then break end
				local Function = self._data.Functions[Number]
				
				if not Function then break end
				ParsePackageNameResult = ProfilerDataParserModule.parsePackageName(Function.Source)
				
				if not ParsePackageNameResult then break end
				if not t[ParsePackageNameResult] then
					t[ParsePackageNameResult] = { count = 0, totalDuration = 0 }
				end
				local Entry = t[ParsePackageNameResult]
				Entry.count += 1
				local Entry1 = t[ParsePackageNameResult]
				Entry1.totalDuration += Node.TotalDuration
				break
			end
		end
	end
	return t
end

return ProfilerDataParserModule