local TimeToInteractiveTracker = script:FindFirstAncestor("TimeToInteractiveTracker")
local _ = require(TimeToInteractiveTracker.Stores.types)
local NowModule = require(TimeToInteractiveTracker.Utils.now)
local SendTTIStatModule = require(TimeToInteractiveTracker.Utils.sendTTIStat)
local BuildTTIStatArgsModule = require(TimeToInteractiveTracker.Utils.buildTTIStatArgs)
local FrameSignalModule = require(TimeToInteractiveTracker.Utils.frameSignal)
local GetAppLifecycleObserverServiceModule = require(TimeToInteractiveTracker.Utils.getAppLifecycleObserverService)
local LogTTIDiscardModule = require(TimeToInteractiveTracker.Utils.logTTIDiscard)
local FFlagTTITrackerDropEventsOnAppHideModule = require(TimeToInteractiveTracker.Utils.FFlagTTITrackerDropEventsOnAppHide)
local FIntTTIFirstFrameMaxWaitMsModuleRatio = require(TimeToInteractiveTracker.Utils.FIntTTIFirstFrameMaxWaitMs) / 1000

return function(p1, Callback)
	-- upvalues: NowModule (copy), FrameSignalModule (copy), FIntTTIFirstFrameMaxWaitMsModuleRatio (copy), LogTTIDiscardModule (copy), BuildTTIStatArgsModule (copy), SendTTIStatModule (copy), FFlagTTITrackerDropEventsOnAppHideModule (copy), GetAppLifecycleObserverServiceModule (copy)
	local NowModuleResult = NowModule()
	local Connection = nil
	local OnceResult = FrameSignalModule.once(function()
		-- upvalues: NowModule (upval), Connection (ref), NowModuleResult (copy), FIntTTIFirstFrameMaxWaitMsModuleRatio (upval), LogTTIDiscardModule (upval), p1 (copy), BuildTTIStatArgsModule (upval), Callback (copy), SendTTIStatModule (upval)
		local NowModuleResult1 = NowModule()
		
		if Connection then
			Connection:Disconnect()
		end
		if FIntTTIFirstFrameMaxWaitMsModuleRatio < NowModuleResult1 - NowModuleResult then
			LogTTIDiscardModule(p1.statName, "lateFrame")
			
			return
		end
		local TTIStatArgsModule = BuildTTIStatArgsModule(p1, NowModuleResult1)
		
		if Callback then
			Callback(function(Tbl1)
				-- upvalues: p1 (upval), NowModuleResult1 (copy), TTIStatArgsModule (copy)
				local Tbl = Tbl1[p1.statName]
				
				if Tbl == nil or Tbl.startTime ~= p1.startTime or not Tbl.sent then
					return Tbl1
				else
					local Copy = table.clone(Tbl)
					Copy.endTime = NowModuleResult1
					Copy.deltaMs = TTIStatArgsModule.deltaMs
					local Copy1 = table.clone(Tbl1)
					Copy1[p1.statName] = Copy
					
					return Copy1
				end
			end)
		end
		SendTTIStatModule(TTIStatArgsModule)
	end)
	
	if FFlagTTITrackerDropEventsOnAppHideModule then
		local AppLifecycleObserverServiceModule = GetAppLifecycleObserverServiceModule()
		
		if AppLifecycleObserverServiceModule then
			Connection = AppLifecycleObserverServiceModule.OnHide:Once(function()
				-- upvalues: OnceResult (copy), LogTTIDiscardModule (upval), p1 (copy)
				OnceResult:Disconnect()
				LogTTIDiscardModule(p1.statName, "backgrounded")
			end)
		end
	end
end