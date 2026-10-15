local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local reactModule = require(parent.React)
local runService = game:GetService("RunService")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local loadingScreenMilestonesModule = require(progressLoading.LoadingScreenMilestones.LoadingScreenMilestones)
local constantsModule = require(progressLoading.LoadingScreenMilestones.Constants)
local fFlagLoadingScreenMilestones = require(parent.SharedFlags).FFlagLoadingScreenMilestones

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), constantsModule (ref), runService (ref), fFlagLoadingScreenMilestones (ref), loadingScreenMilestonesModule (ref), userGameSettingsService (ref)
	local var1, var2 = reactModule.useState(nil)
	local var3 = reactModule.useRef(nil)
	local var4 = reactModule.useRef(p3)
	var4.current = p3
	local var5 = reactModule.useRef(false)
	local var6 = reactModule.useCallback(function(p4, p5)
		-- upvalues: var5 (ref), var3 (ref), constantsModule (copy), var4 (ref)
		if var5.current then return end
		var5.current = true
		
		if var3.current then
			var3.current.abort(constantsModule.AbortReason.Cancelled)
		end
		if var4.current then
			var4.current(p4, p5)
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), runService (copy), fFlagLoadingScreenMilestones (copy), loadingScreenMilestonesModule (copy), constantsModule (copy), userGameSettingsService (copy), var3 (ref), var2 (ref), p2 (ref), var5 (ref)
		if not p1 then return end
		runService:SetRobloxGuiFocused(true)
		local var7 = nil
		local t = {}
		local var8 = nil
		
		if fFlagLoadingScreenMilestones then
			var7 = loadingScreenMilestonesModule.start({
				holdEnabled = false,
				host = constantsModule.Host.DeferredJoin,
				reducedMotion = userGameSettingsService.ReducedMotion
			})
			var3.current = var7
			var2(var7)
			
			if var7 then
				var7.record(constantsModule.Milestone.ScreenVisible)
			end
			if var7 and p2 then
				local function onLoadingStateChanged()
					-- upvalues: var5 (copy), p2 (copy), var7 (write), constantsModule (copy)
					if var5.current then return end
					local prefetchDownloadStatus = p2:GetPrefetchDownloadStatus()
					
					if prefetchDownloadStatus == Enum.PrefetchDownloadStatus.InProgress or p2.PregameLoadingScreenOnly then return end
					if prefetchDownloadStatus == Enum.PrefetchDownloadStatus.Completed then
						var7.dismissRequested(constantsModule.DismissSource.NormalReady)
						var7.record(constantsModule.Milestone.DismissStarted)
						var7.record(constantsModule.Milestone.ScreenHidden)
						var7.complete()
						
						return
					end
					var7.abort(constantsModule.AbortReason.Unmounted)
				end
				
				var8 = onLoadingStateChanged
				table.insert(t, p2.PrefetchDownloadStatusChanged:Connect(onLoadingStateChanged))
				table.insert(t, p2:GetPropertyChangedSignal("PregameLoadingScreenOnly"):Connect(onLoadingStateChanged))
				onLoadingStateChanged()
			end
		end
		return function()
			-- upvalues: t (ref), var7 (write), var8 (write), constantsModule (copy), runService (copy)
			for i, v in t do
				v:Disconnect()
			end
			if var7 then
				if var8 then
					var8()
				end
				var7.abort(constantsModule.AbortReason.Unmounted)
			end
			runService:SetRobloxGuiFocused(false)
		end
	end, { p1, p2 })
	
	return var1, var6
end