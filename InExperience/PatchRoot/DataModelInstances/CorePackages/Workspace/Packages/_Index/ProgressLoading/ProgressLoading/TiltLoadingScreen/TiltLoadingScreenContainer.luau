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
local contentId = constantsModule_1.ContentId
local dismissSource = constantsModule_1.DismissSource
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), fFlagLoadingScreenMilestones (ref), reactModule (ref), replicatedFirst (ref), userGameSettingsService (ref), motionModule (ref), var1 (ref), fFlagTiltLoadingScreenConsoleHints (ref), usePreferredInput (ref), responsiveModule (ref), getBuilderIconForKeycode (ref), useTiltLoadingScreenViewModelModule (ref), useScreenSizeModule (ref), useDeviceInsets (ref), useViewportSettledModule (ref), contentId (ref), useLoadingScreenAnimationModule (ref), fFlagTiltLoadingScreenEnterExitHold (ref), inExperienceLocalesModule (ref), localizationService (ref), milestone (ref), var2 (ref), ANIMATION (ref), shouldHoldForExitModule (ref), players (ref), dismissSource (ref), game (ref), abortReason (ref), isPioneerLaunch (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
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
	local var19 = nil
	local var20 = nil
	
	if fFlagLoadingScreenMilestones then
		local var21, var22 = reactModule.useState(nil)
		var19 = var21
		var20 = var22
	end
	local var23 = fFlagLoadingScreenMilestones and (var4 and (var17 and not var6))
	local var24 = var15.gameData ~= nil and var15.gameData.name ~= ""
	local var25 = var15.gameData ~= nil and var15.gameData.creator ~= ""
	local var26 = var19 ~= nil and var19 == var15.thumbnailUrl
	local var27 = if fFlagLoadingScreenMilestones then reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), contentId (copy), var24 (ref), var25 (ref), var26 (ref), var23 (ref)
		local var28 = if var3 then var3.current else nil
		
		if (if p2 == contentId.Title then var24 elseif p2 == contentId.Creator then var25 else p2 == contentId.Thumbnail and var26) and var23 and var28 then
			var28.contentVisible(p2)
		end
	end, {
		var23,
		var24,
		var25,
		var26,
		var3
	}) else nil
	local var28 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var15.gameData ~= nil and var17,
		onContentRevealComplete = var27,
		isDismissing = var6,
		onEnterComplete = if fFlagTiltLoadingScreenEnterExitHold then function()
			-- upvalues: var18 (ref)
			if var18.current then
				var18.current()
			end
		end else nil
	})
	local var29 = reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), fFlagLoadingScreenMilestones (copy), milestone (copy), var7 (ref), var10 (ref), var2 (copy), replicatedFirst (copy), var5 (ref), var11 (ref), userGameSettingsService (copy), ANIMATION (copy), var18 (ref), shouldHoldForExitModule (copy), players (copy), dismissSource (copy), game (copy), abortReason (copy)
		local var30 = if var3 then var3.current else nil
		
		if fFlagLoadingScreenMilestones and var30 then
			var30.record(milestone.ScreenVisible)
		end
		local t = {}
		local var31 = false
		local var32 = false
		local var33 = nil
		local thread = nil
		local var34 = nil
		local var35 = false
		local var36 = false
		
		local function doDismiss()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var30 (ref), milestone (copy), var31 (write), var7 (copy), var33 (write), var32 (write), var10 (copy), var2 (copy), replicatedFirst (copy), var5 (copy), var11 (copy), userGameSettingsService (copy), ANIMATION (copy)
			if fFlagLoadingScreenMilestones and var30 then
				var30.record(milestone.DismissStarted)
			end
			var31 = true
			var7(true)
			
			local function fadeChrome()
				-- upvalues: var33 (copy), var32 (copy), var10 (copy), var2 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), milestone (copy), replicatedFirst (copy), var5 (copy), var11 (copy)
				var33 = nil
				
				if var32 then
					return
				end
				var10.current(var2, {
					onAnimationComplete = function(p2)
						-- upvalues: var32 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), milestone (copy), replicatedFirst (copy), var5 (copy), var11 (copy)
						if p2 ~= true or var32 then return end
						if fFlagLoadingScreenMilestones and var30 then
							var30.record(milestone.ScreenHidden)
						end
						replicatedFirst:SetDefaultLoadingGuiRemoved()
						var5(false)
						
						if fFlagLoadingScreenMilestones and var30 then
							var30.complete()
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
			var33 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		function var35.current()
			-- upvalues: var32 (write), var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), var35 (write), var36 (write), doDismiss (ref), var34 (write), ANIMATION (copy), fFlagLoadingScreenMilestones (copy), var30 (ref), milestone (copy)
			if var32 or var31 then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var34 = task.delay(ANIMATION.enterExitHold, function()
					-- upvalues: var34 (copy), var32 (copy), var31 (copy), var35 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), milestone (copy), var36 (copy), doDismiss (copy)
					var34 = nil
					
					if var32 or var31 then return end
					var35 = true
					
					if fFlagLoadingScreenMilestones and var30 then
						var30.record(milestone.DismissGateReleased)
					end
					if var36 then
						doDismiss()
					end
				end)
				
				return
			end
			var35 = true
			
			if var36 then
				doDismiss()
			end
		end
		
		local function _()
			-- upvalues: var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var35 (write), var36 (write)
			if var31 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var35 then
				doDismiss()
				
				return
			end
			var36 = true
		end
		
		local _ = function()
			-- upvalues: thread (write), players (copy), var32 (write), fFlagLoadingScreenMilestones (copy), var30 (ref), dismissSource (copy), var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var35 (write), var36 (write)
			if thread then
				return
			end
			thread = task.spawn(function()
				-- upvalues: players (copy), thread (copy), var32 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), dismissSource (copy), var31 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var35 (copy), var36 (copy)
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
				
				if var32 then return end
				if fFlagLoadingScreenMilestones and var30 then
					var30.dismissRequested(dismissSource.NormalReady)
				end
				if var31 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var35 then
					doDismiss()
					
					return
				end
				var36 = true
			end)
		end
		
		table.insert(t, replicatedFirst.FinishedReplicating:Connect(function()
			-- upvalues: game (copy), thread (write), players (copy), var32 (write), fFlagLoadingScreenMilestones (copy), var30 (ref), dismissSource (copy), var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var35 (write), var36 (write), t (ref)
			if not game:IsLoaded() then
				local var37 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var37 (write), thread (copy), players (copy), var32 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), dismissSource (copy), var31 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var35 (copy), var36 (copy)
					var37:Disconnect()
					
					if thread then
						return
					end
					thread = task.spawn(function()
						-- upvalues: players (copy), thread (copy), var32 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), dismissSource (copy), var31 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var35 (copy), var36 (copy)
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
						
						if var32 then return end
						if fFlagLoadingScreenMilestones and var30 then
							var30.dismissRequested(dismissSource.NormalReady)
						end
						if var31 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var35 then
							doDismiss()
							
							return
						end
						var36 = true
					end)
				end))
				
				return
			elseif thread then
				return
			end
			thread = task.spawn(function()
				-- upvalues: players (copy), thread (copy), var32 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), dismissSource (copy), var31 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var35 (copy), var36 (copy)
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
				
				if var32 then return end
				if fFlagLoadingScreenMilestones and var30 then
					var30.dismissRequested(dismissSource.NormalReady)
				end
				if var31 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var35 then
					doDismiss()
					
					return
				end
				var36 = true
			end)
		end))
		table.insert(t, replicatedFirst.RemoveDefaultLoadingGuiSignal:Connect(function()
			-- upvalues: fFlagLoadingScreenMilestones (copy), var30 (ref), dismissSource (copy), var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var35 (write), var36 (write)
			if fFlagLoadingScreenMilestones and var30 then
				var30.dismissRequested(dismissSource.DeveloperOverride)
			end
			if var31 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var35 then
				doDismiss()
				
				return
			end
			var36 = true
		end))
		
		if replicatedFirst:IsFinishedReplicating() then
			if game:IsLoaded() then
				thread = task.spawn(function()
					-- upvalues: players (copy), thread (write), var32 (write), fFlagLoadingScreenMilestones (copy), var30 (ref), dismissSource (copy), var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var35 (write), var36 (write)
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
					
					if var32 then return end
					if fFlagLoadingScreenMilestones and var30 then
						var30.dismissRequested(dismissSource.NormalReady)
					end
					if var31 then return end
					if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
						doDismiss()
						
						return
					elseif var35 then
						doDismiss()
						
						return
					end
					var36 = true
				end)
			else
				local var37 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var37 (write), thread (write), players (copy), var32 (write), fFlagLoadingScreenMilestones (copy), var30 (ref), dismissSource (copy), var31 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var35 (write), var36 (write)
					var37:Disconnect()
					
					if thread then
						return
					end
					thread = task.spawn(function()
						-- upvalues: players (copy), thread (copy), var32 (copy), fFlagLoadingScreenMilestones (copy), var30 (copy), dismissSource (copy), var31 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var35 (copy), var36 (copy)
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
						
						if var32 then return end
						if fFlagLoadingScreenMilestones and var30 then
							var30.dismissRequested(dismissSource.NormalReady)
						end
						if var31 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var35 then
							doDismiss()
							
							return
						end
						var36 = true
					end)
				end))
			end
		end
		if replicatedFirst:IsDefaultLoadingGuiRemoved() then
			if fFlagLoadingScreenMilestones and var30 then
				var30.dismissRequested(dismissSource.DeveloperOverride)
			end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var36 = true
			else
				doDismiss()
			end
		end
		return function()
			-- upvalues: var32 (write), fFlagLoadingScreenMilestones (copy), var30 (ref), abortReason (copy), var18 (copy), var34 (write), var33 (write), thread (write), t (ref)
			var32 = true
			
			if fFlagLoadingScreenMilestones and var30 then
				var30.abort(abortReason.Unmounted)
			end
			var18.current = nil
			
			if var34 then
				task.cancel(var34)
			end
			if var33 then
				task.cancel(var33)
			end
			if thread and coroutine.status(thread) ~= "dead" then
				task.cancel(thread)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	
	if fFlagLoadingScreenMilestones then
		reactModule.useEffect(function()
			-- upvalues: var28 (ref), var27 (ref), contentId (copy)
			if var28.title.reveal:getValue() == 1 and var27 then
				var27(contentId.Title)
			end
			if var28.creator.reveal:getValue() == 1 and var27 then
				var27(contentId.Creator)
			end
			if var28.keyart.coverTransparency:getValue() == 1 and var27 then
				var27(contentId.Thumbnail)
			end
		end, { var28, var27 })
	end
	reactModule.useEffect(function()
		-- upvalues: isPioneerLaunch (copy), p1 (ref), contextActionService (copy), var12 (ref)
		if isPioneerLaunch() then
			return
		end
		local contextActionService_1 = p1.contextActionService or contextActionService
		local var38 = false
		contextActionService_1:BindCoreAction("CancelGameLoad", function(_, p2)
			-- upvalues: var38 (write), var12 (copy)
			if p2 == Enum.UserInputState.Begin then
				var38 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var38 then
				var38 = false
				
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
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var29 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var15.isMobile,
					isDirectionalInput = var13,
					gamepadCancelIcon = var14,
					chromeReveal = var8.reveal,
					animation = var28,
					gameData = var15.gameData,
					thumbnailUrl = var15.thumbnailUrl,
					onThumbnailLoaded = if fFlagLoadingScreenMilestones then var20 else nil,
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