local TweenService = game:GetService("TweenService")
local ChatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local Parent = ChatUIPrimitives.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(ChatUIPrimitives.UniversalMessage.Types)

return ReactModule.memo(function(p1)
	-- upvalues: FoundationModule (copy), ReactModule (copy), TweenService (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local Circle = UseTokensResult.Radius.Circle
	local CooldownEndsAt = p1.cooldownEndsAt
	local CooldownDurationSeconds = p1.cooldownDurationSeconds
	local IsClockTimeBelow: boolean = CooldownEndsAt ~= nil and os.clock() < CooldownEndsAt
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseResult = ReactModule.useCallback(function(Frame: Frame)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult == nil and Frame and Frame.AbsoluteSize.X > 0 then
			UseStateResult2(Frame.AbsoluteSize)
		end
	end, { UseStateResult })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: p1 (copy)
		p1.onActivated(p1.content)
	end, { p1.onActivated, p1.content })
	ReactModule.useEffect(function()
		-- upvalues: CooldownEndsAt (copy), UseStateResult (copy), UseRefResult (copy), CooldownDurationSeconds (copy), TweenService (upval)
		if CooldownEndsAt == nil or UseStateResult == nil then return end
		local Current = UseRefResult.current
		
		if Current == nil then return end
		local CooldownEndsAtDelta = CooldownEndsAt - os.clock()
		
		if CooldownEndsAtDelta <= 0 then return end
		Current.Size = UDim2.fromOffset(UseStateResult.X * math.clamp(CooldownEndsAtDelta / CooldownDurationSeconds, 0, 1), UseStateResult.Y)
		local Tween = TweenService:Create(Current, TweenInfo.new(CooldownEndsAtDelta, Enum.EasingStyle.Linear), { Size = UDim2.fromOffset(0, UseStateResult.Y) })
		Tween:Play()
		
		return function()
			-- upvalues: Tween (copy)
			Tween:Cancel()
			Tween:Destroy()
		end
	end, { CooldownEndsAt, UseStateResult, CooldownDurationSeconds })
	
	return ReactModule.createElement(FoundationModule.View, {
		tag = "size-0-800 auto-x radius-circle clip",
		onAbsoluteSizeChanged = UseResult,
		LayoutOrder = p1.layoutOrder or 0,
		backgroundStyle = UseTokensResult.Color.ActionStandard.Background,
		onActivated = UseResult1,
		isDisabled = IsClockTimeBelow,
		cursor = {
			radius = UDim.new(0, Circle),
			offset = math.floor(UseTokensResult.Stroke.Thicker) * 2,
			borderWidth = math.floor(UseTokensResult.Stroke.Thicker)
		},
		ref = p1.buttonRef
	}, {
		CooldownClipFrame = if IsClockTimeBelow and CooldownEndsAt ~= nil and UseStateResult ~= nil then ReactModule.createElement("Frame", {
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