local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local socialStopwatchModule = require(parent_1.SocialStopwatch)
local UIBloxModule = require(parent_1.UIBlox)
local iconButton = UIBloxModule.App.Button.IconButton
local images = UIBloxModule.App.ImageSet.Images
local useStyle = UIBloxModule.Core.Style.useStyle
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
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
local fFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local uDim = UDim.new(0.12, 0)
local uDim2 = UDim2.fromOffset(36, 36)
local uDim_1 = UDim.new(0, 8)

return capturesPolicyModule.connect(function(p2)
	return { enableShareCaptureCTA = p2.enableShareCaptureCTA() }
end)(function(p0)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useRef (ref), useSelector (ref), constantsModule (ref), reactModule (ref), getSaveToStoragePermissionModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), eventNamesModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref), getIsDeleteWarningModalOptedOutModule (ref), deleteWarningModalOpenedModule (ref), uDim_1 (ref), uDim (ref), iconButton (ref), images (ref), uDim2 (ref)
	local var18 = useAnalyticsModule()
	local var19 = useDispatch()
	local var20 = useStyle()
	local var21 = useRef(0)
	local var22 = useSelector(function(p1)
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Captures[p1[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex]
	end)
	local var23 = reactModule.useCallback(function()
		-- upvalues: p0 (ref), var21 (ref)
		return if p0.isDisabled then true else DateTime.now().UnixTimestampMillis - var21.current < 500
	end, { p0.isDisabled })
	local var24 = reactModule.useCallback(function()
		-- upvalues: var21 (ref)
		var21.current = DateTime.now().UnixTimestampMillis
	end, {})
	local var25 = reactModule.useCallback(function()
		-- upvalues: var23 (ref), getSaveToStoragePermissionModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var22 (ref), p0 (ref), var19 (ref), var24 (ref), captureTypeModule (copy), var18 (ref), eventNamesModule (copy)
		if var23() then return end
		local var26
		getSaveToStoragePermissionModule(if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then { var22 } else var22, p0.openPermissionModal, var19)
		var24()
		
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			var26 = var22.CaptureType == Enum.CaptureType.Video
			var26 = nil
		else
			var26 = var22.type == captureTypeModule.Video
		end
		if var26 then
			var18.fireEvent(eventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated)
			
			return
		end
		var18.fireEvent(eventNamesModule.CapturesCarouselSaveToExternalStorageActivated)
	end, { var22, var23, var24, p0.openPermissionModal })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = var20.Theme.BackgroundContrast.Color,
		BackgroundTransparency = var20.Theme.BackgroundContrast.Transparency,
		LayoutOrder = p0.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p0.height),
		ZIndex = p0.ZIndex
	}, {
		UICorner = reactModule.createElement("UICorner", { CornerRadius = uDim_1 }),
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 12),
			PaddingRight = UDim.new(0, 12)
		}),
		Layout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = uDim,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		SaveButton = if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then reactModule.createElement(iconButton, {
			layoutOrder = 1,
			showBackground = false,
			backgroundColor = var20.Theme.BackgroundUIContrast,
			icon = images["icons/actions/download_medium"],
			onActivated = var25,
			size = uDim2
		}) else reactModule.createElement(iconButton, {
			layoutOrder = 1,
			showBackground = false,
			backgroundColor = var20.Theme.BackgroundUIContrast,
			icon = images["icons/actions/download_medium"],
			onActivated = var25,
			size = uDim2
		}),
		ShareButton = p0.enableShareCaptureCTA and reactModule.createElement(iconButton, {
			layoutOrder = 2,
			showBackground = false,
			backgroundColor = var20.Theme.BackgroundUIContrast,
			icon = images["icons/actions/share"],
			onActivated = reactModule.useCallback(function()
				-- upvalues: var23 (ref), var24 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var22 (ref), captureTypeModule (copy), var18 (ref), eventNamesModule (copy), socialStopwatchModule (copy), var19 (ref), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
				if var23() then return end
				local var27
				var24()
				
				if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var27 = var22.CaptureType == Enum.CaptureType.Video
					var27 = nil
				else
					var27 = var22.type == captureTypeModule.Video
				end
				if var27 then
					var18.fireEvent(eventNamesModule.CapturesCarouselVideoShareActivated)
				else
					var18.fireEvent(eventNamesModule.CapturesCarouselShareActivated)
				end
				if socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureShared) == nil then
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureShared)
				end
				var19(shareCaptureModule(var22, externalShareSourceTypeModule.CapturesCarousel))
			end, { var22, p0.isDisabled, var23, var24 }),
			size = uDim2
		}),
		DeleteButton = reactModule.createElement(iconButton, {
			layoutOrder = 4,
			showBackground = false,
			icon = images["icons/actions/edit/delete"],
			onActivated = reactModule.useCallback(function()
				-- upvalues: var23 (ref), var24 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var22 (ref), captureTypeModule (copy), var18 (ref), eventNamesModule (copy), getIsDeleteWarningModalOptedOutModule (copy), p0 (ref), var19 (ref), deleteWarningModalOpenedModule (copy)
				if var23() then return end
				local var28
				var24()
				
				if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var28 = var22.CaptureType == Enum.CaptureType.Video
					var28 = nil
				else
					var28 = var22.type == captureTypeModule.Video
				end
				if var28 then
					var18.fireEvent(eventNamesModule.CapturesVideoDeleteActivatedInCarousel)
				else
					var18.fireEvent(eventNamesModule.CapturesDeleteActivatedInCarousel)
				end
				if getIsDeleteWarningModalOptedOutModule() then
					assert(p0.deleteItem ~= nil, "props.deleteItem should not be nil")
					p0.deleteItem()
					
					return
				end
				var19(deleteWarningModalOpenedModule())
			end, {
				var22,
				p0.deleteItem,
				p0.isDisabled,
				var23,
				var24
			}),
			size = uDim2
		})
	})
end)