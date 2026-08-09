local tweenService = game:GetService("TweenService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local shopGlobalIconAnimGracePeriodMs = game:DefineFastInt("ShopGlobalIconAnimGracePeriodMs", 3000)
local fFlagExperienceShopNewIconographyModule = require(inExperienceShop.Flags.FFlagExperienceShopNewIconography)
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local var7 = if fFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local var8 = if fFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo_1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local tweenInfo_2 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local tweenInfo_3 = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local currentTime = nil

if game:IsLoaded() then
	currentTime = tick()
else
	local loadedConnection = nil
	loadedConnection = game.Loaded:Connect(function() --[[ line: 39 ]]
		-- upvalues: currentTime (write), loadedConnection (write)
		currentTime = tick()
		loadedConnection:Disconnect()
	end)
end
return function(p0) --[[ line: 56 | named "ShopGlobalIcon" ]]
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), useTokens (ref), reactModule (ref), shopGlobalIconAnimGracePeriodMs (ref), currentTime (write), tweenService (ref), tweenInfo (ref), tweenInfo_2 (ref), tweenInfo_3 (ref), tweenInfo_1 (ref), foundationModule (ref), fFlagExperienceShopNewIconographyModule (ref), iconName (ref), iconVariant (ref), var8 (ref), var7 (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var15 = useTokens()
		local buttonSize = p0.buttonSize
		local leftGap = p0.leftGap or 0
		local var17, var18 = reactModule.useState(0)
		local var19, var20 = reactModule.useState(0)
		local var21, var22 = reactModule.useState(false)
		local var23 = reactModule.useRef(nil)
		local var24 = reactModule.useRef(nil)
		local var25 = reactModule.useRef(nil)
		local var26 = reactModule.useRef(nil)
		local var27 = reactModule.useRef(nil)
		local var28 = reactModule.useRef(nil)
		local var29 = reactModule.useRef(nil)
		local var30 = reactModule.useRef(nil)
		local var31 = reactModule.useRef(nil)
		local var32 = reactModule.useRef(nil)
		reactModule.useEffect(function() --[[ line: 82 ]]
			-- upvalues: var29 (ref), var30 (ref), var18 (ref), var20 (ref), var25 (ref), var26 (ref), var23 (ref), var24 (ref), var27 (ref), var28 (ref), buttonSize (ref), var22 (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), tweenService (copy), tweenInfo (copy), tweenInfo_2 (copy), tweenInfo_3 (copy), tweenInfo_1 (copy), var31 (ref), var32 (ref)
			local numberValue = Instance.new("NumberValue")
			numberValue.Value = 0
			var29.current = numberValue
			local numberValue_1 = Instance.new("NumberValue")
			numberValue_1.Value = 0
			var30.current = numberValue_1
			local var36 = numberValue:GetPropertyChangedSignal("Value"):Connect(function() --[[ line: 91 ]]
				-- upvalues: var18 (copy), numberValue (ref)
				var18(numberValue.Value)
			end)
			local var37 = numberValue_1:GetPropertyChangedSignal("Value"):Connect(function() --[[ line: 94 ]]
				-- upvalues: var20 (copy), numberValue_1 (ref)
				var20(numberValue_1.Value)
			end)
			
			local function stopAllAnimations() --[[ line: 98 ]]
				-- upvalues: var25 (copy), var26 (copy), var23 (copy), var24 (copy), var27 (copy), var28 (copy)
				if var25.current then
					var25.current:Disconnect()
					var25.current = nil
				end
				if var26.current then
					var26.current:Disconnect()
					var26.current = nil
				end
				if var23.current then
					var23.current:Cancel()
					var23.current = nil
				end
				if var24.current then
					var24.current:Cancel()
					var24.current = nil
				end
				if var27.current then
					task.cancel(var27.current)
					var27.current = nil
				end
				if var28.current then
					task.cancel(var28.current)
					var28.current = nil
				end
			end
			
			local function _() --[[ line: 125 | named "showImmediate" ]]
				-- upvalues: numberValue (ref), buttonSize (copy), numberValue_1 (ref), var18 (copy), var20 (copy), var22 (copy)
				numberValue.Value = buttonSize
				numberValue_1.Value = 1
				var18(buttonSize)
				var20(1)
				var22(true)
			end
			
			local function showAnimated() --[[ line: 133 ]]
				-- upvalues: stopAllAnimations (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), numberValue (ref), buttonSize (copy), numberValue_1 (ref), var18 (copy), var20 (copy), var22 (copy), tweenService (copy), tweenInfo (copy), var23 (copy), var27 (copy), tweenInfo_2 (copy), var24 (copy)
				local var41
				stopAllAnimations()
				
				if shopGlobalIconAnimGracePeriodMs > 0 then
					var41 = currentTime and tick() - currentTime
					
					if var41 == nil or var41 < shopGlobalIconAnimGracePeriodMs / 1000 then
						numberValue.Value = buttonSize
						numberValue_1.Value = 1
						var18(buttonSize)
						var20(1)
						var22(true)
						
						return
					end
				end
				numberValue.Value = 0
				numberValue_1.Value = 0
				var22(false)
				var41 = tweenService:Create(numberValue, tweenInfo, { Value = buttonSize })
				var23.current = var41
				var41:Play()
				var27.current = task.delay(0.2, function() --[[ line: 153 ]]
					-- upvalues: var27 (copy), var22 (copy), tweenService (copy), numberValue_1 (copy), tweenInfo_2 (copy), var24 (copy)
					var27.current = nil
					var22(true)
					local var42 = tweenService:Create(numberValue_1, tweenInfo_2, { Value = 1 })
					var24.current = var42
					var42:Play()
				end)
			end
			
			local function hideAnimated() --[[ line: 162 ]]
				-- upvalues: stopAllAnimations (ref), tweenService (copy), numberValue_1 (ref), tweenInfo_3 (copy), var24 (copy), var25 (copy), var22 (copy), var27 (copy), numberValue (ref), tweenInfo_1 (copy), var23 (copy), var26 (copy), var28 (copy), var31 (copy)
				stopAllAnimations()
				local var43 = tweenService:Create(numberValue_1, tweenInfo_3, { Value = 0 })
				var24.current = var43
				var25.current = var43.Completed:Connect(function(p1) --[[ line: 167 ]]
					-- upvalues: var25 (copy), var22 (copy)
					if p1 == Enum.PlaybackState.Completed then
						var25.current = nil
						var22(false)
						
						return
					end
				end)
				var43:Play()
				var27.current = task.delay(0.2, function() --[[ line: 176 ]]
					-- upvalues: var27 (copy), tweenService (copy), numberValue (copy), tweenInfo_1 (copy), var23 (copy), var26 (copy), var28 (copy), var31 (copy)
					var27.current = nil
					local var44 = tweenService:Create(numberValue, tweenInfo_1, { Value = 0 })
					var23.current = var44
					var26.current = var44.Completed:Connect(function(p2) --[[ line: 180 ]]
						-- upvalues: var26 (copy), var28 (copy), var31 (copy)
						if p2 == Enum.PlaybackState.Completed then
							var26.current = nil
							var28.current = task.delay(1.5, function() --[[ line: 185 ]]
								-- upvalues: var28 (copy), var31 (copy)
								var28.current = nil
								
								if var31.current then
									var31.current()
								end
							end)
							
							return
						end
					end)
					var44:Play()
				end)
			end
			
			var31.current = showAnimated
			var32.current = hideAnimated
			showAnimated()
			
			return function() --[[ line: 201 ]]
				-- upvalues: stopAllAnimations (ref), var36 (ref), var37 (ref), numberValue (ref), numberValue_1 (ref), var29 (copy), var30 (copy)
				stopAllAnimations()
				var36:Disconnect()
				var37:Disconnect()
				numberValue:Destroy()
				numberValue_1:Destroy()
				var29.current = nil
				var30.current = nil
			end
		end, { buttonSize })
		reactModule.useEffect(function() --[[ line: 212 ]]
			-- upvalues: p0 (ref)
			return function() --[[ line: 213 ]]
				-- upvalues: p0 (copy)
				if p0.onAreaChanged then
					p0.onAreaChanged("experience-shop-icon", Vector2.zero, Vector2.zero)
				end
			end
		end, { p0.onAreaChanged })
		
		local function reportArea(p3) --[[ line: 220 ]]
			-- upvalues: p0 (ref)
			if p0.onAreaChanged then
				p0.onAreaChanged("experience-shop-icon", p3.AbsolutePosition, p3.AbsoluteSize)
			end
		end
		
		return reactModule.createElement("Frame", {
			Size = UDim2.fromOffset((if buttonSize == 0 then 0 else var17 / buttonSize * leftGap) + var17, buttonSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p0.layoutOrder,
			[reactModule.Change.AbsolutePosition] = reportArea,
			[reactModule.Change.AbsoluteSize] = reportArea
		}, {
			Button = var21 and (reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromOffset(buttonSize, buttonSize),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -buttonSize / 2, 0.5, 0),
				cornerRadius = UDim.new(1, 0),
				backgroundStyle = var15.Color.OverMedia.OverMedia_0,
				onActivated = function() --[[ line: 226 ]]
					-- upvalues: p0 (ref)
					if p0.onActivated then
						p0.onActivated()
					end
				end,
				scale = var19
			}, {
				Icon = if fFlagExperienceShopNewIconographyModule then reactModule.createElement(foundationModule.Icon, {
					ZIndex = 1,
					name = iconName.ShoppingBasket,
					size = buttonSize * 0.55,
					variant = if p0.isActive then iconVariant.Filled else iconVariant.Regular,
					style = var15.Color.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) elseif p0.icon ~= nil then reactModule.createElement(foundationModule.Icon, {
					ZIndex = 1,
					name = iconName.BuildingStore,
					size = buttonSize * 0.55,
					variant = if p0.isActive then iconVariant.Filled else iconVariant.Regular,
					style = var15.Color.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) else reactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 1,
					Size = UDim2.fromScale(1, 1)
				}, {
					Layout = reactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					CustomIcon = p0.icon
				}),
				StatusIndicator = p0.showStatusIndicator and reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.fromOffset(8, 8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(var8 + 0.5, 1 - (var7 + 0.5)),
					BackgroundColor3 = var15.Color.System.Emphasis.Color3,
					BackgroundTransparency = var15.Color.System.Emphasis.Transparency
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					UIStroke = reactModule.createElement("UIStroke", {
						Thickness = 2,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = var15.Color.OverMedia.OverMedia_0.Color3,
						Transparency = var15.Color.OverMedia.OverMedia_0.Transparency
					})
				}) or nil
			}) or nil)
		})
	end
	return nil
end