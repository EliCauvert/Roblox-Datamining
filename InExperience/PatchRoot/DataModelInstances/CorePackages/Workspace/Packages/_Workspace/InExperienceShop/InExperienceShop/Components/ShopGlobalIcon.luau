local RunService = game:GetService("RunService")
local TweenService = game:GetService("TweenService")
local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagEnableExperienceShopGlobalIconModule = require(InExperienceShop.Flags.FFlagEnableExperienceShopGlobalIcon)
local FFlagEnableShopIconTelemetryModule = require(InExperienceShop.Flags.FFlagEnableShopIconTelemetry)
local FFlagOfferNotifyOnGlobalIcon = require(Parent.SharedFlags).FFlagOfferNotifyOnGlobalIcon
local ShopGlobalIconAnimGracePeriodMs = game:DefineFastInt("ShopGlobalIconAnimGracePeriodMs", 3000)
local GetShopGlobalIconStoreModule = require(InExperienceShop.Stores.GetShopGlobalIconStore)
local FFlagExperienceShopNewIconographyModule = require(InExperienceShop.Flags.FFlagExperienceShopNewIconography)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local IconName = FoundationModule.Enums.IconName
local IconVariant = FoundationModule.Enums.IconVariant
local v1: number = if FFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local v2: number = if FFlagExperienceShopNewIconographyModule then 0.23 else 0.2
local _TweenInfo = TweenInfo.new(0.35, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
local _TweenInfo1 = TweenInfo.new(0.2, Enum.EasingStyle.Quad, Enum.EasingDirection.In)
local _TweenInfo2 = TweenInfo.new(0.3, Enum.EasingStyle.Back, Enum.EasingDirection.Out)
local _TweenInfo3 = TweenInfo.new(0.2, Enum.EasingStyle.Back, Enum.EasingDirection.In)
local CurrentTime: number? = nil

if game:IsLoaded() then
	CurrentTime = tick()
else
	local Connection = nil
	Connection = game.Loaded:Connect(function()
		-- upvalues: CurrentTime (ref), Connection (ref)
		CurrentTime = tick()
		Connection:Disconnect()
	end)
end
return function(p1)
	-- upvalues: FFlagEnableExperienceShopGlobalIconModule (copy), UseTokensFunction (copy), FFlagOfferNotifyOnGlobalIcon (copy), GetShopGlobalIconStoreModule (copy), ReactModule (copy), ShopGlobalIconAnimGracePeriodMs (copy), CurrentTime (ref), TweenService (copy), _TweenInfo (copy), _TweenInfo2 (copy), _TweenInfo3 (copy), _TweenInfo1 (copy), FFlagEnableShopIconTelemetryModule (copy), RunService (copy), Parent (copy), InExperienceShop (copy), FoundationModule (copy), FFlagExperienceShopNewIconographyModule (copy), IconName (copy), IconVariant (copy), v2 (copy), v1 (copy)
	if FFlagEnableExperienceShopGlobalIconModule then
		local UseTokensResult = UseTokensFunction()
		local ButtonSize: number = p1.buttonSize
		local LeftGap = p1.leftGap or 0
		local SetIconInstance = if FFlagOfferNotifyOnGlobalIcon then GetShopGlobalIconStoreModule(false).setIconInstance else nil
		local UseStateResult, UseStateResult2 = ReactModule.useState(0)
		local UseStateResult1, UseStateResult2_1 = ReactModule.useState(0)
		local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
		local UseRefResult = ReactModule.useRef(nil)
		local UseRefResult1 = ReactModule.useRef(nil)
		local UseRefResult2 = ReactModule.useRef(nil)
		local UseRefResult3 = ReactModule.useRef(nil)
		local UseRefResult4 = ReactModule.useRef(nil)
		local UseRefResult5 = ReactModule.useRef(nil)
		local UseRefResult6 = ReactModule.useRef(nil)
		local UseRefResult7 = ReactModule.useRef(nil)
		local UseRefResult8 = ReactModule.useRef(nil)
		local UseRefResult9 = ReactModule.useRef(nil)
		local UseRefResult10 = ReactModule.useRef(nil)
		local UseRefResult11 = ReactModule.useRef(p1.hidden)
		UseRefResult11.current = p1.hidden
		ReactModule.useEffect(function()
			-- upvalues: UseRefResult6 (copy), UseRefResult7 (copy), UseStateResult2 (copy), UseStateResult2_1 (copy), UseRefResult2 (copy), UseRefResult3 (copy), UseRefResult (copy), UseRefResult1 (copy), UseRefResult4 (copy), UseRefResult5 (copy), ButtonSize (copy), UseStateResult2_2 (copy), ShopGlobalIconAnimGracePeriodMs (upval), CurrentTime (upval), TweenService (upval), _TweenInfo (upval), _TweenInfo2 (upval), _TweenInfo3 (upval), _TweenInfo1 (upval), UseRefResult8 (copy), UseRefResult9 (copy), UseRefResult10 (copy), UseRefResult11 (copy)
			local NumValue = Instance.new("NumberValue")
			NumValue.Value = 0
			UseRefResult6.current = NumValue
			local NumValue1 = Instance.new("NumberValue")
			NumValue1.Value = 0
			UseRefResult7.current = NumValue1
			local Connection = NumValue:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: UseStateResult2 (upval), NumValue (copy)
				UseStateResult2(NumValue.Value)
			end)
			local Connection1 = NumValue1:GetPropertyChangedSignal("Value"):Connect(function()
				-- upvalues: UseStateResult2_1 (upval), NumValue1 (copy)
				UseStateResult2_1(NumValue1.Value)
			end)
			
			local function stopAllAnimations()
				-- upvalues: UseRefResult2 (upval), UseRefResult3 (upval), UseRefResult (upval), UseRefResult1 (upval), UseRefResult4 (upval), UseRefResult5 (upval)
				if UseRefResult2.current then
					UseRefResult2.current:Disconnect()
					UseRefResult2.current = nil
				end
				if UseRefResult3.current then
					UseRefResult3.current:Disconnect()
					UseRefResult3.current = nil
				end
				if UseRefResult.current then
					UseRefResult.current:Cancel()
					UseRefResult.current = nil
				end
				if UseRefResult1.current then
					UseRefResult1.current:Cancel()
					UseRefResult1.current = nil
				end
				if UseRefResult4.current then
					task.cancel(UseRefResult4.current)
					UseRefResult4.current = nil
				end
				if UseRefResult5.current then
					task.cancel(UseRefResult5.current)
					UseRefResult5.current = nil
				end
			end
			
			local function _()
				-- upvalues: NumValue (copy), ButtonSize (upval), NumValue1 (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval)
				NumValue.Value = ButtonSize
				NumValue1.Value = 1
				UseStateResult2(ButtonSize)
				UseStateResult2_1(1)
				UseStateResult2_2(true)
			end
			
			local function showAnimated()
				-- upvalues: stopAllAnimations (copy), ShopGlobalIconAnimGracePeriodMs (upval), CurrentTime (upval), NumValue (copy), ButtonSize (upval), NumValue1 (copy), UseStateResult2 (upval), UseStateResult2_1 (upval), UseStateResult2_2 (upval), TweenService (upval), _TweenInfo (upval), UseRefResult (upval), UseRefResult4 (upval), _TweenInfo2 (upval), UseRefResult1 (upval)
				stopAllAnimations()
				
				if ShopGlobalIconAnimGracePeriodMs > 0 then
					local Elapsed = CurrentTime and tick() - CurrentTime
					
					if Elapsed == nil or Elapsed < ShopGlobalIconAnimGracePeriodMs / 1000 then
						NumValue.Value = ButtonSize
						NumValue1.Value = 1
						UseStateResult2(ButtonSize)
						UseStateResult2_1(1)
						UseStateResult2_2(true)
						
						return
					end
				end
				NumValue.Value = 0
				NumValue1.Value = 0
				UseStateResult2_2(false)
				local Tween = TweenService:Create(NumValue, _TweenInfo, { Value = ButtonSize })
				UseRefResult.current = Tween
				Tween:Play()
				UseRefResult4.current = task.delay(0.2, function()
					-- upvalues: UseRefResult4 (upval), UseStateResult2_2 (upval), TweenService (upval), NumValue1 (upval), _TweenInfo2 (upval), UseRefResult1 (upval)
					UseRefResult4.current = nil
					UseStateResult2_2(true)
					local Tween = TweenService:Create(NumValue1, _TweenInfo2, { Value = 1 })
					UseRefResult1.current = Tween
					Tween:Play()
				end)
			end
			
			UseRefResult8.current = showAnimated
			
			function UseRefResult9.current()
				-- upvalues: stopAllAnimations (copy), TweenService (upval), NumValue1 (copy), _TweenInfo3 (upval), UseRefResult1 (upval), UseRefResult2 (upval), UseStateResult2_2 (upval), UseRefResult4 (upval), NumValue (copy), _TweenInfo1 (upval), UseRefResult (upval), UseRefResult3 (upval), UseRefResult5 (upval), UseRefResult8 (upval)
				stopAllAnimations()
				local Tween = TweenService:Create(NumValue1, _TweenInfo3, { Value = 0 })
				UseRefResult1.current = Tween
				UseRefResult2.current = Tween.Completed:Connect(function(PlaybackState)
					-- upvalues: UseRefResult2 (upval), UseStateResult2_2 (upval)
					if PlaybackState == Enum.PlaybackState.Completed then
						UseRefResult2.current = nil
						UseStateResult2_2(false)
						
						return
					end
				end)
				Tween:Play()
				UseRefResult4.current = task.delay(0.2, function()
					-- upvalues: UseRefResult4 (upval), TweenService (upval), NumValue (upval), _TweenInfo1 (upval), UseRefResult (upval), UseRefResult3 (upval), UseRefResult5 (upval), UseRefResult8 (upval)
					UseRefResult4.current = nil
					local Tween = TweenService:Create(NumValue, _TweenInfo1, { Value = 0 })
					UseRefResult.current = Tween
					UseRefResult3.current = Tween.Completed:Connect(function(PlaybackState)
						-- upvalues: UseRefResult3 (upval), UseRefResult5 (upval), UseRefResult8 (upval)
						if PlaybackState == Enum.PlaybackState.Completed then
							UseRefResult3.current = nil
							UseRefResult5.current = task.delay(1.5, function()
								-- upvalues: UseRefResult5 (upval), UseRefResult8 (upval)
								UseRefResult5.current = nil
								
								if UseRefResult8.current then
									UseRefResult8.current()
								end
							end)
							
							return
						end
					end)
					Tween:Play()
				end)
			end
			
			UseRefResult10.current = stopAllAnimations
			
			if not UseRefResult11.current then
				showAnimated()
			end
			return function()
				-- upvalues: stopAllAnimations (copy), Connection (copy), Connection1 (copy), NumValue (copy), NumValue1 (copy), UseRefResult6 (upval), UseRefResult7 (upval)
				stopAllAnimations()
				Connection:Disconnect()
				Connection1:Disconnect()
				NumValue:Destroy()
				NumValue1:Destroy()
				UseRefResult6.current = nil
				UseRefResult7.current = nil
			end
		end, { ButtonSize })
		local UseRefResult12 = ReactModule.useRef(false)
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy), UseRefResult12 (copy), UseRefResult6 (copy), UseRefResult7 (copy), UseRefResult10 (copy), UseStateResult2_2 (copy), ButtonSize (copy)
			if p1.hidden == nil then return end
			if not UseRefResult12.current then
				UseRefResult12.current = true
				
				return
			end
			local Current = UseRefResult6.current
			local Current1 = UseRefResult7.current
			
			if not Current or not Current1 then return end
			if UseRefResult10.current then
				UseRefResult10.current()
			end
			if p1.hidden then
				Current.Value = 0
				Current1.Value = 0
				UseStateResult2_2(false)
				
				return
			else
				Current.Value = ButtonSize
				Current1.Value = 1
				UseStateResult2_2(true)
			end
		end, { p1.hidden, ButtonSize })
		ReactModule.useEffect(function()
			-- upvalues: p1 (copy)
			return function()
				-- upvalues: p1 (upval)
				if p1.onAreaChanged then
					p1.onAreaChanged("experience-shop-icon", Vector2.zero, Vector2.zero)
				end
			end
		end, { p1.onAreaChanged })
		
		local function reportArea(Frame: Frame)
			-- upvalues: p1 (copy)
			if not p1.onAreaChanged then return end
			if p1.hidden then
				p1.onAreaChanged("experience-shop-icon", Vector2.zero, Vector2.zero)
				
				return
			else
				p1.onAreaChanged("experience-shop-icon", Frame.AbsolutePosition, Frame.AbsoluteSize)
			end
		end
		
		local function onActivated()
			-- upvalues: FFlagEnableShopIconTelemetryModule (upval), RunService (upval), Parent (upval), InExperienceShop (upval), p1 (copy)
			if FFlagEnableShopIconTelemetryModule and not RunService:IsStudio() then
				local LoggingProtocolModule = require(Parent.LoggingProtocol)
				LoggingProtocolModule.default:logRobloxTelemetryEvent(require(InExperienceShop.Events.ShopIconClickEvent), {
					LoggingProtocolModule.StandardizedFields.addPlaceId,
					LoggingProtocolModule.StandardizedFields.addUniverseId,
					LoggingProtocolModule.StandardizedFields.addSessionId
				}, {})
			end
			if p1.onActivated then
				p1.onActivated()
			end
		end
		
		return ReactModule.createElement("Frame", {
			Size = UDim2.fromOffset((if ButtonSize == 0 then 0 else UseStateResult / ButtonSize * LeftGap) + UseStateResult, ButtonSize),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.layoutOrder,
			[ReactModule.Change.AbsolutePosition] = reportArea,
			[ReactModule.Change.AbsoluteSize] = reportArea
		}, {
			Button = UseStateResult3 and ReactModule.createElement(FoundationModule.View, {
				ref = SetIconInstance,
				Size = UDim2.fromOffset(ButtonSize, ButtonSize),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.new(1, -ButtonSize / 2, 0.5, 0),
				cornerRadius = UDim.new(1, 0),
				backgroundStyle = UseTokensResult.Color.OverMedia.OverMedia_0,
				onActivated = onActivated,
				scale = UseStateResult1
			}, {
				Icon = if FFlagExperienceShopNewIconographyModule then ReactModule.createElement(FoundationModule.Icon, {
					ZIndex = 1,
					name = IconName.ShoppingBasket,
					size = ButtonSize * 0.55,
					variant = if p1.isActive then IconVariant.Filled else IconVariant.Regular,
					style = UseTokensResult.Color.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) elseif p1.icon == nil then ReactModule.createElement(FoundationModule.Icon, {
					ZIndex = 1,
					name = IconName.BuildingStore,
					size = ButtonSize * 0.55,
					variant = if p1.isActive then IconVariant.Filled else IconVariant.Regular,
					style = UseTokensResult.Color.Content.Emphasis,
					Position = UDim2.fromScale(0.5, 0.5),
					AnchorPoint = Vector2.new(0.5, 0.5)
				}) else ReactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					ZIndex = 1,
					Size = UDim2.fromScale(1, 1)
				}, {
					Layout = ReactModule.createElement("UIListLayout", {
						HorizontalAlignment = Enum.HorizontalAlignment.Center,
						VerticalAlignment = Enum.VerticalAlignment.Center
					}),
					CustomIcon = p1.icon
				}),
				StatusIndicator = p1.showStatusIndicator and ReactModule.createElement("Frame", {
					BorderSizePixel = 0,
					ZIndex = 3,
					Size = UDim2.fromOffset(8, 8),
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(v2 + 0.5, 1 - (v1 + 0.5)),
					BackgroundColor3 = UseTokensResult.Color.System.Emphasis.Color3,
					BackgroundTransparency = UseTokensResult.Color.System.Emphasis.Transparency
				}, {
					UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(1, 0) }),
					UIStroke = ReactModule.createElement("UIStroke", {
						Thickness = 2,
						ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
						Color = UseTokensResult.Color.OverMedia.OverMedia_0.Color3,
						Transparency = UseTokensResult.Color.OverMedia.OverMedia_0.Transparency
					})
				}) or nil
			}) or nil
		})
	else
		return nil
	end
end