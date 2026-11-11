local AdPlayer = script:FindFirstAncestor("AdPlayer")

if require(AdPlayer.Flags).GetEnableLuaRewardTimerUI() then
	local Parent = AdPlayer.Parent
	local ReactModule = require(Parent.React)
	local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
	local FoundationModule = require(Parent.Foundation)
	local ReactOtterModule = require(Parent.ReactOtter)
	local UseTokensFunction = FoundationModule.Hooks.useTokens
	local Text = FoundationModule.Text
	local View = FoundationModule.View
	local Image = FoundationModule.Image
	local RadialProgressComponentModule = require(AdPlayer.components.RadialProgressComponent)
	local config = {
		getRewardIn = "Features.OnDemandAds.Get_Reward_In",
		rewardEarned = "Features.OnDemandAds.Reward_Earned"
	}
	
	local function _(Duration)
		return {
			duration = Duration,
			easingStyle = Enum.EasingStyle.Linear
		}
	end
	
	return function(p1)
		-- upvalues: ReactModule (copy), ReactOtterModule (copy), UseTokensFunction (copy), UseLocalizationFunction (copy), config (copy), View (copy), Image (copy), Text (copy), RadialProgressComponentModule (copy)
		local UseRefResult = ReactModule.useRef(nil)
		local UseStateResult, UseStateResult2 = ReactModule.useState(0)
		local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(0)
		local UseAnimatedBindingResult1, UseAnimatedBindingResult2_1 = ReactOtterModule.useAnimatedBinding(0)
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
		local UseAnimatedBindingResult3, UseAnimatedBindingResult2_2 = ReactOtterModule.useAnimatedBinding(1)
		local UseAnimatedBindingResult4, UseAnimatedBindingResult2_3 = ReactOtterModule.useAnimatedBinding(0)
		local UseTokensResult = UseTokensFunction()
		local UseLocalizationResult = UseLocalizationFunction(config)
		local UseAnimatedBindingResult5, UseAnimatedBindingResult2_4 = ReactOtterModule.useAnimatedBinding(0)
		local UseAnimatedBindingResult6, UseAnimatedBindingResult2_5 = ReactOtterModule.useAnimatedBinding(1)
		local UseAnimatedBindingResult7, UseAnimatedBindingResult2_6 = ReactOtterModule.useAnimatedBinding(0)
		local UseAnimatedBindingResult8, UseAnimatedBindingResult2_7 = ReactOtterModule.useAnimatedBinding(0)
		local UseStateResult3, UseStateResult2_2 = ReactModule.useState(true)
		local UseBindingResult, _ = ReactModule.useBinding(1)
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult3 (copy), UseAnimatedBindingResult2_7 (copy), ReactOtterModule (upval)
			if UseStateResult3 then
				UseAnimatedBindingResult2_7(ReactOtterModule.instant(0))
				
				return
			end
			local Flag = false
			task.delay(3, function()
				-- upvalues: Flag (ref), UseAnimatedBindingResult2_7 (upval), ReactOtterModule (upval)
				if not Flag then
					UseAnimatedBindingResult2_7(ReactOtterModule.ease(1))
				end
			end)
			
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end, { UseStateResult3 })
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult (copy), UseStateResult2 (copy), UseRefResult1 (copy), UseStateResult2_1 (copy)
			local Current = UseRefResult.current
			
			if Current then
				UseStateResult2(Current.TextBounds.X)
			end
			local Current1 = UseRefResult1.current
			
			if Current1 then
				UseStateResult2_1(Current1.TextBounds.X)
			end
		end, {})
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult3 (copy), UseAnimatedBindingResult2_4 (copy), ReactOtterModule (upval), UseStateResult (copy), UseStateResult1 (copy)
			if UseStateResult3 then
				UseAnimatedBindingResult2_4(ReactOtterModule.instant(24 + UseStateResult + 8 + 20))
				
				return
			else
				UseAnimatedBindingResult2_4(ReactOtterModule.ease(24 + UseStateResult1 + 8 + 20 - 4, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
			end
		end, { UseStateResult3, UseStateResult, UseStateResult1 })
		ReactModule.useEffect(function()
			-- upvalues: UseStateResult3 (copy), UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseAnimatedBindingResult2_1 (copy), UseAnimatedBindingResult2_2 (copy), UseAnimatedBindingResult2_3 (copy), UseAnimatedBindingResult2_6 (copy), UseAnimatedBindingResult2_5 (copy)
			local Flag = false
			
			if UseStateResult3 then
				UseAnimatedBindingResult2(ReactOtterModule.instant(0))
				UseAnimatedBindingResult2_1(ReactOtterModule.instant(0))
				UseAnimatedBindingResult2_2(ReactOtterModule.instant(1))
				UseAnimatedBindingResult2_3(ReactOtterModule.instant(28))
				UseAnimatedBindingResult2_6(ReactOtterModule.instant(0))
				UseAnimatedBindingResult2_5(ReactOtterModule.instant(1))
			else
				UseAnimatedBindingResult2_1(ReactOtterModule.ease(24, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
				UseAnimatedBindingResult2_3(ReactOtterModule.ease(0, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
				UseAnimatedBindingResult2_6(ReactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
				task.delay(0.1, function()
					-- upvalues: Flag (ref), UseAnimatedBindingResult2 (upval), ReactOtterModule (upval), UseAnimatedBindingResult2_2 (upval)
					if not Flag then
						UseAnimatedBindingResult2(ReactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
						UseAnimatedBindingResult2_2(ReactOtterModule.ease(0, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
					end
				end)
				task.delay(0.4, function()
					-- upvalues: Flag (ref), UseAnimatedBindingResult2_5 (upval), ReactOtterModule (upval)
					if not Flag then
						UseAnimatedBindingResult2_5(ReactOtterModule.ease(0, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
					end
				end)
			end
			return function()
				-- upvalues: Flag (ref)
				Flag = true
			end
		end, { UseStateResult3 })
		
		return ReactModule.createElement(View, {
			tag = "padding-y-xsmall padding-x-medium bg-over-media-300 radius-small clip",
			Size = UseAnimatedBindingResult5:map(function(XOffset): UDim2
				return UDim2.fromOffset(XOffset, 32)
			end),
			GroupTransparency = UseAnimatedBindingResult8,
			Visible = UseStateResult > 0
		}, {
			checkIcon = ReactModule.createElement(Image, {
				tag = "size-500 anchor-center-left",
				Image = "rbxassetid://125702125855534",
				LayoutOrder = 1,
				imageStyle = { Transparency = UseAnimatedBindingResult6 },
				Position = UDim2.new(0, -4, 0.5, 0),
				Visible = p1.rewardWaitAlpha:map(function(p2: number): boolean
					-- upvalues: UseStateResult2_2 (copy)
					UseStateResult2_2(p2 < 1)
					
					return p2 == 1
				end)
			}),
			getRewardInLabel = ReactModule.createElement(Text, {
				tag = "text-label-medium text-align-x-left text-align-y-center",
				Text = UseLocalizationResult.getRewardIn,
				Size = UDim2.new(0, UseStateResult, 1, 0),
				Position = UseAnimatedBindingResult1:map(function(XOffset): UDim2
					return UDim2.new(0, XOffset, 0, 0)
				end),
				textStyle = {
					Color3 = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
					Transparency = UseAnimatedBindingResult
				},
				ref = UseRefResult
			}),
			rewardEarnedLabel = ReactModule.createElement(Text, {
				tag = "text-label-medium text-align-x-right text-align-y-center anchor-top-right",
				Text = UseLocalizationResult.rewardEarned,
				Size = UDim2.new(0, UseStateResult1, 1, 0),
				Position = UseAnimatedBindingResult4:map(function(p2): UDim2
					return UDim2.new(1, -p2, 0, 0)
				end),
				textStyle = {
					Color3 = UseTokensResult.Color.ActionEmphasis.Foreground.Color3,
					Transparency = UseAnimatedBindingResult3
				},
				ref = UseRefResult1
			}),
			progressContainer = ReactModule.createElement(View, {
				tag = "radius-circle bg-over-media-200 size-500 anchor-center-right position-center-right",
				GroupTransparency = UseAnimatedBindingResult7
			}, {
				progressBackground = ReactModule.createElement(RadialProgressComponentModule, {
					thickness = 2,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					alpha = UseBindingResult,
					Size = UDim2.fromScale(1, 1),
					SizeConstraint = Enum.SizeConstraint.RelativeYY,
					ImageColor3 = UseTokensResult.Color.Content.Muted.Color3,
					Visible = p1.rewardWaitAlpha:map(function(p2: number): boolean
						return p2 < 1
					end)
				}, {
					radialProgress = ReactModule.createElement(RadialProgressComponentModule, {
						thickness = 2,
						BackgroundTransparency = 1,
						alpha = p1.rewardWaitAlpha,
						Size = UDim2.fromScale(1, 1),
						ImageColor3 = UseTokensResult.Color.Extended.White.White_0.Color3
					}, {
						timerLabel = ReactModule.createElement(Text, {
							tag = "size-full-300 anchor-center-center position-center-center content-emphasis text-caption-small text-align-x-center text-align-y-center",
							TextScaled = true,
							Text = p1.rewardWaitAlpha:map(function(p2): string
								-- upvalues: p1 (copy)
								return (tostring((math.ceil(p1.rewardWaitTime - p1.rewardWaitTime * p2))))
							end)
						})
					})
				})
			})
		})
	end
else
	return nil
end