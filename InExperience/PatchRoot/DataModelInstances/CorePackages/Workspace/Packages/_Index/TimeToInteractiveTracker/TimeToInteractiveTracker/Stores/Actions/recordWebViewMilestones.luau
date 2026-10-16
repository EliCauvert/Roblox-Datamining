local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local NewResult = require(TimeToInteractiveTracker.Logger):new(script.Name)
local FFlagDebugTimeToInteractiveTrackerModule = require(TimeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local _ = require(script.Parent.Parent.types)
local _ = require(TimeToInteractiveTracker.Milestones.types)
local ConstantsModule = require(TimeToInteractiveTracker.Milestones.constants)

return function(Callback, Callback1) --[[ Line: 35 ]]
	-- upvalues: FFlagDebugTimeToInteractiveTrackerModule (copy), NewResult (copy), ConstantsModule (copy)
	return function(p1, List) --[[ Line: 36 ]]
		-- upvalues: Callback (copy), FFlagDebugTimeToInteractiveTrackerModule (upval), NewResult (upval), ConstantsModule (upval), Callback1 (copy)
		if #List == 0 then return end
		local CallbackResultEntry = Callback(false)[p1]
		
		if FFlagDebugTimeToInteractiveTrackerModule and (not CallbackResultEntry or not CallbackResultEntry.startTime) then
			NewResult:warning(`called before trackStart for eventName={p1}`)
		end
		if not CallbackResultEntry or not CallbackResultEntry.startTime then return end
		local StartTime = CallbackResultEntry.startTime
		local Subphase = ConstantsModule.DataProcessingCompleted.Subphase
		
		local function materializeSubphases(Subphases) --[[ Line: 63 ]]
			-- upvalues: StartTime (copy), Subphase (copy)
			if Subphases == nil then
				return nil
			end
			local List = {}
			
			for _, subphas in Subphases do
				local NewStartTime = StartTime + subphas.deltaMs / 1000
				table.insert(List, if subphas.name == Subphase.Decode or subphas.name == Subphase.DataUpdate or subphas.name == Subphase.TreeBuild then {
					name = subphas.name,
					timestamp = NewStartTime,
					deltaMs = subphas.deltaMs
				} else {
					name = subphas.name,
					timestamp = NewStartTime,
					deltaMs = subphas.deltaMs
				})
			end
			return List
		end
		
		local List1 = {}
		
		for _, value in List do
			table.insert(List1, {
				name = value.name,
				id = value.id,
				timestamp = StartTime + value.deltaMs / 1000,
				deltaMs = value.deltaMs,
				subphases = materializeSubphases(value.subphases)
			})
		end
		Callback1(function(Tbl) --[[ Line: 110 ]]
			-- upvalues: p1 (copy), List1 (copy)
			local Entry = Tbl[p1]
			
			if not Entry then
				return Tbl
			end
			local Copy = table.clone(Tbl)
			local Copy1 = table.clone(Entry)
			local Copy2 = if Copy1.milestones then table.clone(Copy1.milestones) else {}
			for _, value in List1 do
				table.insert(Copy2, value)
			end
			Copy1.milestones = Copy2
			Copy[p1] = Copy1
			
			return Copy
		end)
	end
end