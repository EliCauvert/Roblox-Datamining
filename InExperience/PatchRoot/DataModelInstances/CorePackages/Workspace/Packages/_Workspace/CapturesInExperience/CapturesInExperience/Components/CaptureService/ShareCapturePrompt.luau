local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local UIBloxModule = require(Parent1.UIBlox)
local View = require(Parent1.Foundation).View
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local UseDispatchFunction = require(Parent1.RoactUtils).Hooks.RoactRodux.useDispatch
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UsePinInputStateWhileOpenModule = require(Parent.Hooks.usePinInputStateWhileOpen)
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local CapturePromptItemModule = require(Parent.Components.CaptureService.CapturePromptItem)
local EventNamesModule = require(Parent.Analytics.EventNames)
local ShareCapturePromptFinishedModule = require(Parent.Thunks.ShareCapturePromptFinished)
local _ = require(Parent.Types)
local FFlagCapturePermissionsPromptFreeMouseModule = require(Parent.Flags.FFlagCapturePermissionsPromptFreeMouse)

return function(p1) --[[ Line: 40 ]]
	-- upvalues: UseAnalyticsModule (copy), UseDispatchFunction (copy), UseScreenSizeFunction (copy), ReactModule (copy), UseLocalizationFunction (copy), UsePinInputStateWhileOpenModule (copy), FFlagCapturePermissionsPromptFreeMouseModule (copy), EventNamesModule (copy), ShareCapturePromptFinishedModule (copy), ButtonType (copy), View (copy), CapturePromptItemModule (copy), InteractiveAlert (copy)
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(Vector2.new(0, 0))
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(Vector2.new(0, 0))
	local Content = p1.promptData.content
	local IsU13LocalSavePrompt = p1.promptData.isU13LocalSavePrompt
	local NoEnableInputDelayed = p1.enableInputDelayed == nil or p1.enableInputDelayed
	local IsVideoCapture = typeof(Content) == "Content" and (Content.Object ~= nil and Content.Object:IsA("VideoCapture"))
	local UseLocalizationResult = UseLocalizationFunction({
		no = "Feature.Captures.Action.NoThanks",
		saveBodyText = "Feature.Captures.Body.SaveCapturesPrompt",
		saveTitle = "Feature.Captures.Title.SaveCapturesPrompt",
		saveYes = "Feature.Captures.Action.Save",
		shareBodyText = "Feature.Captures.Body.ShareCapturePrompt",
		shareTitle = "Feature.Captures.Title.ShareCapturePrompt",
		shareYes = "Feature.Captures.Action.Share"
	})
	local SaveBodyText = if IsU13LocalSavePrompt then UseLocalizationResult.saveBodyText else UseLocalizationResult.shareBodyText
	local SaveTitle = if IsU13LocalSavePrompt then UseLocalizationResult.saveTitle else UseLocalizationResult.shareTitle
	local SaveYes = if IsU13LocalSavePrompt then UseLocalizationResult.saveYes else UseLocalizationResult.shareYes
	UsePinInputStateWhileOpenModule(FFlagCapturePermissionsPromptFreeMouseModule)
	ReactModule.useEffect(function() --[[ Line: 71 ]]
		-- upvalues: IsU13LocalSavePrompt (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), IsVideoCapture (copy)
		if not IsU13LocalSavePrompt then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ShareCapturePromptViewed)
			
			if IsVideoCapture then
				UseAnalyticsModuleResult.fireEvent(EventNamesModule.ShareCapturePromptVideoPrompted)
			end
		end
	end, {
		UseAnalyticsModuleResult.fireEvent,
		IsU13LocalSavePrompt,
		IsVideoCapture
	})
	local UseResult = ReactModule.useCallback(function(Frame) --[[ Line: 84 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(Frame.AbsoluteSize)
	end, { UseStateResult2_1 })
	local UseResult1 = ReactModule.useCallback(function() --[[ Line: 89 ]]
		-- upvalues: IsU13LocalSavePrompt (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), IsVideoCapture (copy), UseDispatchResult (copy), ShareCapturePromptFinishedModule (upval), p1 (copy)
		if not IsU13LocalSavePrompt then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ShareCapturePromptAccepted)
			
			if IsVideoCapture then
				UseAnalyticsModuleResult.fireEvent(EventNamesModule.ShareCapturePromptVideoAccepted)
			end
		end
		UseDispatchResult(ShareCapturePromptFinishedModule(p1.promptId, p1.promptData, true))
	end, {
		UseAnalyticsModuleResult.fireEvent, UseDispatchResult, IsU13LocalSavePrompt,
		IsVideoCapture, p1.promptData, p1.promptId
	})
	local UseResult2 = ReactModule.useCallback(function() --[[ Line: 103 ]]
		-- upvalues: IsU13LocalSavePrompt (copy), UseAnalyticsModuleResult (copy), EventNamesModule (upval), IsVideoCapture (copy), UseDispatchResult (copy), ShareCapturePromptFinishedModule (upval), p1 (copy)
		if not IsU13LocalSavePrompt then
			UseAnalyticsModuleResult.fireEvent(EventNamesModule.ShareCapturePromptRejected)
			
			if IsVideoCapture then
				UseAnalyticsModuleResult.fireEvent(EventNamesModule.ShareCapturePromptVideoRejected)
			end
		end
		UseDispatchResult(ShareCapturePromptFinishedModule(p1.promptId, p1.promptData, false))
	end, {
		UseAnalyticsModuleResult.fireEvent, UseDispatchResult, IsU13LocalSavePrompt,
		IsVideoCapture, p1.promptData, p1.promptId
	})
	
	return ReactModule.createElement(InteractiveAlert, {
		isMiddleContentFocusable = false,
		bodyText = SaveBodyText,
		buttonStackInfo = ReactModule.useMemo(function() --[[ Line: 120 ]]
			-- upvalues: UseResult2 (copy), UseLocalizationResult (copy), ButtonType (upval), NoEnableInputDelayed (copy), UseResult1 (copy), SaveYes (copy)
			return {
				buttons = {
					{
						isDefaultChild = true,
						props = {
							onActivated = UseResult2,
							text = UseLocalizationResult.no
						}
					},
					{
						isDefaultChild = false,
						buttonType = ButtonType.PrimarySystem,
						props = {
							delayInputSeconds = 2,
							enableInputDelayed = NoEnableInputDelayed,
							isDelayedInput = NoEnableInputDelayed,
							onActivated = UseResult1,
							text = SaveYes
						}
					}
				}
			}
		end, {
			NoEnableInputDelayed,
			UseLocalizationResult,
			UseResult1,
			UseResult2,
			SaveYes
		}),
		middleContent = ReactModule.useCallback(function() --[[ Line: 146 ]]
			-- upvalues: UseStateResult (copy), UseStateResult1 (copy), UseScreenSizeResult (copy), ReactModule (upval), View (upval), UseResult (copy), CapturePromptItemModule (upval), Content (copy)
			return ReactModule.createElement(View, {
				Size = UDim2.new(1, 0, 0, 200),
				sizeConstraint = {
					MaxSize = Vector2.new(1e999, UseScreenSizeResult.Y - 80 - (UseStateResult.Y - UseStateResult1.Y))
				},
				onAbsoluteSizeChanged = UseResult
			}, {
				CapturePromptItem = ReactModule.createElement(CapturePromptItemModule, {
					isSelected = true,
					showCheckbox = false,
					content = Content,
					updateSelected = function() --[[ Line: 161 ]] end
				})
			})
		end, {
			UseStateResult,
			Content,
			UseStateResult1,
			ReactModule.useCallback(function(p2) --[[ Line: 116 ]]
				-- upvalues: UseStateResult2_2 (copy)
				UseStateResult2_2(p2.Resolution)
			end, { UseStateResult2_2 }),
			UseStateResult3
		}),
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 80 ]]
			-- upvalues: UseStateResult2 (copy)
			UseStateResult2(Frame.AbsoluteSize)
		end, { UseStateResult2 }),
		position = UDim2.fromScale(0.5, 0.5),
		screenSize = UseScreenSizeResult,
		title = SaveTitle
	})
end