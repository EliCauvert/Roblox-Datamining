local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local constantsModule = require(script.Parent.Parent.Constants)
local shouldHoldForExitModule = require(script.Parent.Parent.shouldHoldForExit)
local fFlagLoadingScreenMilestones = require(parent.SharedFlags).FFlagLoadingScreenMilestones
local players = require(parent.MockableProxyServices).Players
local replicatedFirst = require(parent.MockableProxyServices).ReplicatedFirst
local game = require(parent.MockableProxyServices).game
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local _ = require(progressLoading.LoadingScreenMilestones.Types)
local ANIMATION = constantsModule.ANIMATION
local var1 = motionModule.createState({ reveal = 1 }, {
	default = motionModule.transition({ duration = ANIMATION.chromeFadeIn })
})
local var2 = motionModule.createState({ reveal = 0 }, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local constantsModule_1 = require(progressLoading.LoadingScreenMilestones.Constants)
local abortReason = constantsModule_1.AbortReason
local milestone = constantsModule_1.Milestone
local dismissSource = constantsModule_1.DismissSource

return function(p1, p2, p3)
	-- upvalues: fFlagLoadingScreenMilestones (ref), reactModule (ref), replicatedFirst (ref), motionModule (ref), var1 (ref), milestone (ref), var2 (ref), userGameSettingsService (ref), ANIMATION (ref), shouldHoldForExitModule (ref), players (ref), dismissSource (ref), game (ref), abortReason (ref)
	local var3 = if fFlagLoadingScreenMilestones then reactModule.useRef(p2) else nil
	local var4, var5 = reactModule.useState(function()
		-- upvalues: p1 (ref), replicatedFirst (copy)
		return if p1 then not replicatedFirst:IsDefaultLoadingGuiRemoved() else true
	end)
	local var6, var7 = reactModule.useState(false)
	local var8, var9 = motionModule.useMotion(var1)
	local var10 = reactModule.useRef(var8.reveal)
	local var11 = reactModule.useRef(var9)
	var11.current = var9
	local var12 = reactModule.useRef(p3)
	var12.current = p3
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function()
		-- upvalues: var13 (ref)
		if var13.current then
			var13.current()
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var3 (ref), fFlagLoadingScreenMilestones (copy), milestone (copy), var7 (ref), var11 (ref), var2 (copy), replicatedFirst (copy), var5 (ref), var12 (ref), userGameSettingsService (copy), ANIMATION (copy), var13 (ref), shouldHoldForExitModule (copy), players (copy), dismissSource (copy), game (copy), abortReason (copy)
		if not p1 then return end
		local var15 = if var3 then var3.current else nil
		
		if fFlagLoadingScreenMilestones and var15 then
			var15.record(milestone.ScreenVisible)
		end
		local t = {}
		local var16 = false
		local var17 = false
		local var18 = nil
		local thread = nil
		local var19 = nil
		local var20 = false
		local var21 = false
		
		local function doDismiss()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var15 (ref), milestone (copy), var16 (write), var7 (copy), var18 (write), var17 (write), var11 (copy), var2 (copy), replicatedFirst (copy), var5 (copy), var12 (copy), userGameSettingsService (copy), ANIMATION (copy)
			if fFlagLoadingScreenMilestones and var15 then
				var15.record(milestone.DismissStarted)
			end
			var16 = true
			var7(true)
			
			local function fadeChrome()
				-- upvalues: var18 (copy), var17 (copy), var11 (copy), var2 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), milestone (copy), replicatedFirst (copy), var5 (copy), var12 (copy)
				var18 = nil
				
				if var17 then
					return
				end
				var11.current(var2, {
					onAnimationComplete = function(p4)
						-- upvalues: var17 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), milestone (copy), replicatedFirst (copy), var5 (copy), var12 (copy)
						if p4 ~= true or var17 then return end
						if fFlagLoadingScreenMilestones and var15 then
							var15.record(milestone.ScreenHidden)
						end
						replicatedFirst:SetDefaultLoadingGuiRemoved()
						var5(false)
						
						if fFlagLoadingScreenMilestones and var15 then
							var15.complete()
						end
						if var12.current then
							var12.current()
						end
					end
				})
			end
			
			if userGameSettingsService.ReducedMotion then
				fadeChrome()
				
				return
			end
			var18 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		function var19.current()
			-- upvalues: var17 (write), var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), var20 (write), var21 (write), doDismiss (ref), var19 (write), ANIMATION (copy), fFlagLoadingScreenMilestones (copy), var15 (ref), milestone (copy)
			if var17 or var16 then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var19 = task.delay(ANIMATION.enterExitHold, function()
					-- upvalues: var19 (copy), var17 (copy), var16 (copy), var20 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), milestone (copy), var21 (copy), doDismiss (copy)
					var19 = nil
					
					if var17 or var16 then return end
					var20 = true
					
					if fFlagLoadingScreenMilestones and var15 then
						var15.record(milestone.DismissGateReleased)
					end
					if var21 then
						doDismiss()
					end
				end)
				
				return
			end
			var20 = true
			
			if var21 then
				doDismiss()
			end
		end
		
		local function _()
			-- upvalues: var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var20 (write), var21 (write)
			if var16 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var20 then
				doDismiss()
				
				return
			end
			var21 = true
		end
		
		local _ = function()
			-- upvalues: thread (write), players (copy), var17 (write), fFlagLoadingScreenMilestones (copy), var15 (ref), dismissSource (copy), var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var20 (write), var21 (write)
			if thread then
				return
			end
			thread = task.spawn(function()
				-- upvalues: players (copy), thread (copy), var17 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), dismissSource (copy), var16 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var20 (copy), var21 (copy)
				if players.CharacterAutoLoads then
					local localPlayer = players.LocalPlayer
					
					if not localPlayer then
						players:GetPropertyChangedSignal("LocalPlayer"):Wait()
						localPlayer = players.LocalPlayer
					end
					if not localPlayer.Character then
						localPlayer.CharacterAdded:Wait()
					end
				end
				thread = nil
				
				if var17 then return end
				if fFlagLoadingScreenMilestones and var15 then
					var15.dismissRequested(dismissSource.NormalReady)
				end
				if var16 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var20 then
					doDismiss()
					
					return
				end
				var21 = true
			end)
		end
		
		table.insert(t, replicatedFirst.FinishedReplicating:Connect(function()
			-- upvalues: game (copy), thread (write), players (copy), var17 (write), fFlagLoadingScreenMilestones (copy), var15 (ref), dismissSource (copy), var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var20 (write), var21 (write), t (ref)
			if not game:IsLoaded() then
				local var22 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var22 (write), thread (copy), players (copy), var17 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), dismissSource (copy), var16 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var20 (copy), var21 (copy)
					var22:Disconnect()
					
					if thread then
						return
					end
					thread = task.spawn(function()
						-- upvalues: players (copy), thread (copy), var17 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), dismissSource (copy), var16 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var20 (copy), var21 (copy)
						if players.CharacterAutoLoads then
							local localPlayer = players.LocalPlayer
							
							if not localPlayer then
								players:GetPropertyChangedSignal("LocalPlayer"):Wait()
								localPlayer = players.LocalPlayer
							end
							if not localPlayer.Character then
								localPlayer.CharacterAdded:Wait()
							end
						end
						thread = nil
						
						if var17 then return end
						if fFlagLoadingScreenMilestones and var15 then
							var15.dismissRequested(dismissSource.NormalReady)
						end
						if var16 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var20 then
							doDismiss()
							
							return
						end
						var21 = true
					end)
				end))
				
				return
			elseif thread then
				return
			end
			thread = task.spawn(function()
				-- upvalues: players (copy), thread (copy), var17 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), dismissSource (copy), var16 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var20 (copy), var21 (copy)
				if players.CharacterAutoLoads then
					local localPlayer = players.LocalPlayer
					
					if not localPlayer then
						players:GetPropertyChangedSignal("LocalPlayer"):Wait()
						localPlayer = players.LocalPlayer
					end
					if not localPlayer.Character then
						localPlayer.CharacterAdded:Wait()
					end
				end
				thread = nil
				
				if var17 then return end
				if fFlagLoadingScreenMilestones and var15 then
					var15.dismissRequested(dismissSource.NormalReady)
				end
				if var16 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var20 then
					doDismiss()
					
					return
				end
				var21 = true
			end)
		end))
		table.insert(t, replicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var15 (ref), dismissSource (copy), var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var20 (write), var21 (write)
			if fFlagLoadingScreenMilestones and var15 then
				var15.dismissRequested(dismissSource.DeveloperOverride)
			end
			if var16 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var20 then
				doDismiss()
				
				return
			end
			var21 = true
		end))
		
		if replicatedFirst:IsFinishedReplicating() then
			if game:IsLoaded() then
				thread = task.spawn(function()
					-- upvalues: players (copy), thread (write), var17 (write), fFlagLoadingScreenMilestones (copy), var15 (ref), dismissSource (copy), var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var20 (write), var21 (write)
					if players.CharacterAutoLoads then
						local localPlayer = players.LocalPlayer
						
						if not localPlayer then
							players:GetPropertyChangedSignal("LocalPlayer"):Wait()
							localPlayer = players.LocalPlayer
						end
						if not localPlayer.Character then
							localPlayer.CharacterAdded:Wait()
						end
					end
					thread = nil
					
					if var17 then return end
					if fFlagLoadingScreenMilestones and var15 then
						var15.dismissRequested(dismissSource.NormalReady)
					end
					if var16 then return end
					if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
						doDismiss()
						
						return
					elseif var20 then
						doDismiss()
						
						return
					end
					var21 = true
				end)
			else
				local var22 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var22 (write), thread (write), players (copy), var17 (write), fFlagLoadingScreenMilestones (copy), var15 (ref), dismissSource (copy), var16 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var20 (write), var21 (write)
					var22:Disconnect()
					
					if thread then
						return
					end
					thread = task.spawn(function()
						-- upvalues: players (copy), thread (copy), var17 (copy), fFlagLoadingScreenMilestones (copy), var15 (copy), dismissSource (copy), var16 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var20 (copy), var21 (copy)
						if players.CharacterAutoLoads then
							local localPlayer = players.LocalPlayer
							
							if not localPlayer then
								players:GetPropertyChangedSignal("LocalPlayer"):Wait()
								localPlayer = players.LocalPlayer
							end
							if not localPlayer.Character then
								localPlayer.CharacterAdded:Wait()
							end
						end
						thread = nil
						
						if var17 then return end
						if fFlagLoadingScreenMilestones and var15 then
							var15.dismissRequested(dismissSource.NormalReady)
						end
						if var16 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var20 then
							doDismiss()
							
							return
						end
						var21 = true
					end)
				end))
			end
		end
		if replicatedFirst:IsDefaultLoadingGuiRemoved() then
			if fFlagLoadingScreenMilestones and var15 then
				var15.dismissRequested(dismissSource.DeveloperOverride)
			end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var21 = true
			else
				doDismiss()
			end
		end
		return function()
			-- upvalues: var17 (write), fFlagLoadingScreenMilestones (copy), var15 (ref), abortReason (copy), var13 (copy), var19 (write), var18 (write), thread (write), t (ref)
			var17 = true
			
			if fFlagLoadingScreenMilestones and var15 then
				var15.abort(abortReason.Unmounted)
			end
			var13.current = nil
			
			if var19 then
				task.cancel(var19)
			end
			if var18 then
				task.cancel(var18)
			end
			if thread and coroutine.status(thread) ~= "dead" then
				task.cancel(thread)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, { p1 })
	
	return {
		isVisible = var4,
		isDismissing = var6,
		chromeReveal = var10.current,
		onEnterComplete = var14,
		milestones = if var3 then var3.current else nil
	}
end