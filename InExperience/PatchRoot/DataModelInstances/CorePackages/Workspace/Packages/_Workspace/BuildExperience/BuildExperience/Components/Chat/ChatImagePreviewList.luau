local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local _ = require(BuildExperience.Chat.chatTypes)
local Icon = FoundationModule.Icon
local IconButton = FoundationModule.IconButton
local Progress = FoundationModule.Progress
local View = FoundationModule.View
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local InputSize = FoundationModule.Enums.InputSize
local ProgressShape = FoundationModule.Enums.ProgressShape
local ProgressSize = FoundationModule.Enums.ProgressSize

return ReactModule.memo(function(Frame)
	-- upvalues: FoundationModule (copy), ReactModule (copy), Progress (copy), ProgressShape (copy), ProgressSize (copy), Icon (copy), IconName (copy), IconSize (copy), IconButton (copy), InputSize (copy), ButtonVariant (copy), View (copy)
	local UseTokensResult = FoundationModule.Hooks.useTokens()
	local ImageLabels = {}
	local TestId = Frame.testId or "ChatImagePreviewList"
	
	for LayoutOrder, image in Frame.images do
		local IsUploading = image.uploadStatus == "uploading"
		local IsFailed = image.uploadStatus == "failed"
		ImageLabels[`Image-{LayoutOrder}`] = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Image = if typeof(image.capture) == "Object" then "" else image.uri or "",
			ImageContent = if typeof(image.capture) == "Object" then Content.fromObject(image.capture) else nil,
			LayoutOrder = LayoutOrder,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromOffset(UseTokensResult.Size.Size_2400, UseTokensResult.Size.Size_2400),
			[ReactModule.Tag] = `data-testid={TestId}.Image.{LayoutOrder}`
		}, {
			Corner = ReactModule.createElement("UICorner", {
				CornerRadius = UDim.new(0, UseTokensResult.Size.Size_200)
			}),
			FailedStroke = if IsFailed then ReactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = UseTokensResult.Color.System.Alert.Color3,
				Thickness = UseTokensResult.Stroke.Thick
			}) else nil,
			Progress = if IsUploading then ReactModule.createElement(Progress, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				shape = ProgressShape.Circle,
				size = ProgressSize.Medium,
				testId = `{TestId}.Progress.{LayoutOrder}`
			}) else nil,
			Error = if IsFailed then ReactModule.createElement(Icon, {
				tag = "auto-xy",
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				name = IconName.TriangleExclamation,
				Position = UDim2.fromScale(0.5, 0.5),
				size = IconSize.Medium,
				style = UseTokensResult.Color.System.Alert,
				testId = `{TestId}.Error.{LayoutOrder}`
			}) else nil,
			Retry = if IsFailed and Frame.onRetry ~= nil then ReactModule.createElement(IconButton, {
				isCircular = true,
				ZIndex = 3,
				icon = IconName.ArrowSpinClockwise,
				onActivated = function()
					-- upvalues: Frame (copy), LayoutOrder (copy)
					Frame.onRetry(LayoutOrder)
				end,
				Position = UDim2.new(0, 4, 1, -4),
				AnchorPoint = Vector2.new(0, 1),
				size = InputSize.Small,
				variant = ButtonVariant.OverMedia,
				testId = `{TestId}.Retry.{LayoutOrder}`
			}) else nil,
			Remove = if Frame.onRemove == nil then nil else ReactModule.createElement(IconButton, {
				isCircular = true,
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 0),
				icon = IconName.X,
				onActivated = function()
					-- upvalues: Frame (copy), LayoutOrder (copy)
					Frame.onRemove(LayoutOrder)
				end,
				Position = UDim2.new(1, -4, 0, 4),
				size = InputSize.Small,
				variant = ButtonVariant.OverMedia,
				testId = `{TestId}.Remove.{LayoutOrder}`
			})
		})
	end
	return ReactModule.createElement(View, {
		LayoutOrder = Frame.LayoutOrder,
		tag = {
			["row wrap gap-small size-full-0 auto-y"] = true,
			["align-x-right"] = Frame.alignRight == true
		},
		testId = TestId
	}, {
		Images = ReactModule.createElement(ReactModule.Fragment, nil, ImageLabels)
	})
end)