local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
local skeleton = foundationModule.Skeleton
local view = foundationModule.View
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local progress = foundationModule.Progress
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local progressShape = foundationModule.Enums.ProgressShape
local progressSize = foundationModule.Enums.ProgressSize
local useTokens = foundationModule.Hooks.useTokens
local _ = require(script.Parent.types)

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), runService (ref), view (ref), skeleton (ref), foundationModule (ref), icon (ref), iconName (ref), iconSize (ref), iconButton (ref), inputSize (ref), progress (ref), progressShape (ref), progressSize (ref), image (ref)
	local var1 = useTokens()
	local var2, var3 = reactModule.useState(true)
	local var4 = reactModule.useRef(nil)
	local var5, var6 = reactModule.useBinding(0)
	local var7 = if p1.isIcon then 1 else 1.777777777778
	local var8 = reactModule.useCallback(function()
		-- upvalues: var3 (ref), var2 (ref)
		var3(not var2)
	end, { var2 })
	reactModule.useEffect(function()
		-- upvalues: p1 (ref), var4 (ref), runService (copy), var6 (ref)
		if p1.mediaType ~= "video" then
			return nil
		elseif var4.current then
			local renderSteppedConnection = runService.RenderStepped:Connect(function()
				-- upvalues: var4 (copy), var6 (copy)
				local current = var4.current
				
				if current and current.TimeLength > 0 then
					var6(100 * current.TimePosition / current.TimeLength)
				end
			end)
			
			return function()
				-- upvalues: renderSteppedConnection (ref)
				renderSteppedConnection:Disconnect()
			end
		end
		return nil
	end, { p1.mediaType })
	
	return if p1.isLoading then reactModule.createElement(view, {
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p1.LayoutOrder,
		aspectRatio = {
			AspectRatio = var7,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		LoadingSkeleton = reactModule.createElement(skeleton, {
			radius = foundationModule.Enums.Radius.Medium,
			Size = UDim2.fromScale(1, 1)
		})
	}) elseif not (not p1.assetSource and not p1.imageContent) then if p1.mediaType == "video" then reactModule.createElement(view, {
		Size = UDim2.fromScale(1, 1),
		aspectRatio = {
			AspectRatio = var7,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		LayoutOrder = p1.LayoutOrder
	}, {
		Video = reactModule.createElement("VideoFrame", {
			Looped = true,
			Volume = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Video = p1.assetSource,
			VideoContent = p1.imageContent,
			Playing = var2,
			ref = var4
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
			PlayPauseButton = reactModule.createElement(iconButton, {
				Position = UDim2.new(0, 0, 1, -var1.Gap.XSmall),
				AnchorPoint = Vector2.new(0, 1),
				icon = if var2 then iconName.PauseSmall else iconName.PlaySmall,
				size = inputSize.Small,
				onActivated = var8
			})
		}),
		ProgressBar = reactModule.createElement(progress, {
			Position = UDim2.new(0, 0, 1, var1.Gap.Medium),
			value = var5,
			shape = progressShape.Bar,
			size = progressSize.Medium
		})
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-center radius-large clip bg-surface-200",
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p1.LayoutOrder,
		aspectRatio = {
			AspectRatio = var7,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		PreviewImage = if p1.imageContent then reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ImageContent = p1.imageContent,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) })
		}) else reactModule.createElement(image, {
			tag = "size-full radius-large",
			Image = p1.assetSource,
			ScaleType = Enum.ScaleType.Crop
		})
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-center radius-large clip bg-surface-200",
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p1.LayoutOrder,
		aspectRatio = {
			AspectRatio = var7,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		PlaceholderIcon = reactModule.createElement(icon, {
			tag = "auto-xy content-default",
			name = iconName.Image,
			size = iconSize.XLarge
		})
	})
end