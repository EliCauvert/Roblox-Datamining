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

return capturesPolicyModule.connect(function(p5) --[[ line: 200 ]]
	return {
		enableCapturesBulkManagement = p5.enableCapturesBulkManagement()
	}
end)(function(p0) --[[ line: 44 ]]
	-- upvalues: useAnalyticsModule (ref), useStyle (ref), useDispatch (ref), reactModule (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), eventNamesModule (ref), captureManagerOpenedModule (ref), getCaptureStorageUsageModule (ref), usePingLazyRenderResizingModule (ref), iconButton (ref), images (ref), iconSize (ref), withTooltip (ref), tooltipOrientation (ref), coreGuiService (ref), interactable (ref), imageSetLabel (ref)
	local var12 = useAnalyticsModule()
	local var13 = useStyle()
	local var14 = useDispatch()
	local color = var13.Theme.TextDefault.Color
	local font = var13.Font.CaptionBody.Font
	local var15 = var13.Font.BaseSize * var13.Font.CaptionBody.RelativeSize
	local var16, var17 = reactModule.useState(false)
	local var18 = useLocalization({
		oneCaptureLabel = "Feature.Captures.Label.OneCapture",
		tooltipTitle = "Feature.Captures.Title.CaptureStorageTooltipTitle",
		tooltipBody = "Feature.Captures.Label.CaptureStorageTooltipLabel",
		multipleCapturesLabel = {
			"Feature.Captures.Label.CaptureCounts",
			numberOfCaptures = p0.itemCount
		}
	})
	local var19 = useSelector(function(p1) --[[ line: 65 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Captures
	end)
	local var20 = useSelector(function(p2) --[[ line: 69 ]]
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Carousel.IsOpen
	end)
	reactModule.useEffect(function() --[[ line: 73 ]]
		-- upvalues: var20 (ref), var17 (ref)
		if var20 then
			var17(false)
		end
	end, { var20 })
	local var21 = reactModule.useCallback(function() --[[ line: 79 ]]
		-- upvalues: var17 (ref), var12 (ref), eventNamesModule (copy), var14 (ref), captureManagerOpenedModule (copy)
		var17(false)
		var12.fireEvent(eventNamesModule.CapturesManagerOpened)
		var14(captureManagerOpenedModule())
	end, {})
	local var22 = reactModule.useCallback(function(_) --[[ line: 85 ]]
		-- upvalues: var17 (ref), var16 (ref)
		var17(not var16)
	end, { var16 })
	local var23 = reactModule.useMemo(function() --[[ line: 89 ]]
		-- upvalues: getCaptureStorageUsageModule (copy), var19 (ref)
		return getCaptureStorageUsageModule(var19)
	end, { var19 })
	local var24 = if p0.itemCount == 1 then var18.oneCaptureLabel else var18.multipleCapturesLabel
	
	if p0.enableCapturesBulkManagement then
		local var25 = `{var24}{if var23 ~= "" then "" else ", "}{var23}`
		local var26 = reactModule.useRef(nil)
		usePingLazyRenderResizingModule(var26, var25)
		
		return reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var13.Theme.BackgroundDefault.Color,
			BackgroundTransparency = var13.Theme.BackgroundDefault.Transparency,
			LayoutOrder = p0.LayoutOrder,
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
					onActivated = var21,
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
					Text = var25,
					TextColor3 = color,
					TextSize = var15,
					TextXAlignment = Enum.TextXAlignment.Left,
					ref = var26
				}),
				InfoIconWithTooltip = withTooltip({
					headerText = var18.tooltipTitle,
					bodyText = var18.tooltipBody
				}, {
					DisplayOrder = 100,
					preferredOrientation = tooltipOrientation.Bottom,
					guiTarget = coreGuiService,
					active = var16
				}, function(p3) --[[ line: 174 ]]
					-- upvalues: var17 (ref), reactModule (copy), interactable (copy), var22 (ref), imageSetLabel (copy), images (copy)
					local var27 = function(p4) --[[ line: 175 ]]
						-- upvalues: var17 (copy), p3 (ref)
						var17(false)
						p3(p4)
					end
					
					return reactModule.createElement(interactable, {
						AnchorPoint = Vector2.new(1, 0.5),
						BackgroundTransparency = 1,
						LayoutOrder = 2,
						Position = UDim2.fromScale(1, 0.5),
						Size = UDim2.fromOffset(16, 16),
						[reactModule.Change.AbsolutePosition] = var27,
						[reactModule.Change.AbsoluteSize] = var27,
						[reactModule.Event.Activated] = var22
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