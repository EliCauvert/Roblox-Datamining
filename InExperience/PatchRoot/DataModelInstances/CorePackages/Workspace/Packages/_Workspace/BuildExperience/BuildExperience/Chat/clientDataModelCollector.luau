local function defaultDependencies() --[[ line: 27 ]]
	local playersService = game:GetService("Players")
	
	return {
		gameId = game.GameId,
		root = game,
		players = playersService,
		localPlayer = playersService.LocalPlayer,
		getService = function(p0) --[[ line: 34 ]]
			local ok, status = pcall(game.GetService, game, p0)
			
			return if ok then status else game:FindFirstChild(p0)
		end,
		getReflectionProperties = function(p1) --[[ line: 41 ]]
			return game:GetService("ReflectionService"):GetPropertiesOfClass(p1, {})
		end
	}
end

local function _(p2) --[[ line: 48 | named "safeGetChildren" ]]
	local ok, status = pcall(p2.GetChildren, p2)
	
	return if ok and typeof(status) == "table" then status else {}
end

local function escapePathSegment(p3) --[[ line: 53 ]]
	return if p3 == "" then "%00" else p3:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
end

local _ = function(p4) --[[ line: 60 | named "unescapePathSegment" ]]
	return if p4 == "%00" then "" else p4:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
end

