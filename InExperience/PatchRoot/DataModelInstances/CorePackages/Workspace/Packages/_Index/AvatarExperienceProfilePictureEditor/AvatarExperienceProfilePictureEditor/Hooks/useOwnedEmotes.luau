local avatarExperienceProfilePictureEditor = script:FindFirstAncestor("AvatarExperienceProfilePictureEditor")
local reactModule = require(avatarExperienceProfilePictureEditor.Parent.React)
local editProfileImageAnalyticsModule = require(avatarExperienceProfilePictureEditor.Analytics.EditProfileImageAnalytics)
local avatarEditorService = game:GetService("AvatarEditorService")

local function _(p0) --[[ line: 33 | named "getEmoteLabel" ]]
	if typeof(p0) ~= "table" then
		return ""
	end
	local name = p0.Name or p0.name
	
	return if typeof(name) == "string" and name ~= "" then name else ""
end

local function getCurrentPageItems(p1) --[[ line: 46 ]]
	local t = {}
	
	for i, v in p1:GetCurrentPage() do
		local var8
		local t_1 = { id = tostring(v.AssetId) }
		
		if typeof(v) == "table" then
			local name = v.Name or v.name
			var8 = if typeof(name) == "string" and name ~= "" then name else ""
		else
			var8 = ""
		end
		t_1.label = var8
		table.insert(t, t_1)
	end
	return t
end

return function() --[[ line: 57 | named "useOwnedEmotes" ]]
	-- upvalues: reactModule (ref), getCurrentPageItems (ref), avatarEditorService (ref), editProfileImageAnalyticsModule (ref)
	local var10, var11 = reactModule.useState({})
	local var12, var13 = reactModule.useState({})
	local var14, var15 = reactModule.useState(true)
	local var16, var17 = reactModule.useState(false)
	local var18, var19 = reactModule.useState(false)
	local var20, var21 = reactModule.useState(false)
	local var22, var23 = reactModule.useState(false)
	local var24, var25 = reactModule.useState(0)
	local var26 = reactModule.useRef(nil)
	local var27 = reactModule.useRef(false)
	local var28 = reactModule.useRef(0)
	local var29 = reactModule.useCallback(function(p2, p3) --[[ line: 70 ]]
		-- upvalues: var13 (ref)
		var13(function(p4) --[[ line: 71 ]]
			-- upvalues: p2 (ref), p3 (ref)
			for i, v in p4 do
				if v.id == p2 then
					return p4
				end
			end
			local cloned = table.clone(p4)
			table.insert(cloned, { id = p2, label = p3 or "" })
			
			return cloned
		end)
	end, {})
	local var30 = reactModule.useCallback(function(p5) --[[ line: 87 ]]
		-- upvalues: var28 (ref), var26 (ref), var27 (ref), var15 (ref), var11 (ref), var17 (ref), var19 (ref), var21 (ref), var23 (ref), var25 (ref)
		var28.current += 1
		var26.current = nil
		var27.current = false
		
		if not (p5 ~= nil and p5.inBackground == true) then
			var15(true)
			var11({})
		end
		var17(false)
		var19(false)
		var21(false)
		var23(false)
		var25(function(p6) --[[ line: 100 ]]
			return p6 + 1
		end)
	end, {})
	local var31 = reactModule.useCallback(function() --[[ line: 105 ]]
		-- upvalues: var26 (ref), var27 (ref), var21 (ref), var23 (ref), var28 (ref), getCurrentPageItems (copy), var11 (ref), var19 (ref)
		local current = var26.current
		
		if current == nil or current.IsFinished or var27.current then
			return
		end
		var27.current = true
		var21(true)
		var23(false)
		local current_1 = var28.current
		task.spawn(function() --[[ line: 115 ]]
			-- upvalues: current (ref), getCurrentPageItems (copy), current_1 (ref), var28 (copy), var27 (copy), var21 (copy), var11 (copy), var19 (copy), var23 (copy)
			local ok, status = pcall(function() --[[ line: 116 ]]
				-- upvalues: current (copy), getCurrentPageItems (copy)
				current:AdvanceToNextPageAsync()
				
				return getCurrentPageItems(current)
			end)
			
			if current_1 ~= var28.current then return end
			var27.current = false
			var21(false)
			
			if ok then
				var11(function(p7) --[[ line: 128 ]]
					-- upvalues: status (ref)
					local cloned = table.clone(p7)
					
					for i, v in status do
						table.insert(cloned, v)
					end
					return cloned
				end)
				var19(not current.IsFinished)
				
				return
			end
			var23(true)
		end)
	end, {})
	reactModule.useEffect(function() --[[ line: 142 ]]
		-- upvalues: var28 (ref), var26 (ref), var27 (ref), var21 (ref), var23 (ref), avatarEditorService (copy), getCurrentPageItems (copy), var11 (ref), var19 (ref), editProfileImageAnalyticsModule (copy), var17 (ref), var15 (ref)
		local var34 = false
		var28.current += 1
		local current = var28.current
		var26.current = nil
		var27.current = false
		var21(false)
		var23(false)
		task.spawn(function() --[[ line: 151 ]]
			-- upvalues: avatarEditorService (copy), getCurrentPageItems (copy), var34 (write), current (ref), var28 (copy), var26 (copy), var11 (copy), var19 (copy), editProfileImageAnalyticsModule (copy), var17 (copy), var15 (copy)
			local ok, status = pcall(function() --[[ line: 152 ]]
				-- upvalues: avatarEditorService (copy), getCurrentPageItems (copy)
				local var35 = avatarEditorService:GetInventoryAsync({ Enum.AvatarAssetType.EmoteAnimation })
				
				return { items = getCurrentPageItems(var35), pageObject = var35 }
			end)
			
			if var34 or current ~= var28.current then return end
			if ok then
				var26.current = status.pageObject
				var11(status.items)
				var19(not status.pageObject.IsFinished)
			else
				editProfileImageAnalyticsModule.logFetchFailure({ assetType = "emotes" })
				var17(true)
				var19(false)
			end
			var15(false)
		end)
		
		return function() --[[ line: 178 ]]
			-- upvalues: var34 (write), current (ref), var28 (copy), var26 (copy), var27 (copy)
			var34 = true
			
			if current == var28.current then
				var28.current += 1
				var26.current = nil
				var27.current = false
			end
		end
	end, { var24 })
	
	return {
		emoteItems = reactModule.useMemo(function() --[[ line: 188 ]]
			-- upvalues: var10 (ref), var12 (ref)
			local cloned = table.clone(var10)
			local t = {}
			
			for i, v in cloned do
				t[v.id] = true
			end
			for i, v_1 in var12 do
				if not t[v_1.id] then
					table.insert(cloned, 1, v_1)
				end
			end
			return cloned
		end, { var10, var12 }),
		isLoading = var14,
		hasError = var16,
		refetch = var30,
		onMoreEmotes = var31,
		hasMoreEmotes = var18,
		isLoadingMoreEmotes = var20,
		hasLoadMoreError = var22,
		markEmoteOwned = var29
	}
end