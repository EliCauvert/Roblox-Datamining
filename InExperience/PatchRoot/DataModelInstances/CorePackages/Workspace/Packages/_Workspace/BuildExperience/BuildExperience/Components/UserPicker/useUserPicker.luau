local ReactModule = require(script:FindFirstAncestor("BuildExperience").Parent.React)
local _ = require(script.Parent.UserPickerTypes)
local BuildExperienceUserPickerSearchDebounceMs = game:DefineFastInt("BuildExperienceUserPickerSearchDebounceMs", 250)

local function _(Text: string): string
	return (string.gsub(Text, "^%s*(.-)%s*$", "%1"))
end

local _ = function(List): number
	local Count = 0
	
	for _, value in List do
		if value then
			Count += 1
		end
	end
	return Count
end

local function appendUniqueIds(Tbl, Ids)
	local t = {}
	
	for _, value in Tbl do
		t[value] = true
	end
	local Copy = table.clone(Tbl)
	
	for _, id in Ids do
		if not t[id] then
			table.insert(Copy, id)
		end
	end
	return Copy
end

return function(p1)
	-- upvalues: ReactModule (copy), BuildExperienceUserPickerSearchDebounceMs (copy), appendUniqueIds (copy)
	local BrowseIds = p1.browseIds
	local BrowseIsLoading = p1.browseIsLoading
	local LoadMoreBrowseFunction = p1.loadMoreBrowse
	local OnSearchFunction = p1.onSearch
	local OnSubmitFunction = p1.onSubmit
	local SelectionLimit = p1.selectionLimit
	local OnSelectionChangedFunction = p1.onSelectionChanged
	local ExcludeUserIds = p1.excludeUserIds
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState({})
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(false)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState({})
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState("")
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	local UseRefResult = ReactModule.useRef(false)
	local UseRefResult1 = ReactModule.useRef(0)
	local UseRefResult2 = ReactModule.useRef(false)
	local IsNotReplacedMatch = string.gsub(UseStateResult, "^%s*(.-)%s*$", "%1") ~= ""
	ReactModule.useEffect(function()
		-- upvalues: UseStateResult (copy), UseStateResult2_1 (copy), UseStateResult2_2 (copy), UseStateResult2_3 (copy), UseRefResult1 (copy), BuildExperienceUserPickerSearchDebounceMs (upval), OnSearchFunction (copy)
		local Replaced = string.gsub(UseStateResult, "^%s*(.-)%s*$", "%1")
		
		if Replaced == "" then
			UseStateResult2_1({})
			UseStateResult2_2(nil)
			UseStateResult2_3(false)
			
			return
		end
		UseRefResult1.current += 1
		local Current = UseRefResult1.current
		UseStateResult2_1({})
		UseStateResult2_2(nil)
		UseStateResult2_3(true)
		local DelayedThread = task.delay(BuildExperienceUserPickerSearchDebounceMs / 1000, function()
			-- upvalues: OnSearchFunction (upval), Replaced (copy), UseRefResult1 (upval), Current (copy), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
			OnSearchFunction(Replaced):andThen(function(Result)
				-- upvalues: UseRefResult1 (upval), Current (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
				if UseRefResult1.current == Current then
					UseStateResult2_1(Result.ids)
					UseStateResult2_2(Result.nextCursor)
					UseStateResult2_3(false)
				end
			end):catch(function()
				-- upvalues: UseRefResult1 (upval), Current (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), UseStateResult2_3 (upval)
				if UseRefResult1.current == Current then
					UseStateResult2_1({})
					UseStateResult2_2(nil)
					UseStateResult2_3(false)
				end
			end)
		end)
		
		return function()
			-- upvalues: DelayedThread (copy)
			pcall(task.cancel, DelayedThread)
		end
	end, { UseStateResult, OnSearchFunction })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: IsNotReplacedMatch (copy), UseRefResult (copy), UseStateResult3 (copy), UseRefResult1 (copy), OnSearchFunction (copy), UseStateResult (copy), UseStateResult2_1 (copy), appendUniqueIds (upval), UseStateResult2_2 (copy), LoadMoreBrowseFunction (copy)
		if not IsNotReplacedMatch then
			LoadMoreBrowseFunction()
			
			return
		end
		if not UseRefResult.current and UseStateResult3 ~= nil then
			UseRefResult.current = true
			local Current = UseRefResult1.current
			OnSearchFunction(string.gsub(UseStateResult, "^%s*(.-)%s*$", "%1"), UseStateResult3):andThen(function(Result)
				-- upvalues: UseRefResult1 (upval), Current (copy), UseStateResult2_1 (upval), appendUniqueIds (upval), UseStateResult2_2 (upval)
				if UseRefResult1.current == Current then
					UseStateResult2_1(function(p2)
						-- upvalues: appendUniqueIds (upval), Result (copy)
						return (appendUniqueIds(p2, Result.ids))
					end)
					UseStateResult2_2(Result.nextCursor)
					
					return
				end
			end):finally(function()
				-- upvalues: UseRefResult (upval)
				UseRefResult.current = false
			end)
			
			return
		end
	end, {
		IsNotReplacedMatch,
		UseStateResult3,
		UseStateResult,
		OnSearchFunction,
		LoadMoreBrowseFunction
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: IsNotReplacedMatch (copy), UseStateResult1 (copy), BrowseIds (copy), ExcludeUserIds (copy)
		local UseStateResult = if IsNotReplacedMatch then UseStateResult1 else BrowseIds
		
		if ExcludeUserIds == nil then
			return UseStateResult
		end
		local List = {}
		
		for _, value in UseStateResult do
			if not ExcludeUserIds[value] then
				table.insert(List, value)
			end
		end
		return List
	end, {
		IsNotReplacedMatch,
		UseStateResult1,
		BrowseIds,
		ExcludeUserIds
	})
	local SelectedCount = 0
	
	for _, value in UseStateResult5 do
		if value then
			SelectedCount += 1
		end
	end
	ReactModule.useEffect(function()
		-- upvalues: SelectionLimit (copy), UseStateResult2_4 (copy)
		if SelectionLimit ~= nil then
			UseStateResult2_4(function(List)
				-- upvalues: SelectionLimit (copy)
				local Count = 0
				
				for i, value in List do
					if value then
						Count += 1
					end
				end
				if Count <= SelectionLimit then
					return List
				end
				local t = {}
				local Count1 = 0
				
				for i, value1 in List do
					if value1 and Count1 < SelectionLimit then
						t[i] = true
						Count1 += 1
					end
				end
				return t
			end)
			
			return
		end
	end, { SelectionLimit })
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult2 (copy), OnSelectionChangedFunction (copy), UseStateResult5 (copy)
		if not UseRefResult2.current then
			UseRefResult2.current = true
			
			return
		end
		if OnSelectionChangedFunction ~= nil then
			local List = {}
			
			for i, value in UseStateResult5 do
				if value then
					table.insert(List, i)
				end
			end
			OnSelectionChangedFunction(List)
		end
	end, { UseStateResult5, OnSelectionChangedFunction })
	
	return {
		searchText = UseStateResult,
		setSearchText = UseStateResult2,
		userIds = UseMemoResult,
		isLoading = if IsNotReplacedMatch then UseStateResult4 else BrowseIsLoading,
		loadMore = UseResult,
		selectedCount = SelectedCount,
		hasSelection = SelectedCount > 0,
		selectionLimit = SelectionLimit,
		isSelected = ReactModule.useCallback(function(p2): boolean
			-- upvalues: UseStateResult5 (copy)
			return UseStateResult5[p2] == true
		end, { UseStateResult5 }),
		canSelect = ReactModule.useCallback(function(p2): boolean
			-- upvalues: UseStateResult5 (copy), SelectionLimit (copy)
			if UseStateResult5[p2] == true then
				return true
			end
			local v1 = true
			
			if SelectionLimit ~= nil then
				local Count = 0
				
				for _, value in UseStateResult5 do
					if value then
						Count += 1
					end
				end
				v1 = Count < SelectionLimit
			end
			return v1
		end, { UseStateResult5, SelectionLimit }),
		toggleSelected = ReactModule.useCallback(function(p3)
			-- upvalues: UseStateResult2_4 (copy), SelectionLimit (copy)
			UseStateResult2_4(function(Tbl)
				-- upvalues: p3 (copy), SelectionLimit (upval)
				local Copy = table.clone(Tbl)
				
				if Copy[p3] then
					Copy[p3] = nil
					
					return Copy
				end
				if SelectionLimit ~= nil then
					local Count = 0
					
					for _, value in Copy do
						if value then
							Count += 1
						end
					end
					if Count >= SelectionLimit then
						return Tbl
					end
				end
				Copy[p3] = true
				
				return Copy
			end)
		end, { SelectionLimit }),
		message = UseStateResult6,
		setMessage = UseStateResult2_5,
		isSubmitting = UseStateResult7,
		submit = ReactModule.useCallback(function()
			-- upvalues: UseStateResult7 (copy), UseStateResult5 (copy), UseStateResult2_6 (copy), OnSubmitFunction (copy), UseStateResult6 (copy)
			if UseStateResult7 then return end
			local List = {}
			
			for i, value in UseStateResult5 do
				if value then
					table.insert(List, i)
				end
			end
			if #List ~= 0 then
				UseStateResult2_6(true)
				OnSubmitFunction(List, if string.gsub(UseStateResult6, "^%s*(.-)%s*$", "%1") == "" then nil else UseStateResult6):finally(function()
					-- upvalues: UseStateResult2_6 (upval)
					UseStateResult2_6(false)
				end)
				
				return
			end
		end, {
			UseStateResult7,
			UseStateResult5,
			UseStateResult6,
			OnSubmitFunction
		})
	}
end