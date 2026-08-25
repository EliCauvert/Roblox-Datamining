local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local UIBloxModule = require(parent_1.UIBlox)
local iconButton = UIBloxModule.App.Button.IconButton
local iconSize = UIBloxModule.App.Constant.IconSize
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useLocalization = localizationModule.Hooks.useLocalization
local useRef = reactModule.useRef
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local capturesPolicyModule = require(parent.App.CapturesPolicy)
local captureTypeModule = require(parent.Enums.CaptureType)
local constantsModule = require(parent.Constants)
local deleteWarningModalOpenedModule = require(parent.Actions.DeleteWarningModalOpened)
local eventNamesModule = require(parent.Analytics.EventNames)
local externalShareSourceTypeModule = require(parent.Enums.ExternalShareSourceType)
local getIsDeleteWarningModalOptedOutModule = require(parent.Utils.getIsDeleteWarningModalOptedOut)
local getSaveToStoragePermissionModule = require(parent.Utils.getSaveToStoragePermission)
local shareCaptureModule = require(parent.Thunks.ShareCapture)
local _ = require(parent.Types)
local capturesSaveToExternalStorageLimit = game:DefineFastInt("CapturesSaveToExternalStorageLimit", 10)
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local uDim2 = UDim2.new(0.33, 0, 0, 36)

