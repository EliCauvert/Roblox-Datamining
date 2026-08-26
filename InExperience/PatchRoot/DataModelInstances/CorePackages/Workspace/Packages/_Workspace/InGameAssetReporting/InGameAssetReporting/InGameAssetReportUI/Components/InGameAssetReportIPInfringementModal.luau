local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local UIBloxModule = require(parent.UIBlox)
local localizationModule = require(parent.Localization)
local foundationModule = require(parent.Foundation)
local text = foundationModule.Text
local view = foundationModule.View
local useLocalization = localizationModule.Hooks.useLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local t = { stiffness = 400, damping = 40, mass = 1 }

return function(value)
	-- upvalues: reactModule (ref), useLocalization (ref), reactOtterModule (ref), t (ref), view (ref), text (ref), interactiveAlert (ref), buttonType (ref)
	local var1, var2 = reactModule.useState(true)
	local var3 = useLocalization({
		yourReportCode = "Feature.ReportAbuse.Label.YourReportCode",
		ipInfringementModalText = "Feature.ReportAbuse.Description.IpInfringementReportModal",
		reportCompleteClose = "Feature.ReportAbuse.Action.Close",
		thankYouIpInfringementReport = "Feature.ReportAbuse.Title.SelectInSceneIpReport"
	})
	local var4, var5 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var1 (ref), value (ref)
		if not var1 then
			value.onClose()
		end
	end)
	local var6 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return if var1 then 0 else 1
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var5 (ref), reactOtterModule (copy), var6 (ref), t (copy)
		var5(reactOtterModule.spring(var6, t))
	end, { var6 })
	local var7 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, { var2 })
	
	return reactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = var4:map(function(p1)
			return p1 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[reactModule.Event.Activated] = var7,
		ZIndex = 10
	}, {
		Alert = reactModule.createElement(interactiveAlert, {
			richText = true,
			screenSize = value.screenSize,
			title = var3.thankYouIpInfringementReport,
			middleContent = reactModule.useCallback(function()
				-- upvalues: reactModule (copy), view (copy), text (copy), var3 (ref), value (ref)
				return reactModule.createElement(view, { tag = "auto-xy col gap-small align-x-center" }, {
					text1 = reactModule.createElement(text, {
						tag = "auto-xy text-title-medium content-default text-align-x-center",
						LayoutOrder = 1,
						Text = var3.yourReportCode
					}),
					text2 = reactModule.createElement(text, {
						tag = "auto-xy text-heading-medium content-emphasis text-align-x-center",
						LayoutOrder = 2,
						Text = value.reportCode
					}),
					text3 = reactModule.createElement(text, {
						tag = "auto-xy text-body-medium content-default text-align-x-center text-wrap",
						RichText = true,
						LayoutOrder = 3,
						Text = var3.ipInfringementModalText
					})
				})
			end, { value.reportCode }),
			anchorPoint = Vector2.new(0.5, 0.5),
			position = var4:map(function(p1)
				return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), p1)
			end),
			buttonStackInfo = {
				buttons = {
					{
						buttonType = buttonType.PrimarySystem,
						props = { onActivated = var7, text = var3.reportCompleteClose }
					}
				}
			}
		})
	})
end