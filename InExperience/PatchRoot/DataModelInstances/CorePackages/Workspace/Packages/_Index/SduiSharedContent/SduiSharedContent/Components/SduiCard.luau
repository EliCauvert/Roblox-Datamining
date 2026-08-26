local parent = script:FindFirstAncestor("SduiSharedContent").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local loadableImage = require(parent.UIBlox).App.Loading.LoadableImage
local textSizeModule = require(parent.TextSize)
local signalsReactModule = require(parent.SignalsReact)
local _ = require(parent.SduiCompat)
local view = foundationModule.View
local text = foundationModule.Text
local button = foundationModule.Button
local useTokens = foundationModule.Hooks.useTokens
local useCursor = foundationModule.Hooks.useCursor
local buttonVariant = foundationModule.Enums.ButtonVariant
local inputSize = foundationModule.Enums.InputSize
local cursorType = foundationModule.Enums.CursorType
local stateLayerAffordance = foundationModule.Enums.StateLayerAffordance
local fFlagFixSduiCardFocusNavScroll = require(parent.SharedFlags).FFlagFixSduiCardFocusNavScroll

local var1 = function() end

return reactModule.memo(function(p1)
	-- upvalues: useTokens (ref), fFlagFixSduiCardFocusNavScroll (ref), useCursor (ref), cursorType (ref), signalsReactModule (ref), textSizeModule (ref), reactModule (ref), view (ref), var1 (ref), stateLayerAffordance (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref), loadableImage (ref)
	local var2 = useTokens()
	local var3 = if fFlagFixSduiCardFocusNavScroll then useCursor(cursorType.RoundedRect) else nil
	local size2500 = var2.Size.Size_2500
	local var4 = signalsReactModule.useSignalState(function(p2)
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p2).getTextSizeOffset(p2)
	end)
	local ceiled = nil
	
	if p1.descriptionMaxLines and p1.descriptionMaxLines > 0 then
		local bodyMedium = var2.Typography.BodyMedium
		ceiled = math.ceil(p1.descriptionMaxLines * (bodyMedium.FontSize + var4) * bodyMedium.LineHeight)
	end
	local var5, var6 = reactModule.useState(0)
	
	return reactModule.createElement(view, {
		tag = "size-full-0 row auto-y stroke-default",
		backgroundStyle = p1.backgroundStyle or var2.Color.Surface.Surface_100,
		cornerRadius = p1.cornerRadius or UDim.new(0, var2.Radius.Medium),
		selection = if fFlagFixSduiCardFocusNavScroll then reactModule.useMemo(function()
			-- upvalues: var3 (ref), p1 (ref)
			return {
				Selectable = true,
				SelectionImageObject = var3,
				SelectionOrder = p1.selectionOrder
			}
		end, { var3, p1.selectionOrder }) else nil,
		onStateChanged = if fFlagFixSduiCardFocusNavScroll then var1 else nil,
		stateLayer = if fFlagFixSduiCardFocusNavScroll then { affordance = stateLayerAffordance.None } else nil,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Size = p1.size,
		ZIndex = p1.zIndex,
		testId = p1.testId
	}, {
		ContentSection = reactModule.createElement(view, {
			tag = "flex-between size-full-0 auto-y col gap-xsmall padding-top-large padding-bottom-large padding-left-large padding-right-small",
			LayoutOrder = 1,
			Size = UDim2.new(UDim.new(1, -size2500), if p1.size then p1.size.Height else UDim.new(0, 0)),
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
				-- upvalues: var6 (ref)
				var6(p2.AbsoluteSize.Y)
			end, {})
		}, {
			TopContent = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y gap-xsmall",
				LayoutOrder = 1
			}, {
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-align-x-left text-wrap text-label-large content-emphasis",
					LayoutOrder = 1,
					Text = p1.titleText
				}),
				Subtitle = p1.descriptionText and (reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = p1.descriptionText,
					fontStyle = var2.Typography.BodyMedium,
					sizeConstraint = if ceiled then { MaxSize = Vector2.new(1e999, ceiled) } else nil,
					tag = {
						["size-full-0 auto-y text-align-x-left text-wrap"] = true,
						["text-truncate-split"] = if ceiled then true else false
					}
				}) or nil)
			}),
			CTAContainer = if p1.ctaText and p1.ctaOnActivated then reactModule.createElement(view, { tag = "auto-xy padding-top-medium", LayoutOrder = 2 }, {
				CTAButton = reactModule.createElement(button, {
					text = p1.ctaText,
					onActivated = p1.ctaOnActivated,
					variant = p1.ctaVariant or buttonVariant.SoftEmphasis,
					size = p1.ctaSize or inputSize.Small
				})
			}) else nil
		}),
		ImageSection = if p1.image then reactModule.createElement(loadableImage, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = false,
			useShimmerAnimationWhileLoading = true,
			Image = p1.image,
			Size = UDim2.new(0, size2500, 0, var5),
			ImageColor3 = if p1.imageStyle then p1.imageStyle.Color3 else var2.Color.Content.Emphasis.Color3,
			ImageTransparency = if p1.imageStyle then p1.imageStyle.Transparency else 0,
			ScaleType = Enum.ScaleType.Crop,
			cornerRadius = p1.cornerRadius or UDim.new(0, var2.Radius.Medium)
		}) else nil
	})
end)