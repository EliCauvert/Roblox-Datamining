local Parent = script:FindFirstAncestor("AppShortcutBar").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local MotionModule = require(Parent.Motion)
local IsBuilderIconFunction = FoundationModule.Utility.isBuilderIcon
local UseTokensFunction = FoundationModule.Hooks.useTokens
local Icon = FoundationModule.Icon

local function useAnimationValues(Progress)
	-- upvalues: ReactModule (copy), MotionModule (copy)
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: MotionModule (upval)
		return {
			initial = MotionModule.createState({ scale = 1, ringScale = 1 }, { default = MotionModule.transition({ duration = 0.2 }) }),
			target = MotionModule.createState({ scale = 0.8, ringScale = 1.15 }, { default = MotionModule.transition({ duration = 0.3 }) })
		}
	end, {})
	local UseMotionResult, UseMotionResult2 = MotionModule.useMotion(UseMemoResult.initial)
	ReactModule.useEffect(function()
		-- upvalues: UseMotionResult2 (copy), Progress (copy), UseMemoResult (copy)
		UseMotionResult2(if Progress then UseMemoResult.target else UseMemoResult.initial)
	end, { Progress, UseMotionResult2, UseMemoResult })
	
	return UseMotionResult
end

local function CircularProgress(p1)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy)
	local UseTokensResult = UseTokensFunction()
	local Progress = p1.progress
	local UseMemoResult = ReactModule.useMemo(function(): NumberSequence
		-- upvalues: UseTokensResult (copy)
		return NumberSequence.new({
			NumberSequenceKeypoint.new(0, UseTokensResult.Color.Content.Emphasis.Transparency),
			NumberSequenceKeypoint.new(0.4999, UseTokensResult.Color.Content.Emphasis.Transparency),
			NumberSequenceKeypoint.new(0.5, 0.5),
			NumberSequenceKeypoint.new(1, 0.5)
		})
	end, { UseTokensResult })
	local UseMemoResult1 = ReactModule.useMemo(function(): ColorSequence
		-- upvalues: UseTokensResult (copy)
		return ColorSequence.new({
			ColorSequenceKeypoint.new(0, UseTokensResult.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.4999, UseTokensResult.Color.Content.Emphasis.Color3),
			ColorSequenceKeypoint.new(0.5, UseTokensResult.Color.Content.Muted.Color3),
			ColorSequenceKeypoint.new(1, UseTokensResult.Color.Content.Muted.Color3)
		})
	end, { UseTokensResult })
	
	return ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = p1.size }, {
		Left = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.fromScale(0.5, 1)
		}, {
			Image = ReactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(2, 1)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Transparency = UseMemoResult,
					Color = UseMemoResult1,
					Rotation = ReactModule.useMemo(function()
						-- upvalues: Progress (copy)
						return if Progress then Progress:map(function(p2: number): number
							return (math.clamp(p2 * 360, 180, 360))
						end) else 180
					end, { Progress })
				})
			})
		}),
		Right = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ClipsDescendants = true,
			Size = UDim2.fromScale(0.5, 1),
			Position = UDim2.fromScale(0.5, 0)
		}, {
			Image = ReactModule.createElement("ImageLabel", {
				Image = "rbxasset://textures/ui/Controls/RadialFill@3x.png",
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(2, 1),
				Position = UDim2.fromScale(-1, 0)
			}, {
				Gradient = ReactModule.createElement("UIGradient", {
					Transparency = UseMemoResult,
					Color = UseMemoResult1,
					Rotation = ReactModule.useMemo(function()
						-- upvalues: Progress (copy)
						return if Progress then Progress:map(function(p2: number): number
							return (math.clamp(p2 * 360, 0, 180))
						end) else 0
					end, { Progress })
				})
			})
		})
	})
end

function IconWithHoldAnimation(p1)
	-- upvalues: useAnimationValues (copy), ReactModule (copy), UseTokensFunction (copy), CircularProgress (copy), IsBuilderIconFunction (copy), Icon (copy)
	local LayoutOrder = p1.layoutOrder
	local Size = p1.size
	local Position = p1.position
	local AnchorPoint = p1.anchorPoint
	local Progress = p1.progress
	local Icon1 = p1.icon
	local IconSize = p1.iconSize
	local UseAnimationValuesResult = useAnimationValues(Progress)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(IconSize)
	ReactModule.useEffect(function()
		-- upvalues: UseBindingResult2 (copy), IconSize (copy)
		UseBindingResult2(IconSize)
	end, { IconSize })
	local Default = UseTokensFunction().Color.Content.Default
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = LayoutOrder,
		Size = Size,
		Position = Position,
		AnchorPoint = AnchorPoint
	}, {
		AnimationFrame = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.fromScale(1, 1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}, {
			UIScale = ReactModule.createElement("UIScale", { Scale = UseAnimationValuesResult.scale }),
			RingFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				RingScale = ReactModule.createElement("UIScale", { Scale = UseAnimationValuesResult.ringScale }),
				Progress = ReactModule.createElement(CircularProgress, { size = UDim2.fromScale(1, 1), progress = Progress })
			}),
			IconFrame = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.fromScale(1, 1),
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			}, {
				Icon = if IsBuilderIconFunction(Icon1) then ReactModule.createElement(Icon, {
					name = Icon1,
					size = UseBindingResult,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5)
				}) else ReactModule.createElement("ImageLabel", {
					BackgroundTransparency = 1,
					Image = Icon1,
					ImageColor3 = Default.Color3,
					ImageTransparency = Default.Transparency,
					AnchorPoint = Vector2.new(0.5, 0.5),
					Position = UDim2.fromScale(0.5, 0.5),
					Size = UDim2.fromOffset(IconSize, IconSize)
				})
			})
		})
	})
end

return IconWithHoldAnimation