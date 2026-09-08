local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local _ = require(buildExperience.Chat.chatTypes)
local icon = foundationModule.Icon
local iconButton = foundationModule.IconButton
local progress = foundationModule.Progress
local view = foundationModule.View
local buttonVariant = foundationModule.Enums.ButtonVariant
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local inputSize = foundationModule.Enums.InputSize
local progressShape = foundationModule.Enums.ProgressShape
local progressSize = foundationModule.Enums.ProgressSize

return reactModule.memo(function(p1)
	-- upvalues: foundationModule (ref), reactModule (ref), progress (ref), progressShape (ref), progressSize (ref), icon (ref), iconName (ref), iconSize (ref), iconButton (ref), inputSize (ref), buttonVariant (ref), view (ref)
	local var1 = foundationModule.Hooks.useTokens()
	local t = {}
	local testId = p1.testId or "ChatImagePreviewList"
	
	for i, v in p1.images do
		local isFailed = v.uploadStatus == "failed"
		t[`Image-{i}`] = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Image = if typeof(v.capture) == "Object" then "" else v.uri or "",
			ImageContent = if typeof(v.capture) == "Object" then Content.fromObject(v.capture) else nil,
			LayoutOrder = i,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromOffset(var1.Size.Size_2400, var1.Size.Size_2400),
			[reactModule.Tag] = `data-testid={testId}.Image.{i}`
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Size.Size_200) }),
			FailedStroke = if isFailed then reactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				Color = var1.Color.System.Alert.Color3,
				Thickness = var1.Stroke.Thick
			}) else nil,
			Progress = if v.uploadStatus == "uploading" then reactModule.createElement(progress, {
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5),
				shape = progressShape.Circle,
				size = progressSize.Medium,
				testId = `{testId}.Progress.{i}`
			}) else nil,
			Error = if isFailed then reactModule.createElement(icon, {
				tag = "auto-xy",
				ZIndex = 2,
				AnchorPoint = Vector2.new(0.5, 0.5),
				name = iconName.TriangleExclamation,
				Position = UDim2.fromScale(0.5, 0.5),
				size = iconSize.Medium,
				style = var1.Color.System.Alert,
				testId = `{testId}.Error.{i}`
			}) else nil,
			Retry = if isFailed and p1.onRetry ~= nil then reactModule.createElement(iconButton, {
				isCircular = true,
				ZIndex = 3,
				icon = iconName.ArrowSpinClockwise,
				onActivated = function()
					-- upvalues: p1 (ref), i (ref)
					p1.onRetry(i)
				end,
				Position = UDim2.new(0, 4, 1, -4),
				AnchorPoint = Vector2.new(0, 1),
				size = inputSize.Small,
				variant = buttonVariant.OverMedia,
				testId = `{testId}.Retry.{i}`
			}) else nil,
			Remove = if p1.onRemove ~= nil then nil else reactModule.createElement(iconButton, {
				isCircular = true,
				ZIndex = 2,
				AnchorPoint = Vector2.new(1, 0),
				icon = iconName.X,
				onActivated = function()
					-- upvalues: p1 (ref), i (ref)
					p1.onRemove(i)
				end,
				Position = UDim2.new(1, -4, 0, 4),
				size = inputSize.Small,
				variant = buttonVariant.OverMedia,
				testId = `{testId}.Remove.{i}`
			})
		})
	end
	return reactModule.createElement(view, {
		LayoutOrder = p1.LayoutOrder,
		tag = {
			["row wrap gap-small size-full-0 auto-y"] = true,
			["align-x-right"] = p1.alignRight == true
		},
		testId = testId
	}, {
		Images = reactModule.createElement(reactModule.Fragment, nil, t)
	})
end)