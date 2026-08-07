local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local UIBloxModule = require(parent.UIBlox)
local withLocalization = require(parent.Localization).withLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local t = { stiffness = 400, damping = 40, mass = 1 }

return function(value) --[[ line: 24 | named "InGameAssetReportErrorModal" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref), withLocalization (ref), interactiveAlert (ref), buttonType (ref)
	local var4, var5 = reactModule.useState(true)
	local var6, var7 = reactOtterModule.useAnimatedBinding(1, function() --[[ line: 27 ]]
		-- upvalues: var4 (ref), value (ref)
		if not var4 then
			value.onBack()
		end
	end)
	local var8 = reactModule.useMemo(function() --[[ line: 34 ]]
		-- upvalues: var4 (ref)
		return if var4 then 0 else 1
	end, { var4 })
	reactModule.useEffect(function() --[[ line: 38 ]]
		-- upvalues: var7 (ref), reactOtterModule (copy), var8 (ref), t (copy)
		var7(reactOtterModule.spring(var8, t))
	end, { var8 })
	local var9 = reactModule.useCallback(function() --[[ line: 42 ]]
		-- upvalues: var5 (ref)
		var5(false)
	end, { var5 })
	
	return withLocalization({
		errorTitle = "Feature.ReportAbuse.Heading.SelectInSceneErrorTitle",
		errorDescription = "Feature.ReportAbuse.Label.SelectInSceneErrorDescription",
		errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack"
	})(function(p0) --[[ line: 50 ]]
		-- upvalues: reactModule (copy), var6 (ref), var9 (ref), interactiveAlert (copy), value (ref), buttonType (copy)
		return reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = var6:map(function(p1) --[[ line: 54 ]]
				return p1 + 0.3
			end),
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[reactModule.Event.Activated] = var9,
			ZIndex = 10
		}, {
			Alert = reactModule.createElement(interactiveAlert, {
				screenSize = value.screenSize,
				title = p0.errorTitle,
				bodyText = p0.errorDescription,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = var6:map(function(p2) --[[ line: 70 ]]
					return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), p2)
				end),
				buttonStackInfo = {
					buttons = {
						{
							buttonType = buttonType.PrimarySystem,
							props = { onActivated = var9, text = p0.errorBack }
						}
					}
				}
			})
		})
	end)
end