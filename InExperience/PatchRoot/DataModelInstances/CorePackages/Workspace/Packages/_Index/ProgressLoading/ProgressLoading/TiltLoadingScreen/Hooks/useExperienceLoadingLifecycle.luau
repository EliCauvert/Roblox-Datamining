local ProgressLoading = script:FindFirstAncestor("ProgressLoading")
local Parent = ProgressLoading.Parent
local ReactModule = require(Parent.React)
local MotionModule = require(Parent.Motion)
local ShouldHoldForExitModule = require(script.Parent.Parent.shouldHoldForExit)
local FFlagLoadingScreenMilestones = require(Parent.SharedFlags).FFlagLoadingScreenMilestones
local Players = require(Parent.MockableProxyServices).Players
local ReplicatedFirst = require(Parent.MockableProxyServices).ReplicatedFirst
local Game = require(Parent.MockableProxyServices).game
local UserGameSettings = UserSettings():GetService("UserGameSettings")
local _ = require(ProgressLoading.LoadingScreenMilestones.Types)
local ANIMATION = require(script.Parent.Parent.Constants).ANIMATION
local State = MotionModule.createState({ reveal = 1 }, {
	default = MotionModule.transition({ duration = ANIMATION.chromeFadeIn })
})
local State1 = MotionModule.createState({ reveal = 0 }, {
	default = MotionModule.transition({ duration = ANIMATION.closeDur })
})
local ConstantsModule = require(ProgressLoading.LoadingScreenMilestones.Constants)
local AbortReason = ConstantsModule.AbortReason
local Milestone = ConstantsModule.Milestone
local DismissSource = ConstantsModule.DismissSource

