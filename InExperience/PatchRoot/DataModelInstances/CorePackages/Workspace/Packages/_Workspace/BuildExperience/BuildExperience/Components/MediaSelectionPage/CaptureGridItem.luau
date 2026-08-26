local buildExperience = script:FindFirstAncestor("BuildExperience")
local parent = buildExperience.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local fFlagBuildExperienceChatImageAttachmentsModule = require(buildExperience.Flags.FFlagBuildExperienceChatImageAttachments)
local checkbox = foundationModule.Checkbox
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens

local function _(p1)
	return if typeof(p1) == "Object" then Content.fromObject(p1) else Content.none
end

local function CaptureGridItem(p1)
	-- upvalues: useTokens (ref), reactModule (ref), fFlagBuildExperienceChatImageAttachmentsModule (ref), view (ref), foundationModule (ref), checkbox (ref)
	local var1 = useTokens()
	local var2 = reactModule.useCallback(function()
		-- upvalues: p1 (ref)
		p1.onActivated(p1.capture)
	end, { p1.capture, p1.onActivated })
	
	if fFlagBuildExperienceChatImageAttachmentsModule then
		local var3
		if p1.imageContentEnabled == false then
			var3 = Content.none
		else
			local capture = p1.capture
			var3 = if typeof(capture) == "Object" then Content.fromObject(capture) else Content.none
		end
		return reactModule.createElement("ImageButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			ClipsDescendants = true,
			Image = "",
			ImageContent = var3,
			LayoutOrder = p1.LayoutOrder,
			ScaleType = Enum.ScaleType.Crop,
			Size = UDim2.fromScale(1, 1),
			[reactModule.Event.Activated] = var2,
			[reactModule.Tag] = if p1.testId ~= nil then "bg-shift-200" else `bg-shift-200 data-testid={p1.testId}`
		}, {
			Corner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, var1.Size.Size_200) }),
			SelectedStroke = if p1.isSelected then reactModule.createElement("UIStroke", {
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border,
				BorderStrokePosition = Enum.BorderStrokePosition.Inner,
				Color = var1.Color.Content.Emphasis.Color3,
				Thickness = var1.Stroke.Thick
			}) else nil,
			SelectionOverlay = if p1.isSelected then reactModule.createElement(view, { tag = "size-full padding-small", ZIndex = 3 }, {
				SelectedIndicator = reactModule.createElement(checkbox, {
					isChecked = true,
					label = "",
					AnchorPoint = Vector2.new(1, 0),
					onActivated = function()
						-- upvalues: var2 (ref)
						var2()
					end,
					Position = UDim2.fromScale(1, 0),
					size = foundationModule.Enums.InputSize.Small
				})
			}) else nil
		})
	else
		local createElement = reactModule.createElement
		local var4 = view
		local t = {
			tag = "size-full",
			onActivated = var2,
			stateLayer = {
				affordance = foundationModule.Enums.StateLayerAffordance.None
			},
			stroke = if p1.isSelected then {
				Color = var1.Color.Content.Emphasis.Color3,
				Thickness = var1.Stroke.Thick,
				ApplyStrokeMode = Enum.ApplyStrokeMode.Border
			} else nil
		}
		local t_1 = {}
		local createElement_1 = reactModule.createElement
		local var5 = "ImageLabel"
		local t_2 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			ZIndex = 1
		}
		local capture = p1.capture
		t_2.ImageContent = if typeof(capture) == "Object" then Content.fromObject(capture) else Content.none
		t_2.ScaleType = Enum.ScaleType.Crop
		t_2.Size = UDim2.fromScale(1, 1)
		t_1.CaptureThumbnail = createElement_1(var5, t_2)
		t_1.SelectionOverlay = if p1.isSelected then reactModule.createElement(view, { tag = "size-full padding-small", ZIndex = 3 }, {
			SelectedIndicator = reactModule.createElement(checkbox, {
				isChecked = true,
				label = "",
				AnchorPoint = Vector2.new(1, 0),
				onActivated = function()
					-- upvalues: var2 (ref)
					var2()
				end,
				Position = UDim2.fromScale(1, 0),
				size = foundationModule.Enums.InputSize.Small
			})
		}) else nil
		
		return createElement(var4, t, t_1)
	end
end

return if fFlagBuildExperienceChatImageAttachmentsModule then reactModule.memo(CaptureGridItem) else CaptureGridItem