local function defaultDependencies()
	local playersService = game:GetService("Players")
	
	return {
		gameId = game.GameId,
		root = game,
		players = playersService,
		localPlayer = playersService.LocalPlayer,
		getService = function(p1)
			local ok, status = pcall(game.GetService, game, p1)
			
			return if ok then status else game:FindFirstChild(p1)
		end,
		getReflectionProperties = function(p1)
			return game:GetService("ReflectionService"):GetPropertiesOfClass(p1, {})
		end
	}
end

local function _(p1)
	local ok, status = pcall(p1.GetChildren, p1)
	
	return if ok and typeof(status) == "table" then status else {}
end

local function escapePathSegment(p1)
	return if p1 == "" then "%00" else p1:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
end

local _ = function(p1)
	return if p1 == "%00" then "" else p1:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
end

local function getChildPathEntries(p1)
	local ok, status = pcall(p1.GetChildren, p1)
	local var1 = if ok and typeof(status) == "table" then status else {}
	ok = {}
	
	for i, v in var1 do
		ok[v.Name] = (ok[v.Name] or 0) + 1
	end
	local t = {}
	local t_1 = {}
	
	for i_1, v_1 in var1 do
		local name = v_1.Name
		local var2 = (t[name] or 0) + 1
		t[name] = var2
		table.insert(t_1, {
			instance = v_1,
			segment = (if name == "" then "%00" else name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")) .. (if ok[name] > 1 then `[{var2}]` else "")
		})
	end
	return t_1
end

local function formatChildSegment(p2)
	-- upvalues: getChildPathEntries (ref), escapePathSegment (ref)
	if p2.Parent ~= nil then
		for i, v in getChildPathEntries(p2.Parent) do
			if v.instance == p2 then
				return v.segment
			end
		end
	end
	return escapePathSegment(p2.Name)
end

local _ = function(p3, p4)
	return if p3 == "" then p4 else `{p3}.{p4}`
end

local function splitPath(p3)
	local t = {}
	
	for i in string.gmatch(p3:gsub("^game%.", ""):gsub("^game$", ""), "[^%.]+") do
		if i ~= "" then
			table.insert(t, i)
		end
	end
	return t
end

local _ = function(p4)
	local match, match_1 = string.match(p4, "^(.*)%[(%d+)%]$")
	local match_2 = match or p4
	
	return if match_2 == "%00" then "" else match_2:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%"), tonumber(match_1) or 1
end

local _ = function(p4, p5, p6)
	local var3 = 0
	local ok, status = pcall(p4.GetChildren, p4)
	
	for ok, v in if ok and typeof(status) == "table" then status else {} do
		if v.Name == p5 then
			var3 += 1
			
			if var3 == p6 then
				return v
			end
		end
	end
	return nil
end

local function resolvePath(p7, p8)
	-- upvalues: splitPath (ref), getChildPathEntries (ref)
	if p7 == nil or p7 == "" or string.lower(p7) == "game" then
		return p8.root, ""
	end
	local var4 = splitPath(p7)
	
	if #var4 == 0 then
		return p8.root, ""
	end
	local segment, v
	local var5 = var4[1]
	local match, match_1 = string.match(var5, "^(.*)%[(%d+)%]$")
	local match_2 = match or var5
	local var6 = if match_2 == "%00" then "" else match_2:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
	local _ = tonumber(match_1) or 1
	local service = p8.getService(var6)
	
	if service == nil then
		return nil, nil
	elseif service.Parent ~= nil then
		for i, v in getChildPathEntries(service.Parent) do
			if v.instance == service then
				segment = v.segment
				for i_2 = 2, #var4 do
					v = var4[i_2]
					local match_3, match_4 = string.match(v, "^(.*)%[(%d+)%]$")
					local match_3_1 = match_3 or v
					local var7 = if match_3_1 == "%00" then "" else match_3_1:gsub("%%2E", "."):gsub("%%5B", "["):gsub("%%5D", "]"):gsub("%%25", "%%")
					local var8 = tonumber(match_4) or 1
					v = nil
					
					if service == p8.players and var7 == "LocalPlayer" then
						v = p8.localPlayer
						if v ~= nil then
							service = v
							
							if service == p8.localPlayer then
								segment = `{segment}.LocalPlayer`
							else
								local segment_1
								local var9 = segment
								match_3_1 = service
								
								if match_3_1.Parent == nil then break end
								for status, v_2 in getChildPathEntries(match_3_1.Parent) do
									if v_2.instance == match_3_1 then
										segment_1 = v_2.segment
										segment = if var9 == "" then segment_1 else `{var9}.{segment_1}`
									end
								end
								local name = match_3_1.Name
								segment_1 = if name == "" then "%00" else name:gsub("%%", "%%25"):gsub("%.", "%%2E"):gsub("%[", "%%5B"):gsub("%]", "%%5D")
							end
						end
						return nil, nil
					end
					local var10 = service
					local var11 = 0
					local ok, status = pcall(var10.GetChildren, var10)
					match_3_1 = if ok and typeof(status) == "table" then status else {}
					
					for ok, status in match_3_1 do
						if status.Name == var7 then
							var11 += 1
							
							if var11 == var8 then
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

local function getDisplayPath(p9, p10)
	-- upvalues: formatChildSegment (ref)
	local t = {}
	local var12 = p9
	while var12 ~= nil and var12 ~= p10.root do
		if var12 ~= p10.localPlayer then
			table.insert(t, 1, formatChildSegment(var12))
			var12 = var12.Parent
			continue
		end
		table.insert(t, 1, "LocalPlayer")
		table.insert(t, 1, "Players")
		
		return table.concat(t, ".")
	end
	return if var12 == p10.root then table.concat(t, ".") else tostring(p9)
end

local function truncateString(p11)
	if #p11 <= 4096 then
		return p11
	end
	local var13 = 4082
	while var13 > 0 do
		local byteValue = string.byte(p11, var13)
		
		if byteValue == nil or byteValue < 128 or byteValue >= 192 then break end
		var13 -= 1
	end
	local var14 = 4082
	local var15 = if var13 > 0 then string.byte(p11, var13) else nil
	
	if var15 ~= nil and var13 + (if var15 < 128 then 1 elseif var15 < 224 then 2 elseif var15 < 240 then 3 elseif var15 < 248 then 4 else 1) - 1 > 4082 then
		var14 = var13 - 1
	end
	return string.sub(p11, 1, math.max(var14, 0)) .. "...<truncated>"
end

local function serializeValue(p12, p13, p14)
	-- upvalues: truncateString (ref), getDisplayPath (ref), serializeValue (ref)
	local var16 = typeof(p12)
	
	if var16 == "nil" or var16 == "boolean" then
		return p12
	elseif var16 == "string" then
		return truncateString(p12)
	elseif var16 == "number" then
		return if p12 == p12 and p12 ~= 1e999 and p12 ~= -1e999 then p12 else tostring(p12)
	elseif var16 == "Instance" then
		return getDisplayPath(p12, p13)
	elseif var16 == "table" then
		p14 = p14 or 0
		
		if p14 >= 2 then
			return "<table>"
		end
		local t = {}
		local var17 = 0
		
		for i, v in p12 do
			var17 += 1
			
			if var17 <= 50 then
				t[truncateString(tostring(i))] = serializeValue(v, p13, p14 + 1)
				continue
			end
			t.__truncated = true
			
			return t
		end
		return t
	else
		local ok, status = pcall(tostring, p12)
		
		return if ok then truncateString(status) else `<unserializable {var16}>`
	end
end

local function countDescendants(p15)
	local var18 = 10000
	local ok, status = pcall(p15.GetChildren, p15)
	local var19 = if ok and typeof(status) == "table" then status else {}
	ok = {}
	local var20 = false
	
	for i, v in var19 do
		if var18 > #ok then
			var20 = true
			break
		end
		table.insert(ok, v)
	end
	local status_1
	local var21 = 0
	while #ok > 0 and var18 > 0 do
		local removed = table.remove(ok)
		var21 += 1
		var18 -= 1
		ok_1, status_1 = pcall(removed.GetChildren, removed)
		
		for ok_1, status_1 in if ok_1 and typeof(status_1) == "table" then status_1 else {} do
			if var18 > #ok then
				var20 = true
				break
			end
			table.insert(ok, status_1)
		end
	end
	return var21, var20 or #ok > 0
end

local function countDescendantsByInstance(p16)
	local removed
	local t = {}
	local t_1 = {}
	local list = { { expanded = false, instance = p16 } }
	local var22 = 1
	local var23 = false
	while #list > 0 do
		removed = table.remove(list)
		
		if removed == nil then break end
		if removed.expanded then
			local var24 = 0
			
			for i, v in t_1[removed.instance] or {} do
				var24 += 1 + (t[v] or 0)
			end
			t[removed.instance] = var24
		end
		local instance = removed.instance
		local ok, status = pcall(instance.GetChildren, instance)
		local var25 = if ok and typeof(status) == "table" then status else {}
		t_1[removed.instance] = var25
		table.insert(list, { expanded = true, instance = removed.instance })
		
		for status = #var25, 1, -1 do
			if var22 >= 10000 then
				var23 = true
				break
			end
			var22 += 1
			table.insert(list, { expanded = false, instance = var25[status] })
		end
	end
	return t, var23
end

local function summarizeChildren(p17, p18)
	-- upvalues: getChildPathEntries (ref), countDescendants (ref)
	local var26 = getChildPathEntries(p17)
	local t = {}
	
	for i, v in var26 do
		if i > 100 then break end
		local t_1 = { className = v.instance.ClassName }
		local segment = v.segment
		t_1.path = if p18 == "" then segment else `{p18}.{segment}`
		table.insert(t, t_1)
	end
	local var27, var28 = countDescendants(p17)
	local var29 = if #t >= #var26 then var28 else true
	
	return {
		immediateChildren = t,
		childrenCount = #var26,
		totalDescendants = var27,
		truncated = var29
	}, var29
end

local function getPropertyNames(p19, p20)
	local t = {}
	local t_1 = {}
	
	local function _(p21)
		-- upvalues: t_1 (ref), t (ref)
		if typeof(p21) == "string" and p21 ~= "" and (not t_1[p21] and #t < 256) then
			t_1[p21] = true
			table.insert(t, p21)
		end
	end
	
	for i, v in p20.getReflectionProperties(p19.ClassName) do
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

local function collectProperties(p21, p22)
	-- upvalues: getPropertyNames (ref), serializeValue (ref)
	local t = {}
	
	for i, v in getPropertyNames(p21, p22) do
		local ok, status = pcall(function()
			-- upvalues: p21 (ref), v (ref)
			return p21[v]
		end)
		
		if ok and status ~= nil then
			t[v] = serializeValue(status, p22)
		end
	end
	return t
end

local function collectAttributes(p23, p24)
	-- upvalues: serializeValue (ref)
	local ok, status = pcall(p23.GetAttributes, p23)
	
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
		t[v] = serializeValue(status[v], p24)
	end
	return t
end

local _ = function(p25)
	return { status = "invalid_input", message = p25 }
end

local _ = function()
	return {
		status = "not_in_game",
		message = "The user is not in the game."
	}
end

local _ = function(p25)
	return {
		status = "not_found",
		message = "No instance exists at the requested path.",
		path = p25
	}
end

local _ = function(p25, p26)
	if typeof(p25) ~= "table" then
		return nil
	end
	local var30 = p25[p26]
	
	return if typeof(var30) == "string" and var30 ~= "" then var30 else nil
end

local _ = function(p25, p26, p27, p28, p29)
	return if typeof(p25) == "table" and typeof(p25[p26]) == "number" then math.clamp(math.floor(p25[p26]), p28, p29) else p27
end

local function getKeywords(p25)
	local var30, keywords
	if typeof(p25) == "table" then
		keywords = p25.keywords
		var30 = if typeof(keywords) == "string" and keywords ~= "" then keywords else nil
	else
		var30 = nil
	end
	if var30 == nil then
		return {}
	end
	keywords = {}
	
	for i in string.gmatch(string.lower(var30), "[^,%s]+") do
		table.insert(keywords, i)
	end
	return keywords
end

local function matchesFilters(p26, p27, p28)
	local ok
	if p27 ~= nil then
		ok, status = pcall(p26.IsA, p26, p27)
		
		if not ok or not status then
			return false
		end
	end
	ok = string.lower(p26.Name)
	
	for i, v in p28 do
		if not string.find(ok, v, 1, true) then
			return false
		end
	end
	return true
end

local function makeSearchMatch(p29, p30)
	local parent = p29.Parent
	local t = {
		_instance = p29,
		name = p29.Name,
		className = p29.ClassName,
		path = p30,
		parentName = if parent ~= nil then nil else parent.Name
	}
	local ok, status = pcall(p29.GetChildren, p29)
	t.childrenCount = #(if ok and typeof(status) == "table" then status else {})
	
	return t
end

return {
	NOT_IN_GAME_MESSAGE = "The user is not in the game.",
	NOT_FOUND_MESSAGE = "No instance exists at the requested path.",
	searchClientDataModel = function(p29, p30)
		-- upvalues: defaultDependencies (ref), resolvePath (ref), getKeywords (ref), getChildPathEntries (ref), matchesFilters (ref), makeSearchMatch (ref), countDescendantsByInstance (ref)
		local var31, path
		p30 = p30 or defaultDependencies()
		
		if p30.gameId == 0 then
			return {
				status = "not_in_game",
				message = "The user is not in the game."
			}
		elseif typeof(p29) == "table" then
			path = p29.path
			var31 = if typeof(path) == "string" and path ~= "" then path else nil
		else
			var31 = nil
		end
		path, var82 = resolvePath(var31, p30)
		
		if path == nil or var82 == nil then
			return {
				status = "not_found",
				message = "No instance exists at the requested path.",
				path = var31 or ""
			}
		end
		local var32, instanceType
		local var33 = if typeof(p29) == "table" and typeof(p29.max_depth) == "number" then math.clamp(math.floor(p29.max_depth), 0, 10) else 3
		local var34 = if typeof(p29) == "table" and typeof(p29.head_limit) == "number" then math.clamp(math.floor(p29.head_limit), 1, 200) else 200
		
		if typeof(p29) == "table" then
			instanceType = p29.instance_type
			var32 = if typeof(instanceType) == "string" and instanceType ~= "" then instanceType else nil
		else
			var32 = nil
		end
		instanceType = getKeywords(p29)
		local t = {}
		
		if var82 == "" then
			for i, v in getChildPathEntries(path) do
				table.insert(t, { depth = 1, instance = v.instance, path = v.segment })
			end
		else
			table.insert(t, { depth = 0, instance = path, path = var82 })
		end
		local var35
		local t_1 = {}
		local var36 = 0
		local var37 = 0
		local var38 = 1
		local var39 = false
		while var38 <= #t do
			if var37 >= 10000 then
				var39 = true
				break
			end
			var35 = t[var38]
			var38 += 1
			var37 += 1
			
			if matchesFilters(var35.instance, var32, instanceType) then
				var36 += 1
				
				if #t_1 < var34 then
					table.insert(t_1, makeSearchMatch(var35.instance, var35.path))
				else
					var39 = true
				end
			end
			if var35.depth >= var33 then continue end
			for i, v in getChildPathEntries(var35.instance) do
				if var37 + (#t - var38 + 1) >= 10000 then
					var39 = true
					break
				end
				local t_2 = { instance = v.instance }
				local path_1 = var35.path
				local segment = v.segment
				t_2.path = if path_1 == "" then segment else `{path_1}.{segment}`
				t_2.depth = var35.depth + 1
				table.insert(t, t_2)
			end
		end
		if #t_1 > 0 then
			local var40, var41 = countDescendantsByInstance(path)
			
			for i, v in t_1 do
				v.totalDescendants = var40[v._instance] or 0
				v._instance = nil
			end
			var39 = var39 or var41
		end
		return {
			status = "ok",
			matches = t_1,
			count = #t_1,
			totalFound = var36,
			truncated = var39
		}
	end,
	inspectClientInstance = function(p31, p32)
		-- upvalues: defaultDependencies (ref), resolvePath (ref), summarizeChildren (ref), collectProperties (ref), collectAttributes (ref)
		local var42, path
		p32 = p32 or defaultDependencies()
		
		if p32.gameId == 0 then
			return {
				status = "not_in_game",
				message = "The user is not in the game."
			}
		elseif typeof(p31) == "table" then
			path = p31.path
			var42 = if typeof(path) == "string" and path ~= "" then path else nil
		else
			var42 = nil
		end
		if var42 == nil then
			return { status = "invalid_input", message = "path is required" }
		end
		path, var98 = resolvePath(var42, p32)
		
		return if path == nil or var98 == nil then {
			status = "not_found",
			message = "No instance exists at the requested path.",
			path = var42
		} else {
			status = "ok",
			instance = {
				name = path.Name,
				className = path.ClassName,
				path = var98,
				properties = collectProperties(path, p32),
				attributes = collectAttributes(path, p32),
				children = summarizeChildren(path, var98)
			}
		}
	end
}