return capturesPolicyModule.connect(function(p2)
	return { enableShareCaptureCTA = p2.enableShareCaptureCTA() }
end)(function(p0)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useRef (ref), useSelector (ref), constantsModule (ref), reactModule (ref), capturesSaveToExternalStorageLimit (ref), useLocalization (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), getSaveToStoragePermissionModule (ref), eventNamesModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref), getIsDeleteWarningModalOptedOutModule (ref), deleteWarningModalOpenedModule (ref), iconButton (ref), images (ref), iconSize (ref), uDim2 (ref)
	local var18 = useAnalyticsModule()
	local var19 = useDispatch()
	local var20 = useStyle()
	local var21 = useRef(0)
	local var22 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var23, var24 = reactModule.useState(false)
	local var22Count = #var22
	local var26 = if #var22 ~= 0 then #var22 > 1 else true
	local var27 = if #var22 ~= 0 then capturesSaveToExternalStorageLimit < #var22 else true
	local var28 = #var22 == 0
	local var29 = if p0.isHorizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	local var30 = if p0.isHorizontal then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center
	local var31 = if p0.isHorizontal then UDim2.new(0, p0.width - 279, 0, p0.height) else UDim2.new(1, 0, 0, 38)
	local var32 = if p0.isHorizontal then UDim2.new(0, 279, 0, p0.height) else UDim2.new(1, 0, 0, 44)
	local var33 = useLocalization({
		selectCaptureLabel = "Feature.Captures.Label.SelectCapture",
		oneCaptureSelectedLabel = "Feature.Captures.Label.OneCaptureSelected",
		multipleCapturesSelectedLabel = {
			"Feature.Captures.Label.MultipleCapturesSelected",
			numberOfCaptures = var22Count
		}
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var22 (ref), captureTypeModule (copy), var24 (ref)
		local var37 = false
		
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			for i, v in var22 do
				if v.CaptureType == Enum.CaptureType.Video then
					var37 = true
				end
			end
		else
			for i, v in var22 do
				if v.type == captureTypeModule.Video then
					var37 = true
					break
				end
			end
		end
		var24(var37)
	end, { var22 })
	local var34 = reactModule.useCallback(function()
		-- upvalues: var22Count (ref), var33 (ref)
		return if var22Count == 0 then var33.selectCaptureLabel elseif var22Count == 1 then var33.oneCaptureSelectedLabel else var33.multipleCapturesSelectedLabel
	end, { var22Count })
	local var35 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var21 (ref)
		return if p0.isDisabled then true else DateTime.now().UnixTimestampMillis - var21.current < 500
	end, { p0.isDisabled })
	local var36 = reactModule.useCallback(function()
		-- upvalues: var21 (ref)
		var21.current = DateTime.now().UnixTimestampMillis
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var20.Theme.BackgroundContrast.Color,
		BackgroundTransparency = var20.Theme.BackgroundContrast.Transparency,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p0.height),
		ZIndex = p0.ZIndex
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = var29,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Padding = reactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 16) }),
		CapturesLabel = reactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			AutomaticSize = Enum.AutomaticSize.X,
			Font = var20.Font.Header2.Font,
			Position = UDim2.new(1, 0, 1, 0),
			Size = var31,
			Text = var34(),
			TextColor3 = var20.Theme.TextEmphasis.Color,
			TextSize = var20.Font.BaseSize * var20.Font.CaptionHeader.RelativeSize,
			TextXAlignment = var30,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		CTAContainer = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var20.Theme.BackgroundContrast.Color,
			BackgroundTransparency = var20.Theme.BackgroundContrast.Transparency,
			LayoutOrder = p0.LayoutOrder,
			Size = var32,
			ZIndex = p0.ZIndex
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			BulkSaveButton = reactModule.createElement(iconButton, {
				layoutOrder = 1,
				backgroundColor = var20.Theme.BackgroundUIContrast,
				icon = images["icons/actions/download_medium"],
				iconSize = iconSize.Medium,
				isDisabled = var27,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var35 (ref), var22 (ref), getSaveToStoragePermissionModule (copy), p0 (ref), var19 (ref), var18 (ref), eventNamesModule (copy), var36 (ref)
					if var35() or #var22 == 0 then
						return
					end
					getSaveToStoragePermissionModule(var22, p0.openPermissionModal, var19)
					var18.fireEvent(eventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated)
					var36()
				end, { var22, var35, var36, p0.openPermissionModal }),
				size = uDim2
			}),
			BulkShareButton = p0.enableShareCaptureCTA and reactModule.createElement(iconButton, {
				layoutOrder = 1,
				backgroundColor = var20.Theme.BackgroundUIContrast,
				icon = images["icons/actions/share"],
				iconSize = iconSize.Medium,
				isDisabled = var26,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var35 (ref), var26 (ref), var22 (ref), var36 (ref), var23 (ref), var18 (ref), eventNamesModule (copy), socialStopwatchModule (copy), var19 (ref), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
					if var35() or var26 then return end
					local var38 = var22[1]
					var36()
					
					if var23 then
						var18.fireEvent(eventNamesModule.CapturesManagerShareVideoActivated)
					end
					var18.fireEvent(eventNamesModule.CapturesManagerShareActivated)
					
					if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureShared) then
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureShared)
					end
					var19(shareCaptureModule(var38, externalShareSourceTypeModule.CapturesManager))
				end, {
					var35, var26, var23, p0.isDisabled, var36, var22
				}),
				size = uDim2
			}),
			BulkDeleteButton = reactModule.createElement(iconButton, {
				layoutOrder = 2,
				icon = images["icons/actions/edit/delete"],
				iconSize = iconSize.Medium,
				isDisabled = var28,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var35 (ref), var28 (ref), var36 (ref), var18 (ref), eventNamesModule (copy), getIsDeleteWarningModalOptedOutModule (copy), p0 (ref), var19 (ref), deleteWarningModalOpenedModule (copy)
					if var35() or var28 then return end
					var36()
					var18.fireEvent(eventNamesModule.CapturesDeleteActivatedInCaptureManager)
					
					if getIsDeleteWarningModalOptedOutModule() then
						assert(p0.deleteItem ~= nil, "props.deleteItem should not be nil")
						p0.deleteItem()
						
						return
					end
					var19(deleteWarningModalOpenedModule())
				end, {
					var35,
					var28,
					p0.deleteItem,
					p0.isDisabled,
					var36
				}),
				size = uDim2
			})
		})
	})
end)