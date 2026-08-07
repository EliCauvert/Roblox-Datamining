local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagDebugTimeToInteractiveTrackerModule = require(timeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local _ = require(script.Parent.Parent.types)
local _ = require(timeToInteractiveTracker.Milestones.types)
local constantsModule = require(timeToInteractiveTracker.Milestones.constants)

return function(p0, p1) --[[ line: 35 ]]
	-- upvalues: fFlagDebugTimeToInteractiveTrackerModule (ref), name (ref), constantsModule (ref)
	return function(p2, p3) --[[ line: 36 ]]
		-- upvalues: p0 (ref), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), constantsModule (copy), p1 (ref)
		if #p3 == 0 then return end
		local var4 = p0(false)[p2]
		
		if fFlagDebugTimeToInteractiveTrackerModule and (not var4 or not var4.startTime) then
			name:warning(`called before trackStart for eventName={p2}`)
		end
		if not var4 or not var4.startTime then return end
		local startTime = var4.startTime
		local subphase = constantsModule.DataProcessingCompleted.Subphase
		
		local function materializeSubphases(p4) --[[ line: 63 ]]
			-- upvalues: startTime (ref), subphase (ref)
			if p4 == nil then
				return nil
			end
			local t = {}
			
			for i, v in p4 do
				local var8 = startTime + v.deltaMs / 1000
				table.insert(t, if v.name == subphase.Decode or v.name == subphase.DataUpdate or v.name == subphase.TreeBuild then { name = v.name, timestamp = var8, deltaMs = v.deltaMs } else { name = v.name, timestamp = var8, deltaMs = v.deltaMs })
			end
			return t
		end
		
		local t = {}
		
		for i, v in p3 do
			table.insert(t, {
				name = v.name,
				id = v.id,
				timestamp = startTime + v.deltaMs / 1000,
				deltaMs = v.deltaMs,
				subphases = materializeSubphases(v.subphases)
			})
		end
		p1(function(p5) --[[ line: 110 ]]
			-- upvalues: p2 (ref), t (ref)
			local var9 = p5[p2]
			
			if not var9 then
				return p5
			end
			local cloned = table.clone(p5)
			local cloned_1 = table.clone(var9)
			local var12 = if cloned_1.milestones then table.clone(cloned_1.milestones) else {}
			
			for i, v in t do
				table.insert(var12, v)
			end
			cloned_1.milestones = var12
			cloned[p2] = cloned_1
			
			return cloned
		end)
	end
end