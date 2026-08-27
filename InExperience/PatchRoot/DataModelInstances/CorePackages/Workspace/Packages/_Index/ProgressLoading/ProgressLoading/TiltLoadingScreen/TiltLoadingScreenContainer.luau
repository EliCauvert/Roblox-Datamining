local parent = script:FindFirstAncestor("ProgressLoading").Parent
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
local fFlagEnableTiltLoadingScreen = require(parent.SharedFlags).FFlagEnableTiltLoadingScreen
local fFlagIncreaseLoadingScreenOrder = require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local fFlagTiltLoadingScreenConsoleHints = require(parent.SharedFlags).FFlagTiltLoadingScreenConsoleHints
local fFlagTiltLoadingScreenEnterExitHold = require(parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local isPioneerLaunch = require(parent.PioneerUtils).isPioneerLaunch
local contextActionService = game:GetService("ContextActionService")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local replicatedFirstService = game:GetService("ReplicatedFirst")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local ANIMATION = constantsModule.ANIMATION
local var1 = motionModule.createState({ reveal = 1 }, {
	default = motionModule.transition({ duration = ANIMATION.chromeFadeIn })
})
local var2 = motionModule.createState({ reveal = 0 }, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local _ = require(script.Parent.Types)

return function(p1)
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), reactModule (ref), replicatedFirstService (ref), userGameSettingsService (ref), motionModule (ref), var1 (ref), fFlagTiltLoadingScreenConsoleHints (ref), usePreferredInput (ref), responsiveModule (ref), getBuilderIconForKeycode (ref), useTiltLoadingScreenViewModelModule (ref), useScreenSizeModule (ref), useDeviceInsets (ref), useViewportSettledModule (ref), useLoadingScreenAnimationModule (ref), fFlagTiltLoadingScreenEnterExitHold (ref), inExperienceLocalesModule (ref), localizationService (ref), var2 (ref), ANIMATION (ref), shouldHoldForExitModule (ref), playersService (ref), isPioneerLaunch (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var3, var4 = reactModule.useState(function()
		-- upvalues: replicatedFirstService (copy)
		return not replicatedFirstService:IsDefaultLoadingGuiRemoved()
	end)
	local var5, var6 = reactModule.useState(false)
	local reducedMotion = userGameSettingsService.ReducedMotion
	local var7, var8 = motionModule.useMotion(var1)
	local var9 = reactModule.useRef(var8)
	var9.current = var8
	local var10 = reactModule.useRef(p1.onDismissComplete)
	var10.current = p1.onDismissComplete
	local var11 = reactModule.useRef(p1.onCancel)
	var11.current = p1.onCancel
	local var12 = fFlagTiltLoadingScreenConsoleHints and (if fFlagTiltLoadingScreenConsoleHints then usePreferredInput() else nil) == responsiveModule.Input.Directional
	local var13 = if var12 then getBuilderIconForKeycode(Enum.KeyCode.ButtonB) else nil
	local var14 = useTiltLoadingScreenViewModelModule(p1.placeId)
	local var15 = useDeviceInsets()
	local var16 = useViewportSettledModule(useScreenSizeModule())
	local var17 = reactModule.useRef(nil)
	local var18 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var14.gameData ~= nil and var16,
		isDismissing = var5,
		onEnterComplete = if fFlagTiltLoadingScreenEnterExitHold then function()
			-- upvalues: var17 (ref)
			if var17.current then
				var17.current()
			end
		end else nil
	})
	local var19 = reactModule.useMemo(function()
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function()
		-- upvalues: var6 (ref), var9 (ref), var2 (copy), ANIMATION (copy), replicatedFirstService (copy), var4 (ref), var10 (ref), userGameSettingsService (copy), var17 (ref), shouldHoldForExitModule (copy), playersService (copy)
		local t = {}
		local var20 = false
		local var21 = false
		local var22 = nil
		local var23 = nil
		local var24 = nil
		local var25 = nil
		local var26 = false
		local var27 = false
		
		local function doDismiss()
			-- upvalues: var20 (write), var6 (copy), var22 (write), var21 (write), var9 (copy), var2 (copy), var23 (write), ANIMATION (copy), replicatedFirstService (copy), var4 (copy), var10 (copy), userGameSettingsService (copy)
			var20 = true
			var6(true)
			
			local function fadeChrome()
				-- upvalues: var22 (copy), var21 (copy), var9 (copy), var2 (copy), var23 (copy), ANIMATION (copy), replicatedFirstService (copy), var4 (copy), var10 (copy)
				var22 = nil
				
				if var21 then
					return
				end
				var9.current(var2, {
					onAnimationComplete = function(p2)
						-- upvalues: var21 (copy), var23 (copy), ANIMATION (copy), replicatedFirstService (copy), var4 (copy), var10 (copy)
						if p2 == true and not var21 then
							var23 = task.delay(ANIMATION.endPause, function()
								-- upvalues: var23 (copy), var21 (copy), replicatedFirstService (copy), var4 (copy), var10 (copy)
								var23 = nil
								
								if var21 then return end
								replicatedFirstService:SetDefaultLoadingGuiRemoved()
								var4(false)
								
								if var10.current then
									var10.current()
								end
							end)
							
							return
						end
					end
				})
			end
			
			if userGameSettingsService.ReducedMotion then
				fadeChrome()
				
				return
			end
			var22 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		function var34.current()
			-- upvalues: var21 (write), var20 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), var26 (write), var27 (write), doDismiss (ref), var25 (write), ANIMATION (copy)
			if var21 or var20 then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var25 = task.delay(ANIMATION.enterExitHold, function()
					-- upvalues: var25 (copy), var21 (copy), var20 (copy), var26 (copy), var27 (copy), doDismiss (copy)
					var25 = nil
					
					if var21 or var20 then return end
					var26 = true
					
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
			-- upvalues: var20 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
			if var20 then return end
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
			-- upvalues: var24 (write), playersService (copy), var21 (write), var20 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
			if var24 then
				return
			end
			var24 = task.spawn(function()
				-- upvalues: playersService (copy), var24 (copy), var21 (copy), var20 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
				if playersService.CharacterAutoLoads then
					local localPlayer = playersService.LocalPlayer
					
					if not localPlayer then
						playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
						localPlayer = playersService.LocalPlayer
					end
					if not localPlayer.Character then
						localPlayer.CharacterAdded:Wait()
					end
				end
				var24 = nil
				
				if var21 then return end
				if var20 then return end
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
		
		local function handleFinishedReplicating()
			-- upvalues: var24 (write), playersService (copy), var21 (write), var20 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write), t (ref)
			if not game:IsLoaded() then
				local var28 = nil
				table.insert(t, game.Loaded:Connect(function()
					-- upvalues: var28 (write), var24 (copy), playersService (copy), var21 (copy), var20 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
					var28:Disconnect()
					
					if var24 then
						return
					end
					var24 = task.spawn(function()
						-- upvalues: playersService (copy), var24 (copy), var21 (copy), var20 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
						if playersService.CharacterAutoLoads then
							local localPlayer = playersService.LocalPlayer
							
							if not localPlayer then
								playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
								localPlayer = playersService.LocalPlayer
							end
							if not localPlayer.Character then
								localPlayer.CharacterAdded:Wait()
							end
						end
						var24 = nil
						
						if var21 then return end
						if var20 then return end
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
			elseif var24 then
				return
			end
			var24 = task.spawn(function()
				-- upvalues: playersService (copy), var24 (copy), var21 (copy), var20 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var26 (copy), var27 (copy)
				if playersService.CharacterAutoLoads then
					local localPlayer = playersService.LocalPlayer
					
					if not localPlayer then
						playersService:GetPropertyChangedSignal("LocalPlayer"):Wait()
						localPlayer = playersService.LocalPlayer
					end
					if not localPlayer.Character then
						localPlayer.CharacterAdded:Wait()
					end
				end
				var24 = nil
				
				if var21 then return end
				if var20 then return end
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
		
		table.insert(t, replicatedFirstService.FinishedReplicating:Connect(handleFinishedReplicating))
		table.insert(t, replicatedFirstService.RemoveDefaultLoadingGuiSignal:Connect(function()
			-- upvalues: var20 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var26 (write), var27 (write)
			if var20 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var26 then
				doDismiss()
				
				return
			end
			var27 = true
		end))
		
		if replicatedFirstService:IsFinishedReplicating() then
			handleFinishedReplicating()
		end
		if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var27 = true
			else
				doDismiss()
			end
		end
		return function()
			-- upvalues: var21 (write), var17 (copy), var25 (write), var22 (write), var23 (write), var24 (write), t (ref)
			var21 = true
			var17.current = nil
			
			if var25 then
				task.cancel(var25)
			end
			if var22 then
				task.cancel(var22)
			end
			if var23 then
				task.cancel(var23)
			end
			if var24 and coroutine.status(var24) ~= "dead" then
				task.cancel(var24)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function()
		-- upvalues: isPioneerLaunch (copy), p1 (ref), contextActionService (copy), var11 (ref)
		if isPioneerLaunch() then
			return
		end
		local contextActionService_1 = p1.contextActionService or contextActionService
		local var28 = false
		contextActionService_1:BindCoreAction("CancelGameLoad", function(_, p2)
			-- upvalues: var28 (write), var11 (copy)
			if p2 == Enum.UserInputState.Begin then
				var28 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var28 then
				var28 = false
				
				if var11.current then
					var11.current(false, true)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function()
			-- upvalues: contextActionService_1 (ref)
			contextActionService_1:UnbindCoreAction("CancelGameLoad")
		end
	end, { p1.contextActionService })
	
	return if var3 then reactModule.createElement("ScreenGui", {
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
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var19 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var14.isMobile,
					isDirectionalInput = var12,
					gamepadCancelIcon = var13,
					chromeReveal = var7.reveal,
					animation = var18,
					gameData = var14.gameData,
					thumbnailUrl = var14.thumbnailUrl,
					isAutoTranslated = var14.isAutoTranslated,
					statusPanel = var14.statusPanel,
					onCancel = reactModule.useCallback(function()
						-- upvalues: var11 (ref)
						if var11.current then
							var11.current(true)
						end
					end, {}),
					safeAreaInsets = var15,
					showContent = var16
				})
			})
		})
	}) else nil
end