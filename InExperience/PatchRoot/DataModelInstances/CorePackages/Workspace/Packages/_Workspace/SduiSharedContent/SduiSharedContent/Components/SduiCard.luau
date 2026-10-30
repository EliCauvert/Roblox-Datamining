local Parent = script:FindFirstAncestor("SduiSharedContent").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local LoadableImage = require(Parent.UIBlox).App.Loading.LoadableImage
local TextSizeModule = require(Parent.TextSize)
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.SduiCompat)
local View = FoundationModule.View
local Text = FoundationModule.Text
local Button = FoundationModule.Button
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseCursorFunction = FoundationModule.Hooks.useCursor
local ButtonVariant = FoundationModule.Enums.ButtonVariant
local InputSize = FoundationModule.Enums.InputSize
local CursorType = FoundationModule.Enums.CursorType
local StateLayerAffordance = FoundationModule.Enums.StateLayerAffordance
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagFixSduiCardFocusNavScroll = SharedFlagsModule.FFlagFixSduiCardFocusNavScroll
local FFlagLuaAppConfigureSduiCardImageScaleType = SharedFlagsModule.FFlagLuaAppConfigureSduiCardImageScaleType
local FFlagSduiCardBackgroundClickable = SharedFlagsModule.FFlagSduiCardBackgroundClickable

local function v18() end

return ReactModule.memo(function(p1)
	-- upvalues: UseTokensFunction (copy), FFlagFixSduiCardFocusNavScroll (copy), UseCursorFunction (copy), CursorType (copy), SignalsReactModule (copy), TextSizeModule (copy), ReactModule (copy), View (copy), v18 (copy), FFlagSduiCardBackgroundClickable (copy), StateLayerAffordance (copy), Text (copy), Button (copy), ButtonVariant (copy), InputSize (copy), LoadableImage (copy), FFlagLuaAppConfigureSduiCardImageScaleType (copy)
	local UseTokensResult = UseTokensFunction()
	local UseCursorResult = if FFlagFixSduiCardFocusNavScroll then UseCursorFunction(CursorType.RoundedRect) else nil
	local Size2500 = UseTokensResult.Size.Size_2500
	local UseSignalStateResult = SignalsReactModule.useSignalState(function(p2)
		-- upvalues: TextSizeModule (upval)
		return TextSizeModule.getTextSizeStore(p2).getTextSizeOffset(p2)
	end)
	local Y: number? = nil
	
	if p1.descriptionMaxLines and p1.descriptionMaxLines > 0 then
		local BodyMedium = UseTokensResult.Typography.BodyMedium
		Y = math.ceil(p1.descriptionMaxLines * (BodyMedium.FontSize + UseSignalStateResult) * BodyMedium.LineHeight)
	end
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	
	return ReactModule.createElement(View, {
		tag = "size-full-0 row auto-y stroke-default",
		backgroundStyle = p1.backgroundStyle or UseTokensResult.Color.Surface.Surface_100,
		cornerRadius = p1.cornerRadius or UDim.new(0, UseTokensResult.Radius.Medium),
		selection = if FFlagFixSduiCardFocusNavScroll then ReactModule.useMemo(function()
			-- upvalues: UseCursorResult (copy), p1 (copy)
			return {
				Selectable = true,
				SelectionImageObject = UseCursorResult,
				SelectionOrder = p1.selectionOrder
			}
		end, { UseCursorResult, p1.selectionOrder }) else nil,
		onStateChanged = if FFlagFixSduiCardFocusNavScroll then v18 else nil,
		stateLayer = if FFlagFixSduiCardFocusNavScroll and (not FFlagSduiCardBackgroundClickable or p1.backgroundOnActivated == nil) then { affordance = StateLayerAffordance.None } else nil,
		onActivated = if FFlagSduiCardBackgroundClickable then p1.backgroundOnActivated else nil,
		AnchorPoint = p1.anchorPoint,
		LayoutOrder = p1.layoutOrder,
		Position = p1.position,
		Size = p1.size,
		ZIndex = p1.zIndex,
		testId = p1.testId
	}, {
		ContentSection = ReactModule.createElement(View, {
			tag = "flex-between size-full-0 auto-y col gap-xsmall padding-top-large padding-bottom-large padding-left-large padding-right-small",
			LayoutOrder = 1,
			Size = UDim2.new(UDim.new(1, -Size2500), p1.size and p1.size.Height or UDim.new(0, 0)),
			onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame)
				-- upvalues: UseStateResult2 (copy)
				UseStateResult2(Frame.AbsoluteSize.Y)
			end, {})
		}, {
			TopContent = ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y gap-xsmall",
				LayoutOrder = 1
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "size-full-0 auto-y text-align-x-left text-wrap text-label-large content-emphasis",
					LayoutOrder = 1,
					Text = p1.titleText
				}),
				Subtitle = p1.descriptionText and ReactModule.createElement(Text, {
					LayoutOrder = 2,
					Text = p1.descriptionText,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					sizeConstraint = if Y then { MaxSize = Vector2.new(1e999, Y) } else nil,
					tag = {
						["size-full-0 auto-y text-align-x-left text-wrap"] = true,
						["text-truncate-split"] = if Y then true else false
					}
				}) or nil
			}),
			CTAContainer = if p1.ctaText and p1.ctaOnActivated then ReactModule.createElement(View, { tag = "auto-xy padding-top-medium", LayoutOrder = 2 }, {
				CTAButton = ReactModule.createElement(Button, {
					text = p1.ctaText,
					onActivated = p1.ctaOnActivated,
					variant = p1.ctaVariant or ButtonVariant.SoftEmphasis,
					size = p1.ctaSize or InputSize.Small,
					testId = if p1.testId then `{p1.testId}--cta` else nil
				})
			}) else nil
		}),
		ImageSection = if p1.image then ReactModule.createElement(LoadableImage, {
			LayoutOrder = 2,
			BackgroundTransparency = 1,
			showFailedStateWhenLoadingFailed = false,
			useShimmerAnimationWhileLoading = true,
			Image = p1.image,
			Size = UDim2.new(0, Size2500, 0, UseStateResult),
			ImageColor3 = p1.imageStyle and p1.imageStyle.Color3 or UseTokensResult.Color.Content.Emphasis.Color3,
			ImageTransparency = p1.imageStyle and p1.imageStyle.Transparency or 0,
			ScaleType = FFlagLuaAppConfigureSduiCardImageScaleType and p1.imageScaleType or Enum.ScaleType.Crop,
			cornerRadius = p1.cornerRadius or UDim.new(0, UseTokensResult.Radius.Medium)
		}) else nil
	})
end)