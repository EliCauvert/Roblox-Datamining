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

return capturesPolicyModule.connect(function(p1)
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(p1)
	-- upvalues: useAnalyticsModule (ref), useDispatch (ref), useStyle (ref), useRef (ref), useSelector (ref), constantsModule (ref), reactModule (ref), getSaveToStoragePermissionModule (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (ref), captureTypeModule (ref), eventNamesModule (ref), socialStopwatchModule (ref), shareCaptureModule (ref), externalShareSourceTypeModule (ref), getIsDeleteWarningModalOptedOutModule (ref), deleteWarningModalOpenedModule (ref), uDim_1 (ref), uDim (ref), iconButton (ref), images (ref), uDim2 (ref)
	local var1 = useAnalyticsModule()
	local var2 = useDispatch()
	local var3 = useStyle()
	local var4 = useRef(0)
	local var5 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Captures[p2[constantsModule.RoduxKey].Carousel.SelectedCaptureIndex]
	end)
	local var6 = reactModule.useCallback(function()
		-- upvalues: p1 (ref), var4 (ref)
		return if p1.isDisabled then true else DateTime.now().UnixTimestampMillis - var4.current < 500
	end, { p1.isDisabled })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var4 (ref)
		var4.current = DateTime.now().UnixTimestampMillis
	end, {})
	local var8 = reactModule.useCallback(function()
		-- upvalues: var6 (ref), getSaveToStoragePermissionModule (copy), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var5 (ref), p1 (ref), var2 (ref), var7 (ref), captureTypeModule (copy), var1 (ref), eventNamesModule (copy)
		if var6() then return end
		local var9
		getSaveToStoragePermissionModule(if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then { var5 } else var5, p1.openPermissionModal, var2)
		var7()
		
		if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
			var9 = var5.CaptureType == Enum.CaptureType.Video
			var9 = nil
		else
			var9 = var5.type == captureTypeModule.Video
		end
		if var9 then
			var1.fireEvent(eventNamesModule.CapturesCarouselVideoSaveToExternalStorageActivated)
			
			return
		end
		var1.fireEvent(eventNamesModule.CapturesCarouselSaveToExternalStorageActivated)
	end, { var5, var6, var7, p1.openPermissionModal })
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		AutomaticSize = Enum.AutomaticSize.None,
		BackgroundColor3 = var3.Theme.BackgroundContrast.Color,
		BackgroundTransparency = var3.Theme.BackgroundContrast.Transparency,
		LayoutOrder = p1.LayoutOrder,
		Size = UDim2.new(1, 0, 0, p1.height),
		ZIndex = p1.ZIndex
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
			backgroundColor = var3.Theme.BackgroundUIContrast,
			icon = images["icons/actions/download_medium"],
			onActivated = var8,
			size = uDim2
		}) else reactModule.createElement(iconButton, {
			layoutOrder = 1,
			showBackground = false,
			backgroundColor = var3.Theme.BackgroundUIContrast,
			icon = images["icons/actions/download_medium"],
			onActivated = var8,
			size = uDim2
		}),
		ShareButton = p1.enableShareCaptureCTA and reactModule.createElement(iconButton, {
			layoutOrder = 2,
			showBackground = false,
			backgroundColor = var3.Theme.BackgroundUIContrast,
			icon = images["icons/actions/share"],
			onActivated = reactModule.useCallback(function()
				-- upvalues: var6 (ref), var7 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var5 (ref), captureTypeModule (copy), var1 (ref), eventNamesModule (copy), socialStopwatchModule (copy), var2 (ref), shareCaptureModule (copy), externalShareSourceTypeModule (copy)
				if var6() then return end
				local var9
				var7()
				
				if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var9 = var5.CaptureType == Enum.CaptureType.Video
					var9 = nil
				else
					var9 = var5.type == captureTypeModule.Video
				end
				if var9 then
					var1.fireEvent(eventNamesModule.CapturesCarouselVideoShareActivated)
				else
					var1.fireEvent(eventNamesModule.CapturesCarouselShareActivated)
				end
				if socialStopwatchModule.Stopwatch.get(socialStopwatchModule.Events.CaptureShared) == nil then
					socialStopwatchModule.Stopwatch.start(socialStopwatchModule.Events.CaptureShared)
				end
				var2(shareCaptureModule(var5, externalShareSourceTypeModule.CapturesCarousel))
			end, { var5, p1.isDisabled, var6, var7 }),
			size = uDim2
		}),
		DeleteButton = reactModule.createElement(iconButton, {
			layoutOrder = 4,
			showBackground = false,
			icon = images["icons/actions/edit/delete"],
			onActivated = reactModule.useCallback(function()
				-- upvalues: var6 (ref), var7 (ref), fFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), var5 (ref), captureTypeModule (copy), var1 (ref), eventNamesModule (copy), getIsDeleteWarningModalOptedOutModule (copy), p1 (ref), var2 (ref), deleteWarningModalOpenedModule (copy)
				if var6() then return end
				local var9
				var7()
				
				if fFlagEnableCapturesGalleryRetrievalCoreScriptModule then
					var9 = var5.CaptureType == Enum.CaptureType.Video
					var9 = nil
				else
					var9 = var5.type == captureTypeModule.Video
				end
				if var9 then
					var1.fireEvent(eventNamesModule.CapturesVideoDeleteActivatedInCarousel)
				else
					var1.fireEvent(eventNamesModule.CapturesDeleteActivatedInCarousel)
				end
				if getIsDeleteWarningModalOptedOutModule() then
					assert(p1.deleteItem ~= nil, "props.deleteItem should not be nil")
					p1.deleteItem()
					
					return
				end
				var2(deleteWarningModalOpenedModule())
			end, {
				var5,
				p1.deleteItem,
				p1.isDisabled,
				var6,
				var7
			}),
			size = uDim2
		})
	})
end)