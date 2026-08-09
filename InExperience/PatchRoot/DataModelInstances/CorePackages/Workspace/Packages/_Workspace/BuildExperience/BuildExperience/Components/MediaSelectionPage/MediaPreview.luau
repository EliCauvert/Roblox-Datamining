local runService = game:GetService("RunService")
local parent = script:FindFirstAncestor("BuildExperience").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local image = foundationModule.Image
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

return function(p0) --[[ line: 34 | named "MediaPreview" ]]
	-- upvalues: useTokens (ref), reactModule (ref), runService (ref), view (ref), icon (ref), iconName (ref), iconSize (ref), iconButton (ref), inputSize (ref), progress (ref), progressShape (ref), progressSize (ref), image (ref)
	local var3 = useTokens()
	local var4, var5 = reactModule.useState(true)
	local var6 = reactModule.useRef(nil)
	local var7, var8 = reactModule.useBinding(0)
	local var9 = if p0.isIcon then 1 else 1.777777777778
	local var10 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var5 (ref), var4 (ref)
		var5(not var4)
	end, { var4 })
	reactModule.useEffect(function() --[[ line: 46 ]]
		-- upvalues: p0 (ref), var6 (ref), runService (copy), var8 (ref)
		if p0.mediaType ~= "video" then
			return nil
		elseif var6.current then
			local renderSteppedConnection = runService.RenderStepped:Connect(function() --[[ line: 56 ]]
				-- upvalues: var6 (copy), var8 (copy)
				local current = var6.current
				
				if current and current.TimeLength > 0 then
					var8(100 * current.TimePosition / current.TimeLength)
				end
			end)
			
			return function() --[[ line: 63 ]]
				-- upvalues: renderSteppedConnection (ref)
				renderSteppedConnection:Disconnect()
			end
		end
		return nil
	end, { p0.mediaType })
	
	return if p0.assetSource then if p0.mediaType == "video" then reactModule.createElement(view, {
		Size = UDim2.fromScale(1, 1),
		aspectRatio = {
			AspectRatio = var9,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		LayoutOrder = p0.LayoutOrder
	}, {
		Video = reactModule.createElement("VideoFrame", {
			Looped = true,
			Volume = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Video = p0.assetSource,
			Playing = var4,
			ref = var6
		}, {
			UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
			PlayPauseButton = reactModule.createElement(iconButton, {
				Position = UDim2.new(0, 0, 1, -var3.Gap.XSmall),
				AnchorPoint = Vector2.new(0, 1),
				icon = if var4 then iconName.PauseSmall else iconName.PlaySmall,
				size = inputSize.Small,
				onActivated = var10
			})
		}),
		ProgressBar = reactModule.createElement(progress, {
			Position = UDim2.new(0, 0, 1, var3.Gap.Medium),
			value = var7,
			shape = progressShape.Bar,
			size = progressSize.Medium
		})
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-center radius-large clip bg-surface-200",
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p0.LayoutOrder,
		aspectRatio = {
			AspectRatio = var9,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		PreviewImage = reactModule.createElement(image, {
			tag = "size-full radius-large",
			Image = p0.assetSource,
			ScaleType = Enum.ScaleType.Fit
		})
	}) else reactModule.createElement(view, {
		tag = "align-x-center align-y-center radius-large clip bg-surface-200",
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = p0.LayoutOrder,
		aspectRatio = {
			AspectRatio = var9,
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