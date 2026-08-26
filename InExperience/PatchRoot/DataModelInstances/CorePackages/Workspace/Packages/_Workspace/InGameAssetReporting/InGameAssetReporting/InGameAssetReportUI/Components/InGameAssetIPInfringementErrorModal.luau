local inGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local parent = inGameAssetReporting.Parent
local reactModule = require(parent.React)
local reactOtterModule = require(parent.ReactOtter)
local UIBloxModule = require(parent.UIBlox)
local withLocalization = require(parent.Localization).withLocalization
local constantsModule = require(inGameAssetReporting.InGameAssetReportUI.Resources.Constants)
local interactiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local buttonType = UIBloxModule.App.Button.Enum.ButtonType
local ipErrorCodes = constantsModule.IpErrorCodes
local t = {
	titleKey = "Feature.ReportAbuse.Heading.IpNoReportableContent",
	descriptionKey = "Feature.ReportAbuse.Description.IpNoReportableContent",
	showReportExperience = true
}
local t_1 = {
	titleKey = "InGame.CommonUI.Title.Error",
	descriptionKey = "Feature.ReportAbuse.Description.IpGenericError",
	showReportExperience = false
}
local t_2 = {
	[ipErrorCodes.ClientNoAssetsExtracted] = t,
	[ipErrorCodes.NoEligibleContents] = t,
	[ipErrorCodes.Unknown] = t_1
}
local t_3 = { stiffness = 400, damping = 40, mass = 1 }

return reactModule.memo(function(value)
	-- upvalues: reactModule (ref), reactOtterModule (ref), t_3 (ref), t_2 (ref), t_1 (ref), withLocalization (ref), buttonType (ref), interactiveAlert (ref)
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
		-- upvalues: var4 (ref), reactOtterModule (copy), var5 (ref), t_3 (copy)
		var4(reactOtterModule.spring(var5, t_3))
	end, { var5 })
	local var6 = reactModule.useCallback(function()
		-- upvalues: var2 (ref)
		var2(false)
	end, { var2 })
	local var7 = if value.errorCode and t_2[value.errorCode] then t_2[value.errorCode] else t_1
	
	return withLocalization({
		errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack",
		reportExperience = "Feature.ReportAbuse.Action.IpReportExperience",
		title = var7.titleKey,
		description = var7.descriptionKey
	})(function(p1)
		-- upvalues: var7 (ref), value (ref), buttonType (copy), var6 (ref), reactModule (copy), var3 (ref), interactiveAlert (copy)
		local t = {}
		
		if var7.showReportExperience and value.onReportExperience then
			table.insert(t, {
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = value.onReportExperience,
					text = p1.reportExperience,
					isLoading = value.isReportExperienceLoading,
					isDisabled = value.isReportExperienceLoading
				}
			})
			table.insert(t, {
				buttonType = buttonType.Secondary,
				props = { onActivated = var6, text = p1.errorBack }
			})
		else
			table.insert(t, {
				buttonType = buttonType.PrimarySystem,
				props = { onActivated = var6, text = p1.errorBack }
			})
		end
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
				title = p1.title,
				bodyText = p1.description,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = var3:map(function(p2)
					return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), p2)
				end),
				buttonStackInfo = { buttons = t }
			})
		})
	end)
end)