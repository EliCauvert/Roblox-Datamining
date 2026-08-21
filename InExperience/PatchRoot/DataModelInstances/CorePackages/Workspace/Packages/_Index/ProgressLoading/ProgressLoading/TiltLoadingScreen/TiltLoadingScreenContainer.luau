local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local useDeviceInsets = require(parent.Responsive).useDeviceInsets
local tiltLoadingScreenViewModule = require(script.Parent.TiltLoadingScreenView)
local useTiltLoadingScreenViewModelModule = require(script.Parent.Hooks.useTiltLoadingScreenViewModel)
local useLoadingScreenAnimationModule = require(script.Parent.Hooks.useLoadingScreenAnimation)
local useScreenSizeModule = require(script.Parent.Hooks.useScreenSize)
local useViewportSettledModule = require(script.Parent.Hooks.useViewportSettled)
local constantsModule = require(script.Parent.Constants)
local shouldHoldForExitModule = require(script.Parent.shouldHoldForExit)
local fFlagEnableTiltLoadingScreen = require(parent.SharedFlags).FFlagEnableTiltLoadingScreen
local fFlagIncreaseLoadingScreenOrder = require(parent.SharedFlags).FFlagIncreaseLoadingScreenOrder
local fFlagTiltLoadingScreenEnterExitHold = require(parent.SharedFlags).FFlagTiltLoadingScreenEnterExitHold
local contextActionService = game:GetService("ContextActionService")
local localizationService = game:GetService("LocalizationService")
local playersService = game:GetService("Players")
local replicatedFirstService = game:GetService("ReplicatedFirst")
local userGameSettingsService = UserSettings():GetService("UserGameSettings")
local ANIMATION = constantsModule.ANIMATION
local var17 = motionModule.createState({ reveal = 1 }, {
	default = motionModule.transition({ duration = ANIMATION.chromeFadeIn })
})
local var18 = motionModule.createState({ reveal = 0 }, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 45 | named "TiltLoadingScreenContainer" ]]
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), reactModule (ref), replicatedFirstService (ref), userGameSettingsService (ref), motionModule (ref), var17 (ref), useTiltLoadingScreenViewModelModule (ref), useScreenSizeModule (ref), useDeviceInsets (ref), useViewportSettledModule (ref), useLoadingScreenAnimationModule (ref), fFlagTiltLoadingScreenEnterExitHold (ref), inExperienceLocalesModule (ref), localizationService (ref), var18 (ref), ANIMATION (ref), shouldHoldForExitModule (ref), playersService (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var19, var20 = reactModule.useState(function() --[[ line: 50 ]]
		-- upvalues: replicatedFirstService (copy)
		return not replicatedFirstService:IsDefaultLoadingGuiRemoved()
	end)
	local var21, var22 = reactModule.useState(false)
	local reducedMotion = userGameSettingsService.ReducedMotion
	local var23, var24 = motionModule.useMotion(var17)
	local var25 = reactModule.useRef(var24)
	var25.current = var24
	local var26 = reactModule.useRef(p0.onDismissComplete)
	var26.current = p0.onDismissComplete
	local var27 = reactModule.useRef(p0.onCancel)
	var27.current = p0.onCancel
	local var28 = useTiltLoadingScreenViewModelModule(p0.placeId)
	local var29 = useDeviceInsets()
	local var30 = useViewportSettledModule(useScreenSizeModule())
	local var31 = reactModule.useRef(nil)
	local var32 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var28.gameData ~= nil and var30,
		isDismissing = var21,
		onEnterComplete = if fFlagTiltLoadingScreenEnterExitHold then function() --[[ line: 72 ]]
			-- upvalues: var31 (ref)
			if var31.current then
				var31.current()
			end
		end else nil
	})
	local var33 = reactModule.useMemo(function() --[[ line: 79 ]]
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 83 ]]
		-- upvalues: var22 (ref), var25 (ref), var18 (copy), ANIMATION (copy), replicatedFirstService (copy), var20 (ref), var26 (ref), userGameSettingsService (copy), var31 (ref), shouldHoldForExitModule (copy), playersService (copy)
		local t = {}
		local var35 = false
		local var36 = false
		local var37 = nil
		local var38 = nil
		local var39 = nil
		local var40 = nil
		local var41 = false
		local var42 = false
		
		local function doDismiss() --[[ line: 94 ]]
			-- upvalues: var35 (write), var22 (copy), var37 (write), var36 (write), var25 (copy), var18 (copy), var38 (write), ANIMATION (copy), replicatedFirstService (copy), var20 (copy), var26 (copy), userGameSettingsService (copy)
			var35 = true
			var22(true)
			
			local function fadeChrome() --[[ line: 98 ]]
				-- upvalues: var37 (copy), var36 (copy), var25 (copy), var18 (copy), var38 (copy), ANIMATION (copy), replicatedFirstService (copy), var20 (copy), var26 (copy)
				var37 = nil
				
				if var36 then
					return
				end
				var25.current(var18, {
					onAnimationComplete = function(p1) --[[ line: 104 ]]
						-- upvalues: var36 (copy), var38 (copy), ANIMATION (copy), replicatedFirstService (copy), var20 (copy), var26 (copy)
						if p1 == true and not var36 then
							var38 = task.delay(ANIMATION.endPause, function() --[[ line: 108 ]]
								-- upvalues: var38 (copy), var36 (copy), replicatedFirstService (copy), var20 (copy), var26 (copy)
								var38 = nil
								
								if var36 then return end
								replicatedFirstService:SetDefaultLoadingGuiRemoved()
								var20(false)
								
								if var26.current then
									var26.current()
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
			var37 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		function var31.current() --[[ line: 130 ]]
			-- upvalues: var36 (write), var35 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), var41 (write), var42 (write), doDismiss (ref), var40 (write), ANIMATION (copy)
			if var36 or var35 then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var40 = task.delay(ANIMATION.enterExitHold, function() --[[ line: 141 ]]
					-- upvalues: var40 (copy), var36 (copy), var35 (copy), var41 (copy), var42 (copy), doDismiss (copy)
					var40 = nil
					
					if var36 or var35 then return end
					var41 = true
					
					if var42 then
						doDismiss()
					end
				end)
				
				return
			end
			var41 = true
			
			if var42 then
				doDismiss()
			end
		end
		
		local function _() --[[ line: 153 | named "dismiss" ]]
			-- upvalues: var35 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var41 (write), var42 (write)
			if var35 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var41 then
				doDismiss()
				
				return
			end
			var42 = true
		end
		
		local _ = function() --[[ line: 170 | named "waitForCharacterAndDismiss" ]]
			-- upvalues: var39 (write), playersService (copy), var36 (write), var35 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var41 (write), var42 (write)
			if var39 then
				return
			end
			var39 = task.spawn(function() --[[ line: 174 ]]
				-- upvalues: playersService (copy), var39 (copy), var36 (copy), var35 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var41 (copy), var42 (copy)
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
				var39 = nil
				
				if var36 then return end
				if var35 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var41 then
					doDismiss()
					
					return
				end
				var42 = true
			end)
		end
		
		local function handleFinishedReplicating() --[[ line: 193 ]]
			-- upvalues: var39 (write), playersService (copy), var36 (write), var35 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var41 (write), var42 (write), t (ref)
			if not game:IsLoaded() then
				local var46 = nil
				table.insert(t, game.Loaded:Connect(function() --[[ line: 198 ]]
					-- upvalues: var46 (write), var39 (copy), playersService (copy), var36 (copy), var35 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var41 (copy), var42 (copy)
					var46:Disconnect()
					
					if var39 then
						return
					end
					var39 = task.spawn(function() --[[ line: 174 ]]
						-- upvalues: playersService (copy), var39 (copy), var36 (copy), var35 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var41 (copy), var42 (copy)
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
						var39 = nil
						
						if var36 then return end
						if var35 then return end
						if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
							doDismiss()
							
							return
						elseif var41 then
							doDismiss()
							
							return
						end
						var42 = true
					end)
				end))
				
				return
			elseif var39 then
				return
			end
			var39 = task.spawn(function() --[[ line: 174 ]]
				-- upvalues: playersService (copy), var39 (copy), var36 (copy), var35 (copy), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (copy), var41 (copy), var42 (copy)
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
				var39 = nil
				
				if var36 then return end
				if var35 then return end
				if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
					doDismiss()
					
					return
				elseif var41 then
					doDismiss()
					
					return
				end
				var42 = true
			end)
		end
		
		table.insert(t, replicatedFirstService.FinishedReplicating:Connect(handleFinishedReplicating))
		table.insert(t, replicatedFirstService.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ line: 209 ]]
			-- upvalues: var35 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), doDismiss (ref), var41 (write), var42 (write)
			if var35 then return end
			if not shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				doDismiss()
				
				return
			elseif var41 then
				doDismiss()
				
				return
			end
			var42 = true
		end))
		
		if replicatedFirstService:IsFinishedReplicating() then
			handleFinishedReplicating()
		end
		if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion) then
				var42 = true
			else
				doDismiss()
			end
		end
		return function() --[[ line: 222 ]]
			-- upvalues: var36 (write), var31 (copy), var40 (write), var37 (write), var38 (write), var39 (write), t (ref)
			var36 = true
			var31.current = nil
			
			if var40 then
				task.cancel(var40)
			end
			if var37 then
				task.cancel(var37)
			end
			if var38 then
				task.cancel(var38)
			end
			if var39 and coroutine.status(var39) ~= "dead" then
				task.cancel(var39)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 242 ]]
		-- upvalues: contextActionService (copy), var27 (ref)
		local var47 = false
		contextActionService:BindCoreAction("CancelGameLoad", function(_, p2) --[[ line: 244 ]]
			-- upvalues: var47 (write), var27 (copy)
			if p2 == Enum.UserInputState.Begin then
				var47 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var47 then
				var47 = false
				
				if var27.current then
					var27.current(false)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function() --[[ line: 255 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("CancelGameLoad")
		end
	end, {})
	
	return if var19 then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		ClipToDeviceSafeArea = false,
		DisplayOrder = if fFlagIncreaseLoadingScreenOrder then constantsModule.DISPLAY_ORDER + 1 else constantsModule.DISPLAY_ORDER,
		ScreenInsets = Enum.ScreenInsets.None,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Foundation = reactModule.createElement(foundationModule.FoundationProvider, {
			colorMode = foundationModule.Enums.ColorMode.Dark,
			preferences = reactModule.useMemo(function() --[[ line: 259 ]]
				-- upvalues: reducedMotion (ref)
				return { reducedMotion = reducedMotion }
			end, { reducedMotion })
		}, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var33 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var28.isMobile,
					chromeReveal = var23.reveal,
					animation = var32,
					gameData = var28.gameData,
					thumbnailUrl = var28.thumbnailUrl,
					isAutoTranslated = var28.isAutoTranslated,
					statusPanel = var28.statusPanel,
					onCancel = reactModule.useCallback(function() --[[ line: 262 ]]
						-- upvalues: var27 (ref)
						if var27.current then
							var27.current(true)
						end
					end, {}),
					safeAreaInsets = var29,
					showContent = var30
				})
			})
		})
	}) else nil
end