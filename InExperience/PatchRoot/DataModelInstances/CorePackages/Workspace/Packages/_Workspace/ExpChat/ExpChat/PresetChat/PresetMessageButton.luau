local tweenService = game:GetService("TweenService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local expChatSharedModule = require(parent.ExpChatShared)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local presetCooldownContextModule = require(script.Parent.PresetCooldownContext)
local var1 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

return reactModule.memo(function(value)
	-- upvalues: foundationModule (ref), reactModule (ref), presetCooldownContextModule (ref), var1 (ref), tweenService (ref)
	local var2 = foundationModule.Hooks.useTokens()
	local circle = var2.Radius.Circle
	local var3 = reactModule.useContext(presetCooldownContextModule)
	local var4 = var3 ~= nil and var3.isCooldownActive
	local var5 = if var3 ~= nil then nil else var3.endsAt
	local var6 = reactModule.useCallback(function()
		-- upvalues: value (ref)
		value.onActivated(value.presetId)
	end, { value.onActivated, value.presetId })
	local var7, var8 = reactModule.useState(nil)
	local var9 = reactModule.useRef(nil)
	local var10 = reactModule.useCallback(function(p1)
		-- upvalues: var7 (ref), var8 (ref)
		if var7 == nil and p1 and p1.AbsoluteSize.X > 0 then
			var8(p1.AbsoluteSize)
		end
	end, { var7 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), var7 (ref), var9 (ref), var1 (copy), tweenService (copy)
		if var5 == nil or var7 == nil then return end
		local current = var9.current
		
		if current == nil then return end
		local var11 = var5 - os.clock()
		
		if var11 <= 0 then
			return
		end
		current.Size = UDim2.fromOffset(var7.X * math.clamp(var11 / var1, 0, 1), var7.Y)
		local var12 = tweenService:Create(current, TweenInfo.new(var11, Enum.EasingStyle.Linear), { Size = UDim2.fromOffset(0, var7.Y) })
		var12:Play()
		
		return function()
			-- upvalues: var12 (ref)
			var12:Cancel()
			var12:Destroy()
		end
	end, { var5, var7 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-0-800 auto-x radius-circle clip",
		onAbsoluteSizeChanged = var10,
		LayoutOrder = value.layoutOrder or 0,
		backgroundStyle = var2.Color.ActionStandard.Background,
		onActivated = var6,
		isDisabled = var4,
		cursor = {
			radius = UDim.new(0, circle),
			offset = math.floor(var2.Stroke.Thicker) * 2,
			borderWidth = math.floor(var2.Stroke.Thicker)
		},
		ref = value.buttonRef
	}, {
		CooldownClipFrame = if var4 and var5 ~= nil and var7 ~= nil then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			ZIndex = 1,
			ref = var9,
			Size = UDim2.fromOffset(var7.X, var7.Y)
		}, {
			CooldownOverlay = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, var7.X, 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var2.Color.Shift.Shift_400.Color3,
				BackgroundTransparency = var2.Color.Shift.Shift_400.Transparency
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, circle) })
			})
		}) else nil,
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "size-0-full auto-x text-label-medium",
			ZIndex = 2,
			Text = value.text,
			textStyle = var2.Color.ActionStandard.Foreground,
			padding = {
				left = UDim.new(0, var2.Padding.Medium),
				right = UDim.new(0, var2.Padding.Medium)
			}
		})
	})
end)