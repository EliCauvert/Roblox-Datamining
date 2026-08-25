local tweenService = game:GetService("TweenService")
local parent = script:FindFirstAncestor("ExpChat").Parent
local expChatSharedModule = require(parent.ExpChatShared)
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local presetCooldownContextModule = require(script.Parent.PresetCooldownContext)
local var5 = expChatSharedModule.Flags.FIntPresetChatCooldownLuaMs / 1000

return reactModule.memo(function(value)
	-- upvalues: foundationModule (ref), reactModule (ref), presetCooldownContextModule (ref), var5 (ref), tweenService (ref)
	local var6 = foundationModule.Hooks.useTokens()
	local circle = var6.Radius.Circle
	local var7 = reactModule.useContext(presetCooldownContextModule)
	local var8 = var7 ~= nil and var7.isCooldownActive
	local var9 = if var7 ~= nil then nil else var7.endsAt
	local var10 = reactModule.useCallback(function()
		-- upvalues: value (ref)
		value.onActivated(value.presetId)
	end, { value.onActivated, value.presetId })
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = reactModule.useCallback(function(p0)
		-- upvalues: var11 (ref), var12 (ref)
		if var11 == nil and p0 and p0.AbsoluteSize.X > 0 then
			var12(p0.AbsoluteSize)
		end
	end, { var11 })
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var11 (ref), var13 (ref), var5 (copy), tweenService (copy)
		if var9 == nil or var11 == nil then return end
		local current = var13.current
		
		if current == nil then return end
		local var15 = var9 - os.clock()
		
		if var15 <= 0 then
			return
		end
		current.Size = UDim2.fromOffset(var11.X * math.clamp(var15 / var5, 0, 1), var11.Y)
		local var16 = tweenService:Create(current, TweenInfo.new(var15, Enum.EasingStyle.Linear), { Size = UDim2.fromOffset(0, var11.Y) })
		var16:Play()
		
		return function()
			-- upvalues: var16 (ref)
			var16:Cancel()
			var16:Destroy()
		end
	end, { var9, var11 })
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-0-800 auto-x radius-circle clip",
		onAbsoluteSizeChanged = var14,
		LayoutOrder = value.layoutOrder or 0,
		backgroundStyle = var6.Color.ActionStandard.Background,
		onActivated = var10,
		isDisabled = var8,
		cursor = {
			radius = UDim.new(0, circle),
			offset = math.floor(var6.Stroke.Thicker) * 2,
			borderWidth = math.floor(var6.Stroke.Thicker)
		},
		ref = value.buttonRef
	}, {
		CooldownClipFrame = if var8 and var9 ~= nil and var11 ~= nil then reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			BorderSizePixel = 0,
			ZIndex = 1,
			ref = var13,
			Size = UDim2.fromOffset(var11.X, var11.Y)
		}, {
			CooldownOverlay = reactModule.createElement("Frame", {
				BorderSizePixel = 0,
				Size = UDim2.new(0, var11.X, 1, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = var6.Color.Shift.Shift_400.Color3,
				BackgroundTransparency = var6.Color.Shift.Shift_400.Transparency
			}, {
				UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, circle) })
			})
		}) else nil,
		Text = reactModule.createElement(foundationModule.Text, {
			tag = "size-0-full auto-x text-label-medium",
			ZIndex = 2,
			Text = value.text,
			textStyle = var6.Color.ActionStandard.Foreground,
			padding = {
				left = UDim.new(0, var6.Padding.Medium),
				right = UDim.new(0, var6.Padding.Medium)
			}
		})
	})
end)