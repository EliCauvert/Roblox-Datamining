local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local CoreGui = game:GetService("CoreGui")
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UIBloxModule = require(Parent1.UIBlox)
local FoundationModule = require(Parent1.Foundation)
local NormalizeFontFaceFunction = FoundationModule.Utility.normalizeFontFace
local FoundationFontFaceMigration = FoundationModule.Utility.Flags.FoundationFontFaceMigration
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Interactable = UIBloxModule.Core.Control.Interactable
local TooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local WithTooltipFunction = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local CaptureManagerOpenedModule = require(Parent.Actions.CaptureManagerOpened)
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local GetCaptureStorageUsageModule = require(Parent.Utils.getCaptureStorageUsage)
local UsePingLazyRenderResizingModule = require(Parent.Hooks.usePingLazyRenderResizing)

return (require(Parent.App.CapturesPolicy).connect(function(p1)
	return {
		enableCapturesBulkManagement = p1.enableCapturesBulkManagement()
	}
end)(function(Frame)
	-- upvalues: UseAnalyticsModule (copy), UseStyleFunction (copy), UseDispatchFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), EventNamesModule (copy), CaptureManagerOpenedModule (copy), GetCaptureStorageUsageModule (copy), UsePingLazyRenderResizingModule (copy), IconButton (copy), Images (copy), IconSize (copy), FoundationFontFaceMigration (copy), NormalizeFontFaceFunction (copy), WithTooltipFunction (copy), TooltipOrientation (copy), CoreGui (copy), Interactable (copy), ImageSetLabel (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseStyleResult = UseStyleFunction()
	local UseDispatchResult = UseDispatchFunction()
	local Color = UseStyleResult.Theme.TextDefault.Color
	local CaptionBodyFont = UseStyleResult.Font.CaptionBody.Font
	local ScaledBaseSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		oneCaptureLabel = "Feature.Captures.Label.OneCapture",
		tooltipTitle = "Feature.Captures.Title.CaptureStorageTooltipTitle",
		tooltipBody = "Feature.Captures.Label.CaptureStorageTooltipLabel",
		multipleCapturesLabel = {
			"Feature.Captures.Label.CaptureCounts",
			numberOfCaptures = Frame.itemCount
		}
	})
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Captures
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].Carousel.IsOpen
	end)
	ReactModule.useEffect(function()
		-- upvalues: UseSelectorResult1 (copy), UseStateResult2 (copy)
		if UseSelectorResult1 then
			UseStateResult2(false)
		end
	end, { UseSelectorResult1 })
	local UseResult = ReactModule.useCallback(function()
		-- upvalues: UseStateResult2 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), CaptureManagerOpenedModule (upval)
		UseStateResult2(false)
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesManagerOpened)
		UseDispatchResult(CaptureManagerOpenedModule())
	end, {})
	local UseResult1 = ReactModule.useCallback(function(_)
		-- upvalues: UseStateResult2 (copy), UseStateResult (copy)
		UseStateResult2(not UseStateResult)
	end, { UseStateResult })
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: GetCaptureStorageUsageModule (upval), UseSelectorResult (copy)
		return GetCaptureStorageUsageModule(UseSelectorResult)
	end, { UseSelectorResult })
	local OneCaptureLabel = if Frame.itemCount == 1 then UseLocalizationResult.oneCaptureLabel else UseLocalizationResult.multipleCapturesLabel
	
	if Frame.enableCapturesBulkManagement then
		local Text: string = `{OneCaptureLabel}{if UseMemoResult == "" then "" else ", "}{UseMemoResult}`
		local UseRefResult = ReactModule.useRef(nil)
		UsePingLazyRenderResizingModule(UseRefResult, Text)
		
		return ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundDefault.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundDefault.Transparency,
			LayoutOrder = Frame.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 36)
		}, {
			GridLayout = ReactModule.createElement("UIGridLayout", {
				FillDirectionMaxCells = 2,
				CellSize = UDim2.new(0.5, -4, 0, 36),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			IconFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0) }, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				SettingIcon = ReactModule.createElement(IconButton, {
					showBackground = false,
					icon = Images["icons/common/settings"],
					iconSize = IconSize.Medium,
					onActivated = UseResult,
					size = UDim2.fromOffset(36, 36)
				})
			}),
			TextFrame = ReactModule.createElement("Frame", { BackgroundTransparency = 1 }, {
				ListLayout = ReactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				ItemCountAndStorageSpaceLabel = ReactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextWrapped = false,
					AutomaticSize = Enum.AutomaticSize.X,
					Font = if FoundationFontFaceMigration then nil else CaptionBodyFont,
					FontFace = if FoundationFontFaceMigration then NormalizeFontFaceFunction(UseStyleResult.Tokens.Typography.BodySmall.Font) else nil,
					Size = UDim2.fromOffset(0, 20),
					Text = Text,
					TextColor3 = Color,
					TextSize = ScaledBaseSize,
					TextXAlignment = Enum.TextXAlignment.Left,
					ref = UseRefResult
				}),
				InfoIconWithTooltip = WithTooltipFunction({
					headerText = UseLocalizationResult.tooltipTitle,
					bodyText = UseLocalizationResult.tooltipBody
				}, {
					DisplayOrder = 100,
					preferredOrientation = TooltipOrientation.Bottom,
					guiTarget = CoreGui,
					active = UseStateResult
				}, function(Callback)
					-- upvalues: UseStateResult2 (copy), ReactModule (upval), Interactable (upval), UseResult1 (copy), ImageSetLabel (upval), Images (upval)
					local function v37(p1)
						-- upvalues: UseStateResult2 (upval), Callback (copy)
						UseStateResult2(false)
						Callback(p1)
					end
					
					return ReactModule.createElement(Interactable, {
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Position = UDim2.fromScale(1, 0.5),
						Size = UDim2.fromOffset(16, 16),
						[ReactModule.Change.AbsolutePosition] = v37,
						[ReactModule.Change.AbsoluteSize] = v37,
						[ReactModule.Event.Activated] = UseResult1
					}, {
						InfoIcon = ReactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							Image = Images["icons/actions/info_small"]
						})
					})
				end)
			})
		})
	else
		return nil
	end
end))