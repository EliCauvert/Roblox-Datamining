local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CapturesCommonModule = require(Parent1.CapturesCommon)
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStyleFunction = require(Parent1.UIBlox).Core.Style.useStyle
local UseSystemMenuDetectionModule = require(Parent.Hooks.useSystemMenuDetection)
local CaptureGridView = CapturesCommonModule.Components.CaptureGridView
local CaptureItem = CapturesCommonModule.Components.CaptureItem
local CarouselOpenedModule = require(Parent.Actions.CarouselOpened)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GalleryActionContainerModule = require(Parent.Components.CapturesGallery.GalleryActionContainer)
local GalleryGridViewModule = require(Parent.Components.CapturesGallery.GalleryGridView)
local FFlagUseCaptureCommonComponentsModule = require(Parent.Flags.FFlagUseCaptureCommonComponents)
local FFlagCapturesGalleryDespawnOnMenuCloseModule = require(Parent.Flags.FFlagCapturesGalleryDespawnOnMenuClose)

return function(Frame)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseSystemMenuDetectionModule (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseLocalizationFunction (copy), ReactModule (copy), EventNamesModule (copy), CarouselOpenedModule (copy), FFlagCapturesGalleryDespawnOnMenuCloseModule (copy), FFlagUseCaptureCommonComponentsModule (copy), CaptureGridView (copy), GalleryActionContainerModule (copy), CaptureItem (copy), GalleryGridViewModule (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseSystemMenuDetectionModuleResult = UseSystemMenuDetectionModule()
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures
	end)
	local NoNextEntry = next(UseSelectorResult) == nil
	local FeatureCapturesTitleGallery = UseLocalizationFunction({
		nothingHereYet = "Feature.Captures.Label.NothingHereYet",
		title = "Feature.Captures.Title.Gallery"
	})
	local UseResult = ReactModule.useCallback(function(p1)
		-- upvalues: UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CarouselOpenedModule (upval)
		return function()
			-- upvalues: UseAnalyticsModuleResult (upval), EventNamesModule (upval), UseDispatchResult (upval), CarouselOpenedModule (upval), p1 (copy)
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesCarouselOpened)
			UseDispatchResult(CarouselOpenedModule(p1))
		end
	end, {})
	local Color = UseStyleResult.Theme.TextMuted.Color
	local CaptionBodyFont = UseStyleResult.Font.CaptionBody.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local Transparency = UseStyleResult.Theme.TextMuted.Transparency
	local NoNoNextEntry: boolean = if FFlagCapturesGalleryDespawnOnMenuCloseModule then UseSystemMenuDetectionModuleResult and not NoNextEntry else not NoNextEntry
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		Size = Frame.Size or UDim2.fromScale(1, 1)
	}, {
		UICorner = ReactModule.createElement("UICorner", { CornerRadius = UDim.new(0, 8) }),
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 12),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Top
		}),
		NothingHereYet = NoNextEntry and ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			TextWrapped = true,
			Font = CaptionBodyFont,
			Size = UDim2.new(1, -12, 1, 12),
			Text = FeatureCapturesTitleGallery.nothingHereYet,
			TextColor3 = Color,
			TextSize = ScaledBaseSize,
			TextTransparency = Transparency,
			TextXAlignment = Enum.TextXAlignment.Center
		}, {
			MaxSize = ReactModule.createElement("UISizeConstraint", { MaxSize = Vector2.new(312, 1e999) })
		}),
		GalleryGridView = if NoNoNextEntry then if FFlagUseCaptureCommonComponentsModule then ReactModule.createElement(CaptureGridView, {
			shouldShowShowMoreButton = true,
			captures = UseSelectorResult,
			header = ReactModule.createElement(GalleryActionContainerModule, {
				isDisabled = false,
				LayoutOrder = 1,
				itemCount = #UseSelectorResult
			}),
			renderItem = function(Capture, p1)
				-- upvalues: ReactModule (upval), CaptureItem (upval), UseResult (copy)
				return ReactModule.createElement(CaptureItem, { capture = Capture, onActivated = UseResult(p1) })
			end
		}) else ReactModule.createElement(GalleryGridViewModule, {
			captures = UseSelectorResult,
			Size = UDim2.new(1, -12, 1, -12)
		}) else nil
	})
end