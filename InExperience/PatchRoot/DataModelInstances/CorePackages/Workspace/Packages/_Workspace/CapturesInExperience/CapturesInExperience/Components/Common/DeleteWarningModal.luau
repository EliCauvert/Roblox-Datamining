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

return function(p1)
	-- upvalues: useScreenSize (ref), useStyle (ref), useAnalyticsModule (ref), useDispatch (ref), useLocalization (ref), useSelector (ref), constantsModule (ref), useState (ref), useEffect (ref), useCallback (ref), deleteWarningModalClosedModule (ref), eventNamesModule (ref), recordDeleteWarningModalOptOutModule (ref), reactModule (ref), interactiveAlert (ref), buttonType (ref), checkbox (ref)
	local var1 = useScreenSize()
	local var2 = useStyle()
	local var3 = useAnalyticsModule()
	local var4 = useDispatch()
	local var5 = useLocalization({
		alertBody = "Feature.Captures.Label.DeleteCaptureInfo",
		alertBodyPlural = "Feature.Captures.Label.DeleteCapturesWarning",
		alertTitle = "Feature.Captures.Title.DeleteCaptureWarning",
		alertTitlePlural = "Feature.Captures.Title.DeleteMultipleCapturesWarning",
		cancelCTA = "Feature.Captures.Action.DeleteCaptureWarningCancel",
		deleteCTA = "Feature.Captures.Action.DeleteCaptureWarningConfirm",
		optOutText = "Feature.Captures.Label.DeleteCaptureWarningOptOut"
	})
	local theme = var2.Theme
	local var6 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].Carousel.IsDeleteWarningModalOpen
	end)
	local var7 = useSelector(function(p2)
		-- upvalues: constantsModule (copy)
		return p2[constantsModule.RoduxKey].CaptureManager.SelectedCaptures
	end)
	local var8, var9 = useState(false)
	useEffect(function()
		-- upvalues: var6 (ref), var9 (ref)
		if var6 then
			var9(false)
		end
	end, { var6, var9 })
	
	return reactModule.createElement("TextButton", {
		Active = true,
		AutoButtonColor = false,
		BackgroundColor3 = theme.Overlay.Color,
		BackgroundTransparency = theme.Overlay.Transparency,
		Size = UDim2.fromScale(1, 1),
		Visible = var6,
		ZIndex = p1.zIndex
	}, {
		Alert = reactModule.createElement(interactiveAlert, {
			isMiddleContentFocusable = false,
			bodyText = if #var7 > 1 then var5.alertBodyPlural else var5.alertBody,
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.Secondary,
						props = {
							onActivated = useCallback(function()
								-- upvalues: var4 (ref), deleteWarningModalClosedModule (copy), var3 (ref), eventNamesModule (copy)
								var4(deleteWarningModalClosedModule())
								var3.fireEvent(eventNamesModule.CapturesDeleteWarningModalCancelPressed)
							end, {}),
							text = var5.cancelCTA
						}
					},
					{
						buttonType = buttonType.PrimarySystem,
						props = {
							onActivated = useCallback(function()
								-- upvalues: p1 (ref), var8 (ref), recordDeleteWarningModalOptOutModule (copy), var3 (ref), eventNamesModule (copy), var4 (ref), deleteWarningModalClosedModule (copy)
								p1.deleteItem()
								
								if var8 then
									recordDeleteWarningModalOptOutModule(var3)
								end
								var3.fireEvent(eventNamesModule.CapturesDeleteWarningModalDeletePressed)
								var4(deleteWarningModalClosedModule())
							end, { var3, var8, p1.deleteItem }),
							text = var5.deleteCTA
						}
					}
				}
			},
			middleContent = function()
				-- upvalues: reactModule (copy), checkbox (copy), var5 (ref), var8 (ref), var9 (ref)
				return reactModule.createElement(checkbox, {
					isDisabled = false,
					label = var5.optOutText,
					isChecked = var8,
					onActivated = function()
						-- upvalues: var9 (copy), var8 (copy)
						var9(not var8)
					end
				})
			end,
			position = UDim2.fromScale(0.5, 0.5),
			screenSize = var1,
			title = if #var7 > 1 then var5.alertTitlePlural else var5.alertTitle
		})
	})
end