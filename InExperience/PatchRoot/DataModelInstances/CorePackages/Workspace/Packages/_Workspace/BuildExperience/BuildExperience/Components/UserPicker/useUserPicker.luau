local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local _ = require(script.Parent.UserPickerTypes)
local buildExperienceUserPickerSearchDebounceMs = game:DefineFastInt("BuildExperienceUserPickerSearchDebounceMs", 250)

local function _(p1)
	return string.gsub(p1, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1)
	local var1 = 0
	
	for i, v in p1 do
		if v then
			var1 += 1
		end
	end
	return var1
end

local function appendUniqueIds(p2, p3)
	local t = {}
	
	for i, v in p2 do
		t[v] = true
	end
	local cloned = table.clone(p2)
	
	for i_1, v_1 in p3 do
		if not t[v_1] then
			table.insert(cloned, v_1)
		end
	end
	return cloned
end

return function(p4)
	-- upvalues: reactModule (ref), buildExperienceUserPickerSearchDebounceMs (ref), appendUniqueIds (ref)
	local browseIds = p4.browseIds
	local browseIsLoading = p4.browseIsLoading
	local loadMoreBrowse = p4.loadMoreBrowse
	local onSearch = p4.onSearch
	local onSubmit = p4.onSubmit
	local selectionLimit = p4.selectionLimit
	local onSelectionChanged = p4.onSelectionChanged
	local excludeUserIds = p4.excludeUserIds
	local var2, var3 = reactModule.useState("")
	local var4, var5 = reactModule.useState({})
	local var6, var7 = reactModule.useState(nil)
	local var8, var9 = reactModule.useState(false)
	local var10, var11 = reactModule.useState({})
	local var12, var13 = reactModule.useState("")
	local var14, var15 = reactModule.useState(false)
	local var16 = reactModule.useRef(false)
	local var17 = reactModule.useRef(0)
	local var18 = reactModule.useRef(false)
	local var19 = string.gsub(var2, "^%s*(.-)%s*$", "%1") ~= ""
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var5 (ref), var7 (ref), var9 (ref), var17 (ref), buildExperienceUserPickerSearchDebounceMs (copy), onSearch (ref)
		local replaced = string.gsub(var2, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var5({})
			var7(nil)
			var9(false)
			
			return
		end
		var17.current += 1
		local current = var17.current
		var5({})
		var7(nil)
		var9(true)
		replaced = task.delay(buildExperienceUserPickerSearchDebounceMs / 1000, function()
			-- upvalues: onSearch (copy), replaced (ref), var17 (copy), current (ref), var5 (copy), var7 (copy), var9 (copy)
			onSearch(replaced):andThen(function(p5)
				-- upvalues: var17 (copy), current (copy), var5 (copy), var7 (copy), var9 (copy)
				if var17.current == current then
					var5(p5.ids)
					var7(p5.nextCursor)
					var9(false)
				end
			end):catch(function()
				-- upvalues: var17 (copy), current (copy), var5 (copy), var7 (copy), var9 (copy)
				if var17.current == current then
					var5({})
					var7(nil)
					var9(false)
				end
			end)
		end)
		
		return function()
			-- upvalues: replaced (ref)
			pcall(task.cancel, replaced)
		end
	end, { var2, onSearch })
	local var20 = reactModule.useCallback(function()
		-- upvalues: var19 (ref), var16 (ref), var6 (ref), var17 (ref), onSearch (ref), var2 (ref), var5 (ref), appendUniqueIds (copy), var7 (ref), loadMoreBrowse (ref)
		if not var19 then
			loadMoreBrowse()
			
			return
		elseif var16.current or var6 == nil then
			return
		end
		var16.current = true
		local current = var17.current
		onSearch(string.gsub(var2, "^%s*(.-)%s*$", "%1"), var6):andThen(function(p5)
			-- upvalues: var17 (copy), current (ref), var5 (copy), appendUniqueIds (copy), var7 (copy)
			if var17.current == current then
				var5(function(p6)
					-- upvalues: appendUniqueIds (copy), p5 (ref)
					return appendUniqueIds(p6, p5.ids)
				end)
				var7(p5.nextCursor)
				
				return
			end
		end):finally(function()
			-- upvalues: var16 (copy)
			var16.current = false
		end)
	end, {
		var19,
		var6,
		var2,
		onSearch,
		loadMoreBrowse
	})
	local var21 = reactModule.useMemo(function()
		-- upvalues: var19 (ref), var4 (ref), browseIds (ref), excludeUserIds (ref)
		local var22 = if var19 then var4 else browseIds
		
		if excludeUserIds == nil then
			return var22
		end
		local t = {}
		
		for i, v in var22 do
			if not excludeUserIds[v] then
				table.insert(t, v)
			end
		end
		return t
	end, { var19, var4, browseIds, excludeUserIds })
	local var23 = 0
	
	for i, v in var10 do
		if v then
			var23 += 1
		end
	end
	reactModule.useEffect(function()
		-- upvalues: selectionLimit (ref), var11 (ref)
		if selectionLimit == nil then
			return
		end
		var11(function(p5)
			-- upvalues: selectionLimit (ref)
			local var24 = 0
			
			for i, v in p5 do
				if v then
					var24 += 1
				end
			end
			if var24 <= selectionLimit then
				return p5
			end
			local t = {}
			local var25 = 0
			
			for i_1, v_1 in p5 do
				if v_1 and var25 < selectionLimit then
					t[i_1] = true
					var25 += 1
				end
			end
			return t
		end)
	end, { selectionLimit })
	reactModule.useEffect(function()
		-- upvalues: var18 (ref), onSelectionChanged (ref), var10 (ref)
		if not var18.current then
			var18.current = true
			
			return
		elseif onSelectionChanged ~= nil then
			local t = {}
			
			for i, v in var10 do
				if v then
					table.insert(t, i)
				end
			end
			onSelectionChanged(t)
		end
	end, { var10, onSelectionChanged })
	
	return {
		searchText = var2,
		setSearchText = var3,
		userIds = var21,
		isLoading = if var19 then var8 else browseIsLoading,
		loadMore = var20,
		selectedCount = var23,
		hasSelection = var23 > 0,
		selectionLimit = selectionLimit,
		isSelected = reactModule.useCallback(function(p6)
			-- upvalues: var10 (ref)
			return var10[p6] == true
		end, { var10 }),
		canSelect = reactModule.useCallback(function(p6)
			-- upvalues: var10 (ref), selectionLimit (ref)
			if var10[p6] == true then
				return true
			end
			local var26 = true
			
			if selectionLimit ~= nil then
				local var27 = 0
				
				for i, v in var10 do
					if v then
						var27 += 1
					end
				end
				var26 = var27 < selectionLimit
			end
			return var26
		end, { var10, selectionLimit }),
		toggleSelected = reactModule.useCallback(function(p7)
			-- upvalues: var11 (ref), selectionLimit (ref)
			var11(function(p8)
				-- upvalues: p7 (ref), selectionLimit (copy)
				local cloned = table.clone(p8)
				
				if cloned[p7] then
					cloned[p7] = nil
					
					return cloned
				elseif selectionLimit ~= nil then
					local var28 = 0
					
					for i, v in cloned do
						if v then
							var28 += 1
						end
					end
					if var28 < selectionLimit then
						cloned[p7] = true
						
						return cloned
					else
						return p8
					end
				end
			end)
		end, { selectionLimit }),
		message = var12,
		setMessage = var13,
		isSubmitting = var14,
		submit = reactModule.useCallback(function()
			-- upvalues: var14 (ref), var10 (ref), var15 (ref), onSubmit (ref), var12 (ref)
			if var14 then return end
			local t = {}
			
			for i, v in var10 do
				if v then
					table.insert(t, i)
				end
			end
			if #t == 0 then
				return
			end
			var15(true)
			onSubmit(t, if string.gsub(var12, "^%s*(.-)%s*$", "%1") ~= "" then nil else var12):finally(function()
				-- upvalues: var15 (copy)
				var15(false)
			end)
		end, { var14, var10, var12, onSubmit })
	}
end