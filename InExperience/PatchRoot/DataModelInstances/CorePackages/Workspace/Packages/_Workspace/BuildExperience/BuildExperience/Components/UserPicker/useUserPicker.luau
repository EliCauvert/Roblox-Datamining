local reactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local _ = require(script.Parent.UserPickerTypes)
local buildExperienceUserPickerSearchDebounceMs = game:DefineFastInt("BuildExperienceUserPickerSearchDebounceMs", 250)

local function _(p0) --[[ line: 23 | named "trim" ]]
	return string.gsub(p0, "^%s*(.-)%s*$", "%1")
end

local _ = function(p1) --[[ line: 27 | named "countKeys" ]]
	local var3 = 0
	
	for i, v in p1 do
		if v then
			var3 += 1
		end
	end
	return var3
end

local function appendUniqueIds(p2, p3) --[[ line: 39 ]]
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

return function(p4) --[[ line: 53 | named "useUserPicker" ]]
	-- upvalues: reactModule (ref), buildExperienceUserPickerSearchDebounceMs (ref), appendUniqueIds (ref)
	local browseIds = p4.browseIds
	local browseIsLoading = p4.browseIsLoading
	local loadMoreBrowse = p4.loadMoreBrowse
	local onSearch = p4.onSearch
	local onSubmit = p4.onSubmit
	local selectionLimit = p4.selectionLimit
	local onSelectionChanged = p4.onSelectionChanged
	local excludeUserIds = p4.excludeUserIds
	local var6, var7 = reactModule.useState("")
	local var8, var9 = reactModule.useState({})
	local var10, var11 = reactModule.useState(nil)
	local var12, var13 = reactModule.useState(false)
	local var14, var15 = reactModule.useState({})
	local var16, var17 = reactModule.useState("")
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useRef(false)
	local var21 = reactModule.useRef(0)
	local var22 = reactModule.useRef(false)
	local var23 = string.gsub(var6, "^%s*(.-)%s*$", "%1") ~= ""
	reactModule.useEffect(function() --[[ line: 79 ]]
		-- upvalues: var6 (ref), var9 (ref), var11 (ref), var13 (ref), var21 (ref), buildExperienceUserPickerSearchDebounceMs (copy), onSearch (ref)
		local replaced = string.gsub(var6, "^%s*(.-)%s*$", "%1")
		
		if replaced == "" then
			var9({})
			var11(nil)
			var13(false)
			
			return
		end
		var21.current += 1
		local current = var21.current
		var9({})
		var11(nil)
		var13(true)
		replaced = task.delay(buildExperienceUserPickerSearchDebounceMs / 1000, function() --[[ line: 96 ]]
			-- upvalues: onSearch (copy), replaced (ref), var21 (copy), current (ref), var9 (copy), var11 (copy), var13 (copy)
			onSearch(replaced):andThen(function(p5) --[[ line: 99 ]]
				-- upvalues: var21 (copy), current (copy), var9 (copy), var11 (copy), var13 (copy)
				if var21.current == current then
					var9(p5.ids)
					var11(p5.nextCursor)
					var13(false)
				end
			end):catch(function() --[[ line: 106 ]]
				-- upvalues: var21 (copy), current (copy), var9 (copy), var11 (copy), var13 (copy)
				if var21.current == current then
					var9({})
					var11(nil)
					var13(false)
				end
			end)
		end)
		
		return function() --[[ line: 117 ]]
			-- upvalues: replaced (ref)
			pcall(task.cancel, replaced)
		end
	end, { var6, onSearch })
	local var24 = reactModule.useCallback(function() --[[ line: 122 ]]
		-- upvalues: var23 (ref), var20 (ref), var10 (ref), var21 (ref), onSearch (ref), var6 (ref), var9 (ref), appendUniqueIds (copy), var11 (ref), loadMoreBrowse (ref)
		if not var23 then
			loadMoreBrowse()
			
			return
		elseif var20.current or var10 == nil then
			return
		end
		var20.current = true
		local current = var21.current
		onSearch(string.gsub(var6, "^%s*(.-)%s*$", "%1"), var10):andThen(function(p6) --[[ line: 132 ]]
			-- upvalues: var21 (copy), current (ref), var9 (copy), appendUniqueIds (copy), var11 (copy)
			if var21.current == current then
				var9(function(p7) --[[ line: 137 ]]
					-- upvalues: appendUniqueIds (copy), p6 (ref)
					return appendUniqueIds(p7, p6.ids)
				end)
				var11(p6.nextCursor)
				
				return
			end
		end):finally(function() --[[ line: 142 ]]
			-- upvalues: var20 (copy)
			var20.current = false
		end)
	end, {
		var23,
		var10,
		var6,
		onSearch,
		loadMoreBrowse
	})
	local var25 = reactModule.useMemo(function() --[[ line: 154 ]]
		-- upvalues: var23 (ref), var8 (ref), browseIds (ref), excludeUserIds (ref)
		local var28 = if var23 then var8 else browseIds
		
		if excludeUserIds == nil then
			return var28
		end
		local t = {}
		
		for i, v in var28 do
			if not excludeUserIds[v] then
				table.insert(t, v)
			end
		end
		return t
	end, { var23, var8, browseIds, excludeUserIds })
	local var26 = 0
	
	for i, v in var14 do
		if v then
			var26 += 1
		end
	end
	reactModule.useEffect(function() --[[ line: 173 ]]
		-- upvalues: selectionLimit (ref), var15 (ref)
		if selectionLimit == nil then
			return
		end
		var15(function(p8) --[[ line: 178 ]]
			-- upvalues: selectionLimit (ref)
			local var30 = 0
			
			for i, v in p8 do
				if v then
					var30 += 1
				end
			end
			if var30 <= selectionLimit then
				return p8
			end
			local t = {}
			local var32 = 0
			
			for i_1, v_1 in p8 do
				if v_1 and var32 < selectionLimit then
					t[i_1] = true
					var32 += 1
				end
			end
			return t
		end)
	end, { selectionLimit })
	reactModule.useEffect(function() --[[ line: 194 ]]
		-- upvalues: var22 (ref), onSelectionChanged (ref), var14 (ref)
		if not var22.current then
			var22.current = true
			
			return
		elseif onSelectionChanged ~= nil then
			local t = {}
			
			for i, v in var14 do
				if v then
					table.insert(t, i)
				end
			end
			onSelectionChanged(t)
		end
	end, { var14, onSelectionChanged })
	
	return {
		searchText = var6,
		setSearchText = var7,
		userIds = var25,
		isLoading = if var23 then var12 else browseIsLoading,
		loadMore = var24,
		selectedCount = var26,
		hasSelection = var26 > 0,
		selectionLimit = selectionLimit,
		isSelected = reactModule.useCallback(function(p9) --[[ line: 210 ]]
			-- upvalues: var14 (ref)
			return var14[p9] == true
		end, { var14 }),
		canSelect = reactModule.useCallback(function(p10) --[[ line: 214 ]]
			-- upvalues: var14 (ref), selectionLimit (ref)
			if var14[p10] == true then
				return true
			end
			local var34 = true
			
			if selectionLimit ~= nil then
				local var35 = 0
				
				for i, v in var14 do
					if v then
						var35 += 1
					end
				end
				var34 = var35 < selectionLimit
			end
			return var34
		end, { var14, selectionLimit }),
		toggleSelected = reactModule.useCallback(function(p11) --[[ line: 221 ]]
			-- upvalues: var15 (ref), selectionLimit (ref)
			var15(function(p12) --[[ line: 222 ]]
				-- upvalues: p11 (ref), selectionLimit (copy)
				local cloned = table.clone(p12)
				
				if cloned[p11] then
					cloned[p11] = nil
					
					return cloned
				elseif selectionLimit ~= nil then
					local var37 = 0
					
					for i, v in cloned do
						if v then
							var37 += 1
						end
					end
					if var37 < selectionLimit then
						cloned[p11] = true
						
						return cloned
					else
						return p12
					end
				end
			end)
		end, { selectionLimit }),
		message = var16,
		setMessage = var17,
		isSubmitting = var18,
		submit = reactModule.useCallback(function() --[[ line: 235 ]]
			-- upvalues: var18 (ref), var14 (ref), var19 (ref), onSubmit (ref), var16 (ref)
			if var18 then return end
			local t = {}
			
			for i, v in var14 do
				if v then
					table.insert(t, i)
				end
			end
			if #t == 0 then
				return
			end
			var19(true)
			onSubmit(t, if string.gsub(var16, "^%s*(.-)%s*$", "%1") ~= "" then nil else var16):finally(function() --[[ line: 249 ]]
				-- upvalues: var19 (copy)
				var19(false)
			end)
		end, { var18, var14, var16, onSubmit })
	}
end