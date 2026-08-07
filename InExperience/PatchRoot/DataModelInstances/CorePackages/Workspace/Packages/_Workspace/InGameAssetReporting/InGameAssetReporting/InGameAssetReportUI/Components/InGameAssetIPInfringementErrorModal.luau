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

return reactModule.memo(function(value) --[[ line: 49 | named "InGameAssetIPInfringementErrorModal" ]]
	-- upvalues: reactModule (ref), reactOtterModule (ref), t_3 (ref), t_2 (ref), t_1 (ref), withLocalization (ref), buttonType (ref), interactiveAlert (ref)
	local var9, var10 = reactModule.useState(true)
	local var11, var12 = reactOtterModule.useAnimatedBinding(1, function() --[[ line: 52 ]]
		-- upvalues: var9 (ref), value (ref)
		if not var9 then
			value.onBack()
		end
	end)
	local var13 = reactModule.useMemo(function() --[[ line: 59 ]]
		-- upvalues: var9 (ref)
		return if var9 then 0 else 1
	end, { var9 })
	reactModule.useEffect(function() --[[ line: 63 ]]
		-- upvalues: var12 (ref), reactOtterModule (copy), var13 (ref), t_3 (copy)
		var12(reactOtterModule.spring(var13, t_3))
	end, { var13 })
	local var14 = reactModule.useCallback(function() --[[ line: 67 ]]
		-- upvalues: var10 (ref)
		var10(false)
	end, { var10 })
	local var15 = if value.errorCode and t_2[value.errorCode] then t_2[value.errorCode] else t_1
	
	return withLocalization({
		errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack",
		reportExperience = "Feature.ReportAbuse.Action.IpReportExperience",
		title = var15.titleKey,
		description = var15.descriptionKey
	})(function(p0) --[[ line: 80 ]]
		-- upvalues: var15 (ref), value (ref), buttonType (copy), var14 (ref), reactModule (copy), var11 (ref), interactiveAlert (copy)
		local t = {}
		
		if var15.showReportExperience and value.onReportExperience then
			table.insert(t, {
				buttonType = buttonType.PrimarySystem,
				props = {
					onActivated = value.onReportExperience,
					text = p0.reportExperience,
					isLoading = value.isReportExperienceLoading,
					isDisabled = value.isReportExperienceLoading
				}
			})
			table.insert(t, {
				buttonType = buttonType.Secondary,
				props = { onActivated = var14, text = p0.errorBack }
			})
		else
			table.insert(t, {
				buttonType = buttonType.PrimarySystem,
				props = { onActivated = var14, text = p0.errorBack }
			})
		end
		return reactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = var11:map(function(p1) --[[ line: 113 ]]
				return p1 + 0.3
			end),
			BackgroundColor3 = Color3.fromHex("#000000"),
			Size = UDim2.new(1, 0, 1, 0),
			Text = "",
			Position = UDim2.fromScale(0.5, 0.5),
			AnchorPoint = Vector2.new(0.5, 0.5),
			[reactModule.Event.Activated] = var14,
			ZIndex = 10
		}, {
			Alert = reactModule.createElement(interactiveAlert, {
				screenSize = value.screenSize,
				title = p0.title,
				bodyText = p0.description,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = var11:map(function(p2) --[[ line: 129 ]]
					return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), p2)
				end),
				buttonStackInfo = { buttons = t }
			})
		})
	end)
end)