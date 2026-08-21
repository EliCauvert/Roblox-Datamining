local runService = game:GetService("RunService")
local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)

return {
	attach = function(p0) --[[ line: 43 ]]
		-- upvalues: runService (ref), axisMapModule (ref)
		local instance = p0.instance
		local axis = p0.axis
		local getIdentity = p0.getIdentity
		local onItemMeasured = p0.onItemMeasured
		local t = {}
		local t_1 = {}
		
		local function scheduleSettle() --[[ line: 66 ]]
			-- upvalues: getIdentity (ref), t_1 (ref), runService (copy), t (ref), instance (ref), axisMapModule (copy), axis (ref), onItemMeasured (ref)
			local var7 = getIdentity()
			
			if var7 == nil then return end
			local assignmentGeneration = t_1[var7.assignmentGeneration]
			
			if assignmentGeneration == nil then
				assignmentGeneration = {}
				t_1[var7.assignmentGeneration] = assignmentGeneration
			end
			local itemIndex = var7.itemIndex or (var7.pinnedPosition or false)
			itemIndex = itemIndex ~= false and ((if itemIndex ~= false then var7.index else nil) or false)
			local var9 = assignmentGeneration[u110]
			
			if var9 == nil then
				var9 = {}
				assignmentGeneration[u110] = var9
			end
			if var9[var7.itemRevision] == nil then
				local itemKey = var7.itemKey
				local itemIndex_1 = var7.itemIndex
				local assignmentGeneration_1 = var7.assignmentGeneration
				local itemRevision = var7.itemRevision
				local pinnedPosition = var7.pinnedPosition
				local heartbeatConnection = nil
				heartbeatConnection = runService.Heartbeat:Once(function() --[[ line: 97 ]]
					-- upvalues: t (copy), heartbeatConnection (write), var9 (write), itemRevision (ref), assignmentGeneration (write), ? (write), t_1 (copy), assignmentGeneration_1 (ref), getIdentity (copy), itemKey (ref), itemIndex_1 (ref), pinnedPosition (ref), instance (copy), axisMapModule (copy), axis (copy), onItemMeasured (copy)
					t[heartbeatConnection] = nil
					
					if var9[itemRevision] == heartbeatConnection then
						var9[itemRevision] = nil
						
						if next(var9) == nil then
							assignmentGeneration[u5] = nil
							
							if next(assignmentGeneration) == nil then
								t_1[assignmentGeneration_1] = nil
							end
						end
					end
					local var11 = getIdentity()
					
					if var11 == nil or var11.itemKey ~= itemKey or (var11.itemIndex ~= itemIndex_1 or var11.assignmentGeneration ~= assignmentGeneration_1) or (var11.itemRevision ~= itemRevision or var11.pinnedPosition ~= pinnedPosition) then return end
					if axisMapModule.crossOf(instance.AbsoluteSize, axis) > 0 then
						onItemMeasured(var11, axisMapModule.mainOf(instance.AbsoluteSize, axis))
					end
				end)
				t[heartbeatConnection] = true
				var9[itemRevision] = heartbeatConnection
				
				return
			end
		end
		
		local var6 = instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(scheduleSettle)
		
		return {
			scheduleSettle = scheduleSettle,
			getPendingCount = function() --[[ line: 154 ]]
				-- upvalues: t (ref)
				local var12 = 0
				
				for i in t do
					var12 += 1
				end
				return var12
			end,
			disconnect = function() --[[ line: 143 ]]
				-- upvalues: var6 (ref), t (ref), t_1 (ref)
				var6:Disconnect()
				
				for i in t do
					i:Disconnect()
				end
				table.clear(t)
				table.clear(t_1)
			end
		}
	end
}