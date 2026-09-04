local runService = game:GetService("RunService")
local tweenService = game:GetService("TweenService")
local inExperienceShop = script:FindFirstAncestor("InExperienceShop")
local parent = inExperienceShop.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagEnableExperienceShopGlobalIconModule = require(inExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local fFlagEnableShopIconTelemetryModule = require(inExperienceShop.Flags.FFlagEnableShopIconTelemetry)
local fFlagOfferNotifyOnGlobalIcon = sharedFlagsModule.FFlagOfferNotifyOnGlobalIcon
local shopGlobalIconAnimGracePeriodMs = game:DefineFastInt("ShopGlobalIconAnimGracePeriodMs", 3000)
local getShopGlobalIconStoreModule = require(inExperienceShop.Stores.GetShopGlobalIconStore)
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
	-- upvalues: fFlagEnableExperienceShopGlobalIconModule (ref), useTokens (ref), fFlagOfferNotifyOnGlobalIcon (ref), getShopGlobalIconStoreModule (ref), reactModule (ref), shopGlobalIconAnimGracePeriodMs (ref), currentTime (write), tweenService (ref), tweenInfo (ref), tweenInfo_2 (ref), tweenInfo_3 (ref), tweenInfo_1 (ref), fFlagEnableShopIconTelemetryModule (ref), runService (ref), parent (ref), inExperienceShop (ref), foundationModule (ref), fFlagExperienceShopNewIconographyModule (ref), iconName (ref), iconVariant (ref), var2 (ref), var1 (ref)
	if fFlagEnableExperienceShopGlobalIconModule then
		local var3 = useTokens()
		local buttonSize = p1.buttonSize
		local leftGap = p1.leftGap or 0
		local var4 = if fFlagOfferNotifyOnGlobalIcon then getShopGlobalIconStoreModule(false).setIconInstance else nil
		local var5, var6 = reactModule.useState(0)
		local var7, var8 = reactModule.useState(0)
		local var9, var10 = reactModule.useState(false)
		local var11 = reactModule.useRef(nil)
		local var12 = reactModule.useRef(nil)
		local var13 = reactModule.useRef(nil)
		local var14 = reactModule.useRef(nil)
		local var15 = reactModule.useRef(nil)
		local var16 = reactModule.useRef(nil)
		local var17 = reactModule.useRef(nil)
		local var18 = reactModule.useRef(nil)
		local var19 = reactModule.useRef(nil)
		local var20 = reactModule.useRef(nil)
		reactModule.useEffect(function()
			-- upvalues: var17 (ref), var18 (ref), var6 (ref), var8 (ref), var13 (ref), var14 (ref), var11 (ref), var12 (ref), var15 (ref), var16 (ref), buttonSize (ref), var10 (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), tweenService (copy), tweenInfo (copy), tweenInfo_2 (copy), tweenInfo_3 (copy), tweenInfo_1 (copy), var19 (ref), var20 (ref)
			local numberValue = Instance.new("NumberValue")
			numberValue.Value = 0
			var17.current = numberValue
			local numberValue_1 = Instance.new("NumberValue")
			numberValue_1.Value = 0
			var18.current = numberValue_1
			local var21 = numberValue:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: var6 (copy), numberValue (ref)
				var6(numberValue.Value)
			end)
			local var22 = numberValue_1:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: var8 (copy), numberValue_1 (ref)
				var8(numberValue_1.Value)
			end)
			
			local function stopAllAnimations()
				-- upvalues: var13 (copy), var14 (copy), var11 (copy), var12 (copy), var15 (copy), var16 (copy)
				if var13.current then
					var13.current:Disconnect()
					var13.current = nil
				end
				if var14.current then
					var14.current:Disconnect()
					var14.current = nil
				end
				if var11.current then
					var11.current:Cancel()
					var11.current = nil
				end
				if var12.current then
					var12.current:Cancel()
					var12.current = nil
				end
				if var15.current then
					task.cancel(var15.current)
					var15.current = nil
				end
				if var16.current then
					task.cancel(var16.current)
					var16.current = nil
				end
			end
			
			local function _()
				-- upvalues: numberValue (ref), buttonSize (copy), numberValue_1 (ref), var6 (copy), var8 (copy), var10 (copy)
				numberValue.Value = buttonSize
				numberValue_1.Value = 1
				var6(buttonSize)
				var8(1)
				var10(true)
			end
			
			local function showAnimated()
				-- upvalues: stopAllAnimations (ref), shopGlobalIconAnimGracePeriodMs (copy), currentTime (copy), numberValue (ref), buttonSize (copy), numberValue_1 (ref), var6 (copy), var8 (copy), var10 (copy), tweenService (copy), tweenInfo (copy), var11 (copy), var15 (copy), tweenInfo_2 (copy), var12 (copy)
				local var23
				stopAllAnimations()
				
				if shopGlobalIconAnimGracePeriodMs > 0 then
					var23 = currentTime and tick() - currentTime
					
					if var23 == nil or var23 < shopGlobalIconAnimGracePeriodMs / 1000 then
						numberValue.Value = buttonSize
						numberValue_1.Value = 1
						var6(buttonSize)
						var8(1)
						var10(true)
						
						return
					end
				end
				numberValue.Value = 0
				numberValue_1.Value = 0
				var10(false)
				var23 = tweenService:Create(numberValue, tweenInfo, { Value = buttonSize })
				var11.current = var23
				var23:Play()
				var15.current = task.delay(0.2, function()
					-- upvalues: var15 (copy), var10 (copy), tweenService (copy), numberValue_1 (copy), tweenInfo_2 (copy), var12 (copy)
					var15.current = nil
					var10(true)
					local var24 = tweenService:Create(numberValue_1, tweenInfo_2, { Value = 1 })
					var12.current = var24
					var24:Play()
				end)
			end
			
			local function hideAnimated()
				-- upvalues: stopAllAnimations (ref), tweenService (copy), numberValue_1 (ref), tweenInfo_3 (copy), var12 (copy), var13 (copy), var10 (copy), var15 (copy), numberValue (ref), tweenInfo_1 (copy), var11 (copy), var14 (copy), var16 (copy), var19 (copy)
				stopAllAnimations()
				local var23 = tweenService:Create(numberValue_1, tweenInfo_3, { Value = 0 })
				var12.current = var23
				var13.current = var23.Completed:Connect(function(p2)
					-- upvalues: var13 (copy), var10 (copy)
					if p2 == Enum.PlaybackState.Completed then
						var13.current = nil
						var10(false)
						
						return
					end
				end)
				var23:Play()
				var15.current = task.delay(0.2, function()
					-- upvalues: var15 (copy), tweenService (copy), numberValue (copy), tweenInfo_1 (copy), var11 (copy), var14 (copy), var16 (copy), var19 (copy)
					var15.current = nil
					local var24 = tweenService:Create(numberValue, tweenInfo_1, { Value = 0 })
					var11.current = var24
					var14.current = var24.Completed:Connect(function(p2)
						-- upvalues: var14 (copy), var16 (copy), var19 (copy)
						if p2 == Enum.PlaybackState.Completed then
							var14.current = nil
							var16.current = task.delay(1.5, function()
								-- upvalues: var16 (copy), var19 (copy)
								var16.current = nil
								
								if var19.current then
									var19.current()
								end
							end)
							
							return
						end
					end)
					var24:Play()
				end)
			end
			
			var19.current = showAnimated
			var20.current = hideAnimated
			showAnimated()
			
			return function()
				-- upvalues: stopAllAnimations (ref), var21 (ref), var22 (ref), numberValue (ref), numberValue_1 (ref), var17 (copy), var18 (copy)
				stopAllAnimations()
				var21:Disconnect()
				var22:Disconnect()
				numberValue:Destroy()
				numberValue_1:Destroy()
				var17.current = nil
				var18.current = nil
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
			Size = UDim2.fromOffset((if buttonSize == 0 then 0 else var5 / buttonSize * leftGap) + var5, buttonSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.layoutOrder,
			[reactModule.Change.AbsolutePosition] = reportArea,
			[reactModule.Change.AbsoluteSize] = reportArea
		}, {
			Button = var9 and (reactModule.createElement(foundationModule.View, {
				ref = var4,
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
				scale = var7
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