local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UIBloxModule = require(Parent.UIBlox)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local config = { stiffness = 400, damping = 40, mass = 1 }

return function(p1) --[[ Line: 31 | Named "InGameAssetReportIPInfringementModal" ]]
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), ReactOtterModule (copy), config (copy), View (copy), Text (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseLocalizationResult = UseLocalizationFunction({
		yourReportCode = "Feature.ReportAbuse.Label.YourReportCode",
		ipInfringementModalText = "Feature.ReportAbuse.Description.IpInfringementReportModal",
		reportCompleteClose = "Feature.ReportAbuse.Action.Close",
		thankYouIpInfringementReport = "Feature.ReportAbuse.Title.SelectInSceneIpReport"
	})
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function() --[[ Line: 40 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		if not UseStateResult then
			p1.onClose()
		end
	end)
	local UseMemoResult = ReactModule.useMemo(function(): number --[[ Line: 47 ]]
		-- upvalues: UseStateResult (copy)
		return if UseStateResult then 0 else 1
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 51 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult, config))
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 55 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 })
	
	return ReactModule.createElement("TextButton", {
		AutoButtonColor = false,
		BorderSizePixel = 0,
		BackgroundTransparency = UseAnimatedBindingResult:map(function(p2: number): number --[[ Line: 85 ]]
			return p2 + 0.3
		end),
		BackgroundColor3 = Color3.fromHex("#000000"),
		Size = UDim2.new(1, 0, 1, 0),
		Text = "",
		Position = UDim2.fromScale(0.5, 0.5),
		AnchorPoint = Vector2.new(0.5, 0.5),
		[ReactModule.Event.Activated] = UseResult,
		ZIndex = 10
	}, {
		Alert = ReactModule.createElement(InteractiveAlert, {
			richText = true,
			screenSize = p1.screenSize,
			title = UseLocalizationResult.thankYouIpInfringementReport,
			middleContent = ReactModule.useCallback(function() --[[ Line: 59 ]]
				-- upvalues: ReactModule (upval), View (upval), Text (upval), UseLocalizationResult (copy), p1 (copy)
				return ReactModule.createElement(View, { tag = "auto-xy col gap-small align-x-center" }, {
					text1 = ReactModule.createElement(Text, {
						tag = "auto-xy text-title-medium content-default text-align-x-center",
						LayoutOrder = 1,
						Text = UseLocalizationResult.yourReportCode
					}),
					text2 = ReactModule.createElement(Text, {
						tag = "auto-xy text-heading-medium content-emphasis text-align-x-center",
						LayoutOrder = 2,
						Text = p1.reportCode
					}),
					text3 = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium content-default text-align-x-center text-wrap",
						RichText = true,
						LayoutOrder = 3,
						Text = UseLocalizationResult.ipInfringementModalText
					})
				})
			end, { p1.reportCode }),
			anchorPoint = Vector2.new(0.5, 0.5),
			position = UseAnimatedBindingResult:map(function(Alpha) --[[ Line: 102 ]]
				return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), Alpha)
			end),
			buttonStackInfo = {
				buttons = {
					{
						buttonType = ButtonType.PrimarySystem,
						props = {
							onActivated = UseResult,
							text = UseLocalizationResult.reportCompleteClose
						}
					}
				}
			}
		})
	})
end