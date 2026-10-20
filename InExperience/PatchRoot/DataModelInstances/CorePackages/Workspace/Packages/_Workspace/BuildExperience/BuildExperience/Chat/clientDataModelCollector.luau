local function defaultDependencies()
	local Players = game:GetService("Players")
	
	return {
		gameId = game.GameId,
		root = game,
		players = Players,
		localPlayer = Players.LocalPlayer,
		getService = function(ChildName)
			local Success, Result = pcall(game.GetService, game, ChildName)
			
			return if Success then Result else game:FindFirstChild(ChildName)
		end,
		getReflectionProperties = function(ClassName)
			return game:GetService("ReflectionService"):GetPropertiesOfClass(ClassName, {})
		end
	}
end

local function _(p1)
	local Success, Result = pcall(p1.GetChildren, p1)
	
	return if Success and typeof(Result) == "table" then Result else {}
end

local function escapePathSegment(Text: string)
	return if Text == "" then "%00" else Text:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
end

local _ = function(Text: string)
	return if Text == "%00" then "" else Text:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
end

local function getChildPathEntries(Parent)
	local Success, Result = pcall(Parent.GetChildren, Parent)
	local Result1 = if Success and typeof(Result) == "table" then Result else {}
	local t = {}
	
	for _, value in Result1 do
		t[value.Name] = (t[value.Name] or 0) + 1
	end
	local t1 = {}
	local List = {}
	
	for _, value1 in Result1 do
		local Name: string = value1.Name
		local v1 = (t1[Name] or 0) + 1
		t1[Name] = v1
		table.insert(List, {
			instance = value1,
			segment = (if Name == "" then "%00" else Name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")) .. (if t[Name] > 1 then `[{v1}]` else "")
		})
	end
	return List
end

local function formatChildSegment(Parent)
	-- upvalues: getChildPathEntries (copy), escapePathSegment (copy)
	if Parent.Parent ~= nil then
		for _, value in getChildPathEntries(Parent.Parent) do
			if value.instance == Parent then
				return value.segment
			end
		end
	end
	return escapePathSegment(Parent.Name)
end

local _ = function(p1, p2)
	return if p1 == "" then p2 else `{p1}.{p2}`
end

local function splitPath(Text: string)
	local List = {}
	
	for i in string.gmatch(Text:gsub("^game%.", ""):gsub("^game$", ""), "[^%.]+") do
		if i ~= "" then
			table.insert(List, i)
		end
	end
	return List
end

local _ = function(Text: string)
	local Match, Match2 = string.match(Text, "^(.*)%[(%d+)%]$")
	local Match1 = Match or Text
	
	return if Match1 == "%00" then "" else Match1:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%"), tonumber(Match2) or 1
end

local _ = function(p1, Name, Count)
	local Count1 = 0
	local Success, Result = pcall(p1.GetChildren, p1)
	local Result1 = if Success and typeof(Result) == "table" then Result else {}
	for _, value in Result1 do
		if value.Name == Name then
			Count1 += 1
			
			if Count1 == Count then
				return value
			end
		end
	end
	return nil
end

local function resolvePath(Text: string, p2)
	-- upvalues: splitPath (copy), getChildPathEntries (copy)
	if Text == nil or Text == "" or string.lower(Text) == "game" then
		return p2.root, ""
	end
	local SplitPathResult = splitPath(Text)
	
	if #SplitPathResult == 0 then
		return p2.root, ""
	end
	local Text2: string = SplitPathResult[1]
	local Match, Match2 = string.match(Text2, "^(.*)%[(%d+)%]$")
	local Match1 = Match or Text2
	local _25 = if Match1 == "%00" then "" else Match1:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
	local _: number = tonumber(Match2) or 1
	local Service = p2.getService(_25)
	
	if Service == nil then
		return nil, nil
	end
	local Service1 = Service
	local LocalPlayerName = nil
	repeat
		if Service1.Parent ~= nil then
			for _, value in getChildPathEntries(Service1.Parent) do
				if value.instance == Service1 then
					LocalPlayerName = value.segment
					break
				end
			end
		end
		local Name: string = Service1.Name
		LocalPlayerName = if Name == "" then "%00" else Name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
	until true
	local LocalPlayer = nil
	for i = 2, #SplitPathResult do
		local Text1: string = SplitPathResult[i]
		local Match3, Match2_1 = string.match(Text1, "^(.*)%[(%d+)%]$")
		local Match3_1 = Match3 or Text1
		local _251 = if Match3_1 == "%00" then "" else Match3_1:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
		local Number: number = tonumber(Match2_1) or 1
		
		if Service == p2.players and _251 == "LocalPlayer" then
			LocalPlayer = p2.localPlayer
		else
			local Count = 0
			local Success, Result = pcall(Service.GetChildren, Service)
			local Result1 = if Success and typeof(Result) == "table" then Result else {}
			LocalPlayer = nil
			
			for _, value1 in Result1 do
				if value1.Name == _251 then
					Count += 1
					
					if Count == Number then
						LocalPlayer = value1
						break
					end
				end
			end
		end
		if LocalPlayer == nil then
			return nil, nil
		end
		Service = LocalPlayer
		
		if Service == p2.localPlayer then
			LocalPlayerName = `{LocalPlayerName}.LocalPlayer`
		else
			local LocalPlayerName1: string = LocalPlayerName
			local Service2 = Service
			local Segment = nil
			repeat
				if Service2.Parent == nil then break end
				for _, value2 in getChildPathEntries(Service2.Parent) do
					if value2.instance == Service2 then
						Segment = value2.segment
						break
					end
				end
				local Name: string = Service2.Name
				Segment = if Name == "" then "%00" else Name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
			until true
			LocalPlayerName = if LocalPlayerName1 == "" then Segment else `{LocalPlayerName1}.{Segment}`
		end
	end
	return Service, LocalPlayerName
end

local function getDisplayPath(Parent, p3): string
	-- upvalues: formatChildSegment (copy)
	local List = {}
	local Parent1 = Parent
	while Parent1 ~= nil and Parent1 ~= p3.root do
		if Parent1 == p3.localPlayer then
			table.insert(List, 1, "LocalPlayer")
			table.insert(List, 1, "Players")
			
			return table.concat(List, ".")
		end
		table.insert(List, 1, formatChildSegment(Parent1))
		Parent1 = Parent1.Parent
	end
	return if Parent1 == p3.root then table.concat(List, ".") else tostring(Parent)
end

local function truncateString(Text: string): string
	if #Text <= 4096 then
		return Text
	end
	local Index = 4082
	while Index > 0 do
		local ByteValue = string.byte(Text, Index)
		
		if ByteValue == nil or ByteValue < 128 or ByteValue >= 192 then break end
		Index -= 1
	end
	local v2 = 4082
	local ByteValue = if Index > 0 then string.byte(Text, Index) else nil
	
	if ByteValue ~= nil and Index + (if ByteValue < 128 then 1 elseif ByteValue < 224 then 2 elseif ByteValue < 240 then 3 elseif ByteValue < 248 then 4 else 1) - 1 > 4082 then
		v2 = Index - 1
	end
	return string.sub(Text, 1, (math.max(v2, 0))) .. "...<truncated>"
end

local function serializeValue(List, p4, p5)
	-- upvalues: truncateString (copy), getDisplayPath (copy), serializeValue (copy)
	local ValueType = typeof(List)
	
	if ValueType == "nil" or ValueType == "boolean" then
		return List
	end
	if ValueType == "string" then
		return (truncateString(List))
	end
	if ValueType == "number" then
		return if List == List and List ~= 1e999 and List ~= -1e999 then List else tostring(List)
	end
	if ValueType == "Instance" then
		return getDisplayPath(List, p4)
	end
	if ValueType ~= "table" then
		local Success, Result = pcall(tostring, List)
		
		return if Success then truncateString(Result) else `<unserializable {ValueType}>`
	end
	local P23 = p5 or 0
	
	if P23 >= 2 then
		return "<table>"
	end
	local t = {}
	local Count = 0
	
	for i, value in List do
		Count += 1
		
		if Count > 50 then
			t.__truncated = true
			
			return t
		end
		t[truncateString((tostring(i)))] = serializeValue(value, p4, P23 + 1)
	end
	return t
end

local function countDescendants(p6)
	local Count = 10000
	local Success, Result = pcall(p6.GetChildren, p6)
	local Result1 = if Success and typeof(Result) == "table" then Result else {}
	local List = {}
	local Flag = false
	
	for _, value in Result1 do
		if Count <= #List then
			Flag = true
			break
		else
			table.insert(List, value)
			continue
		end
	end
	local Count1 = 0
	while #List > 0 and Count > 0 do
		local Removed = table.remove(List)
		Count1 += 1
		Count -= 1
		local Success1, Result2 = pcall(Removed.GetChildren, Removed)
		local Result3 = if Success1 and typeof(Result2) == "table" then Result2 else {}
		for _, value1 in Result3 do
			if Count <= #List then
				Flag = true
				break
			else
				table.insert(List, value1)
				continue
			end
		end
	end
	return Count1, Flag or #List > 0
end

local function countDescendantsByInstance(p7)
	local Totals = {}
	local t = {}
	local List = { { expanded = false, instance = p7 } }
	local Count = 1
	local Flag = false
	while #List > 0 do
		local Removed = table.remove(List)
		
		if Removed == nil then break end
		if Removed.expanded then
			local Total = 0
			local Entry = t[Removed.instance] or {}
			for _, value in Entry do
				Total += 1 + (Totals[value] or 0)
			end
			Totals[Removed.instance] = Total
		else
			local RemovedInstance = Removed.instance
			local Success, Result = pcall(RemovedInstance.GetChildren, RemovedInstance)
			local Result1 = if Success and typeof(Result) == "table" then Result else {}
			t[Removed.instance] = Result1
			table.insert(List, { expanded = true, instance = Removed.instance })
			
			for i = #Result1, 1, -1 do
				if Count >= 10000 then
					Flag = true
					break
				else
					Count += 1
					table.insert(List, { expanded = false, instance = Result1[i] })
				end
			end
		end
	end
	return Totals, Flag
end

local function summarizeChildren(p8, Path)
	-- upvalues: getChildPathEntries (copy), countDescendants (copy)
	local ChildPathEntries = getChildPathEntries(p8)
	local ImmediateChildren = {}
	
	for i, childPathEntry in ChildPathEntries do
		if i > 100 then break end
		local Segment = childPathEntry.segment
		table.insert(ImmediateChildren, {
			className = childPathEntry.instance.ClassName,
			path = if Path == "" then Segment else `{Path}.{Segment}`
		})
	end
	local CountDescendantsResult, CountDescendantsResult2 = countDescendants(p8)
	local Truncated = #ImmediateChildren < #ChildPathEntries or CountDescendantsResult2
	
	return {
		immediateChildren = ImmediateChildren,
		childrenCount = #ChildPathEntries,
		totalDescendants = CountDescendantsResult,
		truncated = Truncated
	}, Truncated
end

local function getPropertyNames(p9, p10)
	local List = {}
	local t = {}
	
	local function _(Key)
		-- upvalues: t (copy), List (copy)
		if typeof(Key) == "string" and Key ~= "" and not t[Key] and #List < 256 then
			t[Key] = true
			table.insert(List, Key)
		end
	end
	
	for _, value in p10.getReflectionProperties(p9.ClassName) do
		if typeof(value) == "table" then
			local Name = value.Name
			
			if typeof(Name) == "string" and Name ~= "" and not t[Name] and #List < 256 then
				t[Name] = true
				table.insert(List, Name)
			end
		end
	end
	table.sort(List)
	
	return List
end

local function collectProperties(p11, p12)
	-- upvalues: getPropertyNames (copy), serializeValue (copy)
	local t = {}
	
	for _, value in getPropertyNames(p11, p12) do
		local Success, Result = pcall(function()
			-- upvalues: p11 (copy), value (copy)
			return p11[value]
		end)
		
		if Success and Result ~= nil then
			t[value] = serializeValue(Result, p12)
		end
	end
	return t
end

local function collectAttributes(p13, p14)
	-- upvalues: serializeValue (copy)
	local Success, Result = pcall(p13.GetAttributes, p13)
	
	if not Success or typeof(Result) ~= "table" then
		return {}
	end
	local t = {}
	local List = {}
	
	for i in Result do
		table.insert(List, i)
	end
	table.sort(List)
	
	for i1, value in List do
		if i1 > 100 then break end
		t[value] = serializeValue(Result[value], p14)
	end
	return t
end

local _ = function(Message)
	return { status = "invalid_input", message = Message }
end

local _ = function()
	return {
		status = "not_in_game",
		message = "The user is not in the game."
	}
end

local _ = function(Path)
	return {
		status = "not_found",
		message = "No instance exists at the requested path.",
		path = Path
	}
end

local _ = function(p15, p16)
	if typeof(p15) == "table" then
		local v3 = p15[p16]
		
		return if typeof(v3) == "string" and v3 ~= "" then v3 else nil
	else
		return nil
	end
end

local _ = function(p15, p16, p17, MinValue: number, MaxValue: number)
	return if typeof(p15) == "table" and typeof(p15[p16]) == "number" then math.clamp(math.floor(p15[p16]), MinValue, MaxValue) else p17
end

local function getKeywords(p15)
	local Text = nil
	if typeof(p15) == "table" then
		local Keywords = p15.keywords
		Text = if typeof(Keywords) == "string" and Keywords ~= "" then Keywords else nil
	else
		Text = nil
	end
	if Text == nil then
		return {}
	end
	local List = {}
	
	for i in string.gmatch(string.lower(Text), "[^,%s]+") do
		table.insert(List, i)
	end
	return List
end

local function matchesFilters(p16, p17, List): boolean
	if p17 ~= nil then
		local Success, Result = pcall(p16.IsA, p16, p17)
		
		if not Success or not Result then
			return false
		end
	end
	local Lowered = string.lower(p16.Name)
	
	for _, value in List do
		if not string.find(Lowered, value, 1, true) then
			return false
		end
	end
	return true
end

local function makeSearchMatch(_instance, Path)
	local Parent = _instance.Parent
	local Success, Result = pcall(_instance.GetChildren, _instance)
	
	return {
		_instance = _instance,
		name = _instance.Name,
		className = _instance.ClassName,
		path = Path,
		parentName = if Parent == nil then nil else Parent.Name,
		childrenCount = #(if Success and typeof(Result) == "table" then Result else {})
	}
end

return {
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	NOT_FOUND_MESSAGE = "No instance exists at the requested path.",
	getInstancePath = function(p18, p19)
		-- upvalues: getDisplayPath (copy), defaultDependencies (copy)
		return getDisplayPath(p18, p19 or defaultDependencies())
	end,
	resolveInstancePath = function(p18, ClassName, p19)
		-- upvalues: resolvePath (copy), defaultDependencies (copy)
		local ResolvePathResult, ResolvePathResult2 = resolvePath(p18, p19 or defaultDependencies())
		
		return if ResolvePathResult == nil or ResolvePathResult.ClassName ~= ClassName then nil else ResolvePathResult2
	end,
	searchClientDataModel = function(p18, p19)
		-- upvalues: defaultDependencies (copy), resolvePath (copy), getKeywords (copy), getChildPathEntries (copy), matchesFilters (copy), makeSearchMatch (copy), countDescendantsByInstance (copy)
		local P49 = p19 or defaultDependencies()
		
		if P49.gameId == 0 then
			return {
				status = "not_in_game",
				message = "The user is not in the game."
			}
		end
		local v3 = nil
		if typeof(p18) == "table" then
			local Path = p18.path
			v3 = if typeof(Path) == "string" and Path ~= "" then Path else nil
		else
			v3 = nil
		end
		local ResolvePathResult, ResolvePathResult2 = resolvePath(v3, P49)
		
		if ResolvePathResult == nil or ResolvePathResult2 == nil then
			return {
				status = "not_found",
				message = "No instance exists at the requested path.",
				path = v3 or ""
			}
		end
		local ClampedValue: number = if typeof(p18) == "table" and typeof(p18.max_depth) == "number" then math.clamp(math.floor(p18.max_depth), 0, 10) else 3
		local ClampedValue1: number = if typeof(p18) == "table" and typeof(p18.head_limit) == "number" then math.clamp(math.floor(p18.head_limit), 1, 200) else 200
		local v4 = nil
		
		if typeof(p18) == "table" then
			local InstanceType = p18.instance_type
			v4 = if typeof(InstanceType) == "string" and InstanceType ~= "" then InstanceType else nil
		else
			v4 = nil
		end
		local Keywords = getKeywords(p18)
		local List = {}
		
		if ResolvePathResult2 == "" then
			for _, value in getChildPathEntries(ResolvePathResult) do
				table.insert(List, {
					depth = 1,
					instance = value.instance,
					path = value.segment
				})
			end
		else
			table.insert(List, {
				depth = 0,
				instance = ResolvePathResult,
				path = ResolvePathResult2
			})
		end
		local Matches = {}
		local TotalFound = 0
		local Count = 0
		local Count1 = 1
		local Flag = false
		while Count1 <= #List do
			if Count >= 10000 then
				Flag = true
				break
			end
			local Entry = List[Count1]
			Count1 += 1
			Count += 1
			
			if matchesFilters(Entry.instance, v4, Keywords) then
				TotalFound += 1
				
				if #Matches < ClampedValue1 then
					table.insert(Matches, (makeSearchMatch(Entry.instance, Entry.path)))
				else
					Flag = true
				end
			end
			if Entry.depth >= ClampedValue then continue end
			for _, value1 in getChildPathEntries(Entry.instance) do
				if Count + (#List - Count1 + 1) >= 10000 then
					Flag = true
					break
				else
					local Path = Entry.path
					local Segment = value1.segment
					table.insert(List, {
						instance = value1.instance,
						path = if Path == "" then Segment else `{Path}.{Segment}`,
						depth = Entry.depth + 1
					})
					continue
				end
			end
		end
		if #Matches > 0 then
			local CountDescendantsByInstanceResult, CountDescendantsByInstanceResult2 = countDescendantsByInstance(ResolvePathResult)
			
			for _, match in Matches do
				match.totalDescendants = CountDescendantsByInstanceResult[match._instance] or 0
				match._instance = nil
			end
			Flag = Flag or CountDescendantsByInstanceResult2
		end
		return {
			status = "ok",
			matches = Matches,
			count = #Matches,
			totalFound = TotalFound,
			truncated = Flag
		}
	end,
	inspectClientInstance = function(p20, p21)
		-- upvalues: defaultDependencies (copy), resolvePath (copy), summarizeChildren (copy), collectProperties (copy), collectAttributes (copy)
		local P51 = p21 or defaultDependencies()
		
		if P51.gameId == 0 then
			return {
				status = "not_in_game",
				message = "The user is not in the game."
			}
		end
		local Path = nil
		if typeof(p20) == "table" then
			local Path1 = p20.path
			Path = if typeof(Path1) == "string" and Path1 ~= "" then Path1 else nil
		else
			Path = nil
		end
		if Path == nil then
			return { status = "invalid_input", message = "path is required" }
		else
			local ResolvePathResult, ResolvePathResult2 = resolvePath(Path, P51)
			
			return if ResolvePathResult == nil or ResolvePathResult2 == nil then {
				status = "not_found",
				message = "No instance exists at the requested path.",
				path = Path
			} else {
				status = "ok",
				instance = {
					name = ResolvePathResult.Name,
					className = ResolvePathResult.ClassName,
					path = ResolvePathResult2,
					properties = collectProperties(ResolvePathResult, P51),
					attributes = collectAttributes(ResolvePathResult, P51),
					children = summarizeChildren(ResolvePathResult, ResolvePathResult2)
				}
			}
		end
	end
}