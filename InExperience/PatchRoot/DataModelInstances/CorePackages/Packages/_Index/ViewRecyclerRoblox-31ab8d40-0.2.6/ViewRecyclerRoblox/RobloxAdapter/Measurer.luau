local RunService = game:GetService("RunService")
local ViewRecyclerRoblox = script:FindFirstAncestor("ViewRecyclerRoblox")
local _ = require(ViewRecyclerRoblox.Parent.ViewRecycler)
local AxisMapModule = require(ViewRecyclerRoblox.RobloxAdapter.axisMap)

return {
	attach = function(p1)
		-- upvalues: RunService (copy), AxisMapModule (copy)
		local _Instance = p1.instance
		local Axis = p1.axis
		local GetIdentityFunction = p1.getIdentity
		local OnItemMeasuredFunction = p1.onItemMeasured
		local Tbl = {}
		local Tbl1 = {}
		
		local function scheduleSettle()
			-- upvalues: GetIdentityFunction (copy), Tbl1 (copy), RunService (upval), Tbl (copy), _Instance (copy), AxisMapModule (upval), Axis (copy), OnItemMeasuredFunction (copy)
			local Identity = GetIdentityFunction()
			
			if Identity == nil then return end
			local Entry = Tbl1[Identity.assignmentGeneration]
			
			if Entry == nil then
				Entry = {}
				Tbl1[Identity.assignmentGeneration] = Entry
			end
			local ItemIndex = Identity.itemIndex or (Identity.pinnedPosition or false)
			
			if ItemIndex == false then
				ItemIndex = Identity.index or false
			end
			local Entry1 = Entry[ItemIndex]
			
			if Entry1 == nil then
				Entry1 = {}
				Entry[ItemIndex] = Entry1
			end
			if Entry1[Identity.itemRevision] == nil then
				local ItemKey = Identity.itemKey
				local ItemIndex1 = Identity.itemIndex
				local AssignmentGeneration = Identity.assignmentGeneration
				local ItemRevision = Identity.itemRevision
				local PinnedPosition = Identity.pinnedPosition
				local HeartbeatConnection = nil
				HeartbeatConnection = RunService.Heartbeat:Once(function()
					-- upvalues: Tbl (upval), HeartbeatConnection (ref), Entry1 (ref), ItemRevision (copy), Entry (ref), ItemIndex (ref), Tbl1 (upval), AssignmentGeneration (copy), GetIdentityFunction (upval), ItemKey (copy), ItemIndex1 (copy), PinnedPosition (copy), _Instance (upval), AxisMapModule (upval), Axis (upval), OnItemMeasuredFunction (upval)
					Tbl[HeartbeatConnection] = nil
					
					if Entry1[ItemRevision] == HeartbeatConnection then
						Entry1[ItemRevision] = nil
						
						if next(Entry1) == nil then
							Entry[ItemIndex] = nil
							
							if next(Entry) == nil then
								Tbl1[AssignmentGeneration] = nil
							end
						end
					end
					local Identity = GetIdentityFunction()
					
					if Identity == nil or Identity.itemKey ~= ItemKey or Identity.itemIndex ~= ItemIndex1 or Identity.assignmentGeneration ~= AssignmentGeneration or Identity.itemRevision ~= ItemRevision or Identity.pinnedPosition ~= PinnedPosition then return end
					if AxisMapModule.crossOf(_Instance.AbsoluteSize, Axis) > 0 then
						OnItemMeasuredFunction(Identity, AxisMapModule.mainOf(_Instance.AbsoluteSize, Axis))
					end
				end)
				Tbl[HeartbeatConnection] = true
				Entry1[ItemRevision] = HeartbeatConnection
				
				return
			end
		end
		
		local Connection = _Instance:GetPropertyChangedSignal("AbsoluteSize"):Connect(scheduleSettle)
		
		return {
			scheduleSettle = scheduleSettle,
			getPendingCount = function(): number
				-- upvalues: Tbl (copy)
				local Count = 0
				
				for _ in Tbl do
					Count += 1
				end
				return Count
			end,
			disconnect = function()
				-- upvalues: Connection (copy), Tbl (copy), Tbl1 (copy)
				Connection:Disconnect()
				
				for Connection1 in Tbl do
					Connection1:Disconnect()
				end
				table.clear(Tbl)
				table.clear(Tbl1)
			end
		}
	end
}