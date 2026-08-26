local runService = game:GetService("RunService")
local viewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(viewRecyclerRoblox.Parent.ViewRecycler)
local axisMapModule = require(viewRecyclerRoblox.RobloxAdapter.axisMap)

return {
	attach = function(p1)
		-- upvalues: runService (ref), axisMapModule (ref)
		local instance = p1.instance
		local axis = p1.axis
		local getIdentity = p1.getIdentity
		local onItemMeasured = p1.onItemMeasured
		local t = {}
		local t_1 = {}
		
		local function scheduleSettle()
			-- upvalues: getIdentity (ref), t_1 (ref), runService (copy), t (ref), instance (ref), axisMapModule (copy), axis (ref), onItemMeasured (ref)
			local var1 = getIdentity()
			
			if var1 == nil then return end
			local assignmentGeneration = t_1[var1.assignmentGeneration]
			
			if assignmentGeneration == nil then
				assignmentGeneration = {}
				t_1[var1.assignmentGeneration] = assignmentGeneration
			end
			local itemIndex = var1.itemIndex or (var1.pinnedPosition or false)
			itemIndex = itemIndex ~= false and ((if itemIndex ~= false then var1.index else nil) or false)
			local var2 = assignmentGeneration[u110]
			
			if var2 == nil then
				var2 = {}
				assignmentGeneration[u110] = var2
			end
			if var2[var1.itemRevision] == nil then
				local itemKey = var1.itemKey
				local itemIndex_1 = var1.itemIndex
				local assignmentGeneration_1 = var1.assignmentGeneration
				local itemRevision = var1.itemRevision
				local pinnedPosition = var1.pinnedPosition
				local heartbeatConnection = nil
				heartbeatConnection = runService.Heartbeat:Once(function()
					-- upvalues: t (copy), heartbeatConnection (write), var2 (write), itemRevision (ref), assignmentGeneration (write), ? (write), t_1 (copy), assignmentGeneration_1 (ref), getIdentity (copy), itemKey (ref), itemIndex_1 (ref), pinnedPosition (ref), instance (copy), axisMapModule (copy), axis (copy), onItemMeasured (copy)
					t[heartbeatConnection] = nil
					
					if var2[itemRevision] == heartbeatConnection then
						var2[itemRevision] = nil
						
						if next(var2) == nil then
							assignmentGeneration[u5] = nil
							
							if next(assignmentGeneration) == nil then
								t_1[assignmentGeneration_1] = nil
							end
						end
					end
					local var3 = getIdentity()
					
					if var3 == nil or var3.itemKey ~= itemKey or (var3.itemIndex ~= itemIndex_1 or var3.assignmentGeneration ~= assignmentGeneration_1) or (var3.itemRevision ~= itemRevision or var3.pinnedPosition ~= pinnedPosition) then return end
					if axisMapModule.crossOf(instance.AbsoluteSize, axis) > 0 then
						onItemMeasured(var3, axisMapModule.mainOf(instance.AbsoluteSize, axis))
					end
				end)
				t[heartbeatConnection] = true
				var2[itemRevision] = heartbeatConnection
				
				return
			end
		end
		
		local var1 = instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(scheduleSettle)
		
		return {
			scheduleSettle = scheduleSettle,
			getPendingCount = function()
				-- upvalues: t (ref)
				local var2 = 0
				
				for i in t do
					var2 += 1
				end
				return var2
			end,
			disconnect = function()
				-- upvalues: var1 (ref), t (ref), t_1 (ref)
				var1:Disconnect()
				
				for i in t do
					i:Disconnect()
				end
				table.clear(t)
				table.clear(t_1)
			end
		}
	end
}