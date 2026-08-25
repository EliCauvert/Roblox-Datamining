local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local fFlagEnableShopIconTelemetryModule = require(inExperienceShop.Flags.FFlagEnableShopIconTelemetry)
local shopGlobalIconAnimGracePeriodMs = game:DefineFastInt("ShopGlobalIconAnimGracePeriodMs", 3000)
local fFlagExperienceShopNewIconographyModule = require(inExperienceShop.Flags.FFlagExperienceShopNewIconography)
local useTokens = foundationModule.Hooks.useTokens
local iconName = foundationModule.Enums.IconName
local iconVariant = foundationModule.Enums.IconVariant
local var9 = if fFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local var10 = if fFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local tweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local tweenInfo_1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local tweenInfo_2 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local tweenInfo_3 = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local currentTime = nil

if game:IsLoaded() then
	currentTime = tick()
else
	local loadedConnection = nil
	loadedConnection = game.Loaded:Connect(function()
		-- upvalues: currentTime (write), loadedConnection (write)
		currentTime = tick()
		loadedConnection:Disconnect()
	end)
end
return function(p0)
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), useTokens (ref), reactModule (ref), shopGlobalIconAnimGracePeriodMs (ref), currentTime (write), tweenService (ref), tweenInfo (ref), tweenInfo_2 (ref), tweenInfo_3 (ref), tweenInfo_1 (ref), fFlagEnableShopIconTelemetryModule (ref), runService (ref), parent (ref), inExperienceShop (ref), foundationModule (ref), fFlagExperienceShopNewIconographyModule (ref), iconName (ref), iconVariant (ref), var10 (ref), var9 (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var17 = useTokens()
		local buttonSize = p0.buttonSize
		local leftGap = p0.leftGap or 0
		local var19, var20 = reactModule.useState(0)
		local var21, var22 = reactModule.useState(0)
		local var23, var24 = reactModule.useState(false)
		local var25 = reactModule.useRef(nil)
		local var26 = reactModule.useRef(nil)
		local var27 = reactModule.useRef(nil)
		local var28 = reactModule.useRef(nil)
		local var29 = reactModule.useRef(nil)
		local var30 = reactModule.useRef(nil)
		local var31 = reactModule.useRef(nil)
		local var32 = reactModule.useRef(nil)
		local var33 = reactModule.useRef(nil)
		local var34 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var31 (ref), var32 (ref), var20 (ref), var22 (ref), var27 (ref), var28 (ref), var25 (ref), var26 (ref), var29 (ref), var30 (ref), buttonSize (ref), var24 (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), tweenService (copy), tweenInfo (copy), tweenInfo_2 (copy), tweenInfo_3 (copy), tweenInfo_1 (copy), var33 (ref), var34 (ref)
			local numberValue = Instance.new("NumberValue")
			numberValue.Value = 0
			var31.current = numberValue
			local numberValue_1 = Instance.new("NumberValue")
			numberValue_1.Value = 0
			var32.current = numberValue_1
			local var38 = numberValue:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: var20 (copy), numberValue (ref)
				var20(numberValue.Value)
			end)
			local var39 = numberValue_1:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: var22 (copy), numberValue_1 (ref)
				var22(numberValue_1.Value)
			end)
			
			local function stopAllAnimations()
				-- upvalues: var27 (copy), var28 (copy), var25 (copy), var26 (copy), var29 (copy), var30 (copy)
				if var27.current then
					var27.current:Disconnect()
					var27.current = nil
				end
				if var28.current then
					var28.current:Disconnect()
					var28.current = nil
				end
				if var25.current then
					var25.current:Cancel()
					var25.current = nil
				end
				if var26.current then
					var26.current:Cancel()
					var26.current = nil
				end
				if var29.current then
					task.cancel(var29.current)
					var29.current = nil
				end
				if var30.current then
					task.cancel(var30.current)
					var30.current = nil
				end
			end
			
			local function _()
				-- upvalues: numberValue (ref), buttonSize (copy), numberValue_1 (ref), var20 (copy), var22 (copy), var24 (copy)
				numberValue.Value = buttonSize
				numberValue_1.Value = 1
				var20(buttonSize)
				var22(1)
				var24(true)
			end
			
			local function showAnimated()
				-- upvalues: stopAllAnimations (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), numberValue (ref), buttonSize (copy), numberValue_1 (ref), var20 (copy), var22 (copy), var24 (copy), tweenService (copy), tweenInfo (copy), var25 (copy), var29 (copy), tweenInfo_2 (copy), var26 (copy)
				local var43
				stopAllAnimations()
				
				if shopGlobalIconAnimGracePeriodMs > 0 then
					var43 = currentTime and tick() - currentTime
					
					if var43 == nil or var43 < shopGlobalIconAnimGracePeriodMs / 1000 then
						numberValue.Value = buttonSize
						numberValue_1.Value = 1
						var20(buttonSize)
						var22(1)
						var24(true)
						
						return
					end
				end
				numberValue.Value = 0
				numberValue_1.Value = 0
				var24(false)
				var43 = tweenService:Create(numberValue, tweenInfo, { Value = buttonSize })
				var25.current = var43
				var43:Play()
				var29.current = task.delay(0.2, function()
					-- upvalues: var29 (copy), var24 (copy), tweenService (copy), numberValue_1 (copy), tweenInfo_2 (copy), var26 (copy)
					var29.current = nil
					var24(true)
					local var44 = tweenService:Create(numberValue_1, tweenInfo_2, { Value = 1 })
					var26.current = var44
					var44:Play()
				end)
			end
			
			local function hideAnimated()
				-- upvalues: stopAllAnimations (ref), tweenService (copy), numberValue_1 (ref), tweenInfo_3 (copy), var26 (copy), var27 (copy), var24 (copy), var29 (copy), numberValue (ref), tweenInfo_1 (copy), var25 (copy), var28 (copy), var30 (copy), var33 (copy)
				stopAllAnimations()
				local var45 = tweenService:Create(numberValue_1, tweenInfo_3, { Value = 0 })
				var26.current = var45
				var27.current = var45.Completed:Connect(function(p1)
					-- upvalues: var27 (copy), var24 (copy)
					if p1 == Enum.PlaybackState.Completed then
						var27.current = nil
						var24(false)
						
						return
					end
				end)
				var45:Play()
				var29.current = task.delay(0.2, function()
					-- upvalues: var29 (copy), tweenService (copy), numberValue (copy), tweenInfo_1 (copy), var25 (copy), var28 (copy), var30 (copy), var33 (copy)
					var29.current = nil
					local var46 = tweenService:Create(numberValue, tweenInfo_1, { Value = 0 })
					var25.current = var46
					var28.current = var46.Completed:Connect(function(p2)
						-- upvalues: var28 (copy), var30 (copy), var33 (copy)
						if p2 == Enum.PlaybackState.Completed then
							var28.current = nil
							var30.current = task.delay(1.5, function()
								-- upvalues: var30 (copy), var33 (copy)
								var30.current = nil
								
								if var33.current then
									var33.current()
								end
							end)
							
							return
						end
					end)
					var46:Play()
				end)
			end
			
			var33.current = showAnimated
			var34.current = hideAnimated
			showAnimated()
			
			return function()
				-- upvalues: stopAllAnimations (ref), var38 (ref), var39 (ref), numberValue (ref), numberValue_1 (ref), var31 (copy), var32 (copy)
				stopAllAnimations()
				var38:Disconnect()
				var39:Disconnect()
				numberValue:Destroy()
				numberValue_1:Destroy()
				var31.current = nil
				var32.current = nil
			end
		end, { buttonSize })
		reactModule.useEffect(function()
			-- upvalues: p0 (ref)
			return function()
				-- upvalues: p0 (copy)
				if p0.onAreaChanged then
					p0.onAreaChanged("experience-shop-icon", Vector2.zero, Vector2.zero)
				end
			end
		end, { p0.onAreaChanged })
		
		local function reportArea(p3)
			-- upvalues: p0 (ref)
			if p0.onAreaChanged then
				p0.onAreaChanged("experience-shop-icon", p3.AbsolutePosition, p3.AbsoluteSize)
			end
		end
		
		return reactModule.createElement("Frame", {
			Size = UDim2.fromOffset((if buttonSize == 0 then 0 else var19 / buttonSize * leftGap) + var19, buttonSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p0.layoutOrder,
			[reactModule.Change.AbsolutePosition] = reportArea,
			[reactModule.Change.AbsoluteSize] = reportArea
		}, {
			Button = var23 and (reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromOffset(buttonSize, buttonSize),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -buttonSize / 2, 0.5, 0),
				cornerRadius = UDim.new(1, 0),
				backgroundStyle = var17.Color.OverMedia.OverMedia_0,
				onActivated = function()
					-- upvalues: fFlagEnableShopIconTelemetryModule (copy), runService (copy), parent (copy), inExperienceShop (copy), p0 (ref)
					if fFlagEnableShopIconTelemetryModule and not runService:IsStudio() then
						local loggingProtocolModule = require(parent.LoggingProtocol)
						loggingProtocolModule.default:logRobloxTelemetryEvent(require(inExperienceShop.Events.ShopIconClickEvent), {
							loggingProtocolModule.StandardizedFields.addPlaceId,
							loggingProtocolModule.StandardizedFields.addUniverseId,
							loggingProtocolModule.StandardizedFields.addSessionId
						}, {})
					end
					if p0.onActivated then
						p0.onActivated()
					end
				end,
				scale = var21
			}, {
				Icon = if fFlagExperienceShopNewIconographyModule then reactModule.createElement(foundationModule.Icon, {
					ZIndex = 1,
					name = iconName.ShoppingBasket,
					size = buttonSize * 0.55,
					variant = if p0.isActive then iconVariant.Filled else iconVariant.Regular,
					style = var17.Color.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) elseif p0.icon ~= nil then reactModule.createElement(foundationModule.Icon, {
					ZIndex = 1,
					name = iconName.BuildingStore,
					size = buttonSize * 0.55,
					variant = if p0.isActive then iconVariant.Filled else iconVariant.Regular,
					style = var17.Color.Content.Emphasis,
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
					Position = UDim2.fromScale(var10 + 0.5, 1 - (var9 + 0.5)),
					BackgroundColor3 = var17.Color.System.Emphasis.Color3,
					BackgroundTransparency = var17.Color.System.Emphasis.Transparency
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					UIStroke = reactModule.createElement("UIStroke", {
						Thickness = 2,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = var17.Color.OverMedia.OverMedia_0.Color3,
						Transparency = var17.Color.OverMedia.OverMedia_0.Transparency
					})
				}) or nil
			}) or nil)
		})
	end
	return nil
end