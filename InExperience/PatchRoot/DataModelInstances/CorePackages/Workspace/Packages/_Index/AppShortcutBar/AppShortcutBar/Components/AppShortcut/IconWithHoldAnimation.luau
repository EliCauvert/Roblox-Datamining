local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon

local function useAnimationValues(p0)
	-- upvalues: reactModule (ref), motionModule (ref)
	local var5 = reactModule.useMemo(function()
		-- upvalues: motionModule (copy)
		return {
			initial = motionModule.createState({ scale = 1, ringScale = 1 }, { default = motionModule.transition({ duration = 0.2 }) }),
			target = motionModule.createState({ scale = 0.8, ringScale = 1.15 }, { default = motionModule.transition({ duration = 0.3 }) })
		}
	end, {})
	local var6, var7 = motionModule.useMotion(var5.initial)
	reactModule.useEffect(function()
		-- upvalues: var7 (ref), p0 (ref), var5 (ref)
		var7(if p0 then var5.target else var5.initial)
	end, { p0, var7, var5 })
	
	return var6
end

local function CircularProgress(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var8 = useTokens()
	local size = p1.size
	local progress = p1.progress
	local var9 = reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, var8.Color.Content.Emphasis.Transparency),
			NumberSequenceKeypoint.new(0.4999, var8.Color.Content.Emphasis.Transparency),
			NumberSequenceKeypoint.new(0.5, 0.5),
			NumberSequenceKeypoint.new(1, 0.5)
		})
	end, { var8 })
	local var10 = reactModule.useMemo(function()
		-- upvalues: var8 (ref)
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0, var8.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.4999, var8.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.5, var8.Color.Content.Muted.Color3),
			ColorSequenceKeypoint.new(1, var8.Color.Content.Muted.Color3)
		})
	end, { var8 })
	
	return reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = size }, {
		Left = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = reactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = var9,
					Color = var10,
					Rotation = reactModule.useMemo(function()
						-- upvalues: progress (ref)
						return if progress then progress:map(function(p2)
							return math.clamp(p2 * 360, 180, 360)
						end) else 180
					end, { progress })
				})
			})
		}),
		Right = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.fromScale(0.5, 1),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			Image = reactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = reactModule.createElement("UIGradient", {
					Transparency = var9,
					Color = var10,
					Rotation = reactModule.useMemo(function()
						-- upvalues: progress (ref)
						return if progress then progress:map(function(p3)
							return math.clamp(p3 * 360, 0, 180)
						end) else 0
					end, { progress })
				})
			})
		})
	})
end

function IconWithHoldAnimation(p4)
	-- upvalues: useAnimationValues (ref), reactModule (ref), useTokens (ref), CircularProgress (ref), isBuilderIcon (ref), icon (ref)
	local layoutOrder = p4.layoutOrder
	local size = p4.size
	local position = p4.position
	local anchorPoint = p4.anchorPoint
	local progress = p4.progress
	local icon_1 = p4.icon
	local iconSize = p4.iconSize
	local var11 = useAnimationValues(progress)
	local var12, var13 = reactModule.useBinding(iconSize)
	reactModule.useEffect(function()
		-- upvalues: var13 (ref), iconSize (ref)
		var13(iconSize)
	end, { iconSize })
	local default = useTokens().Color.Content.Default
	
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = layoutOrder,
		Size = size,
		Position = position,
		AnchorPoint = anchorPoint
	}, {
		AnimationFrame = reactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			UIScale = reactModule.createElement("UIScale", { Scale = var11.scale }),
			RingFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				RingScale = reactModule.createElement("UIScale", { Scale = var11.ringScale }),
				Progress = reactModule.createElement(CircularProgress, { size = UDim2.fromScale(1, 1), progress = progress })
			}),
			IconFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				Icon = if not isBuilderIcon(icon_1) then reactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = icon_1,
					ImageColor3 = default.Color3,
					ImageTransparency = default.Transparency,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(iconSize, iconSize)
				}) else reactModule.createElement(icon, {
					name = icon_1,
					size = var12,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			})
		})
	})
end

return IconWithHoldAnimation