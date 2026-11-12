local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local NewResult = require(TimeToInteractiveTracker.Logger):new(script.Name)
local _ = require(script.Parent.Parent.types)
local NowModule = require(script.Parent.Parent.Parent.Utils.now)
local SendTTIStatModule = require(TimeToInteractiveTracker.Utils.sendTTIStat)
local SendTTIStatAtFirstFrameModule = require(TimeToInteractiveTracker.Utils.sendTTIStatAtFirstFrame)
local BuildTTIStatArgsModule = require(TimeToInteractiveTracker.Utils.buildTTIStatArgs)
local UtilModule = require(TimeToInteractiveTracker.Utils.Util)
local FFlagLuaAppNavTTIMeasurementV2 = require(TimeToInteractiveTracker.Parent.SharedFlags).FFlagLuaAppNavTTIMeasurementV2

return function(Callback, p1)
	-- upvalues: FFlagLuaAppNavTTIMeasurementV2 (copy), NewResult (copy), NowModule (copy), UtilModule (copy), SendTTIStatAtFirstFrameModule (copy), SendTTIStatModule (copy), BuildTTIStatArgsModule (copy)
	local function _(StatName, p2, p3)
		-- upvalues: Callback (copy), FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (copy), NewResult (upval), NowModule (upval), UtilModule (upval), SendTTIStatAtFirstFrameModule (upval), SendTTIStatModule (upval), BuildTTIStatArgsModule (upval)
		local v1 = nil
		local Config = nil
		local IsNotSent = false
		local NoP2 = not p2 or p2.cleanupAfterSend == nil or p2.cleanupAfterSend
		local SamplingRateOverride = if p2 then p2.samplingRateOverride else nil
		Callback(function(Tbl)
			-- upvalues: StatName (copy), FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (upval), NewResult (upval), NowModule (upval), IsNotSent (ref), v1 (ref), Config (ref), SamplingRateOverride (copy), NoP2 (copy), UtilModule (upval)
			local Entry = Tbl[StatName]
			
			if Entry ~= nil then
				if Entry.startTime == nil then
					NewResult:warning(`called before trackStart for eventName={StatName}`)
					
					return Tbl
				end
				local EndTime = NowModule()
				local ScaledEndTime = (EndTime - Entry.startTime) * 1000
				IsNotSent = Entry.sent ~= true
				
				if IsNotSent then
					v1 = EndTime
					Config = {
						statName = StatName,
						startTime = Entry.startTime,
						metaData = Entry.metadata,
						milestones = Entry.milestones,
						samplingRateOverride = SamplingRateOverride
					}
				end
				local Copy = table.clone(Tbl)
				
				if IsNotSent and NoP2 then
					Copy[StatName] = nil
					
					return Copy
				else
					Copy[StatName] = {
						sent = true,
						startTime = Entry.startTime,
						endTime = EndTime,
						deltaMs = ScaledEndTime,
						metadata = table.clone(Entry.metadata),
						milestones = if Entry.milestones then UtilModule.deepCloneMilestones(Entry.milestones) else nil
					}
					
					return Copy
				end
			elseif FFlagLuaAppNavTTIMeasurementV2 and p1 and p1[StatName] then
				return Tbl
			else
				NewResult:warning(`called before trackStart for eventName={StatName}`)
				
				return Tbl
			end
		end)
		
		if Config == nil or v1 == nil then return end
		if p3 then
			SendTTIStatAtFirstFrameModule(Config, if NoP2 then nil else Callback)
			
			return
		else
			SendTTIStatModule(BuildTTIStatArgsModule(Config, v1))
		end
	end
	
	return function(StatName, p4)
		-- upvalues: Callback (copy), FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (copy), NewResult (upval), NowModule (upval), UtilModule (upval), SendTTIStatModule (upval), BuildTTIStatArgsModule (upval)
		local v2 = nil
		local Config = nil
		local IsNotSent = false
		local NoP5 = not p4 or p4.cleanupAfterSend == nil or p4.cleanupAfterSend
		local SamplingRateOverride = if p4 then p4.samplingRateOverride else nil
		Callback(function(Tbl)
			-- upvalues: StatName (copy), FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (upval), NewResult (upval), NowModule (upval), IsNotSent (ref), v2 (ref), Config (ref), SamplingRateOverride (copy), NoP5 (copy), UtilModule (upval)
			local Entry = Tbl[StatName]
			
			if Entry ~= nil then
				if Entry.startTime == nil then
					NewResult:warning(`called before trackStart for eventName={StatName}`)
					
					return Tbl
				end
				local EndTime = NowModule()
				local ScaledEndTime = (EndTime - Entry.startTime) * 1000
				IsNotSent = Entry.sent ~= true
				
				if IsNotSent then
					v2 = EndTime
					Config = {
						statName = StatName,
						startTime = Entry.startTime,
						metaData = Entry.metadata,
						milestones = Entry.milestones,
						samplingRateOverride = SamplingRateOverride
					}
				end
				local Copy = table.clone(Tbl)
				
				if IsNotSent and NoP5 then
					Copy[StatName] = nil
					
					return Copy
				else
					Copy[StatName] = {
						sent = true,
						startTime = Entry.startTime,
						endTime = EndTime,
						deltaMs = ScaledEndTime,
						metadata = table.clone(Entry.metadata),
						milestones = if Entry.milestones then UtilModule.deepCloneMilestones(Entry.milestones) else nil
					}
					
					return Copy
				end
			elseif FFlagLuaAppNavTTIMeasurementV2 and p1 and p1[StatName] then
				return Tbl
			else
				NewResult:warning(`called before trackStart for eventName={StatName}`)
				
				return Tbl
			end
		end)
		
		if Config ~= nil and v2 ~= nil then
			SendTTIStatModule(BuildTTIStatArgsModule(Config, v2))
			
			return
		end
	end, function(StatName, p5)
		-- upvalues: Callback (copy), FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (copy), NewResult (upval), NowModule (upval), UtilModule (upval), SendTTIStatAtFirstFrameModule (upval)
		local v3 = nil
		local Config = nil
		local IsNotSent = false
		local NoP7 = not p5 or p5.cleanupAfterSend == nil or p5.cleanupAfterSend
		local SamplingRateOverride = if p5 then p5.samplingRateOverride else nil
		Callback(function(Tbl)
			-- upvalues: StatName (copy), FFlagLuaAppNavTTIMeasurementV2 (upval), p1 (upval), NewResult (upval), NowModule (upval), IsNotSent (ref), v3 (ref), Config (ref), SamplingRateOverride (copy), NoP7 (copy), UtilModule (upval)
			local Entry = Tbl[StatName]
			
			if Entry ~= nil then
				if Entry.startTime == nil then
					NewResult:warning(`called before trackStart for eventName={StatName}`)
					
					return Tbl
				end
				local EndTime = NowModule()
				local ScaledEndTime = (EndTime - Entry.startTime) * 1000
				IsNotSent = Entry.sent ~= true
				
				if IsNotSent then
					v3 = EndTime
					Config = {
						statName = StatName,
						startTime = Entry.startTime,
						metaData = Entry.metadata,
						milestones = Entry.milestones,
						samplingRateOverride = SamplingRateOverride
					}
				end
				local Copy = table.clone(Tbl)
				
				if IsNotSent and NoP7 then
					Copy[StatName] = nil
					
					return Copy
				else
					Copy[StatName] = {
						sent = true,
						startTime = Entry.startTime,
						endTime = EndTime,
						deltaMs = ScaledEndTime,
						metadata = table.clone(Entry.metadata),
						milestones = if Entry.milestones then UtilModule.deepCloneMilestones(Entry.milestones) else nil
					}
					
					return Copy
				end
			elseif FFlagLuaAppNavTTIMeasurementV2 and p1 and p1[StatName] then
				return Tbl
			else
				NewResult:warning(`called before trackStart for eventName={StatName}`)
				
				return Tbl
			end
		end)
		
		if Config ~= nil and v3 ~= nil then
			SendTTIStatAtFirstFrameModule(Config, if NoP7 then nil else Callback)
			
			return
		end
	end
end