local ChangeHistoryService = game:GetService("ChangeHistoryService")
local ReactUtils = script:FindFirstAncestor("ReactUtils")
local ReactModule = require(ReactUtils.Parent.React)
local LUAUANALYZEERRORModule = require(ReactUtils.LUAU_ANALYZE_ERROR)

return function(p1, Callback, p2)
	-- upvalues: ReactModule (copy), ChangeHistoryService (copy), LUAUANALYZEERRORModule (copy)
	local UseRefResult = ReactModule.useRef(p1)
	local UseRefResult1 = ReactModule.useRef({})
	local UseRefResult2 = ReactModule.useRef({})
	ReactModule.useEffect(function()
		-- upvalues: ChangeHistoryService (upval), UseRefResult1 (copy), UseRefResult2 (copy), LUAUANALYZEERRORModule (upval), UseRefResult (copy), Callback (copy)
		local OnUndoConnection = ChangeHistoryService.OnUndo:Connect(function(Waypoint)
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), LUAUANALYZEERRORModule (upval), UseRefResult (upval), Callback (upval)
			local Current = UseRefResult1.current
			local Current1 = UseRefResult2.current
			assert(Current ~= nil, LUAUANALYZEERRORModule)
			assert(Current1 ~= nil, LUAUANALYZEERRORModule)
			
			if not Current[Waypoint] or #Current[Waypoint] == 0 then return end
			if not Current1[Waypoint] then
				Current1[Waypoint] = {}
			end
			local Count = #Current[Waypoint]
			local CurrentEntry = Current[Waypoint][Count]
			table.insert(Current1[Waypoint], UseRefResult.current)
			table.remove(Current[Waypoint], Count)
			UseRefResult.current = CurrentEntry
			Callback(CurrentEntry)
			UseRefResult1.current = Current
			UseRefResult2.current = Current1
		end)
		local OnRedoConnection = ChangeHistoryService.OnRedo:Connect(function(Waypoint)
			-- upvalues: UseRefResult1 (upval), UseRefResult2 (upval), LUAUANALYZEERRORModule (upval), UseRefResult (upval), Callback (upval)
			local Current = UseRefResult1.current
			local Current1 = UseRefResult2.current
			assert(Current ~= nil, LUAUANALYZEERRORModule)
			assert(Current1 ~= nil, LUAUANALYZEERRORModule)
			
			if Current1[Waypoint] and #Current1[Waypoint] ~= 0 then
				local Count = #Current1[Waypoint]
				local CurrentEntry = Current1[Waypoint][Count]
				table.insert(Current[Waypoint], UseRefResult.current)
				table.remove(Current1[Waypoint], Count)
				assert(CurrentEntry ~= nil, LUAUANALYZEERRORModule)
				UseRefResult.current = CurrentEntry
				Callback(CurrentEntry)
				UseRefResult1.current = Current
				UseRefResult2.current = Current1
				
				return
			end
		end)
		
		return function()
			-- upvalues: OnUndoConnection (copy), OnRedoConnection (copy)
			OnUndoConnection:Disconnect()
			OnRedoConnection:Disconnect()
		end
	end, p2)
	ReactModule.useEffect(function()
		-- upvalues: UseRefResult1 (copy), UseRefResult2 (copy)
		UseRefResult1.current = {}
		UseRefResult2.current = {}
	end, p2)
	
	return (ReactModule.useCallback(function(Key, Current)
		-- upvalues: UseRefResult1 (copy), LUAUANALYZEERRORModule (upval), UseRefResult2 (copy), ChangeHistoryService (upval), UseRefResult (copy)
		local Current1 = UseRefResult1.current
		assert(Current1 ~= nil, LUAUANALYZEERRORModule)
		
		if not Current1[Key] then
			Current1[Key] = {}
		end
		UseRefResult2.current = {}
		ChangeHistoryService:SetWaypoint(Key)
		
		if typeof(UseRefResult.current) == "table" then
			table.insert(Current1[Key], table.clone(UseRefResult.current))
		else
			table.insert(Current1[Key], UseRefResult.current)
		end
		UseRefResult.current = Current
		UseRefResult1.current = Current1
	end, p2))
end