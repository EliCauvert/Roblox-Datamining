local adPlayer = script:FindFirstAncestor("AdPlayer")

if require(adPlayer.Flags).GetEnableLuaRewardTimerUI() then
	local parent = adPlayer.Parent
	local reactModule = require(parent.React)
	local useLocalization = require(parent.Localization).Hooks.useLocalization
	local foundationModule = require(parent.Foundation)
	local reactOtterModule = require(parent.ReactOtter)
	local useTokens = foundationModule.Hooks.useTokens
	local text = foundationModule.Text
	local view = foundationModule.View
	local image = foundationModule.Image
	local radialProgressComponentModule = require(adPlayer.components.RadialProgressComponent)
	local t = {
		getRewardIn = "Features.OnDemandAds.Get_Reward_In",
		rewardEarned = "Features.OnDemandAds.Reward_Earned"
	}
	
	local function _(p1)
		return { duration = p1, easingStyle = Enum.EasingStyle.Linear }
	end
	
	return function(p1)
		-- upvalues: reactModule (ref), reactOtterModule (ref), useTokens (ref), useLocalization (ref), t (ref), view (ref), image (ref), text (ref), radialProgressComponentModule (ref)
		local var1 = reactModule.useRef(nil)
		local var2, var3 = reactModule.useState(0)
		local var4, var5 = reactOtterModule.useAnimatedBinding(0)
		local var6, var7 = reactOtterModule.useAnimatedBinding(0)
		local var8 = reactModule.useRef(nil)
		local var9, var10 = reactModule.useState(0)
		local var11, var12 = reactOtterModule.useAnimatedBinding(1)
		local var13, var14 = reactOtterModule.useAnimatedBinding(0)
		local var15 = useTokens()
		local var16 = useLocalization(t)
		local var17, var18 = reactOtterModule.useAnimatedBinding(0)
		local var19, var20 = reactOtterModule.useAnimatedBinding(1)
		local var21, var22 = reactOtterModule.useAnimatedBinding(0)
		local var23, var24 = reactOtterModule.useAnimatedBinding(0)
		local var25, var26 = reactModule.useState(true)
		local var27, _ = reactModule.useBinding(1)
		reactModule.useEffect(function()
			-- upvalues: var25 (ref), var24 (ref), reactOtterModule (copy)
			if var25 then
				var24(reactOtterModule.instant(0))
				
				return
			end
			local var28 = false
			task.delay(3, function()
				-- upvalues: var28 (write), var24 (copy), reactOtterModule (copy)
				if not var28 then
					var24(reactOtterModule.ease(1))
				end
			end)
			
			return function()
				-- upvalues: var28 (write)
				var28 = true
			end
		end, { var25 })
		reactModule.useEffect(function()
			-- upvalues: var1 (ref), var3 (ref), var8 (ref), var10 (ref)
			local current = var1.current
			
			if current then
				var3(current.TextBounds.X)
			end
			local current_1 = var8.current
			
			if current_1 then
				var10(current_1.TextBounds.X)
			end
		end, {})
		reactModule.useEffect(function()
			-- upvalues: var25 (ref), var18 (ref), reactOtterModule (copy), var2 (ref), var9 (ref)
			if var25 then
				var18(reactOtterModule.instant(24 + var2 + 8 + 20))
				
				return
			end
			var18(reactOtterModule.ease(24 + var9 + 8 + 20 - 4, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
		end, { var25, var2, var9 })
		reactModule.useEffect(function()
			-- upvalues: var25 (ref), var5 (ref), reactOtterModule (copy), var7 (ref), var12 (ref), var14 (ref), var22 (ref), var20 (ref)
			local var28 = false
			
			if var25 then
				var5(reactOtterModule.instant(0))
				var7(reactOtterModule.instant(0))
				var12(reactOtterModule.instant(1))
				var14(reactOtterModule.instant(28))
				var22(reactOtterModule.instant(0))
				var20(reactOtterModule.instant(1))
			else
				var7(reactOtterModule.ease(24, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
				var14(reactOtterModule.ease(0, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
				var22(reactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
				task.delay(0.1, function()
					-- upvalues: var28 (write), var5 (copy), reactOtterModule (copy), var12 (copy)
					if not var28 then
						var5(reactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
						var12(reactOtterModule.ease(0, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
					end
				end)
				task.delay(0.4, function()
					-- upvalues: var28 (write), var20 (copy), reactOtterModule (copy)
					if not var28 then
						var20(reactOtterModule.ease(0, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
					end
				end)
			end
			return function()
				-- upvalues: var28 (write)
				var28 = true
			end
		end, { var25 })
		
		return reactModule.createElement(view, {
			tag = "padding-y-xsmall padding-x-medium bg-over-media-300 radius-small clip",
			Size = var17:map(function(p2)
				return UDim2.fromOffset(p2, 32)
			end),
			GroupTransparency = var23,
			Visible = var2 > 0
		}, {
			checkIcon = reactModule.createElement(image, {
				tag = "size-500 anchor-center-left",
				Image = "rbxassetid://125702125855534",
				LayoutOrder = 1,
				imageStyle = { Transparency = var19 },
				Position = UDim2.new(0, -4, 0.5, 0),
				Visible = p1.rewardWaitAlpha:map(function(p2)
					-- upvalues: var26 (ref)
					var26(p2 < 1)
					
					return p2 == 1
				end)
			}),
			getRewardInLabel = reactModule.createElement(text, {
				tag = "text-label-medium text-align-x-left text-align-y-center",
				Text = var16.getRewardIn,
				Size = UDim2.new(0, var2, 1, 0),
				Position = var6:map(function(p2)
					return UDim2.new(0, p2, 0, 0)
				end),
				textStyle = {
					Color3 = var15.Color.ActionEmphasis.Foreground.Color3,
					Transparency = var4
				},
				ref = var1
			}),
			rewardEarnedLabel = reactModule.createElement(text, {
				tag = "text-label-medium text-align-x-right text-align-y-center anchor-top-right",
				Text = var16.rewardEarned,
				Size = UDim2.new(0, var9, 1, 0),
				Position = var13:map(function(p2)
					return UDim2.new(1, -p2, 0, 0)
				end),
				textStyle = {
					Color3 = var15.Color.ActionEmphasis.Foreground.Color3,
					Transparency = var11
				},
				ref = var8
			}),
			progressContainer = reactModule.createElement(view, {
				tag = "radius-circle bg-over-media-200 size-500 anchor-center-right position-center-right",
				GroupTransparency = var21
			}, {
				progressBackground = reactModule.createElement(radialProgressComponentModule, {
					thickness = 2,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					alpha = var27,
					Size = UDim2.fromScale(1, 1),
					SizeConstraint = Enum.SizeConstraint.RelativeYY,
					ImageColor3 = var15.Color.Content.Muted.Color3,
					Visible = p1.rewardWaitAlpha:map(function(p2)
						return p2 < 1
					end)
				}, {
					radialProgress = reactModule.createElement(radialProgressComponentModule, {
						thickness = 2,
						BackgroundTransparency = 1,
						alpha = p1.rewardWaitAlpha,
						Size = UDim2.fromScale(1, 1),
						ImageColor3 = var15.Color.Extended.White.White_0.Color3
					}, {
						timerLabel = reactModule.createElement(text, {
							tag = "size-full-300 anchor-center-center position-center-center content-emphasis text-caption-small text-align-x-center text-align-y-center",
							TextScaled = true,
							Text = p1.rewardWaitAlpha:map(function(p2)
								-- upvalues: p1 (ref)
								return tostring(math.ceil(p1.rewardWaitTime - p1.rewardWaitTime * p2))
							end)
						})
					})
				})
			})
		})
	end
end
return nil