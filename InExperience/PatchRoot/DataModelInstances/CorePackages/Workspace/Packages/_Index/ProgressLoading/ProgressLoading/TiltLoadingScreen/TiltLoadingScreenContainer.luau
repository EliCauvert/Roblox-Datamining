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

return function(p0) --[[ line: 44 | named "TiltLoadingScreenContainer" ]]
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), reactModule (ref), replicatedFirstService (ref), userGameSettingsService (ref), motionModule (ref), var17 (ref), useTiltLoadingScreenViewModelModule (ref), useScreenSizeModule (ref), useDeviceInsets (ref), useViewportSettledModule (ref), useLoadingScreenAnimationModule (ref), inExperienceLocalesModule (ref), localizationService (ref), shouldHoldForExitModule (ref), ANIMATION (ref), var18 (ref), playersService (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var19, var20 = reactModule.useState(function() --[[ line: 49 ]]
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
	local var31 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var28.gameData ~= nil and var30,
		isDismissing = var21
	})
	local var32 = reactModule.useMemo(function() --[[ line: 70 ]]
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 74 ]]
		-- upvalues: shouldHoldForExitModule (copy), userGameSettingsService (copy), ANIMATION (copy), var22 (ref), var25 (ref), var18 (copy), replicatedFirstService (copy), var20 (ref), var26 (ref), playersService (copy)
		local t = {}
		local var34 = false
		local var35 = false
		local var36 = nil
		local var37 = nil
		local var38 = nil
		local var39 = nil
		local var40 = false
		
		local function dismiss() --[[ line: 84 ]]
			-- upvalues: var34 (write), var40 (write), var39 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), ANIMATION (copy), var35 (write), dismiss (ref), var22 (copy), var36 (write), var25 (copy), var18 (copy), var37 (write), replicatedFirstService (copy), var20 (copy), var26 (copy)
			if var34 then return end
			if var40 and var39 ~= nil then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion, var40) then
				var40 = true
				var39 = task.delay(ANIMATION.enterExitHold, function() --[[ line: 95 ]]
					-- upvalues: var39 (copy), var35 (copy), dismiss (copy)
					var39 = nil
					
					if var35 then
						return
					end
					dismiss()
				end)
				
				return
			end
			var34 = true
			var22(true)
			
			local function fadeChrome() --[[ line: 108 ]]
				-- upvalues: var36 (copy), var35 (copy), var25 (copy), var18 (copy), var37 (copy), ANIMATION (copy), replicatedFirstService (copy), var20 (copy), var26 (copy)
				var36 = nil
				
				if var35 then
					return
				end
				var25.current(var18, {
					onAnimationComplete = function(p1) --[[ line: 114 ]]
						-- upvalues: var35 (copy), var37 (copy), ANIMATION (copy), replicatedFirstService (copy), var20 (copy), var26 (copy)
						if p1 == true and not var35 then
							var37 = task.delay(ANIMATION.endPause, function() --[[ line: 118 ]]
								-- upvalues: var37 (copy), var35 (copy), replicatedFirstService (copy), var20 (copy), var26 (copy)
								var37 = nil
								
								if var35 then return end
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
			var36 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		local function _() --[[ line: 140 | named "waitForCharacterAndDismiss" ]]
			-- upvalues: var38 (write), playersService (copy), var35 (write), dismiss (ref)
			if var38 then
				return
			end
			var38 = task.spawn(function() --[[ line: 144 ]]
				-- upvalues: playersService (copy), var38 (copy), var35 (copy), dismiss (copy)
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
				var38 = nil
				
				if var35 then
					return
				end
				dismiss()
			end)
		end
		
		local function handleFinishedReplicating() --[[ line: 163 ]]
			-- upvalues: var38 (write), playersService (copy), var35 (write), dismiss (ref), t (ref)
			if not game:IsLoaded() then
				local var44 = nil
				table.insert(t, game.Loaded:Connect(function() --[[ line: 168 ]]
					-- upvalues: var44 (write), var38 (copy), playersService (copy), var35 (copy), dismiss (copy)
					var44:Disconnect()
					
					if var38 then
						return
					end
					var38 = task.spawn(function() --[[ line: 144 ]]
						-- upvalues: playersService (copy), var38 (copy), var35 (copy), dismiss (copy)
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
						var38 = nil
						
						if var35 then
							return
						end
						dismiss()
					end)
				end))
				
				return
			elseif var38 then
				return
			end
			var38 = task.spawn(function() --[[ line: 144 ]]
				-- upvalues: playersService (copy), var38 (copy), var35 (copy), dismiss (copy)
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
				var38 = nil
				
				if var35 then
					return
				end
				dismiss()
			end)
		end
		
		table.insert(t, replicatedFirstService.FinishedReplicating:Connect(handleFinishedReplicating))
		table.insert(t, replicatedFirstService.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ line: 179 ]]
			-- upvalues: dismiss (ref)
			dismiss()
		end))
		
		if replicatedFirstService:IsFinishedReplicating() then
			handleFinishedReplicating()
		end
		if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
			dismiss()
		end
		return function() --[[ line: 192 ]]
			-- upvalues: var35 (write), var39 (write), var36 (write), var37 (write), var38 (write), t (ref)
			var35 = true
			
			if var39 then
				task.cancel(var39)
			end
			if var36 then
				task.cancel(var36)
			end
			if var37 then
				task.cancel(var37)
			end
			if var38 and coroutine.status(var38) ~= "dead" then
				task.cancel(var38)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 211 ]]
		-- upvalues: contextActionService (copy), var27 (ref)
		local var45 = false
		contextActionService:BindCoreAction("CancelGameLoad", function(_, p2) --[[ line: 213 ]]
			-- upvalues: var45 (write), var27 (copy)
			if p2 == Enum.UserInputState.Begin then
				var45 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var45 then
				var45 = false
				
				if var27.current then
					var27.current(false)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function() --[[ line: 224 ]]
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
			theme = foundationModule.Enums.Theme.Dark,
			preferences = reactModule.useMemo(function() --[[ line: 228 ]]
				-- upvalues: reducedMotion (ref)
				return { reducedMotion = reducedMotion }
			end, { reducedMotion })
		}, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var32 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var28.isMobile,
					chromeReveal = var23.reveal,
					animation = var31,
					gameData = var28.gameData,
					thumbnailUrl = var28.thumbnailUrl,
					isAutoTranslated = var28.isAutoTranslated,
					statusPanel = var28.statusPanel,
					onCancel = reactModule.useCallback(function() --[[ line: 231 ]]
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