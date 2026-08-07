local parent = script:FindFirstAncestor("ProgressLoading").Parent
local reactModule = require(parent.React)
local motionModule = require(parent.Motion)
local foundationModule = require(parent.Foundation)
local localizationModule = require(parent.Localization)
local inExperienceLocalesModule = require(parent.InExperienceLocales)
local tiltLoadingScreenViewModule = require(script.Parent.TiltLoadingScreenView)
local useTiltLoadingScreenViewModelModule = require(script.Parent.Hooks.useTiltLoadingScreenViewModel)
local useLoadingScreenAnimationModule = require(script.Parent.Hooks.useLoadingScreenAnimation)
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
local var15 = motionModule.createState({ reveal = 1 }, {
	default = motionModule.transition({ duration = ANIMATION.chromeFadeIn })
})
local var16 = motionModule.createState({ reveal = 0 }, {
	default = motionModule.transition({ duration = ANIMATION.closeDur })
})
local _ = require(script.Parent.Types)

return function(p0) --[[ line: 41 | named "TiltLoadingScreenContainer" ]]
	-- upvalues: fFlagEnableTiltLoadingScreen (ref), reactModule (ref), replicatedFirstService (ref), userGameSettingsService (ref), motionModule (ref), var15 (ref), useTiltLoadingScreenViewModelModule (ref), useLoadingScreenAnimationModule (ref), inExperienceLocalesModule (ref), localizationService (ref), shouldHoldForExitModule (ref), ANIMATION (ref), var16 (ref), playersService (ref), contextActionService (ref), fFlagIncreaseLoadingScreenOrder (ref), constantsModule (ref), foundationModule (ref), localizationModule (ref), tiltLoadingScreenViewModule (ref)
	if not fFlagEnableTiltLoadingScreen then
		return nil
	end
	local var17, var18 = reactModule.useState(function() --[[ line: 46 ]]
		-- upvalues: replicatedFirstService (copy)
		return not replicatedFirstService:IsDefaultLoadingGuiRemoved()
	end)
	local var19, var20 = reactModule.useState(false)
	local reducedMotion = userGameSettingsService.ReducedMotion
	local var21, var22 = motionModule.useMotion(var15)
	local var23 = reactModule.useRef(var22)
	var23.current = var22
	local var24 = reactModule.useRef(p0.onDismissComplete)
	var24.current = p0.onDismissComplete
	local var25 = reactModule.useRef(p0.onCancel)
	var25.current = p0.onCancel
	local var26 = useTiltLoadingScreenViewModelModule(p0.placeId)
	local var27 = useLoadingScreenAnimationModule({
		reducedMotion = reducedMotion,
		contentReady = var26.gameData ~= nil,
		isDismissing = var19
	})
	local var28 = reactModule.useMemo(function() --[[ line: 64 ]]
		-- upvalues: inExperienceLocalesModule (copy), localizationService (copy)
		return inExperienceLocalesModule.Localization.new(localizationService.RobloxLocaleId)
	end, {})
	reactModule.useEffect(function() --[[ line: 68 ]]
		-- upvalues: shouldHoldForExitModule (copy), userGameSettingsService (copy), ANIMATION (copy), var20 (ref), var23 (ref), var16 (copy), replicatedFirstService (copy), var18 (ref), var24 (ref), playersService (copy)
		local t = {}
		local var30 = false
		local var31 = false
		local var32 = nil
		local var33 = nil
		local var34 = nil
		local var35 = nil
		local var36 = false
		
		local function dismiss() --[[ line: 78 ]]
			-- upvalues: var30 (write), var36 (write), var35 (write), shouldHoldForExitModule (copy), userGameSettingsService (copy), ANIMATION (copy), var31 (write), dismiss (ref), var20 (copy), var32 (write), var23 (copy), var16 (copy), var33 (write), replicatedFirstService (copy), var18 (copy), var24 (copy)
			if var30 then return end
			if var36 and var35 ~= nil then return end
			if shouldHoldForExitModule(userGameSettingsService.ReducedMotion, var36) then
				var36 = true
				var35 = task.delay(ANIMATION.enterExitHold, function() --[[ line: 89 ]]
					-- upvalues: var35 (copy), var31 (copy), dismiss (copy)
					var35 = nil
					
					if var31 then
						return
					end
					dismiss()
				end)
				
				return
			end
			var30 = true
			var20(true)
			
			local function fadeChrome() --[[ line: 102 ]]
				-- upvalues: var32 (copy), var31 (copy), var23 (copy), var16 (copy), var33 (copy), ANIMATION (copy), replicatedFirstService (copy), var18 (copy), var24 (copy)
				var32 = nil
				
				if var31 then
					return
				end
				var23.current(var16, {
					onAnimationComplete = function(p1) --[[ line: 108 ]]
						-- upvalues: var31 (copy), var33 (copy), ANIMATION (copy), replicatedFirstService (copy), var18 (copy), var24 (copy)
						if p1 == true and not var31 then
							var33 = task.delay(ANIMATION.endPause, function() --[[ line: 112 ]]
								-- upvalues: var33 (copy), var31 (copy), replicatedFirstService (copy), var18 (copy), var24 (copy)
								var33 = nil
								
								if var31 then return end
								replicatedFirstService:SetDefaultLoadingGuiRemoved()
								var18(false)
								
								if var24.current then
									var24.current()
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
			var32 = task.delay(ANIMATION.closeDur, fadeChrome)
		end
		
		local function _() --[[ line: 134 | named "waitForCharacterAndDismiss" ]]
			-- upvalues: var34 (write), playersService (copy), var31 (write), dismiss (ref)
			if var34 then
				return
			end
			var34 = task.spawn(function() --[[ line: 138 ]]
				-- upvalues: playersService (copy), var34 (copy), var31 (copy), dismiss (copy)
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
				var34 = nil
				
				if var31 then
					return
				end
				dismiss()
			end)
		end
		
		local function handleFinishedReplicating() --[[ line: 157 ]]
			-- upvalues: var34 (write), playersService (copy), var31 (write), dismiss (ref), t (ref)
			if not game:IsLoaded() then
				local var40 = nil
				table.insert(t, game.Loaded:Connect(function() --[[ line: 162 ]]
					-- upvalues: var40 (write), var34 (copy), playersService (copy), var31 (copy), dismiss (copy)
					var40:Disconnect()
					
					if var34 then
						return
					end
					var34 = task.spawn(function() --[[ line: 138 ]]
						-- upvalues: playersService (copy), var34 (copy), var31 (copy), dismiss (copy)
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
						var34 = nil
						
						if var31 then
							return
						end
						dismiss()
					end)
				end))
				
				return
			elseif var34 then
				return
			end
			var34 = task.spawn(function() --[[ line: 138 ]]
				-- upvalues: playersService (copy), var34 (copy), var31 (copy), dismiss (copy)
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
				var34 = nil
				
				if var31 then
					return
				end
				dismiss()
			end)
		end
		
		table.insert(t, replicatedFirstService.FinishedReplicating:Connect(handleFinishedReplicating))
		table.insert(t, replicatedFirstService.RemoveDefaultLoadingGuiSignal:Connect(function() --[[ line: 173 ]]
			-- upvalues: dismiss (ref)
			dismiss()
		end))
		
		if replicatedFirstService:IsFinishedReplicating() then
			handleFinishedReplicating()
		end
		if replicatedFirstService:IsDefaultLoadingGuiRemoved() then
			dismiss()
		end
		return function() --[[ line: 186 ]]
			-- upvalues: var31 (write), var35 (write), var32 (write), var33 (write), var34 (write), t (ref)
			var31 = true
			
			if var35 then
				task.cancel(var35)
			end
			if var32 then
				task.cancel(var32)
			end
			if var33 then
				task.cancel(var33)
			end
			if var34 and coroutine.status(var34) ~= "dead" then
				task.cancel(var34)
			end
			for i, v in t do
				v:Disconnect()
			end
		end
	end, {})
	reactModule.useEffect(function() --[[ line: 205 ]]
		-- upvalues: contextActionService (copy), var25 (ref)
		local var41 = false
		contextActionService:BindCoreAction("CancelGameLoad", function(_, p2) --[[ line: 207 ]]
			-- upvalues: var41 (write), var25 (copy)
			if p2 == Enum.UserInputState.Begin then
				var41 = true
				
				return
			elseif p2 == Enum.UserInputState.End and var41 then
				var41 = false
				
				if var25.current then
					var25.current(false)
				end
			end
		end, false, Enum.KeyCode.ButtonB)
		
		return function() --[[ line: 218 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("CancelGameLoad")
		end
	end, {})
	
	return if var17 then reactModule.createElement("ScreenGui", {
		IgnoreGuiInset = true,
		DisplayOrder = if fFlagIncreaseLoadingScreenOrder then constantsModule.DISPLAY_ORDER + 1 else constantsModule.DISPLAY_ORDER,
		ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	}, {
		Foundation = reactModule.createElement(foundationModule.FoundationProvider, {
			theme = foundationModule.Enums.Theme.Dark,
			preferences = reactModule.useMemo(function() --[[ line: 222 ]]
				-- upvalues: reducedMotion (ref)
				return { reducedMotion = reducedMotion }
			end, { reducedMotion })
		}, {
			Localization = reactModule.createElement(localizationModule.LocalizationProvider, { localization = var28 }, {
				View = reactModule.createElement(tiltLoadingScreenViewModule, {
					isMobile = var26.isMobile,
					chromeReveal = var21.reveal,
					animation = var27,
					gameData = var26.gameData,
					thumbnailUrl = var26.thumbnailUrl,
					isAutoTranslated = var26.isAutoTranslated,
					statusPanel = var26.statusPanel,
					onCancel = reactModule.useCallback(function() --[[ line: 225 ]]
						-- upvalues: var25 (ref)
						if var25.current then
							var25.current(true)
						end
					end, {})
				})
			})
		})
	}) else nil
end