local tweenService = game:GetService("TweenService")
local chatUIPrimitives = script:FindFirstAncestor("ChatUIPrimitives")
local parent = chatUIPrimitives.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(chatUIPrimitives.UniversalMessage.Types)

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), tweenService (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local circle = var1.Radius.Circle
	local cooldownEndsAt = p1.cooldownEndsAt
	local cooldownDurationSeconds = p1.cooldownDurationSeconds
	local var2 = cooldownEndsAt ~= nil and os.clock() < cooldownEndsAt
	local var3, var4 = reactModule.useState(nil)
	local var5 = reactModule.useRef(nil)
	local var6 = reactModule.useCallback(function(p2)
		-- upvalues: var3 (ref), var4 (ref)
		if var3 == nil and p2 and p2.AbsoluteSize.X > 0 then
			var4(p2.AbsoluteSize)
		end
	end, { var3 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onActivated(p1.content)
	end, { p1.onActivated, p1.content })
	reactModule.useEffect(function()
		-- upvalues: cooldownEndsAt (ref), var3 (ref), var5 (ref), cooldownDurationSeconds (ref), tweenService (copy)
		if cooldownEndsAt == nil or var3 == nil then return end
		local current = var5.current
		
		if current == nil then return end
		local var8 = cooldownEndsAt - os.clock()
		
		if var8 <= 0 then
			return
		end
		current.Size = UDim2.fromOffset(var3.X * math.clamp(var8 / cooldownDurationSeconds, 0, 1), var3.Y)
		local var9 = tweenService:Create(current, TweenInfo.new(var8, Enum.EasingStyle.Linear), { Size = UDim2.fromOffset(0, var3.Y) })
		var9:Play()
		
		return function()
			-- upvalues: var9 (ref)
			var9:Cancel()
			var9:Destroy()
		end
	end, { cooldownEndsAt, var3, cooldownDurationSeconds })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-0-800 auto-x radius-circle clip",
		onAbsoluteSizeChanged = var6,
		LayoutOrder = p1.layoutOrder or 0,
		backgroundStyle = var1.Color.ActionStandard.Background,
		onActivated = var7,
		isDisabled = var2,
		cursor = {
			radius = UDim.new(0, circle),
			offset = math.floor(var1.Stroke.Thicker) * 2,
			borderWidth = math.floor(var1.Stroke.Thicker)
		},
		ref = p1.buttonRef
	}, {
		CooldownClipFrame = if var2 and cooldownEndsAt ~= nil and var3 ~= nil then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			ZIndex = 1,
			ref = var5,
			Size = UDim2.fromOffset(var3.X, var3.Y)
		}, {
			CooldownOverlay = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, var3.X, 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var1.Color.Shift.Shift_400.Color3,
				BackgroundTransparency = var1.Color.Shift.Shift_400.Transparency
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, circle) })
			})
		}) else nil,
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "size-0-full auto-x text-label-medium",
			ZIndex = 2,
			Text = p1.text,
			textStyle = var1.Color.ActionStandard.Foreground,
			padding = {
				left = UDim.new(0, var1.Padding.Medium),
				right = UDim.new(0, var1.Padding.Medium)
			}
		})
	})
end)