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
local fFlagDebugEnablePioneerUX = require(parent.SharedFlags).FFlagDebugEnablePioneerUX
local contextActionService = game:GetService("ContextActionService")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local replicatedFirstService = game:GetService("ReplicatedFirst")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local ANIMATION = constantsModule.ANIMATION
local var18 = motionModule.createState({ reveal = 1 }, {
	default = motionModule.transition({ duration = ANIMATION.chromeFadeIn })
})
local var19 = motionModule.createState({ reveal = 0 }, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 50 | named "TiltLoadingScreenContainer" ]]
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), reactModule (ref), replicatedFirstService (ref), userGameSettingsService (ref), motionModule (ref), var18 (ref), fFlagTiltLoadingScreenConsoleHints (ref), usePreferredInput (ref), responsiveModule (ref), getBuilderIconForKeycode (ref), useTiltLoadingScreenViewModelModule (ref), useScreenSizeModule (ref), useDeviceInsets (ref), useViewportSettledModule (ref), useLoadingScreenAnimationModule (ref), fFlagTiltLoadingScreenEnterExitHold (ref), inExperienceLocalesModule (ref), localizationService (ref), var19 (ref), ANIMATION (ref), shouldHoldForExitModule (ref), playersService (ref), fFlagDebugEnablePioneerUX (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var20, var21 = reactModule.useState(function() --[[ line: 55 ]]
		-- upvalues: replicatedFirstService (copy)
		return not replicatedFirstService:IsDefaultLoadingGuiRemoved()
	end)
	local var22, var23 = reactModule.useState(false)
	local reducedMotion = userGameSettingsService.ReducedMotion
	local var24, var25 = motionModule.useMotion(var18)
	local var26 = reactModule.useRef(var25)
	var26.current = var25
	local var27 = reactModule.useRef(p0.onDismissComplete)
	var27.current = p0.onDismissComplete
	local var28 = reactModule.useRef(p0.onCancel)
	var28.current = p0.onCancel
	local var29 = fFlagTiltLoadingScreenConsoleHints and (if fFlagTiltLoadingScreenConsoleHints then usePreferredInput() else nil) == responsiveModule.Input.Directional
	local var30 = if var29 then getBuilderIconForKeycode(Enum.KeyCode.ButtonB) else nil
	local var31 = useTiltLoadingScreenViewModelModule(p0.placeId)
	local var32 = useDeviceInsets()
	local var33 = useViewportSettledModule(useScreenSizeModule())
	local var34 = reactModule.useRef(nil)
	local var35 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var31.gameData ~= nil and var33,
		isDismissing = var22,
		onEnterComplete = if fFlagTiltLoadingScreenEnterExitHold then function() --[[ line: 80 ]]
			-- upvalues: var34 (ref)
			if var34.current then
				var34.current()
			end
		end else nil
	})
	local var36 = reactModule.useMemo(function() --[[ line: 87 ]]
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 91 ]]
		-- upvalues: var23 (ref), var26 (ref), var19 (copy), ANIMATION (copy), replicatedFirstService (copy), var21 (ref), var27 (ref), userGameSettingsService (copy), var34 (ref), shouldHoldForExitModule (copy), playersService (copy)
		local t = {}
		local var38 = false
		local var39 = false
		local var40 = nil
		local var41 = nil
		local var42 = nil
		local var43 = nil
		local var44 = false
		local var45 = false
		
		local function doDismiss() --[[ line: 102 ]]
			-- upvalues: var38 (write), var23 (copy), var40 (write), var39 (write), var26 (copy), var19 (copy), var41 (write), ANIMATION (copy), replicatedFirstService (copy), var21 (copy), var27 (copy), userGameSettingsService (copy)
			var38 = true
			var23(true)
			
			local function fadeChrome() --[[ line: 106 ]]
				-- upvalues: var40 (copy), var39 (copy), var26 (copy), var19 (copy), var41 (copy), ANIMATION (copy), replicatedFirstService (copy), var21 (copy), var27 (copy)
				var40 = nil
				
				if var39 then
					return
				end
				var26.current(var19, {
					onAnimationComplete = function(p1) --[[ line: 112 ]]
						-- upvalues: var39 (copy), var41 (copy), ANIMATION (copy), replicatedFirstService (copy), var21 (copy), var27 (copy)
						if p1 == true and not var39 then
							var41 = task.delay(ANIMATION.endPause, function() --[[ line: 116 ]]
								-- upvalues: var41 (copy), var39 (copy), replicatedFirstService (copy), var21 (copy), var27 (copy)
								var41 = nil
								
								if var39 then return end
								replicatedFirstService:SetDefaultLoadingGuiRemoved()
								var21(false)
								
								if var27.current then
									var27.current()
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
			var40 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		function var34.current() --[[ line: 138 ]]
			-- upvalues: var39 (write), var38 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), var44 (write), var45 (write), doDismiss (ref), var43 (write), ANIMATION (copy)
			if var39 or var38 then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var43 = task.delay(ANIMATION.enterExitHold, function() --[[ line: 149 ]]
					-- upvalues: var43 (copy), var39 (copy), var38 (copy), var44 (copy), var45 (copy), doDismiss (copy)
					var43 = nil
					
					if var39 or var38 then return end
					var44 = true
					
					if var45 then
						doDismiss()
					end
				end)
				
				return
			end
			var44 = true
			
			if var45 then
				doDismiss()
			end
		end
		
		local function _() --[[ line: 161 | named "dismiss" ]]
			-- upvalues: var38 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var44 (write), var45 (write)
			if var38 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var44 then
				doDismiss()
				
				return
			end
			var45 = true
		end
		
		local _ = function() --[[ line: 178 | named "waitForCharacterAndDismiss" ]]
			-- upvalues: var42 (write), playersService (copy), var39 (write), var38 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var44 (write), var45 (write)
			if var42 then
				return
			end
			var42 = task.spawn(function() --[[ line: 182 ]]
				-- upvalues: playersService (copy), var42 (copy), var39 (copy), var38 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var44 (copy), var45 (copy)
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
				var42 = nil
				
				if var39 then return end
				if var38 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var44 then
					doDismiss()
					
					return
				end
				var45 = true
			end)
		end
		
		local function handleFinishedReplicating() --[[ line: 201 ]]
			-- upvalues: var42 (write), playersService (copy), var39 (write), var38 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var44 (write), var45 (write), t (ref)
			if not game:IsLoaded() then
				local var49 = nil
				table.insert(t, game.Loaded:Connect(function() --[[ line: 206 ]]
					-- upvalues: var49 (write), var42 (copy), playersService (copy), var39 (copy), var38 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var44 (copy), var45 (copy)
					var49:Disconnect()
					
					if var42 then
						return
					end
					var42 = task.spawn(function() --[[ line: 182 ]]
						-- upvalues: playersService (copy), var42 (copy), var39 (copy), var38 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var44 (copy), var45 (copy)
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
						var42 = nil
						
						if var39 then return end
						if var38 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var44 then
							doDismiss()
							
							return
						end
						var45 = true
					end)
				end))
				
				return
			elseif var42 then
				return
			end
			var42 = task.spawn(function() --[[ line: 182 ]]
				-- upvalues: playersService (copy), var42 (copy), var39 (copy), var38 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var44 (copy), var45 (copy)
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
				var42 = nil
				
				if var39 then return end
				if var38 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var44 then
					doDismiss()
					
					return
				end
				var45 = true
			end)
		end
		
		table.insert(t, replicatedFirstService.FinishedReplicating:Connect(handleFinishedReplicating))
		table.insert(t, replicatedFirstService.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ line: 217 ]]
			-- upvalues: var38 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var44 (write), var45 (write)
			if var38 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var44 then
				doDismiss()
				
				return
			end
			var45 = true
		end))
		
		if replicatedFirstService:IsFinishedReplicating() then
			handleFinishedReplicating()
		end
		if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var45 = true
			else
				doDismiss()
			end
		end
		return function() --[[ line: 230 ]]
			-- upvalues: var39 (write), var34 (copy), var43 (write), var40 (write), var41 (write), var42 (write), t (ref)
			var39 = true
			var34.current = nil
			
			if var43 then
				task.cancel(var43)
			end
			if var40 then
				task.cancel(var40)
			end
			if var41 then
				task.cancel(var41)
			end
			if var42 and coroutine.status(var42) ~= "dead" then
				task.cancel(var42)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 250 ]]
		-- upvalues: fFlagDebugEnablePioneerUX (copy), p0 (ref), contextActionService (copy), var28 (ref)
		if fFlagDebugEnablePioneerUX then
			return
		end
		local contextActionService_1 = p0.contextActionService or contextActionService
		local var51 = false
		contextActionService_1:BindCoreAction("CancelGameLoad", function(_, p2) --[[ line: 256 ]]
			-- upvalues: var51 (write), var28 (copy)
			if p2 == Enum.UserInputState.Begin then
				var51 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var51 then
				var51 = false
				
				if var28.current then
					var28.current(false, true)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function() --[[ line: 267 ]]
			-- upvalues: contextActionService_1 (ref)
			contextActionService_1:UnbindCoreAction("CancelGameLoad")
		end
	end, { p0.contextActionService })
	
	return if var20 then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		DisplayOrder = if fFlagIncreaseLoadingScreenOrder then constantsModule.DISPLAY_ORDER + 1 else constantsModule.DISPLAY_ORDER,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Foundation = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			preferences = reactModule.useMemo(function() --[[ line: 271 ]]
				-- upvalues: reducedMotion (ref)
				return { reducedMotion = reducedMotion }
			end, { reducedMotion })
		}, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var36 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var31.isMobile,
					isDirectionalInput = var29,
					gamepadCancelIcon = var30,
					chromeReveal = var24.reveal,
					animation = var35,
					gameData = var31.gameData,
					thumbnailUrl = var31.thumbnailUrl,
					isAutoTranslated = var31.isAutoTranslated,
					statusPanel = var31.statusPanel,
					onCancel = reactModule.useCallback(function() --[[ line: 274 ]]
						-- upvalues: var28 (ref)
						if var28.current then
							var28.current(true)
						end
					end, {}),
					safeAreaInsets = var32,
					showContent = var33
				})
			})
		})
	}) else nil
end