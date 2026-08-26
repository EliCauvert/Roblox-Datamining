local timeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local name = require(timeToInteractiveTracker.Logger):new(script.Name)
local fFlagDebugTimeToInteractiveTrackerModule = require(timeToInteractiveTracker.Utils.FFlagDebugTimeToInteractiveTracker)
local _ = require(script.Parent.Parent.types)
local _ = require(timeToInteractiveTracker.Milestones.types)
local constantsModule = require(timeToInteractiveTracker.Milestones.constants)

return function(p1, p2)
	-- upvalues: fFlagDebugTimeToInteractiveTrackerModule (ref), name (ref), constantsModule (ref)
	return function(p3, p4)
		-- upvalues: p1 (ref), fFlagDebugTimeToInteractiveTrackerModule (copy), name (copy), constantsModule (copy), p2 (ref)
		if #p4 == 0 then return end
		local var1 = p1(false)[p3]
		
		if fFlagDebugTimeToInteractiveTrackerModule and (not var1 or not var1.startTime) then
			name:warning(`called before trackStart for eventName={p3}`)
		end
		if not var1 or not var1.startTime then return end
		local startTime = var1.startTime
		local subphase = constantsModule.DataProcessingCompleted.Subphase
		
		local function materializeSubphases(p5)
			-- upvalues: startTime (ref), subphase (ref)
			if p5 == nil then
				return nil
			end
			local t = {}
			
			for i, v in p5 do
				local var2 = startTime + v.deltaMs / 1000
				table.insert(t, if v.name == subphase.Decode or v.name == subphase.DataUpdate or v.name == subphase.TreeBuild then { name = v.name, timestamp = var2, deltaMs = v.deltaMs } else { name = v.name, timestamp = var2, deltaMs = v.deltaMs })
			end
			return t
		end
		
		local t = {}
		
		for i, v in p4 do
			table.insert(t, {
				name = v.name,
				id = v.id,
				timestamp = startTime + v.deltaMs / 1000,
				deltaMs = v.deltaMs,
				subphases = materializeSubphases(v.subphases)
			})
		end
		p2(function(p6)
			-- upvalues: p3 (ref), t (ref)
			local var3 = p6[p3]
			
			if not var3 then
				return p6
			end
			local cloned = table.clone(p6)
			local cloned_1 = table.clone(var3)
			local var4 = if cloned_1.milestones then table.clone(cloned_1.milestones) else {}
			
			for i, v in t do
				table.insert(var4, v)
			end
			cloned_1.milestones = var4
			cloned[p3] = cloned_1
			
			return cloned
		end)
	end
end