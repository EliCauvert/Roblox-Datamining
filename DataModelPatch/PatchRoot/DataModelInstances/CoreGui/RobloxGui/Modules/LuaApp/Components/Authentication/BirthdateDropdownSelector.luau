local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ReactModule = require(CorePackages.Packages.React)
local TimeUnit = require(CorePackages.Workspace.Packages.Time).TimeUnit
local DateHelper = require(CorePackages.Workspace.Packages.Time).DateHelper
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local UseSelectorFunction = require(CorePackages.Workspace.Packages.RoactUtils).Hooks.RoactRodux.useSelector
local UseLocalizationModule = require(Modules.LuaApp.Hooks.useLocalization)
local BirthdateDropDownMinimumAge = game:DefineFastInt("BirthdateDropDownMinimumAge", 5)
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local Birthday = AuthCommonModule.Models.Birthday
local RegisterAuditContent = AuthCommonModule.Components.RegisterAuditContent
local DateDropdownSelectorModule = require(Modules.LuaApp.Components.Authentication.DateDropdownSelector)
local GetFFlagEnableAuditForSsoFunction = require(CorePackages.Workspace.Packages.SharedFlags).GetFFlagEnableAuditForSso

local function v11()
	-- upvalues: UseLocalizationModule (copy), ReactModule (copy), RegisterAuditContent (copy)
	local UseLocalizationModuleResult = UseLocalizationModule({ titleText = "Authentication.SignUp.Label.Birthday" })
	
	return if UseLocalizationModuleResult.titleText then ReactModule.createElement(RegisterAuditContent, {
		translationKey = "Authentication.SignUp.Label.Birthday",
		translatedSourceString = UseLocalizationModuleResult.titleText
	}) else nil
end

return function(p1)
	-- upvalues: ReactModule (copy), UseDesignTokensFunction (copy), UseSelectorFunction (copy), TimeUnit (copy), Birthday (copy), DateHelper (copy), BirthdateDropDownMinimumAge (copy), GetFFlagEnableAuditForSsoFunction (copy), DateDropdownSelectorModule (copy), RegisterAuditContent (copy), v11 (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local SignUpView = UseDesignTokensFunction().LuaApps.SignUpView
	local CurrentDate = DateHelper:getCurrentDate()
	local config = {
		titleKey = "Authentication.SignUp.Label.Birthday",
		size = UDim2.new(0.75, 0, 1, 0),
		errorTextKey = if UseStateResult == false then "Authentication.SignUp.Response.InvalidBirthday" else nil,
		maxYear = CurrentDate[TimeUnit.Years] - BirthdateDropDownMinimumAge,
		minYear = CurrentDate[TimeUnit.Years] - 100,
		onDateSelected = ReactModule.useCallback(function(p2)
			-- upvalues: TimeUnit (upval), Birthday (upval), DateHelper (upval), BirthdateDropDownMinimumAge (upval), UseStateResult2 (copy), p1 (copy)
			local Year = p2[TimeUnit.Years]
			local Month = p2[TimeUnit.Months]
			local Day = p2[TimeUnit.Days]
			
			if Year ~= 0 and Month ~= 0 and Day ~= 0 then
				local NewBirthday = Birthday.new({ Year = Year, Month = Month, Day = Day })
				local IsAgeInYearsAbove: boolean = if DateHelper:isValidDate(Month, Day, Year) then not DateHelper:isFutureDate(Month, Day, Year) and NewBirthday:GetAgeInYears() >= BirthdateDropDownMinimumAge else false
				UseStateResult2(IsAgeInYearsAbove)
				p1.onBirthdaySelected(NewBirthday, IsAgeInYearsAbove)
			end
		end, { p1.onBirthdaySelected }),
		horizontalInnerPadding = UDim.new(0, 18),
		fixedListHeight = math.min(UseSelectorFunction(function(p2)
			return p2.ScreenSize or Vector2.new(1920, 1080)
		end).Y, 480),
		alignment = p1.alignment,
		layoutOrder = p1.layoutOrder,
		designTokens = ReactModule.useMemo(function()
			-- upvalues: SignUpView (copy)
			return {
				textCaptionHeaderSize = SignUpView.textCaptionHeaderSize,
				textBodySize = SignUpView.textBodySize,
				dropdownHeight = SignUpView.dropdownHeight,
				dropdownHorizontalPadding = SignUpView.dropdownHorizontalPadding,
				dropdownVerticalPadding = SignUpView.dropdownVerticalPadding,
				dateDropdownWidth = SignUpView.dateDropdownWidth
			}
		end, { SignUpView })
	}
	
	return if GetFFlagEnableAuditForSsoFunction() then ReactModule.createElement(ReactModule.Fragment, nil, {
		DateDropdownSelector = ReactModule.createElement(DateDropdownSelectorModule, config),
		RegisterTitleAuditContent = if RegisterAuditContent and p1.enableAuditContentCapture then ReactModule.createElement(v11) else nil
	}) else ReactModule.createElement(DateDropdownSelectorModule, config)
end