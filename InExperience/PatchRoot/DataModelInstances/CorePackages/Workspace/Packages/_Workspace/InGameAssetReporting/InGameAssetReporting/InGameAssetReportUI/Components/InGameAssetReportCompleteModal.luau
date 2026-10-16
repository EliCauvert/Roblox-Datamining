local Parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UIBloxModule = require(Parent.UIBlox)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local config = { stiffness = 400, damping = 40, mass = 1 }

return function(p1) --[[ Line: 24 | Named "InGameAssetReportCompleteModal" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), config (copy), WithLocalizationFunction (copy), InteractiveAlert (copy), ButtonType (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function() --[[ Line: 27 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		if not UseStateResult then
			p1.onClose()
		end
	end)
	local UseMemoResult = ReactModule.useMemo(function(): number --[[ Line: 34 ]]
		-- upvalues: UseStateResult (copy)
		return if UseStateResult then 0 else 1
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 38 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy), config (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult, config))
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 42 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 })
	
	return WithLocalizationFunction({
		reportCompleteTitle = "Feature.ReportAbuse.Title.SelectInSceneThankYou",
		reportCompleteDescription = "Feature.ReportAbuse.Label.SelectInSceneComplete",
		reportCompleteClose = "Feature.ReportAbuse.Action.Close"
	})(function(p2) --[[ Line: 50 ]]
		-- upvalues: ReactModule (upval), UseAnimatedBindingResult (copy), UseResult (copy), InteractiveAlert (upval), p1 (copy), ButtonType (upval)
		return ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = UseAnimatedBindingResult:map(function(p3: number): number --[[ Line: 54 ]]
				return p3 + 0.3
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
				screenSize = p1.screenSize,
				title = p2.reportCompleteTitle,
				bodyText = p2.reportCompleteDescription,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UseAnimatedBindingResult:map(function(Alpha) --[[ Line: 70 ]]
					return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), Alpha)
				end),
				buttonStackInfo = {
					buttons = {
						{
							buttonType = ButtonType.PrimarySystem,
							props = { onActivated = UseResult, text = p2.reportCompleteClose }
						}
					}
				}
			})
		})
	end)
end