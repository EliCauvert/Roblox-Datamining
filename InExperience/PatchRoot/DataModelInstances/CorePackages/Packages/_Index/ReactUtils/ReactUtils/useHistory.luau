local changeHistoryService = game:GetService("ChangeHistoryService")
local reactUtils = script:FindFirstAncestor("ReactUtils")
local reactModule = require(reactUtils.Parent.React)
local LUAU_ANALYZE_ERRORModule = require(reactUtils.LUAU_ANALYZE_ERROR)

return function(p0, p1, p2)
	-- upvalues: reactModule (ref), changeHistoryService (ref), LUAU_ANALYZE_ERRORModule (ref)
	local var4 = reactModule.useRef(p0)
	local var5 = reactModule.useRef({})
	local var6 = reactModule.useRef({})
	reactModule.useEffect(function()
		-- upvalues: changeHistoryService (copy), var5 (ref), var6 (ref), LUAU_ANALYZE_ERRORModule (copy), var4 (ref), p1 (ref)
		local onUndoConnection = changeHistoryService.OnUndo:Connect(function(p3)
			-- upvalues: var5 (copy), var6 (copy), LUAU_ANALYZE_ERRORModule (copy), var4 (copy), p1 (copy)
			local current = var5.current
			local current_1 = var6.current
			assert(current ~= nil, LUAU_ANALYZE_ERRORModule)
			assert(current_1 ~= nil, LUAU_ANALYZE_ERRORModule)
			
			if not current[p3] or #current[p3] == 0 then return end
			if not current_1[p3] then
				current_1[p3] = {}
			end
			local count = #current[p3]
			local var10 = current[p3][count]
			table.insert(current_1[p3], var4.current)
			table.remove(current[p3], count)
			var4.current = var10
			p1(var10)
			var5.current = current
			var6.current = current_1
		end)
		local onRedoConnection = changeHistoryService.OnRedo:Connect(function(p4)
			-- upvalues: var5 (copy), var6 (copy), LUAU_ANALYZE_ERRORModule (copy), var4 (copy), p1 (copy)
			local current = var5.current
			local current_1 = var6.current
			assert(current ~= nil, LUAU_ANALYZE_ERRORModule)
			assert(current_1 ~= nil, LUAU_ANALYZE_ERRORModule)
			
			if current_1[p4] and #current_1[p4] ~= 0 then
				local count = #current_1[p4]
				local var12 = current_1[p4][count]
				table.insert(current[p4], var4.current)
				table.remove(current_1[p4], count)
				assert(var12 ~= nil, LUAU_ANALYZE_ERRORModule)
				var4.current = var12
				p1(var12)
				var5.current = current
				var6.current = current_1
				
				return
			end
		end)
		
		return function()
			-- upvalues: onUndoConnection (ref), onRedoConnection (ref)
			onUndoConnection:Disconnect()
			onRedoConnection:Disconnect()
		end
	end, p2)
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var6 (ref)
		var5.current = {}
		var6.current = {}
	end, p2)
	
	return reactModule.useCallback(function(p5, p6)
		-- upvalues: var5 (ref), LUAU_ANALYZE_ERRORModule (copy), var6 (ref), changeHistoryService (copy), var4 (ref)
		local current = var5.current
		assert(current ~= nil, LUAU_ANALYZE_ERRORModule)
		
		if not current[p5] then
			current[p5] = {}
		end
		var6.current = {}
		changeHistoryService:SetWaypoint(p5)
		
		if typeof(var4.current) == "table" then
			table.insert(current[p5], table.clone(var4.current))
		else
			table.insert(current[p5], var4.current)
		end
		var4.current = p6
		var5.current = current
	end, p2)
end