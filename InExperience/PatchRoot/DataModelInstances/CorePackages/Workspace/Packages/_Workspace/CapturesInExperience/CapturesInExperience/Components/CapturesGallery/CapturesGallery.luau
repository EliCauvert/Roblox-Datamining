local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local capturesCommonModule = require(parent_1.CapturesCommon)
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local UIBloxModule = require(parent_1.UIBlox)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useStyle = UIBloxModule.Core.Style.useStyle
local useSystemMenuDetectionModule = require(parent.Hooks.useSystemMenuDetection)
local captureGridView = capturesCommonModule.Components.CaptureGridView
local captureItem = capturesCommonModule.Components.CaptureItem
local carouselOpenedModule = require(parent.Actions.CarouselOpened)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local galleryActionContainerModule = require(parent.Components.CapturesGallery.GalleryActionContainer)
local galleryGridViewModule = require(parent.Components.CapturesGallery.GalleryGridView)
local fFlagUseCaptureCommonComponentsModule = require(parent.Flags.FFlagUseCaptureCommonComponents)
local fFlagCapturesGalleryDespawnOnMenuCloseModule = require(parent.Flags.FFlagCapturesGalleryDespawnOnMenuClose)

return function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useSystemMenuDetectionModule (ref), useSelector (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), eventNamesModule (ref), carouselOpenedModule (ref), fFlagCapturesGalleryDespawnOnMenuCloseModule (ref), fFlagUseCaptureCommonComponentsModule (ref), captureGridView (ref), galleryActionContainerModule (ref), captureItem (ref), galleryGridViewModule (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useStyle()
	local var4 = useSystemMenuDetectionModule()
	local var5 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Captures
	end)
	local var6 = next(var5) == nil
	local var7 = reactModule.useCallback(function(p2)
		-- upvalues: var1 (ref), eventNamesModule (copy), var2 (ref), carouselOpenedModule (copy)
		return function()
			-- upvalues: var1 (copy), eventNamesModule (copy), var2 (copy), carouselOpenedModule (copy), p2 (ref)
			var1.fireEvent(eventNamesModule.CapturesCarouselOpened)
			var2(carouselOpenedModule(p2))
		end
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var3.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var3.Theme.BackgroundDefault.Transparency,
		LayoutOrder = p1.LayoutOrder,
		Size = p1.Size or UDim2.fromScale(1, 1)
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		NothingHereYet = var6 and reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Font = var3.Font.CaptionBody.Font,
			Size = UDim2.new(1, -12, 1, 12),
			Text = useLocalization({
				nothingHereYet = "Feature.Captures.Label.NothingHereYet",
				title = "Feature.Captures.Title.Gallery"
			}).nothingHereYet,
			TextColor3 = var3.Theme.TextMuted.Color,
			TextSize = var3.Font.BaseSize * var3.Font.CaptionBody.RelativeSize,
			TextTransparency = var3.Theme.TextMuted.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center
		}, {
			MaxSize = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(312, 1e999) })
		}),
		GalleryGridView = if if fFlagCapturesGalleryDespawnOnMenuCloseModule then var4 and not var6 else not var6 then if fFlagUseCaptureCommonComponentsModule then reactModule.createElement(captureGridView, {
			shouldShowShowMoreButton = true,
			captures = var5,
			header = reactModule.createElement(galleryActionContainerModule, { isDisabled = false, LayoutOrder = 1, itemCount = #var5 }),
			renderItem = function(p2, p3)
				-- upvalues: reactModule (copy), captureItem (copy), var7 (ref)
				return reactModule.createElement(captureItem, { capture = p2, onActivated = var7(p3) })
			end
		}) else reactModule.createElement(galleryGridViewModule, { captures = var5, Size = UDim2.new(1, -12, 1, -12) }) else nil
	})
end