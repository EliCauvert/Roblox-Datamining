local parent = script.Parent.Parent.Parent
local roactModule = require(parent.Roact)
local tModule = require(parent.t)
local imagesModule = require(parent.UIBlox.App.ImageSet.Images)
local imageSetComponentModule = require(parent.UIBlox.Core.ImageSet.ImageSetComponent)
local withStyleModule = require(parent.UIBlox.Core.Style.withStyle)
local roundedFrameModule = require(parent.UIBlox.App.Menu.RoundedFrame)
local modalBottomSheetButton = roactModule.PureComponent:extend("ModalBottomSheetButton")
local imageRectSize = imagesModule["component_assets/circle_17"].ImageRectSize
local imageRectOffset = imagesModule["component_assets/circle_17"].ImageRectOffset
local var7 = 8 * imagesModule.ImagesResolutionScale
local var8 = 8 * imagesModule.ImagesResolutionScale
local rect = Rect.new(var7, var8, imageRectSize.x - var7, imageRectSize.y - var8)
local var10 = 8 * imagesModule.ImagesResolutionScale
modalBottomSheetButton.validateProps = tModule.strictInterface({
	icon = tModule.optional(tModule.union(tModule.table, tModule.string)),
	text = tModule.optional(tModule.string),
	onActivated = tModule.optional(tModule.callback),
	renderRightElement = tModule.optional(tModule.callback),
	showImage = tModule.boolean,
	isFixed = tModule.boolean,
	onActivatedAndDismissed = tModule.callback,
	elementHeight = tModule.integer,
	hasRoundBottom = tModule.boolean,
	hasRoundTop = tModule.boolean,
	LayoutOrder = tModule.integer,
	stayOnActivated = tModule.optional(tModule.boolean)
})
modalBottomSheetButton.defaultProps = {
	text = "",
	icon = {},
	onActivated = function() end
}

function modalBottomSheetButton.init(p0)
	-- upvalues: roactModule (ref)
	local var11, var12 = roactModule.createBinding(false)
	p0.pressed = var11
	p0.updatePressed = var12
	p0.ref = roactModule.createRef()
	
	function p0.onColorChange(p1)
		-- upvalues: p0 (ref)
		if p0.ref.current then
			p0.ref.current.ImageColor3 = p1
			
			return
		end
	end
	
	function p0.onInputBegan(p2)
		return if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true
	end
	
	function p0.onInputEnd(p3)
		return if p3.UserInputType ~= Enum.UserInputType.MouseButton1 then p3.UserInputType == Enum.UserInputType.Touch else true
	end
end

