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

return capturesPolicyModule.connect(function(p1)
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useRef (ref), useSelector (ref), constantsModule (ref), reactModule (ref), capturesSaveToExternalStorageLimit (ref), useLocalization (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), getSaveToStoragePermissionModule (ref), eventNamesModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref), getIsDeleteWarningModalOptedOutModule (ref), deleteWarningModalOpenedModule (ref), iconButton (ref), images (ref), iconSize (ref), uDim2 (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useStyle()
	local var4 = useRef(0)
	local var5 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var6, var7 = reactModule.useState(false)
	local var22Count = #var5
	local var8 = if #var5 ~= 0 then #var5 > 1 else true
	local var9 = if #var5 ~= 0 then capturesSaveToExternalStorageLimit < #var5 else true
	local var10 = #var5 == 0
	local var11 = if p1.isHorizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	local var12 = if p1.isHorizontal then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center
	local var13 = if p1.isHorizontal then UDim2.new(0, p1.width - 279, 0, p1.height) else UDim2.new(1, 0, 0, 38)
	local var14 = if p1.isHorizontal then UDim2.new(0, 279, 0, p1.height) else UDim2.new(1, 0, 0, 44)
	local var15 = useLocalization({
		selectCaptureLabel = "Feature.Captures.Label.SelectCapture",
		oneCaptureSelectedLabel = "Feature.Captures.Label.OneCaptureSelected",
		multipleCapturesSelectedLabel = {
			"Feature.Captures.Label.MultipleCapturesSelected",
			numberOfCaptures = var22Count
		}
	})
	reactModule.useEffect(function()
		-- upvalues: fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var5 (ref), captureTypeModule (copy), var7 (ref)
		local var16 = false
		
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			for i, v in var5 do
				if v.CaptureType == Enum.CaptureType.Video then
					var16 = true
				end
			end
		else
			for i, v in var5 do
				if v.type == captureTypeModule.Video then
					var16 = true
					break
				end
			end
		end
		var7(var16)
	end, { var5 })
	local var17 = reactModule.useCallback(function()
		-- upvalues: var22Count (ref), var15 (ref)
		return if var22Count == 0 then var15.selectCaptureLabel elseif var22Count == 1 then var15.oneCaptureSelectedLabel else var15.multipleCapturesSelectedLabel
	end, { var22Count })
	local var18 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref)
		return if p1.isDisabled then true else DateTime.now().UnixTimestampMillis - var4.current < 500
	end, { p1.isDisabled })
	local var19 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4.current = DateTime.now().UnixTimestampMillis
	end, {})
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
		BackgroundTransparency = var3.Theme.BackgroundContrast.Transparency,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p1.height),
		ZIndex = p1.ZIndex
	}, {
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = var11,
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
			Font = var3.Font.Header2.Font,
			Position = UDim2.new(1, 0, 1, 0),
			Size = var13,
			Text = var17(),
			TextColor3 = var3.Theme.TextEmphasis.Color,
			TextSize = var3.Font.BaseSize * var3.Font.CaptionHeader.RelativeSize,
			TextXAlignment = var12,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		CTAContainer = reactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
			BackgroundTransparency = var3.Theme.BackgroundContrast.Transparency,
			LayoutOrder = p1.LayoutOrder,
			Size = var14,
			ZIndex = p1.ZIndex
		}, {
			Layout = reactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			BulkSaveButton = reactModule.createElement(iconButton, {
				layoutOrder = 1,
				backgroundColor = var3.Theme.BackgroundUIContrast,
				icon = images["icons/actions/download_medium"],
				iconSize = iconSize.Medium,
				isDisabled = var9,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var18 (ref), var5 (ref), getSaveToStoragePermissionModule (copy), p1 (ref), var2 (ref), var1 (ref), eventNamesModule (copy), var19 (ref)
					if var18() or #var5 == 0 then
						return
					end
					getSaveToStoragePermissionModule(var5, p1.openPermissionModal, var2)
					var1.fireEvent(eventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated)
					var19()
				end, { var5, var18, var19, p1.openPermissionModal }),
				size = uDim2
			}),
			BulkShareButton = p1.enableShareCaptureCTA and reactModule.createElement(iconButton, {
				layoutOrder = 1,
				backgroundColor = var3.Theme.BackgroundUIContrast,
				icon = images["icons/actions/share"],
				iconSize = iconSize.Medium,
				isDisabled = var8,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var18 (ref), var8 (ref), var5 (ref), var19 (ref), var6 (ref), var1 (ref), eventNamesModule (copy), socialStopwatchModule (copy), var2 (ref), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
					if var18() or var8 then return end
					local var20 = var5[1]
					var19()
					
					if var6 then
						var1.fireEvent(eventNamesModule.CapturesManagerShareVideoActivated)
					end
					var1.fireEvent(eventNamesModule.CapturesManagerShareActivated)
					
					if not socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureShared) then
						socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureShared)
					end
					var2(shareCaptureModule(var20, externalShareSourceTypeModule.CapturesManager))
				end, {
					var18, var8, var6, p1.isDisabled, var19, var5
				}),
				size = uDim2
			}),
			BulkDeleteButton = reactModule.createElement(iconButton, {
				layoutOrder = 2,
				icon = images["icons/actions/edit/delete"],
				iconSize = iconSize.Medium,
				isDisabled = var10,
				onActivated = reactModule.useCallback(function()
					-- upvalues: var18 (ref), var10 (ref), var19 (ref), var1 (ref), eventNamesModule (copy), getIsDeleteWarningModalOptedOutModule (copy), p1 (ref), var2 (ref), deleteWarningModalOpenedModule (copy)
					if var18() or var10 then return end
					var19()
					var1.fireEvent(eventNamesModule.CapturesDeleteActivatedInCaptureManager)
					
					if getIsDeleteWarningModalOptedOutModule() then
						assert(p1.deleteItem ~= nil, "props.deleteItem should not be nil")
						p1.deleteItem()
						
						return
					end
					var2(deleteWarningModalOpenedModule())
				end, {
					var18,
					var10,
					p1.deleteItem,
					p1.isDisabled,
					var19
				}),
				size = uDim2
			})
		})
	})
end)