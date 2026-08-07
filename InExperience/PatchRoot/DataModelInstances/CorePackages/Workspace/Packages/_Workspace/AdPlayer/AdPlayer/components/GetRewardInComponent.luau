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
	
	local function _(p0) --[[ line: 37 | named "linearEaseOptions" ]]
		return { duration = p0, easingStyle = Enum.EasingStyle.Linear }
	end
	
	return function(p1) --[[ line: 44 ]]
		-- upvalues: reactModule (ref), reactOtterModule (ref), useTokens (ref), useLocalization (ref), t (ref), view (ref), image (ref), text (ref), radialProgressComponentModule (ref)
		local var6 = reactModule.useRef(nil)
		local var7, var8 = reactModule.useState(0)
		local var9, var10 = reactOtterModule.useAnimatedBinding(0)
		local var11, var12 = reactOtterModule.useAnimatedBinding(0)
		local var13 = reactModule.useRef(nil)
		local var14, var15 = reactModule.useState(0)
		local var16, var17 = reactOtterModule.useAnimatedBinding(1)
		local var18, var19 = reactOtterModule.useAnimatedBinding(0)
		local var20 = useTokens()
		local var21 = useLocalization(t)
		local var22, var23 = reactOtterModule.useAnimatedBinding(0)
		local var24, var25 = reactOtterModule.useAnimatedBinding(1)
		local var26, var27 = reactOtterModule.useAnimatedBinding(0)
		local var28, var29 = reactOtterModule.useAnimatedBinding(0)
		local var30, var31 = reactModule.useState(true)
		local var32, _ = reactModule.useBinding(1)
		reactModule.useEffect(function() --[[ line: 64 ]]
			-- upvalues: var30 (ref), var29 (ref), reactOtterModule (copy)
			if var30 then
				var29(reactOtterModule.instant(0))
				
				return
			end
			local var33 = false
			task.delay(3, function() --[[ line: 71 ]]
				-- upvalues: var33 (write), var29 (copy), reactOtterModule (copy)
				if not var33 then
					var29(reactOtterModule.ease(1))
				end
			end)
			
			return function() --[[ line: 77 ]]
				-- upvalues: var33 (write)
				var33 = true
			end
		end, { var30 })
		reactModule.useEffect(function() --[[ line: 82 ]]
			-- upvalues: var6 (ref), var8 (ref), var13 (ref), var15 (ref)
			local current = var6.current
			
			if current then
				var8(current.TextBounds.X)
			end
			local current_1 = var13.current
			
			if current_1 then
				var15(current_1.TextBounds.X)
			end
		end, {})
		reactModule.useEffect(function() --[[ line: 94 ]]
			-- upvalues: var30 (ref), var23 (ref), reactOtterModule (copy), var7 (ref), var14 (ref)
			if var30 then
				var23(reactOtterModule.instant(24 + var7 + 8 + 20))
				
				return
			end
			var23(reactOtterModule.ease(24 + var14 + 8 + 20 - 4, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
		end, { var30, var7, var14 })
		reactModule.useEffect(function() --[[ line: 114 ]]
			-- upvalues: var30 (ref), var10 (ref), reactOtterModule (copy), var12 (ref), var17 (ref), var19 (ref), var27 (ref), var25 (ref)
			local var34 = false
			
			if var30 then
				var10(reactOtterModule.instant(0))
				var12(reactOtterModule.instant(0))
				var17(reactOtterModule.instant(1))
				var19(reactOtterModule.instant(28))
				var27(reactOtterModule.instant(0))
				var25(reactOtterModule.instant(1))
			else
				var12(reactOtterModule.ease(24, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
				var19(reactOtterModule.ease(0, { duration = 0.4, easingStyle = Enum.EasingStyle.Linear }))
				var27(reactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
				task.delay(0.1, function() --[[ line: 130 ]]
					-- upvalues: var34 (write), var10 (copy), reactOtterModule (copy), var17 (copy)
					if not var34 then
						var10(reactOtterModule.ease(1, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
						var17(reactOtterModule.ease(0, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
					end
				end)
				task.delay(0.4, function() --[[ line: 137 ]]
					-- upvalues: var34 (write), var25 (copy), reactOtterModule (copy)
					if not var34 then
						var25(reactOtterModule.ease(0, { duration = 0.1, easingStyle = Enum.EasingStyle.Linear }))
					end
				end)
			end
			return function() --[[ line: 144 ]]
				-- upvalues: var34 (write)
				var34 = true
			end
		end, { var30 })
		
		return reactModule.createElement(view, {
			tag = "padding-y-xsmall padding-x-medium bg-over-media-300 radius-small clip",
			Size = var22:map(function(p2) --[[ line: 151 ]]
				return UDim2.fromOffset(p2, 32)
			end),
			GroupTransparency = var28,
			Visible = var7 > 0
		}, {
			checkIcon = reactModule.createElement(image, {
				tag = "size-500 anchor-center-left",
				Image = "rbxassetid://125702125855534",
				LayoutOrder = 1,
				imageStyle = { Transparency = var24 },
				Position = UDim2.new(0, -4, 0.5, 0),
				Visible = p1.rewardWaitAlpha:map(function(p3) --[[ line: 165 ]]
					-- upvalues: var31 (ref)
					var31(p3 < 1)
					
					return p3 == 1
				end)
			}),
			getRewardInLabel = reactModule.createElement(text, {
				tag = "text-label-medium text-align-x-left text-align-y-center",
				Text = var21.getRewardIn,
				Size = UDim2.new(0, var7, 1, 0),
				Position = var11:map(function(p4) --[[ line: 174 ]]
					return UDim2.new(0, p4, 0, 0)
				end),
				textStyle = {
					Color3 = var20.Color.ActionEmphasis.Foreground.Color3,
					Transparency = var9
				},
				ref = var6
			}),
			rewardEarnedLabel = reactModule.createElement(text, {
				tag = "text-label-medium text-align-x-right text-align-y-center anchor-top-right",
				Text = var21.rewardEarned,
				Size = UDim2.new(0, var14, 1, 0),
				Position = var18:map(function(p5) --[[ line: 187 ]]
					return UDim2.new(1, -p5, 0, 0)
				end),
				textStyle = {
					Color3 = var20.Color.ActionEmphasis.Foreground.Color3,
					Transparency = var16
				},
				ref = var13
			}),
			progressContainer = reactModule.createElement(view, {
				tag = "radius-circle bg-over-media-200 size-500 anchor-center-right position-center-right",
				GroupTransparency = var26
			}, {
				progressBackground = reactModule.createElement(radialProgressComponentModule, {
					thickness = 2,
					BackgroundTransparency = 1,
					LayoutOrder = 3,
					alpha = var32,
					Size = UDim2.fromScale(1, 1),
					SizeConstraint = Enum.SizeConstraint.RelativeYY,
					ImageColor3 = var20.Color.Content.Muted.Color3,
					Visible = p1.rewardWaitAlpha:map(function(p6) --[[ line: 208 ]]
						return p6 < 1
					end)
				}, {
					radialProgress = reactModule.createElement(radialProgressComponentModule, {
						thickness = 2,
						BackgroundTransparency = 1,
						alpha = p1.rewardWaitAlpha,
						Size = UDim2.fromScale(1, 1),
						ImageColor3 = var20.Color.Extended.White.White_0.Color3
					}, {
						timerLabel = reactModule.createElement(text, {
							tag = "size-full-300 anchor-center-center position-center-center content-emphasis text-caption-small text-align-x-center text-align-y-center",
							TextScaled = true,
							Text = p1.rewardWaitAlpha:map(function(p7) --[[ line: 221 ]]
								-- upvalues: p1 (ref)
								return tostring(math.ceil(p1.rewardWaitTime - p1.rewardWaitTime * p7))
							end)
						})
					})
				})
			})
		})
	end
end
return nil