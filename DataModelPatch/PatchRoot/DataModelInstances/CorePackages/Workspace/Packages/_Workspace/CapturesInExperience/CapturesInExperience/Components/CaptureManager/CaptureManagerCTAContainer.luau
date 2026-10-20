local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local SocialStopwatchModule = require(Parent1.SocialStopwatch)
local UIBloxModule = require(Parent1.UIBlox)
local IconButton = UIBloxModule.App.Button.IconButton
local IconSize = UIBloxModule.App.Constant.IconSize
local Images = UIBloxModule.App.ImageSet.Images
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseRefFunction = ReactModule.useRef
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local CaptureTypeModule = require(Parent.Enums.CaptureType)
local ConstantsModule = require(Parent.Constants)
local DeleteWarningModalOpenedModule = require(Parent.Actions.DeleteWarningModalOpened)
local EventNamesModule = require(Parent.Analytics.EventNames)
local ExternalShareSourceTypeModule = require(Parent.Enums.ExternalShareSourceType)
local GetIsDeleteWarningModalOptedOutModule = require(Parent.Utils.getIsDeleteWarningModalOptedOut)
local GetSaveToStoragePermissionModule = require(Parent.Utils.getSaveToStoragePermission)
local ShareCaptureModule = require(Parent.Thunks.ShareCapture)
local _ = require(Parent.Types)
local CapturesSaveToExternalStorageLimit = game:DefineFastInt("CapturesSaveToExternalStorageLimit", 10)
local FFlagEnableCapturesGalleryRetrievalCoreScriptModule = require(Parent.Flags.FFlagEnableCapturesGalleryRetrievalCoreScript)
local _UDim2 = UDim2.new(0.33, 0, 0, 36)

