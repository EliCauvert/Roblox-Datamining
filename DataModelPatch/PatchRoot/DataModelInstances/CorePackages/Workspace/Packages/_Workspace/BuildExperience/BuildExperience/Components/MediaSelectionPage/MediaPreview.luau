local RunService = game:GetService("RunService")
local Parent = script:FindFirstAncestor("BuildExperience").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Image = FoundationModule.Image
local View = FoundationModule.View
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Progress = FoundationModule.Progress
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize
local UseTokensFunction = FoundationModule.Hooks.useTokens
local _ = require(script.Parent.types)

return function(Frame: Frame)
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), RunService (copy), View (copy), Icon (copy), IconName (copy), IconSize (copy), IconButton (copy), InputSize (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Image (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseRefResult = ReactModule.useRef(nil)
	local UseBindingResult, UseBindingResult2 = ReactModule.useBinding(0)
	local AspectRatio: number = if Frame.isIcon then 1 else 1.7777777777777777
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
		UseStateResult2(not UseStateResult)
	end, { UseStateResult })
	ReactModule.useEffect(function()
		-- upvalues: Frame (copy), UseRefResult (copy), RunService (upval), UseBindingResult2 (copy)
		if Frame.mediaType ~= "video" then
			return nil
		elseif UseRefResult.current then
			local RenderSteppedConnection = RunService.RenderStepped:Connect(function()
				-- upvalues: UseRefResult (upval), UseBindingResult2 (upval)
				local Current = UseRefResult.current
				
				if Current and Current.TimeLength > 0 then
					UseBindingResult2(100 * Current.TimePosition / Current.TimeLength)
				end
			end)
			
			return function()
				-- upvalues: RenderSteppedConnection (copy)
				RenderSteppedConnection:Disconnect()
			end
		else
			return nil
		end
	end, { Frame.mediaType })
	
	return if Frame.assetSource then if Frame.mediaType == "video" then ReactModule.createElement(View, {
		Size = UDim2.fromScale(1, 1),
		aspectRatio = {
			AspectRatio = AspectRatio,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		},
		LayoutOrder = Frame.LayoutOrder
	}, {
		Video = ReactModule.createElement("VideoFrame", {
			Looped = true,
			Volume = 0,
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Size = UDim2.fromScale(1, 1),
			Video = Frame.assetSource,
			Playing = UseStateResult,
			ref = UseRefResult
		}, {
			UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 12) }),
			PlayPauseButton = ReactModule.createElement(IconButton, {
				Position = UDim2.new(0, 0, 1, -UseTokensResult.Gap.XSmall),
				AnchorPoint = Vector2.new(0, 1),
				icon = if UseStateResult then IconName.PauseSmall else IconName.PlaySmall,
				size = InputSize.Small,
				onActivated = UseResult
			})
		}),
		ProgressBar = ReactModule.createElement(Progress, {
			Position = UDim2.new(0, 0, 1, UseTokensResult.Gap.Medium),
			value = UseBindingResult,
			shape = ProgressShape.Bar,
			size = ProgressSize.Medium
		})
	}) else ReactModule.createElement(View, {
		tag = "align-x-center align-y-center radius-large clip bg-surface-200",
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = Frame.LayoutOrder,
		aspectRatio = {
			AspectRatio = AspectRatio,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		PreviewImage = ReactModule.createElement(Image, {
			tag = "size-full radius-large",
			Image = Frame.assetSource,
			ScaleType = Enum.ScaleType.Fit
		})
	}) else ReactModule.createElement(View, {
		tag = "align-x-center align-y-center radius-large clip bg-surface-200",
		Size = UDim2.fromScale(1, 1),
		LayoutOrder = Frame.LayoutOrder,
		aspectRatio = {
			AspectRatio = AspectRatio,
			AspectType = Enum.AspectType.FitWithinMaxSize,
			DominantAxis = Enum.DominantAxis.Width
		}
	}, {
		PlaceholderIcon = ReactModule.createElement(Icon, {
			tag = "auto-xy content-default",
			name = IconName.Image,
			size = IconSize.XLarge
		})
	})
end