local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local coreGuiService = game:GetService("CoreGui")
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local UIBloxModule = require(parent_1.UIBlox)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.ImageSet.Enum.IconSize
local images = UIBloxModule.App.ImageSet.Images
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local interactable = UIBloxModule.Core.Control.Interactable
local tooltipOrientation = UIBloxModule.App.Dialog.Enum.TooltipOrientation
local useStyle = UIBloxModule.Core.Style.useStyle
local withTooltip = UIBloxModule.App.Dialog.TooltipV2.withTooltip
local captureManagerOpenedModule = require(parent.Actions.CaptureManagerOpened)
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local getCaptureStorageUsageModule = require(parent.Utils.getCaptureStorageUsage)
local usePingLazyRenderResizingModule = require(parent.Hooks.usePingLazyRenderResizing)

return capturesPolicyModule.connect(function(p1)
	return {
		enableCapturesBulkManagement = p1.enableCapturesBulkManagement()
	}
end)(function(p1)
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), reactModule (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), eventNamesModule (ref), captureManagerOpenedModule (ref), getCaptureStorageUsageModule (ref), usePingLazyRenderResizingModule (ref), iconButton (ref), images (ref), iconSize (ref), withTooltip (ref), tooltipOrientation (ref), coreGuiService (ref), interactable (ref), imageSetLabel (ref)
	local var1 = useAnalyticsModule()
	local var2 = useStyle()
	local var3 = useDispatch()
	local color = var2.Theme.TextDefault.Color
	local font = var2.Font.CaptionBody.Font
	local var4 = var2.Font.BaseSize * var2.Font.CaptionBody.RelativeSize
	local var5, var6 = reactModule.useState(false)
	local var7 = useLocalization({
		oneCaptureLabel = "Feature.Captures.Label.OneCapture",
		tooltipTitle = "Feature.Captures.Title.CaptureStorageTooltipTitle",
		tooltipBody = "Feature.Captures.Label.CaptureStorageTooltipLabel",
		multipleCapturesLabel = {
			"Feature.Captures.Label.CaptureCounts",
			numberOfCaptures = p1.itemCount
		}
	})
	local var8 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Captures
	end)
	local var9 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Carousel.IsOpen
	end)
	reactModule.useEffect(function()
		-- upvalues: var9 (ref), var6 (ref)
		if var9 then
			var6(false)
		end
	end, { var9 })
	local var10 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), var1 (ref), eventNamesModule (copy), var3 (ref), captureManagerOpenedModule (copy)
		var6(false)
		var1.fireEvent(eventNamesModule.CapturesManagerOpened)
		var3(captureManagerOpenedModule())
	end, {})
	local var11 = reactModule.useCallback(function(_)
		-- upvalues: var6 (ref), var5 (ref)
		var6(not var5)
	end, { var5 })
	local var12 = reactModule.useMemo(function()
		-- upvalues: getCaptureStorageUsageModule (copy), var8 (ref)
		return getCaptureStorageUsageModule(var8)
	end, { var8 })
	local var13 = if p1.itemCount == 1 then var7.oneCaptureLabel else var7.multipleCapturesLabel
	
	if p1.enableCapturesBulkManagement then
		local var14 = `{var13}{if var12 ~= "" then "" else ", "}{var12}`
		local var15 = reactModule.useRef(nil)
		usePingLazyRenderResizingModule(var15, var14)
		
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var2.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var2.Theme.BackgroundDefault.Transparency,
			LayoutOrder = p1.LayoutOrder,
			Size = UDim2.new(1, 0, 0, 36)
		}, {
			GridLayout = reactModule.createElement("UIGridLayout", {
				FillDirectionMaxCells = 2,
				CellSize = UDim2.new(0.5, -4, 0, 36),
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			IconFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1, Size = UDim2.fromScale(1, 0) }, {
				ListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Right,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				SettingIcon = reactModule.createElement(iconButton, {
					showBackground = false,
					icon = images["icons/common/settings"],
					iconSize = iconSize.Medium,
					onActivated = var10,
					size = UDim2.fromOffset(36, 36)
				})
			}),
			TextFrame = reactModule.createElement("Frame", { BackgroundTransparency = 1 }, {
				ListLayout = reactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Left,
					Padding = UDim.new(0, 4),
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				ItemCountAndStorageSpaceLabel = reactModule.createElement("TextLabel", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					TextWrapped = false,
					AutomaticSize = Enum.AutomaticSize.X,
					Font = font,
					Size = UDim2.fromOffset(0, 20),
					Text = var14,
					TextColor3 = color,
					TextSize = var4,
					TextXAlignment = Enum.TextXAlignment.Left,
					ref = var15
				}),
				InfoIconWithTooltip = withTooltip({
					headerText = var7.tooltipTitle,
					bodyText = var7.tooltipBody
				}, {
					DisplayOrder = 100,
					preferredOrientation = tooltipOrientation.Bottom,
					guiTarget = coreGuiService,
					active = var5
				}, function(p2)
					-- upvalues: var6 (ref), reactModule (copy), interactable (copy), var11 (ref), imageSetLabel (copy), images (copy)
					local var16 = function(p3)
						-- upvalues: var6 (copy), p2 (ref)
						var6(false)
						p2(p3)
					end
					
					return reactModule.createElement(interactable, {
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Position = UDim2.fromScale(1, 0.5),
						Size = UDim2.fromOffset(16, 16),
						[reactModule.Change.AbsolutePosition] = var16,
						[reactModule.Change.AbsoluteSize] = var16,
						[reactModule.Event.Activated] = var11
					}, {
						InfoIcon = reactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							Size = UDim2.fromScale(1, 1),
							Image = images["icons/actions/info_small"]
						})
					})
				end)
			})
		})
	end
	return nil
end)