return (require(Parent.App.CapturesPolicy).connect(function(p1)
	return { enableShareCaptureCTA = p1.enableShareCaptureCTA() }
end)(function(Frame: Frame)
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseStyleFunction (copy), UseRefFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), ReactModule (copy), CapturesSaveToExternalStorageLimit (copy), UseLocalizationFunction (copy), FFlagEnableCapturesGalleryRetrievalCoreScriptModule (copy), CaptureTypeModule (copy), GetSaveToStoragePermissionModule (copy), EventNamesModule (copy), SocialStopwatchModule (copy), ShareCaptureModule (copy), ExternalShareSourceTypeModule (copy), GetIsDeleteWarningModalOptedOutModule (copy), DeleteWarningModalOpenedModule (copy), IconButton (copy), Images (copy), IconSize (copy), _UDim2 (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseStyleResult = UseStyleFunction()
	local UseRefResult = UseRefFunction(0)
	local UseSelectorResult = UseSelectorFunction(function(p1)
		-- upvalues: ConstantsModule (upval)
		return p1[ConstantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local CountUseSelectorResult = #UseSelectorResult
	local IsDisabled: boolean = #UseSelectorResult == 0 or #UseSelectorResult > 1
	local IsDisabled1: boolean = #UseSelectorResult == 0 or CapturesSaveToExternalStorageLimit < #UseSelectorResult
	local IsDisabled2 = #UseSelectorResult == 0
	local Horizontal = if Frame.isHorizontal then Enum.FillDirection.Horizontal else Enum.FillDirection.Vertical
	local Left = if Frame.isHorizontal then Enum.TextXAlignment.Left else Enum.TextXAlignment.Center
	local _UDim2_1: UDim2 = if Frame.isHorizontal then UDim2.new(0, Frame.width - 279, 0, Frame.height) else UDim2.new(1, 0, 0, 38)
	local _UDim2_2: UDim2 = if Frame.isHorizontal then UDim2.new(0, 279, 0, Frame.height) else UDim2.new(1, 0, 0, 44)
	local UseLocalizationResult = UseLocalizationFunction({
		selectCaptureLabel = "Feature.Captures.Label.SelectCapture",
		oneCaptureSelectedLabel = "Feature.Captures.Label.OneCaptureSelected",
		multipleCapturesSelectedLabel = {
			"Feature.Captures.Label.MultipleCapturesSelected",
			numberOfCaptures = CountUseSelectorResult
		}
	})
	ReactModule.useEffect(function()
		-- upvalues: FFlagEnableCapturesGalleryRetrievalCoreScriptModule (upval), UseSelectorResult (copy), CaptureTypeModule (upval), UseStateResult2 (copy)
		local Flag = false
		repeat
			if FFlagEnableCapturesGalleryRetrievalCoreScriptModule then
				for _, value in UseSelectorResult do
					if value.CaptureType == Enum.CaptureType.Video then
						Flag = true
						break
					end
				end
				break
			end
			for _, value1 in UseSelectorResult do
				if value1.type == CaptureTypeModule.Video then
					Flag = true
				else
					continue
				end
			end
			break
		until true
		UseStateResult2(Flag)
	end, { UseSelectorResult })
	local UseResult = ReactModule.useCallback(function(): boolean
		-- upvalues: Frame (copy), UseRefResult (copy)
		return if Frame.isDisabled then true else DateTime.now().UnixTimestampMillis - UseRefResult.current < 500
	end, { Frame.isDisabled })
	local UseResult1 = ReactModule.useCallback(function()
		-- upvalues: UseRefResult (copy)
		UseRefResult.current = DateTime.now().UnixTimestampMillis
	end, {})
	local UseResult2 = ReactModule.useCallback(function()
		-- upvalues: UseResult (copy), IsDisabled (copy), UseSelectorResult (copy), UseResult1 (copy), UseStateResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), SocialStopwatchModule (upval), UseDispatchResult (copy), ShareCaptureModule (upval), ExternalShareSourceTypeModule (upval)
		if UseResult() or IsDisabled then return end
		local UseSelectorResultEntry = UseSelectorResult[1]
		UseResult1()
		
		if UseStateResult then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesManagerShareVideoActivated)
		end
		UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesManagerShareActivated)
		
		if not SocialStopwatchModule.Stopwatch.get(SocialStopwatchModule.Events.CaptureShared) then
			SocialStopwatchModule.Stopwatch.start(SocialStopwatchModule.Events.CaptureShared)
		end
		UseDispatchResult(ShareCaptureModule(UseSelectorResultEntry, ExternalShareSourceTypeModule.CapturesManager))
	end, {
		UseResult, IsDisabled, UseStateResult, Frame.isDisabled, UseResult1,
		UseSelectorResult
	})
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
		BackgroundTransparency = UseStyleResult.Theme.BackgroundContrast.Transparency,
		LayoutOrder = Frame.LayoutOrder,
		Size = UDim2.new(1, 0, 0, Frame.height),
		ZIndex = Frame.ZIndex
	}, {
		Layout = ReactModule.createElement("UIListLayout", {
			FillDirection = Horizontal,
			HorizontalAlignment = Enum.HorizontalAlignment.Center,
			Padding = UDim.new(0, 0),
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Center
		}),
		Padding = ReactModule.createElement("UIPadding", { PaddingRight = UDim.new(0, 16) }),
		CapturesLabel = ReactModule.createElement("TextLabel", {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			ZIndex = 1,
			AnchorPoint = Vector2.new(1, 0.5),
			AutomaticSize = Enum.AutomaticSize.X,
			Font = UseStyleResult.Font.Header2.Font,
			Position = UDim2.new(1, 0, 1, 0),
			Size = _UDim2_1,
			Text = ReactModule.useCallback(function()
				-- upvalues: CountUseSelectorResult (copy), UseLocalizationResult (copy)
				return if CountUseSelectorResult == 0 then UseLocalizationResult.selectCaptureLabel elseif CountUseSelectorResult == 1 then UseLocalizationResult.oneCaptureSelectedLabel else UseLocalizationResult.multipleCapturesSelectedLabel
			end, { CountUseSelectorResult })(),
			TextColor3 = UseStyleResult.Theme.TextEmphasis.Color,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionHeader.RelativeSize,
			TextXAlignment = Left,
			TextYAlignment = Enum.TextYAlignment.Center
		}),
		CTAContainer = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = UseStyleResult.Theme.BackgroundContrast.Color,
			BackgroundTransparency = UseStyleResult.Theme.BackgroundContrast.Transparency,
			LayoutOrder = Frame.LayoutOrder,
			Size = _UDim2_2,
			ZIndex = Frame.ZIndex
		}, {
			Layout = ReactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			BulkSaveButton = ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
				icon = Images["icons/actions/download_medium"],
				iconSize = IconSize.Medium,
				isDisabled = IsDisabled1,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseResult (copy), UseSelectorResult (copy), GetSaveToStoragePermissionModule (upval), Frame (copy), UseDispatchResult (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseResult1 (copy)
					if not UseResult() and #UseSelectorResult ~= 0 then
						GetSaveToStoragePermissionModule(UseSelectorResult, Frame.openPermissionModal, UseDispatchResult)
						UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesManagerBulkSaveToExternalStorageActivated)
						UseResult1()
						
						return
					end
				end, {
					UseSelectorResult,
					UseResult,
					UseResult1,
					Frame.openPermissionModal
				}),
				size = _UDim2
			}),
			BulkShareButton = Frame.enableShareCaptureCTA and ReactModule.createElement(IconButton, {
				layoutOrder = 1,
				backgroundColor = UseStyleResult.Theme.BackgroundUIContrast,
				icon = Images["icons/actions/share"],
				iconSize = IconSize.Medium,
				isDisabled = IsDisabled,
				onActivated = UseResult2,
				size = _UDim2
			}),
			BulkDeleteButton = ReactModule.createElement(IconButton, {
				layoutOrder = 2,
				icon = Images["icons/actions/edit/delete"],
				iconSize = IconSize.Medium,
				isDisabled = IsDisabled2,
				onActivated = ReactModule.useCallback(function()
					-- upvalues: UseResult (copy), IsDisabled2 (copy), UseResult1 (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), GetIsDeleteWarningModalOptedOutModule (upval), Frame (copy), UseDispatchResult (copy), DeleteWarningModalOpenedModule (upval)
					if UseResult() or IsDisabled2 then return end
					UseResult1()
					UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesDeleteActivatedInCaptureManager)
					
					if GetIsDeleteWarningModalOptedOutModule() then
						assert(Frame.deleteItem ~= nil, "props.deleteItem should not be nil")
						Frame.deleteItem()
						
						return
					else
						UseDispatchResult(DeleteWarningModalOpenedModule())
					end
				end, {
					UseResult,
					IsDisabled2,
					Frame.deleteItem,
					Frame.isDisabled,
					UseResult1
				}),
				size = _UDim2
			})
		})
	})
end))