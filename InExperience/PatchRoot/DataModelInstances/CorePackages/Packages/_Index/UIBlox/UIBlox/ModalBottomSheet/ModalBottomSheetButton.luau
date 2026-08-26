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
local var1 = 8 * imagesModule.ImagesResolutionScale
local var2 = 8 * imagesModule.ImagesResolutionScale
local rect = Rect.new(var1, var2, imageRectSize.x - var1, imageRectSize.y - var2)
local var3 = 8 * imagesModule.ImagesResolutionScale
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

function modalBottomSheetButton.init(p1)
	-- upvalues: roactModule (ref)
	local var4, var5 = roactModule.createBinding(false)
	p1.pressed = var4
	p1.updatePressed = var5
	p1.ref = roactModule.createRef()
	
	function p0.onColorChange(p2)
		-- upvalues: p1 (ref)
		if p1.ref.current then
			p1.ref.current.ImageColor3 = p2
			
			return
		end
	end
	
	function p0.onInputBegan(p2)
		return if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true
	end
	
	function p0.onInputEnd(p2)
		return if p2.UserInputType ~= Enum.UserInputType.MouseButton1 then p2.UserInputType == Enum.UserInputType.Touch else true
	end
end

function modalBottomSheetButton.render(p1)
	-- upvalues: imageRectSize (ref), imageRectOffset (ref), rect (ref), withStyleModule (ref), roactModule (ref), imagesModule (ref), imageSetComponentModule (ref), roundedFrameModule (ref), var3 (ref)
	local vector2, var4
	local hasRoundTop = p1.props.hasRoundTop
	local hasRoundBottom = p1.props.hasRoundBottom
	local _ = nil
	local _ = nil
	local rect_1 = nil
	local x = imageRectSize.X
	local var5 = x / 2
	
	if hasRoundTop and hasRoundBottom then
		vector2 = imageRectSize
		var4 = imageRectOffset
		rect_1 = rect
	elseif hasRoundTop then
		vector2 = Vector2.new(x, var5)
		var4 = imageRectOffset
		rect_1 = Rect.new(var5 - 1, var5 - 1, var5 + 1, var5)
	elseif hasRoundBottom then
		vector2 = Vector2.new(x, var5)
		var4 = imageRectOffset + Vector2.new(0, var5)
		rect_1 = Rect.new(var5 - 1, 0, var5 + 1, 1)
	else
		vector2 = Vector2.new(1, 1)
		var4 = imageRectOffset + Vector2.new(var5, var5)
	end
	local elementHeight = p1.props.elementHeight
	local var6 = if p1.props.isFixed then UDim2.new(0, 300, 0, elementHeight) else UDim2.new(1, -32, 0, elementHeight)
	local var7 = if p1.props.showImage or p1.props.renderRightElement then 12 else 24
	local var8 = var7
	local var9 = elementHeight * 0.8
	
	if p1.props.showImage then
		var8 = var8 + var9 + var7
	end
	if p1.props.renderRightElement then
		var8 = var8 + var9 + var7
	end
	return withStyleModule(function(p2)
		-- upvalues: p1 (ref), roactModule (copy), rect_1 (write), imagesModule (copy), vector2 (write), var4 (write), var7 (write), imageSetComponentModule (copy), var9 (ref), var8 (write), hasRoundBottom (ref), var6 (write), roundedFrameModule (copy), hasRoundTop (ref), var3 (copy)
		local theme = p2.Theme
		local font = p2.Font
		local _ = nil
		local _ = nil
		local _ = nil
		local _ = nil
		local var10 = p1.pressed:map(function(p3)
			-- upvalues: theme (ref)
			return if p3 then theme.BackgroundOnPress.Color else theme.BackgroundUIDefault.Color
		end)
		local var11 = p1.pressed:map(function(p3)
			-- upvalues: theme (ref)
			return if p3 then theme.BackgroundOnPress.Transparency else theme.BackgroundUIDefault.Transparency
		end)
		local color = theme.TextEmphasis.Color
		local transparency = theme.TextEmphasis.Transparency
		
		return roactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = p1.props.LayoutOrder,
			Size = var6
		}, {
			Background = roactModule.createElement(roundedFrameModule, {
				zIndex = -1,
				background = theme.BackgroundUIDefault,
				topCornerRadius = if hasRoundTop then UDim.new(0, var3) else nil,
				bottomCornerRadius = if hasRoundBottom then UDim.new(0, var3) else nil
			}),
			Button = roactModule.createElement("ImageButton", {
				AutoButtonColor = false,
				BackgroundTransparency = 1,
				BorderSizePixel = 0,
				ScaleType = Enum.ScaleType.Slice,
				SliceCenter = rect_1,
				Image = imagesModule["component_assets/circle_17"].Image,
				ImageColor3 = var10,
				ImageRectSize = vector2,
				ImageRectOffset = var4,
				ImageTransparency = var11,
				Size = UDim2.fromScale(1, 1),
				LayoutOrder = p1.props.LayoutOrder,
				[roactModule.Ref] = p1.ref,
				[roactModule.Event.Activated] = p1.props.onActivatedAndDismissed,
				[roactModule.Event.InputBegan] = function(_, p3)
					-- upvalues: p1 (copy)
					if p1.onInputBegan(p3) then
						p1.updatePressed(true)
					end
				end,
				[roactModule.Event.InputEnded] = function(_, p3)
					-- upvalues: p1 (copy)
					if p1.onInputEnd(p3) then
						p1.updatePressed(false)
					end
				end
			}, {
				buttonContents = roactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.new(1, 0, 1, 0) }, {
					horizontalLayout = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, var7)
					}),
					padding = roactModule.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, var7),
						PaddingTop = UDim.new(0.1, 0),
						PaddingBottom = UDim.new(0.1, 0)
					}),
					icon = p1.props.showImage and roactModule.createElement(imageSetComponentModule.Label, {
						BackgroundTransparency = 1,
						LayoutOrder = 1,
						Image = p1.props.icon,
						ImageColor3 = color,
						ImageTransparency = transparency,
						Size = UDim2.new(0, var9, 0, var9)
					}) or nil,
					textLabel = roactModule.createElement("TextLabel", {
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						TextXAlignment = Enum.TextXAlignment.Left,
						Size = UDim2.new(1, -var8, 1, 0),
						Text = p1.props.text,
						TextTransparency = transparency,
						Font = font.Header2.Font,
						TextColor3 = color,
						TextSize = font.Header2.RelativeSize * font.BaseSize,
						TextTruncate = Enum.TextTruncate.AtEnd
					}),
					rightContainer = p1.props.renderRightElement and roactModule.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 3,
						Size = UDim2.new(0, var9, 0, var9)
					}, { hint = p1.props.renderRightElement() })
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