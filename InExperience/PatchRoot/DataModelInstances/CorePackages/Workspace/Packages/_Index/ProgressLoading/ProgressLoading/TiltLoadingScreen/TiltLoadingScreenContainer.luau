local progressLoading = script:FindFirstAncestor("ProgressLoading")
local parent = progressLoading.Parent
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local responsiveModule = require(parent.Responsive)
local useDeviceInsets = responsiveModule.useDeviceInsets
local usePreferredInput = responsiveModule.usePreferredInput
local getBuilderIconForKeycode = foundationModule.Utility.getBuilderIconForKeycode
local tiltLoadingScreenViewModule = require(script.Parent.TiltLoadingScreenView)
local useTiltLoadingScreenViewModelModule = require(script.Parent.Hooks.useTiltLoadingScreenViewModel)
local useLoadingScreenAnimationModule = require(script.Parent.Hooks.useLoadingScreenAnimation)
local useScreenSizeModule = require(script.Parent.Hooks.useScreenSize)
local useViewportSettledModule = require(script.Parent.Hooks.useViewportSettled)
local constantsModule = require(script.Parent.Constants)
local shouldHoldForExitModule = require(script.Parent.shouldHoldForExit)
local fFlagLoadingScreenMilestones = require(parent.SharedFlags).FFlagLoadingScreenMilestones
local fFlagEnableTiltLoadingScreen = require(parent.SharedFlags).FFlagEnableTiltLoadingScreen
local fFlagIncreaseLoadingScreenOrder = require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local fFlagTiltLoadingScreenConsoleHints = require(parent.SharedFlags).FFlagTiltLoadingScreenConsoleHints
local fFlagTiltLoadingScreenEnterExitHold = require(parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local contextActionService = game:GetService("ContextActionService")
local localizationService = game:GetService("LocalizationService")
local players = require(parent.MockableProxyServices).Players
local replicatedFirst = require(parent.MockableProxyServices).ReplicatedFirst
local game = require(parent.MockableProxyServices).game
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
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
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), fFlagLoadingScreenMilestones (ref), reactModule (ref), replicatedFirst (ref), userGameSettingsService (ref), motionModule (ref), var1 (ref), fFlagTiltLoadingScreenConsoleHints (ref), usePreferredInput (ref), responsiveModule (ref), getBuilderIconForKeycode (ref), useTiltLoadingScreenViewModelModule (ref), useScreenSizeModule (ref), useDeviceInsets (ref), useViewportSettledModule (ref), useLoadingScreenAnimationModule (ref), fFlagTiltLoadingScreenEnterExitHold (ref), inExperienceLocalesModule (ref), localizationService (ref), milestone (ref), var2 (ref), ANIMATION (ref), shouldHoldForExitModule (ref), players (ref), dismissSource (ref), game (ref), abortReason (ref), isPioneerLaunch (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var3 = if fFlagLoadingScreenMilestones then reactModule.useRef(p1.milestones) else nil
	local var4, var5 = reactModule.useState(function()
		-- upvalues: replicatedFirst (copy)
		return not replicatedFirst:IsDefaultLoadingGuiRemoved()
	end)
	local var6, var7 = reactModule.useState(false)
	local reducedMotion = userGameSettingsService.ReducedMotion
	local var8, var9 = motionModule.useMotion(var1)
	local var10 = reactModule.useRef(var9)
	var10.current = var9
	local var11 = reactModule.useRef(p1.onDismissComplete)
	var11.current = p1.onDismissComplete
	local var12 = reactModule.useRef(p1.onCancel)
	var12.current = p1.onCancel
	local var13 = fFlagTiltLoadingScreenConsoleHints and (if fFlagTiltLoadingScreenConsoleHints then usePreferredInput() else nil) == responsiveModule.Input.Directional
	local var14 = if var13 then getBuilderIconForKeycode(Enum.KeyCode.ButtonB) else nil
	local var15 = useTiltLoadingScreenViewModelModule(p1.placeId)
	local var16 = useDeviceInsets()
	local var17 = useViewportSettledModule(useScreenSizeModule())
	local var18 = reactModule.useRef(nil)
	local var19 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var15.gameData ~= nil and var17,
		isDismissing = var6,
		onEnterComplete = if fFlagTiltLoadingScreenEnterExitHold then function()
			-- upvalues: var18 (ref)
			if var18.current then
				var18.current()
			end
		end else nil
	})
	local var20 = reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fFlagLoadingScreenMilestones (copy), milestone (copy), var7 (ref), var10 (ref), var2 (copy), replicatedFirst (copy), var5 (ref), var11 (ref), userGameSettingsService (copy), ANIMATION (copy), var18 (ref), shouldHoldForExitModule (copy), players (copy), dismissSource (copy), game (copy), abortReason (copy)
		local var21 = if var3 then var3.current else nil
		
		if fFlagLoadingScreenMilestones and var21 then
			var21.record(milestone.ScreenVisible)
		end
		local t = {}
		local var22 = false
		local var23 = false
		local var24 = nil
		local thread = nil
		local var25 = nil
		local var26 = false
		local var27 = false
		
		local function doDismiss()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var21 (ref), milestone (copy), var22 (write), var7 (copy), var24 (write), var23 (write), var10 (copy), var2 (copy), replicatedFirst (copy), var5 (copy), var11 (copy), userGameSettingsService (copy), ANIMATION (copy)
			if fFlagLoadingScreenMilestones and var21 then
				var21.record(milestone.DismissStarted)
			end
			var22 = true
			var7(true)
			
			local function fadeChrome()
				-- upvalues: var24 (copy), var23 (copy), var10 (copy), var2 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), milestone (copy), replicatedFirst (copy), var5 (copy), var11 (copy)
				var24 = nil
				
				if var23 then
					return
				end
				var10.current(var2, {
					onAnimationComplete = function(p2)
						-- upvalues: var23 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), milestone (copy), replicatedFirst (copy), var5 (copy), var11 (copy)
						if p2 ~= true or var23 then return end
						if fFlagLoadingScreenMilestones and var21 then
							var21.record(milestone.ScreenHidden)
						end
						replicatedFirst:SetDefaultLoadingGuiRemoved()
						var5(false)
						
						if fFlagLoadingScreenMilestones and var21 then
							var21.complete()
						end
						if var11.current then
							var11.current()
						end
					end
				})
			end
			
			if userGameSettingsService.ReducedMotion then
				fadeChrome()
				
				return
			end
			var24 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		function var35.current()
			-- upvalues: var23 (write), var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), var26 (write), var27 (write), doDismiss (ref), var25 (write), ANIMATION (copy), fFlagLoadingScreenMilestones (copy), var21 (ref), milestone (copy)
			if var23 or var22 then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var25 = task.delay(ANIMATION.enterExitHold, function()
					-- upvalues: var25 (copy), var23 (copy), var22 (copy), var26 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), milestone (copy), var27 (copy), doDismiss (copy)
					var25 = nil
					
					if var23 or var22 then return end
					var26 = true
					
					if fFlagLoadingScreenMilestones and var21 then
						var21.record(milestone.DismissGateReleased)
					end
					if var27 then
						doDismiss()
					end
				end)
				
				return
			end
			var26 = true
			
			if var27 then
				doDismiss()
			end
		end
		
		local function _()
			-- upvalues: var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
			if var22 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var26 then
				doDismiss()
				
				return
			end
			var27 = true
		end
		
		local _ = function()
			-- upvalues: thread (write), players (copy), var23 (write), fFlagLoadingScreenMilestones (copy), var21 (ref), dismissSource (copy), var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
			if thread then
				return
			end
			thread = task.spawn(function()
				-- upvalues: players (copy), thread (copy), var23 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), dismissSource (copy), var22 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
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
				
				if var23 then return end
				if fFlagLoadingScreenMilestones and var21 then
					var21.dismissRequested(dismissSource.NormalReady)
				end
				if var22 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var26 then
					doDismiss()
					
					return
				end
				var27 = true
			end)
		end
		
		table.insert(t, replicatedFirst.FinishedReplicating:Connect(function()
			-- upvalues: game (copy), thread (write), players (copy), var23 (write), fFlagLoadingScreenMilestones (copy), var21 (ref), dismissSource (copy), var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write), t (ref)
			if not game:IsLoaded() then
				local var28 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var28 (write), thread (copy), players (copy), var23 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), dismissSource (copy), var22 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
					var28:Disconnect()
					
					if thread then
						return
					end
					thread = task.spawn(function()
						-- upvalues: players (copy), thread (copy), var23 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), dismissSource (copy), var22 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
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
						
						if var23 then return end
						if fFlagLoadingScreenMilestones and var21 then
							var21.dismissRequested(dismissSource.NormalReady)
						end
						if var22 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var26 then
							doDismiss()
							
							return
						end
						var27 = true
					end)
				end))
				
				return
			elseif thread then
				return
			end
			thread = task.spawn(function()
				-- upvalues: players (copy), thread (copy), var23 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), dismissSource (copy), var22 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
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
				
				if var23 then return end
				if fFlagLoadingScreenMilestones and var21 then
					var21.dismissRequested(dismissSource.NormalReady)
				end
				if var22 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var26 then
					doDismiss()
					
					return
				end
				var27 = true
			end)
		end))
		table.insert(t, replicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var21 (ref), dismissSource (copy), var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
			if fFlagLoadingScreenMilestones and var21 then
				var21.dismissRequested(dismissSource.DeveloperOverride)
			end
			if var22 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var26 then
				doDismiss()
				
				return
			end
			var27 = true
		end))
		
		if replicatedFirst:IsFinishedReplicating() then
			if game:IsLoaded() then
				thread = task.spawn(function()
					-- upvalues: players (copy), thread (write), var23 (write), fFlagLoadingScreenMilestones (copy), var21 (ref), dismissSource (copy), var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
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
					
					if var23 then return end
					if fFlagLoadingScreenMilestones and var21 then
						var21.dismissRequested(dismissSource.NormalReady)
					end
					if var22 then return end
					if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
						doDismiss()
						
						return
					elseif var26 then
						doDismiss()
						
						return
					end
					var27 = true
				end)
			else
				local var28 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var28 (write), thread (write), players (copy), var23 (write), fFlagLoadingScreenMilestones (copy), var21 (ref), dismissSource (copy), var22 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
					var28:Disconnect()
					
					if thread then
						return
					end
					thread = task.spawn(function()
						-- upvalues: players (copy), thread (copy), var23 (copy), fFlagLoadingScreenMilestones (copy), var21 (copy), dismissSource (copy), var22 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
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
						
						if var23 then return end
						if fFlagLoadingScreenMilestones and var21 then
							var21.dismissRequested(dismissSource.NormalReady)
						end
						if var22 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var26 then
							doDismiss()
							
							return
						end
						var27 = true
					end)
				end))
			end
		end
		if replicatedFirst:IsDefaultLoadingGuiRemoved() then
			if fFlagLoadingScreenMilestones and var21 then
				var21.dismissRequested(dismissSource.DeveloperOverride)
			end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var27 = true
			else
				doDismiss()
			end
		end
		return function()
			-- upvalues: var23 (write), fFlagLoadingScreenMilestones (copy), var21 (ref), abortReason (copy), var18 (copy), var25 (write), var24 (write), thread (write), t (ref)
			var23 = true
			
			if fFlagLoadingScreenMilestones and var21 then
				var21.abort(abortReason.Unmounted)
			end
			var18.current = nil
			
			if var25 then
				task.cancel(var25)
			end
			if var24 then
				task.cancel(var24)
			end
			if thread and coroutine.status(thread) ~= "dead" then
				task.cancel(thread)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isPioneerLaunch (copy), p1 (ref), contextActionService (copy), var12 (ref)
		if isPioneerLaunch() then
			return
		end
		local contextActionService_1 = p1.contextActionService or contextActionService
		local var29 = false
		contextActionService_1:BindCoreAction("CancelGameLoad", function(_, p2)
			-- upvalues: var29 (write), var12 (copy)
			if p2 == Enum.UserInputState.Begin then
				var29 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var29 then
				var29 = false
				
				if var12.current then
					var12.current(false, true)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: contextActionService_1 (ref)
			contextActionService_1:UnbindCoreAction("CancelGameLoad")
		end
	end, { p1.contextActionService })
	
	return if var4 then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		DisplayOrder = if fFlagIncreaseLoadingScreenOrder then constantsModule.DISPLAY_ORDER + 1 else constantsModule.DISPLAY_ORDER,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Foundation = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			preferences = reactModule.useMemo(function()
				-- upvalues: reducedMotion (ref)
				return { reducedMotion = reducedMotion }
			end, { reducedMotion })
		}, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var20 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var15.isMobile,
					isDirectionalInput = var13,
					gamepadCancelIcon = var14,
					chromeReveal = var8.reveal,
					animation = var19,
					gameData = var15.gameData,
					thumbnailUrl = var15.thumbnailUrl,
					isAutoTranslated = var15.isAutoTranslated,
					statusPanel = var15.statusPanel,
					onCancel = reactModule.useCallback(function()
						-- upvalues: var12 (ref)
						if var12.current then
							var12.current(true)
						end
					end, {}),
					safeAreaInsets = var16,
					showContent = var17
				})
			})
		})
	}) else nil
end