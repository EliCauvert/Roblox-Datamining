local changeHistoryService = game:GetService("ChangeHistoryService")
local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local LUAU_ANALYZE_ERROR = reactUtils.LUAU_ANALYZE_ERROR

return function(p0, p1, p2) --[[ line: 11 | named "useHistory" ]]
	-- upvalues: reactModule (ref), changeHistoryService (ref), LUAU_ANALYZE_ERROR (ref)
	local var3 = reactModule.useRef(p0)
	local var4 = reactModule.useRef({})
	local var5 = reactModule.useRef({})
	reactModule.useEffect(function() --[[ line: 16 ]]
		-- upvalues: changeHistoryService (copy), var4 (ref), var5 (ref), LUAU_ANALYZE_ERROR (copy), var3 (ref), p1 (ref)
		local onUndoConnection = changeHistoryService.OnUndo:Connect(function(p3) --[[ line: 17 ]]
			-- upvalues: var4 (copy), var5 (copy), LUAU_ANALYZE_ERROR (copy), var3 (copy), p1 (copy)
			local current = var4.current
			local current_1 = var5.current
			assert(current ~= nil, LUAU_ANALYZE_ERROR)
			assert(current_1 ~= nil, LUAU_ANALYZE_ERROR)
			
			if not current[p3] or #current[p3] == 0 then return end
			if not current_1[p3] then
				current_1[p3] = {}
			end
			local count = #current[p3]
			local var9 = current[p3][count]
			table.insert(current_1[p3], var3.current)
			table.remove(current[p3], count)
			var3.current = var9
			p1(var9)
			var4.current = current
			var5.current = current_1
		end)
		local onRedoConnection = changeHistoryService.OnRedo:Connect(function(p4) --[[ line: 48 ]]
			-- upvalues: var4 (copy), var5 (copy), LUAU_ANALYZE_ERROR (copy), var3 (copy), p1 (copy)
			local current = var4.current
			local current_1 = var5.current
			assert(current ~= nil, LUAU_ANALYZE_ERROR)
			assert(current_1 ~= nil, LUAU_ANALYZE_ERROR)
			
			if current_1[p4] and #current_1[p4] ~= 0 then
				local count = #current_1[p4]
				local var11 = current_1[p4][count]
				table.insert(current[p4], var3.current)
				table.remove(current_1[p4], count)
				assert(var11 ~= nil, LUAU_ANALYZE_ERROR)
				var3.current = var11
				p1(var11)
				var4.current = current
				var5.current = current_1
				
				return
			end
		end)
		
		return function() --[[ line: 76 ]]
			-- upvalues: onUndoConnection (ref), onRedoConnection (ref)
			onUndoConnection:Disconnect()
			onRedoConnection:Disconnect()
		end
	end, p2)
	reactModule.useEffect(function() --[[ line: 82 ]]
		-- upvalues: var4 (ref), var5 (ref)
		var4.current = {}
		var5.current = {}
	end, p2)
	
	return reactModule.useCallback(function(p5, p6) --[[ line: 87 ]]
		-- upvalues: var4 (ref), LUAU_ANALYZE_ERROR (copy), var5 (ref), changeHistoryService (copy), var3 (ref)
		local current = var4.current
		assert(current ~= nil, LUAU_ANALYZE_ERROR)
		
		if not current[p5] then
			current[p5] = {}
		end
		var5.current = {}
		changeHistoryService:SetWaypoint(p5)
		
		if typeof(var3.current) == "table" then
			table.insert(current[p5], table.clone(var3.current))
		else
			table.insert(current[p5], var3.current)
		end
		var3.current = p6
		var4.current = current
	end, p2)
end