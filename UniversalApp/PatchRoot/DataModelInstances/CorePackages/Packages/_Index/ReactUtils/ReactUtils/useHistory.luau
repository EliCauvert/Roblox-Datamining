local changeHistoryService = game:GetService("ChangeHistoryService")
local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local LUAU_ANALYZE_ERRORModule = require(reactUtils.LUAU_ANALYZE_ERROR)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), changeHistoryService (ref), LUAU_ANALYZE_ERRORModule (ref)
	local var1 = reactModule.useRef(p1)
	local var2 = reactModule.useRef({})
	local var3 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: changeHistoryService (copy), var2 (ref), var3 (ref), LUAU_ANALYZE_ERRORModule (copy), var1 (ref), p2 (ref)
		local onUndoConnection = changeHistoryService.OnUndo:Connect(function(p4)
			-- upvalues: var2 (copy), var3 (copy), LUAU_ANALYZE_ERRORModule (copy), var1 (copy), p2 (copy)
			local current = var2.current
			local current_1 = var3.current
			assert(current ~= nil, LUAU_ANALYZE_ERRORModule)
			assert(current_1 ~= nil, LUAU_ANALYZE_ERRORModule)
			
			if not current[p4] or #current[p4] == 0 then return end
			if not current_1[p4] then
				current_1[p4] = {}
			end
			local count = #current[p4]
			local var4 = current[p4][count]
			table.insert(current_1[p4], var1.current)
			table.remove(current[p4], count)
			var1.current = var4
			p2(var4)
			var2.current = current
			var3.current = current_1
		end)
		local onRedoConnection = changeHistoryService.OnRedo:Connect(function(p4)
			-- upvalues: var2 (copy), var3 (copy), LUAU_ANALYZE_ERRORModule (copy), var1 (copy), p2 (copy)
			local current = var2.current
			local current_1 = var3.current
			assert(current ~= nil, LUAU_ANALYZE_ERRORModule)
			assert(current_1 ~= nil, LUAU_ANALYZE_ERRORModule)
			
			if current_1[p4] and #current_1[p4] ~= 0 then
				local count = #current_1[p4]
				local var4 = current_1[p4][count]
				table.insert(current[p4], var1.current)
				table.remove(current_1[p4], count)
				assert(var4 ~= nil, LUAU_ANALYZE_ERRORModule)
				var1.current = var4
				p2(var4)
				var2.current = current
				var3.current = current_1
				
				return
			end
		end)
		
		return function()
			-- upvalues: onUndoConnection (ref), onRedoConnection (ref)
			onUndoConnection:Disconnect()
			onRedoConnection:Disconnect()
		end
	end, p3)
	reactModule.useEffect(function()
		-- upvalues: var2 (ref), var3 (ref)
		var2.current = {}
		var3.current = {}
	end, p3)
	
	return reactModule.useCallback(function(p4, p5)
		-- upvalues: var2 (ref), LUAU_ANALYZE_ERRORModule (copy), var3 (ref), changeHistoryService (copy), var1 (ref)
		local current = var2.current
		assert(current ~= nil, LUAU_ANALYZE_ERRORModule)
		
		if not current[p4] then
			current[p4] = {}
		end
		var3.current = {}
		changeHistoryService:SetWaypoint(p4)
		
		if typeof(var1.current) == "table" then
			table.insert(current[p4], table.clone(var1.current))
		else
			table.insert(current[p4], var1.current)
		end
		var1.current = p5
		var2.current = current
	end, p3)
end