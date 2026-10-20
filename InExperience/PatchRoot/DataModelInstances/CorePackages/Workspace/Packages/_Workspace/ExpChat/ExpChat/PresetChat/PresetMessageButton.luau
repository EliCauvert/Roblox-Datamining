local TweenService = game:GetService("TweenService")
local Parent = script:FindFirstAncestor("ExpChat").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local PresetCooldownContextModule = require(script.Parent.PresetCooldownContext)
local FIntPresetChatCooldownLuaMsRatio = require(Parent.ExpChatShared).Flags.FIntPresetChatCooldownLuaMs / 1000

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), PresetCooldownContextModule (copy), FIntPresetChatCooldownLuaMsRatio (copy), TweenService (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Circle = UseTokensResult.Radius.Circle
	local UseContextResult = ReactModule.useContext(PresetCooldownContextModule)
	local IsCooldownActive = UseContextResult ~= nil and UseContextResult.isCooldownActive
	local EndsAt = if UseContextResult == nil then nil else UseContextResult.endsAt
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onActivated(p1.presetId)
	end, { p1.onActivated, p1.presetId })
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult1 = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult == nil and Frame and Frame.AbsoluteSize.X > 0 then
			UseStateResult2(Frame.AbsoluteSize)
		end
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: EndsAt (copy), UseStateResult (copy), UseRefResult (copy), FIntPresetChatCooldownLuaMsRatio (upval), TweenService (upval)
		if EndsAt == nil or UseStateResult == nil then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local EndsAtDelta = EndsAt - os.clock()
		
		if EndsAtDelta <= 0 then return end
		Current.Size = UDim2.fromOffset(UseStateResult.X * math.clamp(EndsAtDelta / FIntPresetChatCooldownLuaMsRatio, 0, 1), UseStateResult.Y)
		local Tween = TweenService:Create(Current, TweenInfo.new(EndsAtDelta, Enum.EasingStyle.Linear), { Size = UDim2.fromOffset(0, UseStateResult.Y) })
		Tween:Play()
		
		return function()
			-- upvalues: Tween (copy)
			Tween:Cancel()
			Tween:Destroy()
		end
	end, { EndsAt, UseStateResult })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-0-800 auto-x radius-circle clip",
		onAbsoluteSizeChanged = UseResult1,
		LayoutOrder = p1.layoutOrder or 0,
		backgroundStyle = UseTokensResult.Color.ActionStandard.Background,
		onActivated = UseResult,
		isDisabled = IsCooldownActive,
		cursor = {
			radius = UDim.new(0, Circle),
			offset = math.floor(UseTokensResult.Stroke.Thicker) * 2,
			borderWidth = math.floor(UseTokensResult.Stroke.Thicker)
		},
		ref = p1.buttonRef
	}, {
		CooldownClipFrame = if IsCooldownActive and EndsAt ~= nil and UseStateResult ~= nil then ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			ZIndex = 1,
			ref = UseRefResult,
			Size = UDim2.fromOffset(UseStateResult.X, UseStateResult.Y)
		}, {
			CooldownOverlay = ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, UseStateResult.X, 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = UseTokensResult.Color.Shift.Shift_400.Color3,
				BackgroundTransparency = UseTokensResult.Color.Shift.Shift_400.Transparency
			}, {
				UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, Circle) })
			})
		}) else nil,
		Text = ReactModule.createElement(FoundationModule.Text, {
			tag = "size-0-full auto-x text-label-medium",
			ZIndex = 2,
			Text = p1.text,
			textStyle = UseTokensResult.Color.ActionStandard.Foreground,
			padding = {
				left = UDim.new(0, UseTokensResult.Padding.Medium),
				right = UDim.new(0, UseTokensResult.Padding.Medium)
			}
		})
	})
end)