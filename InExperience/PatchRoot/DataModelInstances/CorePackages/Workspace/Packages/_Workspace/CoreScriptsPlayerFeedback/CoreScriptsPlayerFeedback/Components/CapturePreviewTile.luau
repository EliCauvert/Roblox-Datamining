local coreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local parent = coreScriptsPlayerFeedback.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local loading = foundationModule.Loading
local iconSize = foundationModule.Enums.IconSize
local builderIconsModule = require(parent.BuilderIcons)
local iconVariant = builderIconsModule.IconVariant
local _ = require(coreScriptsPlayerFeedback.CaptureTypes)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), loading (ref), iconSize (ref), icon (ref), builderIconsModule (ref), iconVariant (ref)
	local var1, var2 = reactModule.useState(false)
	local var3, var4 = reactModule.useState(false)
	
	return reactModule.createElement("ImageButton", {
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Image = "",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(0, 80, 0, 80),
		[reactModule.Event.MouseEnter] = function()
			-- upvalues: var2 (ref)
			var2(true)
		end,
		[reactModule.Event.MouseLeave] = function()
			-- upvalues: var2 (ref)
			var2(false)
		end,
		[reactModule.Event.SelectionGained] = function()
			-- upvalues: var4 (ref)
			var4(true)
		end,
		[reactModule.Event.SelectionLost] = function()
			-- upvalues: var4 (ref)
			var4(false)
		end
	}, {
		Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		FailedStroke = if p1.status == "failed" and p1.failureReason ~= Enum.UploadCaptureResult.CaptureModerated then reactModule.createElement("UIStroke", {
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(220, 50, 50)
		}) else nil,
		Thumbnail = reactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 1,
			ImageContent = Content.fromObject(p1.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}),
		UploadingOverlay = if p1.status == "uploading" then reactModule.createElement("Frame", {
			BackgroundTransparency = 0.45,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 2,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Spinner = reactModule.createElement(loading, {
				ZIndex = 3,
				size = iconSize.Medium,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		}) else nil,
		RemoveButton = if var1 or game:GetService("UserInputService").TouchEnabled or var3 then reactModule.createElement("ImageButton", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(1, -2, 0, 2),
			Size = UDim2.new(0, 20, 0, 20),
			ZIndex = 4,
			[reactModule.Event.Activated] = p1.onRemove
		}, {
			CircleXIcon = reactModule.createElement(icon, {
				name = builderIconsModule.Icon.CircleX,
				size = iconSize.Medium,
				variant = iconVariant.Filled
			})
		}) else nil
	})
end)