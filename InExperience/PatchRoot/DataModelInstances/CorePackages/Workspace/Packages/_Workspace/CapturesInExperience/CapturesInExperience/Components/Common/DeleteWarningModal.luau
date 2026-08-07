local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local localizationModule = require(parent_1.Localization)
local reactModule = require(parent_1.React)
local roactUtilsModule = require(parent_1.RoactUtils)
local robloxAppHooksModule = require(parent_1.RobloxAppHooks)
local UIBloxModule = require(parent_1.UIBlox)
local checkbox = require(parent_1.Foundation).Checkbox
local deleteWarningModalClosedModule = require(parent.Actions.DeleteWarningModalClosed)
local recordDeleteWarningModalOptOutModule = require(parent.Utils.recordDeleteWarningModalOptOut)
local useCallback = reactModule.useCallback
local useDispatch = roactUtilsModule.Hooks.RoactRodux.useDispatch
local useEffect = reactModule.useEffect
local useLocalization = localizationModule.Hooks.useLocalization
local useScreenSize = robloxAppHooksModule.useScreenSize
local useSelector = roactUtilsModule.Hooks.RoactRodux.useSelector
local useState = reactModule.useState
local useStyle = UIBloxModule.Core.Style.useStyle
local constantsModule = require(parent.Constants)
local eventNamesModule = require(parent.Analytics.EventNames)
local useAnalyticsModule = require(parent.Analytics.useAnalytics)
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert

return function(p0) --[[ line: 37 ]]
	-- upvalues: useScreenSize (ref), useStyle (ref), useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), useState (ref), useEffect (ref), useCallback (ref), deleteWarningModalClosedModule (ref), eventNamesModule (ref), recordDeleteWarningModalOptOutModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref), checkbox (ref)
	local var10 = useScreenSize()
	local var11 = useStyle()
	local var12 = useAnalyticsModule()
	local var13 = useDispatch()
	local var14 = useLocalization({
		alertBody = "Feature.Captures.Label.DeleteCaptureInfo",
		alertBodyPlural = "Feature.Captures.Label.DeleteCapturesWarning",
		alertTitle = "Feature.Captures.Title.DeleteCaptureWarning",
		alertTitlePlural = "Feature.Captures.Title.DeleteMultipleCapturesWarning",
		cancelCTA = "Feature.Captures.Action.DeleteCaptureWarningCancel",
		deleteCTA = "Feature.Captures.Action.DeleteCaptureWarningConfirm",
		optOutText = "Feature.Captures.Label.DeleteCaptureWarningOptOut"
	})
	local theme = var11.Theme
	local var15 = useSelector(function(p1) --[[ line: 56 ]]
		-- upvalues: constantsModule (copy)
		return p1[constantsModule.RoduxKey].Carousel.IsDeleteWarningModalOpen
	end)
	local var16 = useSelector(function(p2) --[[ line: 60 ]]
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var17, var18 = useState(false)
	useEffect(function() --[[ line: 66 ]]
		-- upvalues: var15 (ref), var18 (ref)
		if var15 then
			var18(false)
		end
	end, { var15, var18 })
	
	return reactModule.createElement("TextButton", {
		Active = true,
		AutoButtonColor = false,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.fromScale(1, 1),
		Visible = var15,
		ZIndex = p0.zIndex
	}, {
		Alert = reactModule.createElement(interactiveAlert, {
			isMiddleContentFocusable = false,
			bodyText = if #var16 > 1 then var14.alertBodyPlural else var14.alertBody,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = useCallback(function() --[[ line: 72 ]]
								-- upvalues: var13 (ref), deleteWarningModalClosedModule (copy), var12 (ref), eventNamesModule (copy)
								var13(deleteWarningModalClosedModule())
								var12.fireEvent(eventNamesModule.CapturesDeleteWarningModalCancelPressed)
							end, {}),
							text = var14.cancelCTA
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = useCallback(function() --[[ line: 77 ]]
								-- upvalues: p0 (ref), var17 (ref), recordDeleteWarningModalOptOutModule (copy), var12 (ref), eventNamesModule (copy), var13 (ref), deleteWarningModalClosedModule (copy)
								p0.deleteItem()
								
								if var17 then
									recordDeleteWarningModalOptOutModule(var12)
								end
								var12.fireEvent(eventNamesModule.CapturesDeleteWarningModalDeletePressed)
								var13(deleteWarningModalClosedModule())
							end, { var12, var17, p0.deleteItem }),
							text = var14.deleteCTA
						}
					}
				}
			},
			middleContent = function() --[[ line: 118 ]]
				-- upvalues: reactModule (copy), checkbox (copy), var14 (ref), var17 (ref), var18 (ref)
				return reactModule.createElement(checkbox, {
					isDisabled = false,
					label = var14.optOutText,
					isChecked = var17,
					onActivated = function() --[[ line: 123 ]]
						-- upvalues: var18 (copy), var17 (copy)
						var18(not var17)
					end
				})
			end,
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = var10,
			title = if #var16 > 1 then var14.alertTitlePlural else var14.alertTitle
		})
	})
end