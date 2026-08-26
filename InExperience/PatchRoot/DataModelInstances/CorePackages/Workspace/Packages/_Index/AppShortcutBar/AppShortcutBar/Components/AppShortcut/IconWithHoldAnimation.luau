local parent = script:FindFirstAncestor("AppShortcutBar").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local motionModule = require(parent.Motion)
local isBuilderIcon = foundationModule.Utility.isBuilderIcon
local useTokens = foundationModule.Hooks.useTokens
local icon = foundationModule.Icon

local function useAnimationValues(p1)
	-- upvalues: reactModule (ref), motionModule (ref)
	local var1 = reactModule.useMemo(function()
		-- upvalues: motionModule (copy)
		return {
			initial = motionModule.createState({ scale = 1, ringScale = 1 }, { default = motionModule.transition({ duration = 0.2 }) }),
			target = motionModule.createState({ scale = 0.8, ringScale = 1.15 }, { default = motionModule.transition({ duration = 0.3 }) })
		}
	end, {})
	local var2, var3 = motionModule.useMotion(var1.initial)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), p1 (ref), var1 (ref)
		var3(if p1 then var1.target else var1.initial)
	end, { p1, var3, var1 })
	
	return var2
end

local function CircularProgress(p1)
	-- upvalues: useTokens (ref), reactModule (ref)
	local var1 = useTokens()
	local size = p1.size
	local progress = p1.progress
	local var2 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, var1.Color.Content.Emphasis.Transparency),
			NumberSequenceKeypoint.new(0.4999, var1.Color.Content.Emphasis.Transparency),
			NumberSequenceKeypoint.new(0.5, 0.5),
			NumberSequenceKeypoint.new(1, 0.5)
		})
	end, { var1 })
	local var3 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0, var1.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.4999, var1.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.5, var1.Color.Content.Muted.Color3),
			ColorSequenceKeypoint.new(1, var1.Color.Content.Muted.Color3)
		})
	end, { var1 })
	
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
					Transparency = var2,
					Color = var3,
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
					Transparency = var2,
					Color = var3,
					Rotation = reactModule.useMemo(function()
						-- upvalues: progress (ref)
						return if progress then progress:map(function(p2)
							return math.clamp(p2 * 360, 0, 180)
						end) else 0
					end, { progress })
				})
			})
		})
	})
end

function IconWithHoldAnimation(p1)
	-- upvalues: useAnimationValues (ref), reactModule (ref), useTokens (ref), CircularProgress (ref), isBuilderIcon (ref), icon (ref)
	local layoutOrder = p1.layoutOrder
	local size = p1.size
	local position = p1.position
	local anchorPoint = p1.anchorPoint
	local progress = p1.progress
	local icon_1 = p1.icon
	local iconSize = p1.iconSize
	local var1 = useAnimationValues(progress)
	local var2, var3 = reactModule.useBinding(iconSize)
	reactModule.useEffect(function()
		-- upvalues: var3 (ref), iconSize (ref)
		var3(iconSize)
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
			UIScale = reactModule.createElement("UIScale", { Scale = var1.scale }),
			RingFrame = reactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				RingScale = reactModule.createElement("UIScale", { Scale = var1.ringScale }),
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
					size = var2,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				})
			})
		})
	})
end

return IconWithHoldAnimation