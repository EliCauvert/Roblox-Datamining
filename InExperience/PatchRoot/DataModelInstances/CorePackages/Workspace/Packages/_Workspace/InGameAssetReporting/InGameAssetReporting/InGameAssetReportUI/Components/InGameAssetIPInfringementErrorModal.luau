local InGameAssetReporting = script:FindFirstAncestor("InGameAssetReporting")
local Parent = InGameAssetReporting.Parent
local ReactModule = require(Parent.React)
local ReactOtterModule = require(Parent.ReactOtter)
local UIBloxModule = require(Parent.UIBlox)
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local InteractiveAlert = UIBloxModule.App.Dialog.Alert.InteractiveAlert
local ButtonType = UIBloxModule.App.Button.Enum.ButtonType
local IpErrorCodes = require(InGameAssetReporting.InGameAssetReportUI.Resources.Constants).IpErrorCodes
local config = {
	titleKey = "Feature.ReportAbuse.Heading.IpNoReportableContent",
	descriptionKey = "Feature.ReportAbuse.Description.IpNoReportableContent",
	showReportExperience = true
}
local config1 = {
	titleKey = "InGame.CommonUI.Title.Error",
	descriptionKey = "Feature.ReportAbuse.Description.IpGenericError",
	showReportExperience = false
}
local config2 = {
	[IpErrorCodes.ClientNoAssetsExtracted] = config,
	[IpErrorCodes.NoEligibleContents] = config,
	[IpErrorCodes.Unknown] = config1
}
local config3 = { stiffness = 400, damping = 40, mass = 1 }

return ReactModule.memo(function(p1) --[[ Line: 49 | Named "InGameAssetIPInfringementErrorModal" ]]
	-- upvalues: ReactModule (copy), ReactOtterModule (copy), config3 (copy), config2 (copy), config1 (copy), WithLocalizationFunction (copy), ButtonType (copy), InteractiveAlert (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(true)
	local UseAnimatedBindingResult, UseAnimatedBindingResult2 = ReactOtterModule.useAnimatedBinding(1, function() --[[ Line: 52 ]]
		-- upvalues: UseStateResult (copy), p1 (copy)
		if not UseStateResult then
			p1.onBack()
		end
	end)
	local UseMemoResult = ReactModule.useMemo(function(): number --[[ Line: 59 ]]
		-- upvalues: UseStateResult (copy)
		return if UseStateResult then 0 else 1
	end, { UseStateResult })
	ReactModule.useEffect(function() --[[ Line: 63 ]]
		-- upvalues: UseAnimatedBindingResult2 (copy), ReactOtterModule (upval), UseMemoResult (copy), config3 (upval)
		UseAnimatedBindingResult2(ReactOtterModule.spring(UseMemoResult, config3))
	end, { UseMemoResult })
	local UseResult = ReactModule.useCallback(function() --[[ Line: 67 ]]
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(false)
	end, { UseStateResult2 })
	local Entry = if p1.errorCode and config2[p1.errorCode] then config2[p1.errorCode] else config1
	
	return WithLocalizationFunction({
		errorBack = "Feature.ReportAbuse.Action.ErrorModalGoBack",
		reportExperience = "Feature.ReportAbuse.Action.IpReportExperience",
		title = Entry.titleKey,
		description = Entry.descriptionKey
	})(function(p2) --[[ Line: 80 ]]
		-- upvalues: Entry (copy), p1 (copy), ButtonType (upval), UseResult (copy), ReactModule (upval), UseAnimatedBindingResult (copy), InteractiveAlert (upval)
		local List = {}
		
		if Entry.showReportExperience and p1.onReportExperience then
			table.insert(List, {
				buttonType = ButtonType.PrimarySystem,
				props = {
					onActivated = p1.onReportExperience,
					text = p2.reportExperience,
					isLoading = p1.isReportExperienceLoading,
					isDisabled = p1.isReportExperienceLoading
				}
			})
			table.insert(List, {
				buttonType = ButtonType.Secondary,
				props = { onActivated = UseResult, text = p2.errorBack }
			})
		else
			table.insert(List, {
				buttonType = ButtonType.PrimarySystem,
				props = { onActivated = UseResult, text = p2.errorBack }
			})
		end
		return ReactModule.createElement("TextButton", {
			AutoButtonColor = false,
			BorderSizePixel = 0,
			BackgroundTransparency = UseAnimatedBindingResult:map(function(p3: number): number --[[ Line: 113 ]]
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
				title = p2.title,
				bodyText = p2.description,
				anchorPoint = Vector2.new(0.5, 0.5),
				position = UseAnimatedBindingResult:map(function(Alpha) --[[ Line: 129 ]]
					return UDim2.new(0.5, 0, 0.5, 0):Lerp(UDim2.new(0.5, 0, -0.5, 0), Alpha)
				end),
				buttonStackInfo = { buttons = List }
			})
		})
	end)
end)