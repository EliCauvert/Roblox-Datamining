local CoreScriptsPlayerFeedback = script:FindFirstAncestor("CoreScriptsPlayerFeedback")
local Parent = CoreScriptsPlayerFeedback.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local Loading = FoundationModule.Loading
local IconSize = FoundationModule.Enums.IconSize
local BuilderIconsModule = require(Parent.BuilderIcons)
local IconVariant = BuilderIconsModule.IconVariant
local _ = require(CoreScriptsPlayerFeedback.CaptureTypes)

return (ReactModule.memo(function(p1)
	-- upvalues: ReactModule (copy), Loading (copy), IconSize (copy), Icon (copy), BuilderIconsModule (copy), IconVariant (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	local IsUploading = p1.status == "uploading"
	local IsNotFailureReasonMatch: boolean = p1.status == "failed" and p1.failureReason ~= Enum.UploadCaptureResult.CaptureModerated
	local TouchEnabled = game:GetService("UserInputService").TouchEnabled
	
	return ReactModule.createElement("ImageButton", {
		BackgroundColor3 = Color3.fromRGB(30, 30, 30),
		BackgroundTransparency = 0,
		BorderSizePixel = 0,
		ClipsDescendants = false,
		Image = "",
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(0, 80, 0, 80),
		[ReactModule.Event.MouseEnter] = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(true)
		end,
		[ReactModule.Event.MouseLeave] = function()
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(false)
		end,
		[ReactModule.Event.SelectionGained] = function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(true)
		end,
		[ReactModule.Event.SelectionLost] = function()
			-- upvalues: UseStateResult2_1 (copy)
			UseStateResult2_1(false)
		end
	}, {
		Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		FailedStroke = if IsNotFailureReasonMatch then ReactModule.createElement("UIStroke", {
			Thickness = 1,
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			Color = Color3.fromRGB(220, 50, 50)
		}) else nil,
		Thumbnail = ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 1,
			ImageContent = Content.fromObject(p1.capture),
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) })
		}),
		UploadingOverlay = if IsUploading then ReactModule.createElement("Frame", {
			BackgroundTransparency = 0.45,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			ZIndex = 2,
			BackgroundColor3 = Color3.fromRGB(0, 0, 0),
			Size = UDim2.fromScale(1, 1)
		}, {
			Corner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
			Spinner = ReactModule.createElement(Loading, {
				ZIndex = 3,
				size = IconSize.Medium,
				AnchorPoint = Vector2.new(0.5, 0.5),
				Position = UDim2.fromScale(0.5, 0.5)
			})
		}) else nil,
		RemoveButton = if UseStateResult or (TouchEnabled or UseStateResult1) then ReactModule.createElement("ImageButton", {
			AnchorPoint = Vector2.new(1, 0),
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			Position = UDim2.new(1, -2, 0, 2),
			Size = UDim2.new(0, 20, 0, 20),
			ZIndex = 4,
			[ReactModule.Event.Activated] = p1.onRemove
		}, {
			CircleXIcon = ReactModule.createElement(Icon, {
				name = BuilderIconsModule.Icon.CircleX,
				size = IconSize.Medium,
				variant = IconVariant.Filled
			})
		}) else nil
	})
end))