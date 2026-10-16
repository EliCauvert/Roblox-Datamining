local BuildExperience = script:FindFirstAncestor("BuildExperience")
local Parent = BuildExperience.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local FFlagBuildExperienceChatImageAttachmentsModule = require(BuildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local Checkbox = FoundationModule.Checkbox
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

local function _(p1) --[[ Line: 23 | Named "getCaptureContent" ]]
	return if typeof(p1) == "Object" then Content.fromObject(p1) else Content.none
end

local function CaptureGridItem(Frame) --[[ Line: 30 ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), FFlagBuildExperienceChatImageAttachmentsModule (copy), View (copy), FoundationModule (copy), Checkbox (copy)
	local UseTokensResult = UseTokensFunction()
	local UseResult = ReactModule.useCallback(function() --[[ Line: 33 ]]
		-- upvalues: Frame (copy)
		Frame.onActivated(Frame.capture)
	end, { Frame.capture, Frame.onActivated })
	
	if not FFlagBuildExperienceChatImageAttachmentsModule then
		local Capture = Frame.capture
		
		return ReactModule.createElement(View, {
			tag = "size-full",
			onActivated = UseResult,
			stateLayer = {
				affordance = FoundationModule.Enums.StateLayerAffordance.None
			},
			stroke = if Frame.isSelected then {
				Color = UseTokensResult.Color.Content.Emphasis.Color3,
				Thickness = UseTokensResult.Stroke.Thick,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			} else nil
		}, {
			CaptureThumbnail = ReactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ZIndex = 1,
				ImageContent = if typeof(Capture) == "Object" then Content.fromObject(Capture) else Content.none,
				ScaleType = Enum.ScaleType.Crop,
				Size = UDim2.fromScale(1, 1)
			}),
			SelectionOverlay = if Frame.isSelected then ReactModule.createElement(View, { tag = "size-full padding-small", ZIndex = 3 }, {
				SelectedIndicator = ReactModule.createElement(Checkbox, {
					isChecked = true,
					label = "",
					AnchorPoint = Vector2.new(1, 0),
					onActivated = function() --[[ Line: 67 ]]
						-- upvalues: UseResult (copy)
						UseResult()
					end,
					Position = UDim2.fromScale(1, 0),
					size = FoundationModule.Enums.InputSize.Small
				})
			}) else nil
		})
	end
	local Content1 = nil
	if Frame.imageContentEnabled == false then
		Content1 = Content.none
	else
		local Capture = Frame.capture
		Content1 = if typeof(Capture) == "Object" then Content.fromObject(Capture) else Content.none
	end
	return ReactModule.createElement("ImageButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		ClipsDescendants = true,
		Image = "",
		ImageContent = Content1,
		LayoutOrder = Frame.LayoutOrder,
		ScaleType = Enum.ScaleType.Crop,
		Size = UDim2.fromScale(1, 1),
		[ReactModule.Event.Activated] = UseResult,
		[ReactModule.Tag] = if Frame.testId == nil then "bg-shift-200" else `bg-shift-200 data-testid={Frame.testId}`
	}, {
		Corner = ReactModule.createElement("UICorner", {
			CornerRadius = UDim.new(0, UseTokensResult.Size.Size_200)
		}),
		SelectedStroke = if Frame.isSelected then ReactModule.createElement("UIStroke", {
			ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
			BorderStrokePosition = Enum.BorderStrokePosition.Inner,
			Color = UseTokensResult.Color.Content.Emphasis.Color3,
			Thickness = UseTokensResult.Stroke.Thick
		}) else nil,
		SelectionOverlay = if Frame.isSelected then ReactModule.createElement(View, { tag = "size-full padding-small", ZIndex = 3 }, {
			SelectedIndicator = ReactModule.createElement(Checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function() --[[ Line: 114 ]]
					-- upvalues: UseResult (copy)
					UseResult()
				end,
				Position = UDim2.fromScale(1, 0),
				size = FoundationModule.Enums.InputSize.Small
			})
		}) else nil
	})
end

return if FFlagBuildExperienceChatImageAttachmentsModule then ReactModule.memo(CaptureGridItem) else CaptureGridItem