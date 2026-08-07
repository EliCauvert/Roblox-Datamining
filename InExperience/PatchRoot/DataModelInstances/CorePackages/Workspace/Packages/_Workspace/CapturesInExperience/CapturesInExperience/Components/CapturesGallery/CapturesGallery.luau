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

return function(p0) --[[ line: 38 ]]
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useSystemMenuDetectionModule (ref), useSelector (ref), constantsModule (ref), useLocalization (ref), reactModule (ref), eventNamesModule (ref), carouselOpenedModule (ref), fFlagCapturesGalleryDespawnOnMenuCloseModule (ref), fFlagUseCaptureCommonComponentsModule (ref), captureGridView (ref), galleryActionContainerModule (ref), captureItem (ref), galleryGridViewModule (ref)
	local var14 = useAnalyticsModule()
	local var15 = useDispatch()
	local var16 = useStyle()
	local var17 = useSystemMenuDetectionModule()
	local var18 = useSelector(function(p1) --[[ line: 44 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Captures
	end)
	local var19 = next(var18) == nil
	local var20 = reactModule.useCallback(function(p2) --[[ line: 55 ]]
		-- upvalues: var14 (ref), eventNamesModule (copy), var15 (ref), carouselOpenedModule (copy)
		return function() --[[ line: 56 ]]
			-- upvalues: var14 (copy), eventNamesModule (copy), var15 (copy), carouselOpenedModule (copy), p2 (ref)
			var14.fireEvent(eventNamesModule.CapturesCarouselOpened)
			var15(carouselOpenedModule(p2))
		end
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var16.Theme.BackgroundDefault.Color,
		BackgroundTransparency = var16.Theme.BackgroundDefault.Transparency,
		LayoutOrder = p0.LayoutOrder,
		Size = p0.Size or UDim2.fromScale(1, 1)
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		NothingHereYet = var19 and reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Font = var16.Font.CaptionBody.Font,
			Size = UDim2.new(1, -12, 1, 12),
			Text = useLocalization({
				nothingHereYet = "Feature.Captures.Label.NothingHereYet",
				title = "Feature.Captures.Title.Gallery"
			}).nothingHereYet,
			TextColor3 = var16.Theme.TextMuted.Color,
			TextSize = var16.Font.BaseSize * var16.Font.CaptionBody.RelativeSize,
			TextTransparency = var16.Theme.TextMuted.Transparency,
			TextXAlignment = Enum.TextXAlignment.Center
		}, {
			MaxSize = reactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(312, 1e999) })
		}),
		GalleryGridView = if if fFlagCapturesGalleryDespawnOnMenuCloseModule then var17 and not var19 else not var19 then if fFlagUseCaptureCommonComponentsModule then reactModule.createElement(captureGridView, {
			shouldShowShowMoreButton = true,
			captures = var18,
			header = reactModule.createElement(galleryActionContainerModule, { isDisabled = false, LayoutOrder = 1, itemCount = #var18 }),
			renderItem = function(p3, p4) --[[ line: 119 ]]
				-- upvalues: reactModule (copy), captureItem (copy), var20 (ref)
				return reactModule.createElement(captureItem, { capture = p3, onActivated = var20(p4) })
			end
		}) else reactModule.createElement(galleryGridViewModule, { captures = var18, Size = UDim2.new(1, -12, 1, -12) }) else nil
	})
end