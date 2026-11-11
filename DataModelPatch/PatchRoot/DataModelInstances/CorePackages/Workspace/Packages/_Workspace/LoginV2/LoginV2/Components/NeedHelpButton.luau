local ContentProvider = game:GetService("ContentProvider")
local LoginV2 = script:FindFirstAncestor("LoginV2")
local Parent = LoginV2.Parent
local ArgCheckModule = require(Parent.ArgCheck)
local AuthAnalyticsModule = require(Parent.AuthAnalytics)
local ReactModule = require(Parent.React)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local TextButton = require(Parent.UIBlox).App.Button.TextButton
local GetFFlagEnableLuafiedRecoveryFlowFunction = require(Parent.SharedFlags).GetFFlagEnableLuafiedRecoveryFlow
local EnrolledInLuafiedRecoveryExperimentFunction = require(Parent.AuthCommon).Experiments.enrolledInLuafiedRecoveryExperiment
local AuthButtonClickFunction = AuthAnalyticsModule.Events.authButtonClick
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local LoginContextModule = require(LoginV2.Context.LoginContext)

return function(p1)
	-- upvalues: ReactModule (copy), LoginContextModule (copy), UseDesignTokensFunction (copy), UseLocalizationFunction (copy), ArgCheckModule (copy), AuthButtonClickFunction (copy), EventStreamConstants (copy), GetFFlagEnableLuafiedRecoveryFlowFunction (copy), EnrolledInLuafiedRecoveryExperimentFunction (copy), ContentProvider (copy), TextButton (copy)
	local UseContextResult = ReactModule.useContext(LoginContextModule)
	local UseDesignTokensResult = UseDesignTokensFunction()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, UseDesignTokensResult.Size.Size_300),
			PaddingBottom = UDim.new(0, UseDesignTokensResult.Size.Size_300)
		}),
		Button = ReactModule.createElement(TextButton, {
			fontStyle = "CaptionHeader",
			colorStyleDefault = "TextDefault",
			text = UseLocalizationFunction({ needHelpButtonText = p1.textKey }).needHelpButtonText,
			isDisabled = p1.isDisabled,
			onActivated = function()
				-- upvalues: p1 (copy), ArgCheckModule (upval), AuthButtonClickFunction (upval), EventStreamConstants (upval), GetFFlagEnableLuafiedRecoveryFlowFunction (upval), EnrolledInLuafiedRecoveryExperimentFunction (upval), UseContextResult (copy), ContentProvider (upval)
				if p1.originPage then
					AuthButtonClickFunction(ArgCheckModule.isNonEmptyString(p1.originPage, "props.originPage"), EventStreamConstants.Button.NeedHelpLink, nil, nil)
				end
				if GetFFlagEnableLuafiedRecoveryFlowFunction() and EnrolledInLuafiedRecoveryExperimentFunction() then
					UseContextResult.utils.openAccountRecovery(p1.identifierAutofill or "")
					
					return
				else
					UseContextResult.utils.openWebView(ContentProvider.BaseUrl .. "login/forgot-password-or-username")
				end
			end,
			verticalPadding = UseDesignTokensResult.Size.Size_400,
			position = UDim2.new(0.5, 0, 0.5, 0),
			anchorPoint = Vector2.new(0.5, 0.5)
		})
	})
end