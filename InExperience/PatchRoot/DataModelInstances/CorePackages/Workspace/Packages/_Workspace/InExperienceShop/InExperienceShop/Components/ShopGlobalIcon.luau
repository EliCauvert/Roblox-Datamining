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
local var1 = if fFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local var2 = if fFlagExperienceShopNewIconographyModule then 0.23 else 0.2
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
return function(p1)
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), useTokens (ref), reactModule (ref), shopGlobalIconAnimGracePeriodMs (ref), currentTime (write), tweenService (ref), tweenInfo (ref), tweenInfo_2 (ref), tweenInfo_3 (ref), tweenInfo_1 (ref), fFlagEnableShopIconTelemetryModule (ref), runService (ref), parent (ref), inExperienceShop (ref), foundationModule (ref), fFlagExperienceShopNewIconographyModule (ref), iconName (ref), iconVariant (ref), var2 (ref), var1 (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var3 = useTokens()
		local buttonSize = p1.buttonSize
		local leftGap = p1.leftGap or 0
		local var4, var5 = reactModule.useState(0)
		local var6, var7 = reactModule.useState(0)
		local var8, var9 = reactModule.useState(false)
		local var10 = reactModule.useRef(nil)
		local var11 = reactModule.useRef(nil)
		local var12 = reactModule.useRef(nil)
		local var13 = reactModule.useRef(nil)
		local var14 = reactModule.useRef(nil)
		local var15 = reactModule.useRef(nil)
		local var16 = reactModule.useRef(nil)
		local var17 = reactModule.useRef(nil)
		local var18 = reactModule.useRef(nil)
		local var19 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var16 (ref), var17 (ref), var5 (ref), var7 (ref), var12 (ref), var13 (ref), var10 (ref), var11 (ref), var14 (ref), var15 (ref), buttonSize (ref), var9 (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), tweenService (copy), tweenInfo (copy), tweenInfo_2 (copy), tweenInfo_3 (copy), tweenInfo_1 (copy), var18 (ref), var19 (ref)
			local numberValue = Instance.new("NumberValue")
			numberValue.Value = 0
			var16.current = numberValue
			local numberValue_1 = Instance.new("NumberValue")
			numberValue_1.Value = 0
			var17.current = numberValue_1
			local var20 = numberValue:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: var5 (copy), numberValue (ref)
				var5(numberValue.Value)
			end)
			local var21 = numberValue_1:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: var7 (copy), numberValue_1 (ref)
				var7(numberValue_1.Value)
			end)
			
			local function stopAllAnimations()
				-- upvalues: var12 (copy), var13 (copy), var10 (copy), var11 (copy), var14 (copy), var15 (copy)
				if var12.current then
					var12.current:Disconnect()
					var12.current = nil
				end
				if var13.current then
					var13.current:Disconnect()
					var13.current = nil
				end
				if var10.current then
					var10.current:Cancel()
					var10.current = nil
				end
				if var11.current then
					var11.current:Cancel()
					var11.current = nil
				end
				if var14.current then
					task.cancel(var14.current)
					var14.current = nil
				end
				if var15.current then
					task.cancel(var15.current)
					var15.current = nil
				end
			end
			
			local function _()
				-- upvalues: numberValue (ref), buttonSize (copy), numberValue_1 (ref), var5 (copy), var7 (copy), var9 (copy)
				numberValue.Value = buttonSize
				numberValue_1.Value = 1
				var5(buttonSize)
				var7(1)
				var9(true)
			end
			
			local function showAnimated()
				-- upvalues: stopAllAnimations (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), numberValue (ref), buttonSize (copy), numberValue_1 (ref), var5 (copy), var7 (copy), var9 (copy), tweenService (copy), tweenInfo (copy), var10 (copy), var14 (copy), tweenInfo_2 (copy), var11 (copy)
				local var22
				stopAllAnimations()
				
				if shopGlobalIconAnimGracePeriodMs > 0 then
					var22 = currentTime and tick() - currentTime
					
					if var22 == nil or var22 < shopGlobalIconAnimGracePeriodMs / 1000 then
						numberValue.Value = buttonSize
						numberValue_1.Value = 1
						var5(buttonSize)
						var7(1)
						var9(true)
						
						return
					end
				end
				numberValue.Value = 0
				numberValue_1.Value = 0
				var9(false)
				var22 = tweenService:Create(numberValue, tweenInfo, { Value = buttonSize })
				var10.current = var22
				var22:Play()
				var14.current = task.delay(0.2, function()
					-- upvalues: var14 (copy), var9 (copy), tweenService (copy), numberValue_1 (copy), tweenInfo_2 (copy), var11 (copy)
					var14.current = nil
					var9(true)
					local var23 = tweenService:Create(numberValue_1, tweenInfo_2, { Value = 1 })
					var11.current = var23
					var23:Play()
				end)
			end
			
			local function hideAnimated()
				-- upvalues: stopAllAnimations (ref), tweenService (copy), numberValue_1 (ref), tweenInfo_3 (copy), var11 (copy), var12 (copy), var9 (copy), var14 (copy), numberValue (ref), tweenInfo_1 (copy), var10 (copy), var13 (copy), var15 (copy), var18 (copy)
				stopAllAnimations()
				local var22 = tweenService:Create(numberValue_1, tweenInfo_3, { Value = 0 })
				var11.current = var22
				var12.current = var22.Completed:Connect(function(p2)
					-- upvalues: var12 (copy), var9 (copy)
					if p2 == Enum.PlaybackState.Completed then
						var12.current = nil
						var9(false)
						
						return
					end
				end)
				var22:Play()
				var14.current = task.delay(0.2, function()
					-- upvalues: var14 (copy), tweenService (copy), numberValue (copy), tweenInfo_1 (copy), var10 (copy), var13 (copy), var15 (copy), var18 (copy)
					var14.current = nil
					local var23 = tweenService:Create(numberValue, tweenInfo_1, { Value = 0 })
					var10.current = var23
					var13.current = var23.Completed:Connect(function(p2)
						-- upvalues: var13 (copy), var15 (copy), var18 (copy)
						if p2 == Enum.PlaybackState.Completed then
							var13.current = nil
							var15.current = task.delay(1.5, function()
								-- upvalues: var15 (copy), var18 (copy)
								var15.current = nil
								
								if var18.current then
									var18.current()
								end
							end)
							
							return
						end
					end)
					var23:Play()
				end)
			end
			
			var18.current = showAnimated
			var19.current = hideAnimated
			showAnimated()
			
			return function()
				-- upvalues: stopAllAnimations (ref), var20 (ref), var21 (ref), numberValue (ref), numberValue_1 (ref), var16 (copy), var17 (copy)
				stopAllAnimations()
				var20:Disconnect()
				var21:Disconnect()
				numberValue:Destroy()
				numberValue_1:Destroy()
				var16.current = nil
				var17.current = nil
			end
		end, { buttonSize })
		reactModule.useEffect(function()
			-- upvalues: p1 (ref)
			return function()
				-- upvalues: p1 (copy)
				if p1.onAreaChanged then
					p1.onAreaChanged("experience-shop-icon", Vector2.zero, Vector2.zero)
				end
			end
		end, { p1.onAreaChanged })
		
		local function reportArea(p2)
			-- upvalues: p1 (ref)
			if p1.onAreaChanged then
				p1.onAreaChanged("experience-shop-icon", p2.AbsolutePosition, p2.AbsoluteSize)
			end
		end
		
		return reactModule.createElement("Frame", {
			Size = UDim2.fromOffset((if buttonSize == 0 then 0 else var4 / buttonSize * leftGap) + var4, buttonSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.layoutOrder,
			[reactModule.Change.AbsolutePosition] = reportArea,
			[reactModule.Change.AbsoluteSize] = reportArea
		}, {
			Button = var8 and (reactModule.createElement(foundationModule.View, {
				Size = UDim2.fromOffset(buttonSize, buttonSize),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -buttonSize / 2, 0.5, 0),
				cornerRadius = UDim.new(1, 0),
				backgroundStyle = var3.Color.OverMedia.OverMedia_0,
				onActivated = function()
					-- upvalues: fFlagEnableShopIconTelemetryModule (copy), runService (copy), parent (copy), inExperienceShop (copy), p1 (ref)
					if fFlagEnableShopIconTelemetryModule and not runService:IsStudio() then
						local loggingProtocolModule = require(parent.LoggingProtocol)
						loggingProtocolModule.default:logRobloxTelemetryEvent(require(inExperienceShop.Events.ShopIconClickEvent), {
							loggingProtocolModule.StandardizedFields.addPlaceId,
							loggingProtocolModule.StandardizedFields.addUniverseId,
							loggingProtocolModule.StandardizedFields.addSessionId
						}, {})
					end
					if p1.onActivated then
						p1.onActivated()
					end
				end,
				scale = var6
			}, {
				Icon = if fFlagExperienceShopNewIconographyModule then reactModule.createElement(foundationModule.Icon, {
					ZIndex = 1,
					name = iconName.ShoppingBasket,
					size = buttonSize * 0.55,
					variant = if p1.isActive then iconVariant.Filled else iconVariant.Regular,
					style = var3.Color.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) elseif p1.icon ~= nil then reactModule.createElement(foundationModule.Icon, {
					ZIndex = 1,
					name = iconName.BuildingStore,
					size = buttonSize * 0.55,
					variant = if p1.isActive then iconVariant.Filled else iconVariant.Regular,
					style = var3.Color.Content.Emphasis,
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
					CustomIcon = p1.icon
				}),
				StatusIndicator = p1.showStatusIndicator and reactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.fromOffset(8, 8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(var2 + 0.5, 1 - (var1 + 0.5)),
					BackgroundColor3 = var3.Color.System.Emphasis.Color3,
					BackgroundTransparency = var3.Color.System.Emphasis.Transparency
				}, {
					UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					UIStroke = reactModule.createElement("UIStroke", {
						Thickness = 2,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = var3.Color.OverMedia.OverMedia_0.Color3,
						Transparency = var3.Color.OverMedia.OverMedia_0.Transparency
					})
				}) or nil
			}) or nil)
		})
	end
	return nil
end