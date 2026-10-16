local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local ReactModule = require(Parent.React)
local RunService = game:GetService("RunService")
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local LoadingScreenMilestonesModule = require(ProgressLoading.LoadingScreenMilestones.LoadingScreenMilestones)
local ConstantsModule = require(ProgressLoading.LoadingScreenMilestones.Constants)
local FFlagLoadingScreenMilestones = require(Parent.SharedFlags).FFlagLoadingScreenMilestones

return function(p1, Object, Current) --[[ Line: 11 | Named "useDeferredLoadingLifecycle" ]]
	-- upvalues: ReactModule (copy), ConstantsModule (copy), RunService (copy), FFlagLoadingScreenMilestones (copy), LoadingScreenMilestonesModule (copy), UserGameSettings (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseRefResult1 = ReactModule.useRef(Current)
	UseRefResult1.current = Current
	local UseRefResult2 = ReactModule.useRef(false)
	local UseResult = ReactModule.useCallback(function(p2, p3) --[[ Line: 21 ]]
		-- upvalues: UseRefResult2 (copy), UseRefResult (copy), ConstantsModule (upval), UseRefResult1 (copy)
		if UseRefResult2.current then return end
		UseRefResult2.current = true
		
		if UseRefResult.current then
			UseRefResult.current.abort(ConstantsModule.AbortReason.Cancelled)
		end
		if UseRefResult1.current then
			UseRefResult1.current(p2, p3)
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 34 ]]
		-- upvalues: p1 (copy), RunService (upval), FFlagLoadingScreenMilestones (upval), LoadingScreenMilestonesModule (upval), ConstantsModule (upval), UserGameSettings (upval), UseRefResult (copy), UseStateResult2 (copy), Object (copy), UseRefResult2 (copy)
		if not p1 then return end
		RunService:SetRobloxGuiFocused(true)
		local StartResult = nil
		local List = {}
		local Callback = nil
		
		if FFlagLoadingScreenMilestones then
			StartResult = LoadingScreenMilestonesModule.start({
				holdEnabled = false,
				host = ConstantsModule.Host.DeferredJoin,
				reducedMotion = UserGameSettings.ReducedMotion
			})
			UseRefResult.current = StartResult
			UseStateResult2(StartResult)
			
			if StartResult then
				StartResult.record(ConstantsModule.Milestone.ScreenVisible)
			end
			if StartResult and Object then
				local function onLoadingStateChanged() --[[ Line: 54 ]]
					-- upvalues: UseRefResult2 (upval), Object (upval), StartResult (ref), ConstantsModule (upval)
					if UseRefResult2.current then return end
					local PrefetchDownloadStatus = Object:GetPrefetchDownloadStatus()
					
					if PrefetchDownloadStatus == Enum.PrefetchDownloadStatus.InProgress or Object.PregameLoadingScreenOnly then return end
					if PrefetchDownloadStatus == Enum.PrefetchDownloadStatus.Completed then
						StartResult.dismissRequested(ConstantsModule.DismissSource.NormalReady)
						StartResult.record(ConstantsModule.Milestone.DismissStarted)
						StartResult.record(ConstantsModule.Milestone.ScreenHidden)
						StartResult.complete()
						
						return
					else
						StartResult.abort(ConstantsModule.AbortReason.Unmounted)
					end
				end
				
				Callback = onLoadingStateChanged
				table.insert(List, Object.PrefetchDownloadStatusChanged:Connect(onLoadingStateChanged))
				table.insert(List, Object:GetPropertyChangedSignal("PregameLoadingScreenOnly"):Connect(onLoadingStateChanged))
				onLoadingStateChanged()
			end
		end
		return function() --[[ Line: 80 ]]
			-- upvalues: List (copy), StartResult (ref), Callback (ref), ConstantsModule (upval), RunService (upval)
			for _, Connection in List do
				Connection:Disconnect()
			end
			if StartResult then
				if Callback then
					Callback()
				end
				StartResult.abort(ConstantsModule.AbortReason.Unmounted)
			end
			RunService:SetRobloxGuiFocused(false)
		end
	end, { p1, Object })
	
	return UseStateResult, UseResult
end