function modalBottomSheetButton.render(p4)
	-- upvalues: imageRectSize (ref), imageRectOffset (ref), rect (ref), withStyleModule (ref), roactModule (ref), imagesModule (ref), imageSetComponentModule (ref), roundedFrameModule (ref), var10 (ref)
	local vector2, var16
	local hasRoundTop = p4.props.hasRoundTop
	local hasRoundBottom = p4.props.hasRoundBottom
	local _ = nil
	local _ = nil
	local rect_1 = nil
	local x = imageRectSize.X
	local var14 = x / 2
	
	if hasRoundTop and hasRoundBottom then
		vector2 = imageRectSize
		var16 = imageRectOffset
		rect_1 = rect
	elseif hasRoundTop then
		vector2 = Vector2.new(x, var14)
		var16 = imageRectOffset
		rect_1 = Rect.new(var14 - 1, var14 - 1, var14 + 1, var14)
	elseif hasRoundBottom then
		vector2 = Vector2.new(x, var14)
		var16 = imageRectOffset + Vector2.new(0, var14)
		rect_1 = Rect.new(var14 - 1, 0, var14 + 1, 1)
	else
		vector2 = Vector2.new(1, 1)
		var16 = imageRectOffset + Vector2.new(var14, var14)
	end
	local elementHeight = p4.props.elementHeight
	local var17 = if p4.props.isFixed then UDim2.new(0, 300, 0, elementHeight) else UDim2.new(1, -32, 0, elementHeight)
	local var18 = if p4.props.showImage or p4.props.renderRightElement then 12 else 24
	local var19 = var18
	local var20 = elementHeight * 0.8
	
	if p4.props.showImage then
		var19 = var19 + var20 + var18
	end
	if p4.props.renderRightElement then
		var19 = var19 + var20 + var18
	end
	return withStyleModule(function(p5)
		-- upvalues: p4 (ref), roactModule (copy), rect_1 (write), imagesModule (copy), vector2 (write), var16 (write), var18 (write), imageSetComponentModule (copy), var20 (ref), var19 (write), hasRoundBottom (ref), var17 (write), roundedFrameModule (copy), hasRoundTop (ref), var10 (copy)
		local theme = p5.Theme
		local font = p5.Font
		local _ = nil
		local _ = nil
		local _ = nil
		local _ = nil
		local var21 = p4.pressed:map(function(p6)
			-- upvalues: theme (ref)
			return if p6 then theme.BackgroundOnPress.Color else theme.BackgroundUIDefault.Color
		end)
		local var22 = p4.pressed:map(function(p7)
			-- upvalues: theme (ref)
			return if p7 then theme.BackgroundOnPress.Transparency else theme.BackgroundUIDefault.Transparency
		end)
		local color = theme.TextEmphasis.Color
		local transparency = theme.TextEmphasis.Transparency
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p4.props.LayoutOrder,
			Size = var17
		}, {
			Background = roactModule.createElement(roundedFrameModule, {
				zIndex = -1,
				background = theme.BackgroundUIDefault,
				topCornerRadius = if hasRoundTop then UDim.new(0, var10) else nil,
				bottomCornerRadius = if hasRoundBottom then UDim.new(0, var10) else nil
			}),
			Button = roactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect_1,
				Image = imagesModule["component_assets/circle_17"].Image,
				ImageColor3 = var21,
				ImageRectSize = vector2,
				ImageRectOffset = var16,
				ImageTransparency = var22,
				Size = UDim2.fromScale(1, 1),
				LayoutOrder = p4.props.LayoutOrder,
				[roactModule.Ref] = p4.ref,
				[roactModule.Event.Activated] = p4.props.onActivatedAndDismissed,
				[roactModule.Event.InputBegan] = function(_, p8)
					-- upvalues: p4 (copy)
					if p4.onInputBegan(p8) then
						p4.updatePressed(true)
					end
				end,
				[roactModule.Event.InputEnded] = function(_, p9)
					-- upvalues: p4 (copy)
					if p4.onInputEnd(p9) then
						p4.updatePressed(false)
					end
				end
			}, {
				buttonContents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					horizontalLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, var18)
					}),
					padding = roactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var18),
						PaddingTop = UDim.new(0.1, 0),
						PaddingBottom = UDim.new(0.1, 0)
					}),
					icon = p4.props.showImage and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = p4.props.icon,
						ImageColor3 = color,
						ImageTransparency = transparency,
						Size = UDim2.new(0, var20, 0, var20)
					}) or nil,
					textLabel = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -var19, 1, 0),
						Text = p4.props.text,
						TextTransparency = transparency,
						Font = font.Header2.Font,
						TextColor3 = color,
						TextSize = font.Header2.RelativeSize * font.BaseSize,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					rightContainer = p4.props.renderRightElement and roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(0, var20, 0, var20)
					}, { hint = p4.props.renderRightElement() })
				}),
				bottomBorder = not hasRoundBottom and roactModule.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					BackgroundColor3 = theme.Divider.Color,
					Size = UDim2.new(1, 0, 0, 1),
					AnchorPoint = Vector2.new(0, 1),
					Position = UDim2.new(0, 0, 1, 0)
				})
			})
		})
	end)
end

return modalBottomSheetButton