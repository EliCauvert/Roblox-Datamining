local parent = script:FindFirstAncestor("InGameAssetReporting").Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local UIBloxModule = require(parent.UIBlox)
local withLocalization = require(parent.Localization).withLocalization
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local t = { stiffness = 400, damping = 40, mass = 1 }

return function(value)
	-- upvalues: reactModule (ref), reactOtterModule (ref), t (ref), withLocalization (ref), interactiveAlert (ref), buttonType (ref)
	local var1, var2 = reactModule.useState(true)
	local var3, var4 = reactOtterModule.useAnimatedBinding(1, function()
		-- upvalues: var1 (ref), value (ref)
		if not var1 then
			value.onBack()
		end
	end)
	local var5 = reactModule.useMemo(function()
		-- upvalues: var1 (ref)
		return if var1 then 0 else 1
	end, { var1 })
	reactModule.useEffect(function()
		-- upvalues: var4 (ref), reactOtterModule (copy), var5 (ref), t (copy)
		var4(reactOtterModule.spring(var5, t))
	end, { var5 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, { var2 })
	
	return withLocalization({
		errorTitle = "Feature.ReportAbuse.Heading.SelectInSceneErrorTitle",
		errorDescription = "Feature.ReportAbuse.Label.SelectInSceneErrorDescription",
		errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack"
	})(function(p1)
		-- upvalues: reactModule (copy), var3 (ref), var6 (ref), interactiveAlert (copy), value (ref), buttonType (copy)
		return reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = var3:map(function(p2)
				return p2 + 0.3
			end),
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[reactModule.Event.Activated] = var6,
			ZIndex = 10
		}, {
			Alert = reactModule.createElement(interactiveAlert, {
				screenSize = value.screenSize,
				title = p1.errorTitle,
				bodyText = p1.errorDescription,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = var3:map(function(p2)
					return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), p2)
				end),
				buttonStackInfo = {
					buttons = {
						{
							buttonType = buttonType.PrimarySystem,
							props = { onActivated = var6, text = p1.errorBack }
						}
					}
				}
			})
		})
	end)
end