return function(p1, p2, Current) --[[ Line: 41 | Named "useExperienceLoadingLifecycle" ]]
	-- upvalues: FFlagLoadingScreenMilestones (copy), ReactModule (copy), ReplicatedFirst (copy), MotionModule (copy), State (copy), Milestone (copy), State1 (copy), UserGameSettings (copy), ANIMATION (copy), ShouldHoldForExitModule (copy), Players (copy), DismissSource (copy), Game (copy), AbortReason (copy)
	local UseRefResult = if FFlagLoadingScreenMilestones then ReactModule.useRef(p2) else nil
	local UseStateResult, UseStateResult2 = ReactModule.useState(function(): boolean --[[ Line: 47 ]]
		-- upvalues: p1 (copy), ReplicatedFirst (upval)
		return not p1 or not ReplicatedFirst:IsDefaultLoadingGuiRemoved()
	end)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(State)
	local UseRefResult1 = ReactModule.useRef(UseMotionResult.reveal)
	local UseRefResult2 = ReactModule.useRef(UseMotionResult2)
	UseRefResult2.current = UseMotionResult2
	local UseRefResult3 = ReactModule.useRef(Current)
	UseRefResult3.current = Current
	local UseRefResult4 = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function() --[[ Line: 61 ]]
		-- upvalues: UseRefResult4 (copy)
		if UseRefResult4.current then
			UseRefResult4.current()
		end
	end, {})
	ReactModule.useEffect(function() --[[ Line: 67 ]]
		-- upvalues: p1 (copy), UseRefResult (copy), FFlagLoadingScreenMilestones (upval), Milestone (upval), UseStateResult2_1 (copy), UseRefResult2 (copy), State1 (upval), ReplicatedFirst (upval), UseStateResult2 (copy), UseRefResult3 (copy), UserGameSettings (upval), ANIMATION (upval), UseRefResult4 (copy), ShouldHoldForExitModule (upval), Players (upval), DismissSource (upval), Game (upval), AbortReason (upval)
		if not p1 then return end
		local Current = if UseRefResult then UseRefResult.current else nil
		
		if FFlagLoadingScreenMilestones and Current then
			Current.record(Milestone.ScreenVisible)
		end
		local List = {}
		local Flag = false
		local Flag1 = false
		local DelayedThread = nil
		local SpawnedThread = nil
		local DelayedThread1 = nil
		local Flag2 = false
		local Flag3 = false
		
		local function doDismiss() --[[ Line: 84 ]]
			-- upvalues: FFlagLoadingScreenMilestones (upval), Current (copy), Milestone (upval), Flag (ref), UseStateResult2_1 (upval), DelayedThread (ref), Flag1 (ref), UseRefResult2 (upval), State1 (upval), ReplicatedFirst (upval), UseStateResult2 (upval), UseRefResult3 (upval), UserGameSettings (upval), ANIMATION (upval)
			if FFlagLoadingScreenMilestones and Current then
				Current.record(Milestone.DismissStarted)
			end
			Flag = true
			UseStateResult2_1(true)
			
			local function fadeChrome() --[[ Line: 91 ]]
				-- upvalues: DelayedThread (upval), Flag1 (upval), UseRefResult2 (upval), State1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), Milestone (upval), ReplicatedFirst (upval), UseStateResult2 (upval), UseRefResult3 (upval)
				DelayedThread = nil
				
				if not Flag1 then
					UseRefResult2.current(State1, {
						onAnimationComplete = function(Enabled) --[[ Line: 97 ]]
							-- upvalues: Flag1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), Milestone (upval), ReplicatedFirst (upval), UseStateResult2 (upval), UseRefResult3 (upval)
							if Enabled ~= true or Flag1 then return end
							if FFlagLoadingScreenMilestones and Current then
								Current.record(Milestone.ScreenHidden)
							end
							ReplicatedFirst:SetDefaultLoadingGuiRemoved()
							UseStateResult2(false)
							
							if FFlagLoadingScreenMilestones and Current then
								Current.complete()
							end
							if UseRefResult3.current then
								UseRefResult3.current()
							end
						end
					})
					
					return
				end
			end
			
			if UserGameSettings.ReducedMotion then
				fadeChrome()
				
				return
			else
				DelayedThread = task.delay(ANIMATION.closeDur, fadeChrome)
			end
		end
		
		function UseRefResult4.current() --[[ Line: 123 ]]
			-- upvalues: Flag1 (ref), Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), Flag2 (ref), Flag3 (ref), doDismiss (copy), DelayedThread1 (ref), ANIMATION (upval), FFlagLoadingScreenMilestones (upval), Current (copy), Milestone (upval)
			if Flag1 or Flag then return end
			if ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
				DelayedThread1 = task.delay(ANIMATION.enterExitHold, function() --[[ Line: 134 ]]
					-- upvalues: DelayedThread1 (upval), Flag1 (upval), Flag (upval), Flag2 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), Milestone (upval), Flag3 (upval), doDismiss (upval)
					DelayedThread1 = nil
					
					if Flag1 or Flag then return end
					Flag2 = true
					
					if FFlagLoadingScreenMilestones and Current then
						Current.record(Milestone.DismissGateReleased)
					end
					if Flag3 then
						doDismiss()
					end
				end)
				
				return
			end
			Flag2 = true
			
			if Flag3 then
				doDismiss()
			end
		end
		
		local function _() --[[ Line: 149 | Named "dismiss" ]]
			-- upvalues: Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (copy), Flag2 (ref), Flag3 (ref)
			if Flag then return end
			if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
				doDismiss()
				
				return
			end
			if Flag2 then
				doDismiss()
				
				return
			else
				Flag3 = true
			end
		end
		
		local _ = function() --[[ Line: 166 | Named "waitForCharacterAndDismiss" ]]
			-- upvalues: SpawnedThread (ref), Players (upval), Flag1 (ref), FFlagLoadingScreenMilestones (upval), Current (copy), DismissSource (upval), Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (copy), Flag2 (ref), Flag3 (ref)
			if not SpawnedThread then
				SpawnedThread = task.spawn(function() --[[ Line: 170 ]]
					-- upvalues: Players (upval), SpawnedThread (upval), Flag1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), DismissSource (upval), Flag (upval), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (upval), Flag2 (upval), Flag3 (upval)
					if Players.CharacterAutoLoads then
						local LocalPlayer = Players.LocalPlayer
						
						if not LocalPlayer then
							Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
							LocalPlayer = Players.LocalPlayer
						end
						if not LocalPlayer.Character then
							LocalPlayer.CharacterAdded:Wait()
						end
					end
					SpawnedThread = nil
					
					if Flag1 then return end
					if FFlagLoadingScreenMilestones and Current then
						Current.dismissRequested(DismissSource.NormalReady)
					end
					if Flag then return end
					if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
						doDismiss()
						
						return
					end
					if Flag2 then
						doDismiss()
						
						return
					else
						Flag3 = true
					end
				end)
				
				return
			end
		end
		
		table.insert(List, ReplicatedFirst.FinishedReplicating:Connect(function() --[[ Line: 192 | Named "handleFinishedReplicating" ]]
			-- upvalues: Game (upval), SpawnedThread (ref), Players (upval), Flag1 (ref), FFlagLoadingScreenMilestones (upval), Current (copy), DismissSource (upval), Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (copy), Flag2 (ref), Flag3 (ref), List (copy)
			if not Game:IsLoaded() then
				local Connection = nil
				Connection = Game.Loaded:Connect(function() --[[ Line: 197 ]]
					-- upvalues: Connection (ref), SpawnedThread (upval), Players (upval), Flag1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), DismissSource (upval), Flag (upval), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (upval), Flag2 (upval), Flag3 (upval)
					Connection:Disconnect()
					
					if not SpawnedThread then
						SpawnedThread = task.spawn(function() --[[ Line: 170 ]]
							-- upvalues: Players (upval), SpawnedThread (upval), Flag1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), DismissSource (upval), Flag (upval), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (upval), Flag2 (upval), Flag3 (upval)
							if Players.CharacterAutoLoads then
								local LocalPlayer = Players.LocalPlayer
								
								if not LocalPlayer then
									Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
									LocalPlayer = Players.LocalPlayer
								end
								if not LocalPlayer.Character then
									LocalPlayer.CharacterAdded:Wait()
								end
							end
							SpawnedThread = nil
							
							if Flag1 then return end
							if FFlagLoadingScreenMilestones and Current then
								Current.dismissRequested(DismissSource.NormalReady)
							end
							if Flag then return end
							if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
								doDismiss()
								
								return
							end
							if Flag2 then
								doDismiss()
								
								return
							else
								Flag3 = true
							end
						end)
						
						return
					end
				end)
				table.insert(List, Connection)
				
				return
			end
			if not SpawnedThread then
				SpawnedThread = task.spawn(function() --[[ Line: 170 ]]
					-- upvalues: Players (upval), SpawnedThread (upval), Flag1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), DismissSource (upval), Flag (upval), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (upval), Flag2 (upval), Flag3 (upval)
					if Players.CharacterAutoLoads then
						local LocalPlayer = Players.LocalPlayer
						
						if not LocalPlayer then
							Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
							LocalPlayer = Players.LocalPlayer
						end
						if not LocalPlayer.Character then
							LocalPlayer.CharacterAdded:Wait()
						end
					end
					SpawnedThread = nil
					
					if Flag1 then return end
					if FFlagLoadingScreenMilestones and Current then
						Current.dismissRequested(DismissSource.NormalReady)
					end
					if Flag then return end
					if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
						doDismiss()
						
						return
					end
					if Flag2 then
						doDismiss()
						
						return
					else
						Flag3 = true
					end
				end)
				
				return
			end
		end))
		table.insert(List, ReplicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ Line: 208 ]]
			-- upvalues: FFlagLoadingScreenMilestones (upval), Current (copy), DismissSource (upval), Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (copy), Flag2 (ref), Flag3 (ref)
			if FFlagLoadingScreenMilestones and Current then
				Current.dismissRequested(DismissSource.DeveloperOverride)
			end
			if Flag then return end
			if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
				doDismiss()
				
				return
			end
			if Flag2 then
				doDismiss()
				
				return
			else
				Flag3 = true
			end
		end))
		
		if ReplicatedFirst:IsFinishedReplicating() then
			if Game:IsLoaded() then
				if not SpawnedThread then
					SpawnedThread = task.spawn(function() --[[ Line: 170 ]]
						-- upvalues: Players (upval), SpawnedThread (ref), Flag1 (ref), FFlagLoadingScreenMilestones (upval), Current (copy), DismissSource (upval), Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (copy), Flag2 (ref), Flag3 (ref)
						if Players.CharacterAutoLoads then
							local LocalPlayer = Players.LocalPlayer
							
							if not LocalPlayer then
								Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
								LocalPlayer = Players.LocalPlayer
							end
							if not LocalPlayer.Character then
								LocalPlayer.CharacterAdded:Wait()
							end
						end
						SpawnedThread = nil
						
						if Flag1 then return end
						if FFlagLoadingScreenMilestones and Current then
							Current.dismissRequested(DismissSource.NormalReady)
						end
						if Flag then return end
						if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
							doDismiss()
							
							return
						end
						if Flag2 then
							doDismiss()
							
							return
						else
							Flag3 = true
						end
					end)
				end
			else
				local LoadedConnection = nil
				LoadedConnection = Game.Loaded:Connect(function() --[[ Line: 197 ]]
					-- upvalues: LoadedConnection (ref), SpawnedThread (ref), Players (upval), Flag1 (ref), FFlagLoadingScreenMilestones (upval), Current (copy), DismissSource (upval), Flag (ref), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (copy), Flag2 (ref), Flag3 (ref)
					LoadedConnection:Disconnect()
					
					if not SpawnedThread then
						SpawnedThread = task.spawn(function() --[[ Line: 170 ]]
							-- upvalues: Players (upval), SpawnedThread (upval), Flag1 (upval), FFlagLoadingScreenMilestones (upval), Current (upval), DismissSource (upval), Flag (upval), ShouldHoldForExitModule (upval), UserGameSettings (upval), doDismiss (upval), Flag2 (upval), Flag3 (upval)
							if Players.CharacterAutoLoads then
								local LocalPlayer = Players.LocalPlayer
								
								if not LocalPlayer then
									Players:GetPropertyChangedSignal("LocalPlayer"):Wait()
									LocalPlayer = Players.LocalPlayer
								end
								if not LocalPlayer.Character then
									LocalPlayer.CharacterAdded:Wait()
								end
							end
							SpawnedThread = nil
							
							if Flag1 then return end
							if FFlagLoadingScreenMilestones and Current then
								Current.dismissRequested(DismissSource.NormalReady)
							end
							if Flag then return end
							if not ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
								doDismiss()
								
								return
							end
							if Flag2 then
								doDismiss()
								
								return
							else
								Flag3 = true
							end
						end)
						
						return
					end
				end)
				table.insert(List, LoadedConnection)
			end
		end
		if ReplicatedFirst:IsDefaultLoadingGuiRemoved() then
			if FFlagLoadingScreenMilestones and Current then
				Current.dismissRequested(DismissSource.DeveloperOverride)
			end
			if not Flag then
				if ShouldHoldForExitModule(UserGameSettings.ReducedMotion) then
					if Flag2 then
						doDismiss()
					else
						Flag3 = true
					end
				else
					doDismiss()
				end
			end
		end
		return function() --[[ Line: 227 ]]
			-- upvalues: Flag1 (ref), FFlagLoadingScreenMilestones (upval), Current (copy), AbortReason (upval), UseRefResult4 (upval), DelayedThread1 (ref), DelayedThread (ref), SpawnedThread (ref), List (copy)
			Flag1 = true
			
			if FFlagLoadingScreenMilestones and Current then
				Current.abort(AbortReason.Unmounted)
			end
			UseRefResult4.current = nil
			
			if DelayedThread1 then
				task.cancel(DelayedThread1)
			end
			if DelayedThread then
				task.cancel(DelayedThread)
			end
			if SpawnedThread and coroutine.status(SpawnedThread) ~= "dead" then
				task.cancel(SpawnedThread)
			end
			for _, Connection in List do
				Connection:Disconnect()
			end
		end
	end, { p1 })
	
	return {
		isVisible = UseStateResult,
		isDismissing = UseStateResult1,
		chromeReveal = UseRefResult1.current,
		onEnterComplete = UseResult,
		milestones = if UseRefResult then UseRefResult.current else nil
	}
end