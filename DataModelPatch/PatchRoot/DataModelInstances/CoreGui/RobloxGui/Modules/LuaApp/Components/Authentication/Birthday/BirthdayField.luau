local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local TextInputBoxWithBorder = AuthCommonModule.Components.TextInputBoxWithBorder
local AuthStatefulRoundCornerBorder = AuthCommonModule.Components.AuthStatefulRoundCornerBorder
local ReactModule = require(CorePackages.Packages.React)
local UseStyleFunction = require(CorePackages.Packages.UIBlox).Core.Style.useStyle
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AgeAndMonthInputModule = require(Modules.LuaApp.Components.Authentication.Birthday.AgeAndMonthInput)
local MonthAndYearInputModule = require(Modules.LuaApp.Components.Authentication.Birthday.MonthAndYearInput)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)

return (require(CorePackages.Workspace.Packages.RoactServices).RoactServices.connect({
	analytics = require(Modules.LuaApp.Services.RoactAnalyticsAuthEvents)
})(function(p1)
	-- upvalues: UseStyleFunction (copy), UseLocalizationFunction (copy), ReactModule (copy), AuthStatefulRoundCornerBorder (copy), EventStreamConstantsModule (copy), TextInputBoxWithBorder (copy), AgeAndMonthInputModule (copy), MonthAndYearInputModule (copy)
	local UseStyleResult = UseStyleFunction()
	local UseLocalizationResult = UseLocalizationFunction({
		ageLabel = "Authentication.SignUp.Label.Age",
		helpText = "Authentication.SignUp.Description.BirthdayValuePropC",
		errorMessage = "Authentication.SignUp.Response.InvalidBirthday"
	})
	local UseStateResult, UseStateResult2 = ReactModule.useState(AuthStatefulRoundCornerBorder.BorderState.Default)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(false)
	
	local function OnChangeTextCallback()
		-- upvalues: p1 (copy)
		if p1.ageTextFieldRef and p1.ageTextFieldRef.current then
			local Text: string = p1.ageTextFieldRef.current.Text
			
			if string.len(Text) > 2 then
				p1.ageTextFieldRef.current.Text = string.sub(Text, 1, 2)
			end
		end
		p1.onAgeChange(p1.ageTextFieldRef.current.Text)
	end
	
	local function OnFocused()
		-- upvalues: p1 (copy), UseStateResult2 (copy), AuthStatefulRoundCornerBorder (upval), EventStreamConstantsModule (upval), UseStateResult2_1 (copy)
		if not p1.hasBirthdayError and p1.variant == 1 then
			UseStateResult2(AuthStatefulRoundCornerBorder.BorderState.Focused)
		end
		p1.analytics.reportAgeFocus(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
		UseStateResult2_1(true)
	end
	
	local function OnFocusLost()
		-- upvalues: p1 (copy), UseStateResult2 (copy), AuthStatefulRoundCornerBorder (upval), UseStateResult2_1 (copy)
		if not p1.hasBirthdayError and p1.variant == 1 then
			UseStateResult2(AuthStatefulRoundCornerBorder.BorderState.Default)
		end
		UseStateResult2_1(false)
	end
	
	local function OnFocused1()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval), UseStateResult2_1 (copy)
		p1.analytics.reportYearFocus(EventStreamConstantsModule.Context.SinglePageSignUpScreen)
		UseStateResult2_1(true)
	end
	
	local function OnFocusLost1()
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(false)
	end
	
	local function OnMonthInputConfirmed()
		-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
		p1.analytics.reportButtonClicked(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Button.ConfirmBirthdayMonth)
	end
	
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult2 (copy), AuthStatefulRoundCornerBorder (upval)
		if p1.hasBirthdayError then
			UseStateResult2(AuthStatefulRoundCornerBorder.BorderState.Error)
			
			return
		else
			UseStateResult2(AuthStatefulRoundCornerBorder.BorderState.Default)
		end
	end, { p1.hasBirthdayError })
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy)
		if p1.variant == 1 and p1.ageTextFieldRef and p1.ageTextFieldRef.current then
			p1.ageTextFieldRef.current:CaptureFocus()
		end
	end, { p1.variant, p1.ageTextFieldRef.current })
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		ZIndex = 4,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			SortOrder = Enum.SortOrder.LayoutOrder,
			FillDirection = Enum.FillDirection.Vertical,
			Padding = UDim.new(0, -10)
		}),
		AgeInput = p1.variant == 1 and ReactModule.createElement(TextInputBoxWithBorder, {
			textInputListPadding = 6,
			layoutOrder = 3,
			textInputType = Enum.TextInputType.Number,
			textInputHeight = p1.textInputHeight,
			placeholderText = UseLocalizationResult.ageLabel,
			labelText = UseLocalizationResult.ageLabel,
			borderState = UseStateResult,
			onChangeTextCallback = OnChangeTextCallback,
			errorText = p1.hasBirthdayError and UseLocalizationResult.errorMessage or "",
			onFocused = OnFocused,
			onFocusLost = OnFocusLost,
			textBoxRef = p1.ageTextFieldRef
		}),
		AgeAndMonthInput = p1.variant == 2 and ReactModule.createElement(AgeAndMonthInputModule, {
			layoutOrder = 3,
			errorText = p1.hasBirthdayError and UseLocalizationResult.errorMessage or "",
			textInputHeight = p1.textInputHeight,
			onAgeAndMonthChange = p1.onAgeAndMonthChange,
			onFocused = OnFocused,
			onFocusLost = OnFocusLost,
			onMonthInputConfirmed = OnMonthInputConfirmed,
			screenSize = p1.screenSize,
			textBoxRef = p1.ageTextFieldRef
		}),
		MonthAndYearInput = p1.variant == 3 and ReactModule.createElement(MonthAndYearInputModule, {
			layoutOrder = 3,
			errorText = p1.hasBirthdayError and UseLocalizationResult.errorMessage or "",
			textInputHeight = p1.textInputHeight,
			onMonthAndYearChange = p1.onMonthAndYearChange,
			onFocused = OnFocused1,
			onFocusLost = OnFocusLost1,
			onMonthInputConfirmed = OnMonthInputConfirmed,
			screenSize = p1.screenSize,
			textBoxRef = p1.ageTextFieldRef
		}),
		Padding = p1.hasBirthdayError and ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			LayoutOrder = 5,
			Size = UDim2.new(0, 0, 0, 21)
		}),
		ValueProp = UseStateResult1 and ReactModule.createElement("TextLabel", {
			TextWrapped = true,
			BackgroundTransparency = 1,
			ZIndex = 0,
			LayoutOrder = 6,
			Text = UseLocalizationResult.helpText,
			Font = UseStyleResult.Font.CaptionBody.Font,
			TextSize = UseStyleResult.Font.BaseSize * UseStyleResult.Font.CaptionBody.RelativeSize,
			TextColor3 = UseStyleResult.Theme.TextDefault.Color,
			TextTransparency = UseStyleResult.Theme.TextDefault.Transparency,
			TextXAlignment = Enum.TextXAlignment.Left,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y
		})
	})
end))