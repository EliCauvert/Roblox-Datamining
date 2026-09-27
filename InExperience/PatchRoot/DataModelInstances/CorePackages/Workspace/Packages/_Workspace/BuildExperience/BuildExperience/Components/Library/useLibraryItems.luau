local buildExperience = script:FindFirstAncestor("BuildExperience")
local reactModule = require(buildExperience.Parent.React)
local _ = require(buildExperience.Stores.BuildLibrary.createBuildLibraryStore)
local sendBuildExperienceEventModule = require(buildExperience.Telemetry.sendBuildExperienceEvent)

return function(p1, p2, p3, p4, p5, p6, p7)
	-- upvalues: reactModule (ref), sendBuildExperienceEventModule (ref)
	local var1 = reactModule.useMemo(function()
		return {}
	end, {
		p1,
		p3 or false,
		p4,
		p6 or false,
		p7 or false
	})
	local var2, var3 = reactModule.useState({ key = var1, count = p5 })
	local var4 = if var2.key == var1 then var2.count else p5
	local t = {}
	local var5 = 0
	local lowerText = string.lower(p4)
	local t_1 = {}
	
	if lowerText ~= "" and p7 ~= nil then
		for i, v in p2 do
			if v.className == "Folder" and v.folderId ~= nil then
				t_1[v.id] = v.folderId
			end
		end
	end
	for i, v in p2 do
		local var6 = v.folderId == p7
		
		if lowerText == "" then
			if (p3 == nil or v.kind == p3) and var6 and (lowerText == "" or string.find(string.lower(v.displayName), lowerText, 1, true) ~= nil) then
				var5 += 1
				
				if var5 <= var4 then
					table.insert(t, v)
				end
			end
		end
		local folderId = v.folderId
		while p7 ~= nil and (folderId ~= nil and folderId ~= p7) do
			folderId = t_1[folderId]
		end
		var6 = v.className ~= "Folder" and (if p7 ~= nil then folderId == p7 else true)
	end
	local var7 = var4 < var5
	local var8 = reactModule.useRef({ key = var1, count = var4 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var1 (ref), var4 (ref), var5 (write), sendBuildExperienceEventModule (copy), p6 (ref), p3 (ref), p7 (ref)
		local current = var8.current
		
		if current.key == var1 and current.count < var4 then
			local var9 = math.min(var4, var5) - math.min(current.count, var5)
			
			if var9 > 0 then
				sendBuildExperienceEventModule("LIBRARY_LOAD_MORE", { universeId = game.GameId, placeId = game.PlaceId }, {
					surface = if p6 ~= nil then "Browser" else "Category",
					kind = p3 or "All",
					scope = if p7 ~= nil then "Root" else "Folder",
					addedCount = tostring(var9),
					visibleCount = tostring(math.min(var4, var5))
				})
			end
		end
		var8.current = { key = var1, count = var4 }
	end, {
		var1, var4, var5, p3 or false, p6 or false, p7 or false
	})
	
	return t, var7, reactModule.useCallback(function()
		-- upvalues: var7 (ref), var3 (ref), var1 (ref), var4 (ref), p5 (ref)
		if var7 then
			var3({ key = var1, count = var4 + p5 })
		end
	end, { var1, var4, p5, var7 })
end