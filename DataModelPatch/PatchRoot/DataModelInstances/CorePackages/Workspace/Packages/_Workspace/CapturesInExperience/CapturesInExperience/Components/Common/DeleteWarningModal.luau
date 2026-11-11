local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local ReactModule = require(Parent1.React)
local RoactUtilsModule = require(Parent1.RoactUtils)
local UIBloxModule = require(Parent1.UIBlox)
local Checkbox = require(Parent1.Foundation).Checkbox
local DeleteWarningModalClosedModule = require(Parent.Actions.DeleteWarningModalClosed)
local RecordDeleteWarningModalOptOutModule = require(Parent.Utils.recordDeleteWarningModalOptOut)
local UseCallbackFunction = ReactModule.useCallback
local UseDispatchFunction = RoactUtilsModule.Hooks.RoactRodux.useDispatch
local UseEffectFunction = ReactModule.useEffect
local UseLocalizationFunction = require(Parent1.Localization).Hooks.useLocalization
local UseScreenSizeFunction = require(Parent1.RobloxAppHooks).useScreenSize
local UseSelectorFunction = RoactUtilsModule.Hooks.RoactRodux.useSelector
local UseStateFunction = ReactModule.useState
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local ConstantsModule = require(Parent.Constants)
local EventNamesModule = require(Parent.Analytics.EventNames)
local UseAnalyticsModule = require(Parent.Analytics.useAnalytics)
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

return function(p1)
	-- upvalues: UseScreenSizeFunction (copy), UseStyleFunction (copy), UseAnalyticsModule (copy), UseDispatchFunction (copy), UseLocalizationFunction (copy), UseSelectorFunction (copy), ConstantsModule (copy), UseStateFunction (copy), UseEffectFunction (copy), UseCallbackFunction (copy), DeleteWarningModalClosedModule (copy), EventNamesModule (copy), RecordDeleteWarningModalOptOutModule (copy), ReactModule (copy), InteractiveAlert (copy), ButtonType (copy), Checkbox (copy)
	local UseScreenSizeResult = UseScreenSizeFunction()
	local UseStyleResult = UseStyleFunction()
	local UseAnalyticsModuleResult = UseAnalyticsModule()
	local UseDispatchResult = UseDispatchFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		alertBody = "Feature.Captures.Label.DeleteCaptureInfo",
		alertBodyPlural = "Feature.Captures.Label.DeleteCapturesWarning",
		alertTitle = "Feature.Captures.Title.DeleteCaptureWarning",
		alertTitlePlural = "Feature.Captures.Title.DeleteMultipleCapturesWarning",
		cancelCTA = "Feature.Captures.Action.DeleteCaptureWarningCancel",
		deleteCTA = "Feature.Captures.Action.DeleteCaptureWarningConfirm",
		optOutText = "Feature.Captures.Label.DeleteCaptureWarningOptOut"
	})
	local Theme = UseStyleResult.Theme
	local UseSelectorResult = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].Carousel.IsDeleteWarningModalOpen
	end)
	local UseSelectorResult1 = UseSelectorFunction(function(p2)
		-- upvalues: ConstantsModule (upval)
		return p2[ConstantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	UseEffectFunction(function()
		-- upvalues: UseSelectorResult (copy), UseStateResult2 (copy)
		if UseSelectorResult then
			UseStateResult2(false)
		end
	end, { UseSelectorResult, UseStateResult2 })
	
	return ReactModule.createElement("TextButton", {
		Active = true,
		AutoButtonColor = false,
		BackgroundColor3 = Theme.Overlay.Color,
		BackgroundTransparency = Theme.Overlay.Transparency,
		Size = UDim2.fromScale(1, 1),
		Visible = UseSelectorResult,
		ZIndex = p1.zIndex
	}, {
		Alert = ReactModule.createElement(InteractiveAlert, {
			isMiddleContentFocusable = false,
			bodyText = if #UseSelectorResult1 > 1 then UseLocalizationResult.alertBodyPlural else UseLocalizationResult.alertBody,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.Secondary,
						props = {
							onActivated = UseCallbackFunction(function()
								-- upvalues: UseDispatchResult (copy), DeleteWarningModalClosedModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval)
								UseDispatchResult(DeleteWarningModalClosedModule())
								UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesDeleteWarningModalCancelPressed)
							end, {}),
							text = UseLocalizationResult.cancelCTA
						}
					},
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseCallbackFunction(function()
								-- upvalues: p1 (copy), UseStateResult (copy), RecordDeleteWarningModalOptOutModule (upval), UseAnalyticsModuleResult (copy), EventNamesModule (upval), UseDispatchResult (copy), DeleteWarningModalClosedModule (upval)
								p1.deleteItem()
								
								if UseStateResult then
									RecordDeleteWarningModalOptOutModule(UseAnalyticsModuleResult)
								end
								UseAnalyticsModuleResult.fireEvent(EventNamesModule.CapturesDeleteWarningModalDeletePressed)
								UseDispatchResult(DeleteWarningModalClosedModule())
							end, { UseAnalyticsModuleResult, UseStateResult, p1.deleteItem }),
							text = UseLocalizationResult.deleteCTA
						}
					}
				}
			},
			middleContent = function()
				-- upvalues: ReactModule (upval), Checkbox (upval), UseLocalizationResult (copy), UseStateResult (copy), UseStateResult2 (copy)
				return ReactModule.createElement(Checkbox, {
					isDisabled = false,
					label = UseLocalizationResult.optOutText,
					isChecked = UseStateResult,
					onActivated = function()
						-- upvalues: UseStateResult2 (upval), UseStateResult (upval)
						UseStateResult2(not UseStateResult)
					end
				})
			end,
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = UseScreenSizeResult,
			title = if #UseSelectorResult1 > 1 then UseLocalizationResult.alertTitlePlural else UseLocalizationResult.alertTitle
		})
	})
end