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

local var4 = function() end

return reactModule.memo(function(p0)
	-- upvalues: useTokens (ref), fFlagFixSduiCardFocusNavScroll (ref), useCursor (ref), cursorType (ref), signalsReactModule (ref), textSizeModule (ref), reactModule (ref), view (ref), var4 (ref), stateLayerAffordance (ref), text (ref), button (ref), buttonVariant (ref), inputSize (ref), loadableImage (ref)
	local var5 = useTokens()
	local var6 = if fFlagFixSduiCardFocusNavScroll then useCursor(cursorType.RoundedRect) else nil
	local size2500 = var5.Size.Size_2500
	local var7 = signalsReactModule.useSignalState(function(p1)
		-- upvalues: textSizeModule (copy)
		return textSizeModule.getTextSizeStore(p1).getTextSizeOffset(p1)
	end)
	local ceiled = nil
	
	if p0.descriptionMaxLines and p0.descriptionMaxLines > 0 then
		local bodyMedium = var5.Typography.BodyMedium
		ceiled = math.ceil(p0.descriptionMaxLines * (bodyMedium.FontSize + var7) * bodyMedium.LineHeight)
	end
	local var9, var10 = reactModule.useState(0)
	
	return reactModule.createElement(view, {
		tag = "size-full-0 row auto-y stroke-default",
		backgroundStyle = p0.backgroundStyle or var5.Color.Surface.Surface_100,
		cornerRadius = p0.cornerRadius or UDim.new(0, var5.Radius.Medium),
		selection = if fFlagFixSduiCardFocusNavScroll then reactModule.useMemo(function()
			-- upvalues: var6 (ref), p0 (ref)
			return {
				Selectable = true,
				SelectionImageObject = var6,
				SelectionOrder = p0.selectionOrder
			}
		end, { var6, p0.selectionOrder }) else nil,
		onStateChanged = if fFlagFixSduiCardFocusNavScroll then var4 else nil,
		stateLayer = if fFlagFixSduiCardFocusNavScroll then { affordance = stateLayerAffordance.None } else nil,
		AnchorPoint = p0.anchorPoint,
		LayoutOrder = p0.layoutOrder,
		Position = p0.position,
		Size = p0.size,
		ZIndex = p0.zIndex,
		testId = p0.testId
	}, {
		ContentSection = reactModule.createElement(view, {
			tag = "flex-between size-full-0 auto-y col gap-xsmall padding-top-large padding-bottom-large padding-left-large padding-right-small",
			LayoutOrder = 1,
			Size = UDim2.new(UDim.new(1, -size2500), if p0.size then p0.size.Height else UDim.new(0, 0)),
			onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
				-- upvalues: var10 (ref)
				var10(p2.AbsoluteSize.Y)
			end, {})
		}, {
			TopContent = reactModule.createElement(view, {
				tag = "col size-full-0 auto-y gap-xsmall",
				LayoutOrder = 1
			}, {
				Title = reactModule.createElement(text, {
					tag = "size-full-0 auto-y text-align-x-left text-wrap text-label-large content-emphasis",
					LayoutOrder = 1,
					Text = p0.titleText
				}),
				Subtitle = p0.descriptionText and (reactModule.createElement(text, {
					LayoutOrder = 2,
					Text = p0.descriptionText,
					fontStyle = var5.Typography.BodyMedium,
					sizeConstraint = if ceiled then { MaxSize = Vector2.new(1e999, ceiled) } else nil,
					tag = {
						["size-full-0 auto-y text-align-x-left text-wrap"] = true,
						["text-truncate-split"] = if ceiled then true else false
					}
				}) or nil)
			}),
			CTAContainer = if p0.ctaText and p0.ctaOnActivated then reactModule.createElement(view, { tag = "auto-xy padding-top-medium", LayoutOrder = 2 }, {
				CTAButton = reactModule.createElement(button, {
					text = p0.ctaText,
					onActivated = p0.ctaOnActivated,
					variant = p0.ctaVariant or buttonVariant.SoftEmphasis,
					size = p0.ctaSize or inputSize.Small
				})
			}) else nil
		}),
		ImageSection = if p0.image then reactModule.createElement(loadableImage, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = false,
			useShimmerAnimationWhileLoading = true,
			Image = p0.image,
			Size = UDim2.new(0, size2500, 0, var9),
			ImageColor3 = if p0.imageStyle then p0.imageStyle.Color3 else var5.Color.Content.Emphasis.Color3,
			ImageTransparency = if p0.imageStyle then p0.imageStyle.Transparency else 0,
			ScaleType = Enum.ScaleType.Crop,
			cornerRadius = p0.cornerRadius or UDim.new(0, var5.Radius.Medium)
		}) else nil
	})
end)