local function getChildPathEntries(p5) --[[ line: 72 ]]
	local ok, status = pcall(p5.GetChildren, p5)
	local var19 = if ok and typeof(status) == "table" then status else {}
	ok = {}
	
	for i, v in var19 do
		ok[v.Name] = (ok[v.Name] or 0) + 1
	end
	local t = {}
	local t_1 = {}
	
	for i_1, v_1 in var19 do
		local name = v_1.Name
		local var22 = (t[name] or 0) + 1
		t[name] = var22
		table.insert(t_1, {
			instance = v_1,
			segment = (if name == "" then "%00" else name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")) .. (if ok[name] > 1 then `[{var22}]` else "")
		})
	end
	return t_1
end

local function formatChildSegment(p6) --[[ line: 93 ]]
	-- upvalues: getChildPathEntries (ref), escapePathSegment (ref)
	if p6.Parent ~= nil then
		for i, v in getChildPathEntries(p6.Parent) do
			if v.instance == p6 then
				return v.segment
			end
		end
	end
	return escapePathSegment(p6.Name)
end

local _ = function(p7, p8) --[[ line: 104 | named "appendPathSegment" ]]
	return if p7 == "" then p8 else `{p7}.{p8}`
end

local function splitPath(p9) --[[ line: 108 ]]
	local t = {}
	
	for i in string.gmatch(p9:gsub("^game%.", ""):gsub("^game$", ""), "[^%.]+") do
		if i ~= "" then
			table.insert(t, i)
		end
	end
	return t
end

local _ = function(p10) --[[ line: 119 | named "parsePathSegment" ]]
	local match, match_1 = string.match(p10, "^(.*)%[(%d+)%]$")
	local match_2 = match or p10
	
	return if match_2 == "%00" then "" else match_2:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%"), tonumber(match_1) or 1
end

local _ = function(p11, p12, p13) --[[ line: 124 | named "findChild" ]]
	local var27 = 0
	local ok, status = pcall(p11.GetChildren, p11)
	
	for ok, v in if ok and typeof(status) == "table" then status else {} do
		if v.Name == p12 then
			var27 += 1
			
			if var27 == p13 then
				return v
			end
		end
	end
	return nil
end

local function resolvePath(p14, p15) --[[ line: 137 ]]
	-- upvalues: splitPath (ref), getChildPathEntries (ref)
	if p14 == nil or p14 == "" or string.lower(p14) == "game" then
		return p15.root, ""
	end
	local var28 = splitPath(p14)
	
	if #var28 == 0 then
		return p15.root, ""
	end
	local segment, v
	local var29 = var28[1]
	local match, match_1 = string.match(var29, "^(.*)%[(%d+)%]$")
	local match_2 = match or var29
	local var33 = if match_2 == "%00" then "" else match_2:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
	local _ = tonumber(match_1) or 1
	local service = p15.getService(var33)
	
	if service == nil then
		return nil, nil
	elseif service.Parent ~= nil then
		for i, v in getChildPathEntries(service.Parent) do
			if v.instance == service then
				segment = v.segment
				for i_2 = 2, #var28 do
					v = var28[i_2]
					local match_3, match_4 = string.match(v, "^(.*)%[(%d+)%]$")
					local match_3_1 = match_3 or v
					local var38 = if match_3_1 == "%00" then "" else match_3_1:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
					local var39 = tonumber(match_4) or 1
					v = nil
					
					if service == p15.players and var38 == "LocalPlayer" then
						v = p15.localPlayer
						if v ~= nil then
							service = v
							
							if service == p15.localPlayer then
								segment = `{segment}.LocalPlayer`
							else
								local segment_1
								local var42 = segment
								match_3_1 = service
								
								if match_3_1.Parent == nil then break end
								for status, v_2 in getChildPathEntries(match_3_1.Parent) do
									if v_2.instance == match_3_1 then
										segment_1 = v_2.segment
										segment = if var42 == "" then segment_1 else `{var42}.{segment_1}`
									end
								end
								local name = match_3_1.Name
								segment_1 = if name == "" then "%00" else name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
							end
						end
						return nil, nil
					end
					local var40 = service
					local var41 = 0
					local ok, status = pcall(var40.GetChildren, var40)
					match_3_1 = if ok and typeof(status) == "table" then status else {}
					
					for ok, status in match_3_1 do
						if status.Name == var38 then
							var41 += 1
							
							if var41 == var39 then
								v = status
							end
						end
					end
					v = nil
				end
				return service, segment
			end
		end
	end
	local name = service.Name
	segment = if name == "" then "%00" else name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
end

local function getDisplayPath(p16, p17) --[[ line: 174 ]]
	-- upvalues: formatChildSegment (ref)
	local t = {}
	local var44 = p16
	while var44 ~= nil and var44 ~= p17.root do
		if var44 ~= p17.localPlayer then
			table.insert(t, 1, formatChildSegment(var44))
			var44 = var44.Parent
			continue
		end
		table.insert(t, 1, "LocalPlayer")
		table.insert(t, 1, "Players")
		
		return table.concat(t, ".")
	end
	return if var44 == p17.root then table.concat(t, ".") else tostring(p16)
end

local function truncateString(p18) --[[ line: 189 ]]
	if #p18 <= 4096 then
		return p18
	end
	local var45 = 4082
	while var45 > 0 do
		local byteValue = string.byte(p18, var45)
		
		if byteValue == nil or byteValue < 128 or byteValue >= 192 then break end
		var45 -= 1
	end
	local var47 = 4082
	local var48 = if var45 > 0 then string.byte(p18, var45) else nil
	
	if var48 ~= nil and var45 + (if var48 < 128 then 1 elseif var48 < 224 then 2 elseif var48 < 240 then 3 elseif var48 < 248 then 4 else 1) - 1 > 4082 then
		var47 = var45 - 1
	end
	return string.sub(p18, 1, math.max(var47, 0)) .. "...<truncated>"
end

local function serializeValue(p19, p20, p21) --[[ line: 221 ]]
	-- upvalues: truncateString (ref), getDisplayPath (ref), serializeValue (ref)
	local var49 = typeof(p19)
	
	if var49 == "nil" or var49 == "boolean" then
		return p19
	elseif var49 == "string" then
		return truncateString(p19)
	elseif var49 == "number" then
		return if p19 == p19 and p19 ~= 1e999 and p19 ~= -1e999 then p19 else tostring(p19)
	elseif var49 == "Instance" then
		return getDisplayPath(p19, p20)
	elseif var49 == "table" then
		p21 = p21 or 0
		
		if p21 >= 2 then
			return "<table>"
		end
		local t = {}
		local var52 = 0
		
		for i, v in p19 do
			var52 += 1
			
			if var52 <= 50 then
				t[truncateString(tostring(i))] = serializeValue(v, p20, p21 + 1)
				continue
			end
			t.__truncated = true
			
			return t
		end
		return t
	else
		local ok, status = pcall(tostring, p19)
		
		return if ok then truncateString(status) else `<unserializable {var49}>`
	end
end

local function countDescendants(p22) --[[ line: 257 ]]
	local var53 = 10000
	local ok, status = pcall(p22.GetChildren, p22)
	local var54 = if ok and typeof(status) == "table" then status else {}
	ok = {}
	local var55 = false
	
	for i, v in var54 do
		if var53 > #ok then
			var55 = true
			break
		end
		table.insert(ok, v)
	end
	local status_1
	local var56 = 0
	while #ok > 0 and var53 > 0 do
		local removed = table.remove(ok)
		var56 += 1
		var53 -= 1
		ok_1, status_1 = pcall(removed.GetChildren, removed)
		
		for ok_1, status_1 in if ok_1 and typeof(status_1) == "table" then status_1 else {} do
			if var53 > #ok then
				var55 = true
				break
			end
			table.insert(ok, status_1)
		end
	end
	return var56, var55 or #ok > 0
end

local function countDescendantsByInstance(p23) --[[ line: 287 ]]
	local removed
	local t = {}
	local t_1 = {}
	local list = { { expanded = false, instance = p23 } }
	local var61 = 1
	local var62 = false
	while #list > 0 do
		removed = table.remove(list)
		
		if removed == nil then break end
		if removed.expanded then
			local var64 = 0
			
			for i, v in t_1[removed.instance] or {} do
				var64 += 1 + (t[v] or 0)
			end
			t[removed.instance] = var64
		end
		local instance = removed.instance
		local ok, status = pcall(instance.GetChildren, instance)
		local var65 = if ok and typeof(status) == "table" then status else {}
		t_1[removed.instance] = var65
		table.insert(list, { expanded = true, instance = removed.instance })
		
		for status = #var65, 1, -1 do
			if var61 >= 10000 then
				var62 = true
				break
			end
			var61 += 1
			table.insert(list, { expanded = false, instance = var65[status] })
		end
	end
	return t, var62
end

local function summarizeChildren(p24, p25) --[[ line: 335 ]]
	-- upvalues: getChildPathEntries (ref), countDescendants (ref)
	local var66 = getChildPathEntries(p24)
	local t = {}
	
	for i, v in var66 do
		if i > 100 then break end
		local t_1 = { className = v.instance.ClassName }
		local segment = v.segment
		t_1.path = if p25 == "" then segment else `{p25}.{segment}`
		table.insert(t, t_1)
	end
	local var69, var70 = countDescendants(p24)
	local var71 = if #t >= #var66 then var70 else true
	
	return {
		immediateChildren = t,
		childrenCount = #var66,
		totalDescendants = var69,
		truncated = var71
	}, var71
end

local function getPropertyNames(p26, p27) --[[ line: 359 ]]
	local t = {}
	local t_1 = {}
	
	local function _(p28) --[[ line: 363 | named "addName" ]]
		-- upvalues: t_1 (ref), t (ref)
		if typeof(p28) == "string" and p28 ~= "" and (not t_1[p28] and #t < 256) then
			t_1[p28] = true
			table.insert(t, p28)
		end
	end
	
	for i, v in p27.getReflectionProperties(p26.ClassName) do
		if typeof(v) == "table" then
			local name = v.Name
			
			if typeof(name) == "string" and name ~= "" and (not t_1[name] and #t < 256) then
				t_1[name] = true
				table.insert(t, name)
			end
		end
	end
	table.sort(t)
	
	return t
end

local function collectProperties(p29, p30) --[[ line: 380 ]]
	-- upvalues: getPropertyNames (ref), serializeValue (ref)
	local t = {}
	
	for i, v in getPropertyNames(p29, p30) do
		local ok, status = pcall(function() --[[ line: 383 ]]
			-- upvalues: p29 (ref), v (ref)
			return p29[v]
		end)
		
		if ok and status ~= nil then
			t[v] = serializeValue(status, p30)
		end
	end
	return t
end

local function collectAttributes(p31, p32) --[[ line: 393 ]]
	-- upvalues: serializeValue (ref)
	local ok, status = pcall(p31.GetAttributes, p31)
	
	if not ok or typeof(status) ~= "table" then
		return {}
	end
	local t = {}
	local t_1 = {}
	
	for i in status do
		table.insert(t_1, i)
	end
	table.sort(t_1)
	
	for i_1, v in t_1 do
		if i_1 > 100 then break end
		t[v] = serializeValue(status[v], p32)
	end
	return t
end

local _ = function(p33) --[[ line: 415 | named "invalidInput" ]]
	return { status = "invalid_input", message = p33 }
end

local _ = function() --[[ line: 422 | named "notInGame" ]]
	return {
		status = "not_in_game",
		message = "The user is not in the game."
	}
end

local _ = function(p34) --[[ line: 429 | named "notFound" ]]
	return {
		status = "not_found",
		message = "No instance exists at the requested path.",
		path = p34
	}
end

local _ = function(p35, p36) --[[ line: 437 | named "getOptionalString" ]]
	if typeof(p35) ~= "table" then
		return nil
	end
	local var77 = p35[p36]
	
	return if typeof(var77) == "string" and var77 ~= "" then var77 else nil
end

local _ = function(p37, p38, p39, p40, p41) --[[ line: 445 | named "getBoundedInteger" ]]
	return if typeof(p37) == "table" and typeof(p37[p38]) == "number" then math.clamp(math.floor(p37[p38]), p40, p41) else p39
end

local function getKeywords(p42) --[[ line: 458 ]]
	local var78, keywords
	if typeof(p42) == "table" then
		keywords = p42.keywords
		var78 = if typeof(keywords) == "string" and keywords ~= "" then keywords else nil
	else
		var78 = nil
	end
	if var78 == nil then
		return {}
	end
	keywords = {}
	
	for i in string.gmatch(string.lower(var78), "[^,%s]+") do
		table.insert(keywords, i)
	end
	return keywords
end

local function matchesFilters(p43, p44, p45) --[[ line: 471 ]]
	local ok
	if p44 ~= nil then
		ok, status = pcall(p43.IsA, p43, p44)
		
		if not ok or not status then
			return false
		end
	end
	ok = string.lower(p43.Name)
	
	for i, v in p45 do
		if not string.find(ok, v, 1, true) then
			return false
		end
	end
	return true
end

local function makeSearchMatch(p46, p47) --[[ line: 488 ]]
	local parent = p46.Parent
	local t = {
		_instance = p46,
		name = p46.Name,
		className = p46.ClassName,
		path = p47,
		parentName = if parent ~= nil then nil else parent.Name
	}
	local ok, status = pcall(p46.GetChildren, p46)
	t.childrenCount = #(if ok and typeof(status) == "table" then status else {})
	
	return t
end

return {
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	NOT_FOUND_MESSAGE = "No instance exists at the requested path.",
	searchClientDataModel = function(p48, p49) --[[ line: 500 ]]
		-- upvalues: defaultDependencies (ref), resolvePath (ref), getKeywords (ref), getChildPathEntries (ref), matchesFilters (ref), makeSearchMatch (ref), countDescendantsByInstance (ref)
		local var81, path
		p49 = p49 or defaultDependencies()
		
		if p49.gameId == 0 then
			return {
				status = "not_in_game",
				message = "The user is not in the game."
			}
		elseif typeof(p48) == "table" then
			path = p48.path
			var81 = if typeof(path) == "string" and path ~= "" then path else nil
		else
			var81 = nil
		end
		path, var82 = resolvePath(var81, p49)
		
		if path == nil or var82 == nil then
			return {
				status = "not_found",
				message = "No instance exists at the requested path.",
				path = var81 or ""
			}
		end
		local var85, instanceType
		local var83 = if typeof(p48) == "table" and typeof(p48.max_depth) == "number" then math.clamp(math.floor(p48.max_depth), 0, 10) else 3
		local var84 = if typeof(p48) == "table" and typeof(p48.head_limit) == "number" then math.clamp(math.floor(p48.head_limit), 1, 200) else 200
		
		if typeof(p48) == "table" then
			instanceType = p48.instance_type
			var85 = if typeof(instanceType) == "string" and instanceType ~= "" then instanceType else nil
		else
			var85 = nil
		end
		instanceType = getKeywords(p48)
		local t = {}
		
		if var82 == "" then
			for i, v in getChildPathEntries(path) do
				table.insert(t, { depth = 1, instance = v.instance, path = v.segment })
			end
		else
			table.insert(t, { depth = 0, instance = path, path = var82 })
		end
		local var92
		local t_1 = {}
		local var88 = 0
		local var89 = 0
		local var90 = 1
		local var91 = false
		while var90 <= #t do
			if var89 >= 10000 then
				var91 = true
				break
			end
			var92 = t[var90]
			var90 += 1
			var89 += 1
			
			if matchesFilters(var92.instance, var85, instanceType) then
				var88 += 1
				
				if #t_1 < var84 then
					table.insert(t_1, makeSearchMatch(var92.instance, var92.path))
				else
					var91 = true
				end
			end
			if var92.depth >= var83 then continue end
			for i, v in getChildPathEntries(var92.instance) do
				if var89 + (#t - var90 + 1) >= 10000 then
					var91 = true
					break
				end
				local t_2 = { instance = v.instance }
				local path_1 = var92.path
				local segment = v.segment
				t_2.path = if path_1 == "" then segment else `{path_1}.{segment}`
				t_2.depth = var92.depth + 1
				table.insert(t, t_2)
			end
		end
		if #t_1 > 0 then
			local var94, var95 = countDescendantsByInstance(path)
			
			for i, v in t_1 do
				v.totalDescendants = var94[v._instance] or 0
				v._instance = nil
			end
			var91 = var91 or var95
		end
		return {
			status = "ok",
			matches = t_1,
			count = #t_1,
			totalFound = var88,
			truncated = var91
		}
	end,
	inspectClientInstance = function(p50, p51) --[[ line: 593 ]]
		-- upvalues: defaultDependencies (ref), resolvePath (ref), summarizeChildren (ref), collectProperties (ref), collectAttributes (ref)
		local var97, path
		p51 = p51 or defaultDependencies()
		
		if p51.gameId == 0 then
			return {
				status = "not_in_game",
				message = "The user is not in the game."
			}
		elseif typeof(p50) == "table" then
			path = p50.path
			var97 = if typeof(path) == "string" and path ~= "" then path else nil
		else
			var97 = nil
		end
		if var97 == nil then
			return { status = "invalid_input", message = "path is required" }
		end
		path, var98 = resolvePath(var97, p51)
		
		return if path == nil or var98 == nil then {
			status = "not_found",
			message = "No instance exists at the requested path.",
			path = var97
		} else {
			status = "ok",
			instance = {
				name = path.Name,
				className = path.ClassName,
				path = var98,
				properties = collectProperties(path, p51),
				attributes = collectAttributes(path, p51),
				children = summarizeChildren(path, var98)
			}
		}
	end
}