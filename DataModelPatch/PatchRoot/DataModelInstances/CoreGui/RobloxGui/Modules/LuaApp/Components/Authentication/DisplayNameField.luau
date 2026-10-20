local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local CollapsingTextInputValidatorModule = require(Modules.LuaApp.Components.Authentication.CollapsingTextInputValidator)
local UniversalDisplayNameValidatorModule = require(Modules.LuaApp.Thunks.Authentication.UniversalDisplayNameValidator)
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local InputValidity = require(CorePackages.Workspace.Packages.AuthCommon).Enums.InputValidity
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local GetUsernameRecommendationFromDisplayNameModule = require(Modules.LuaApp.Http.Requests.GetUsernameRecommendationFromDisplayName)
local PostUsernameRecommendationFromDisplayNameModule = require(Modules.LuaApp.Http.Requests.PostUsernameRecommendationFromDisplayName)
local EventStreamConstantsModule = require(Modules.LuaApp.EventStreamConstants)
local RoactUtilsModule = require(CorePackages.Workspace.Packages.RoactUtils)
local UseEffectOnMountFunction = RoactUtilsModule.Hooks.useEffectOnMount
local UseEffectOnceFunction = RoactUtilsModule.Hooks.useEffectOnce
local FFlagSignupDisplayNameLoggingModule = require(Modules.LuaApp.Components.Authentication.Flags.FFlagSignupDisplayNameLogging)
local UsernameDisplayNameRecommendationPostSwitch = game:DefineFastFlag("UsernameDisplayNameRecommendationPostSwitch", false)
game:DefineFastInt("DisplayNameDebounceInMilliseconds", 500)

local function _()
	return game:GetFastInt("DisplayNameDebounceInMilliseconds")
end

local _ = function()
	return (game:GetFastInt("DisplayNameDebounceInMilliseconds") or 500) / 1000
end

return function(p1)
	-- upvalues: ReactModule (copy), UseLocalizationFunction (copy), UseRoactServiceFunction (copy), RoactNetworkingModule (copy), InputValidity (copy), FFlagSignupDisplayNameLoggingModule (copy), EventStreamConstantsModule (copy), GetUsernameRecommendationFromDisplayNameModule (copy), UsernameDisplayNameRecommendationPostSwitch (copy), PostUsernameRecommendationFromDisplayNameModule (copy), UseEffectOnMountFunction (copy), UseEffectOnceFunction (copy), CollapsingTextInputValidatorModule (copy), UniversalDisplayNameValidatorModule (copy)
	local UseStateResult, UseStateResult2 = ReactModule.useState(false)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(false)
	local UseLocalizationResult = UseLocalizationFunction({
		displayNamePlaceholder = "Feature.DisplayName.Label.SignUpAgedUpDisplayName"
	})
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworkingModule)
	local UseResult = ReactModule.useCallback(function(p2, Valid, p3)
		-- upvalues: p1 (copy), UseStateResult2_1 (copy), UseStateResult2 (copy), InputValidity (upval), FFlagSignupDisplayNameLoggingModule (upval), EventStreamConstantsModule (upval), UseStateResult1 (copy)
		p1.onDisplayNameTextChanged(p2, Valid, p3)
		UseStateResult2_1(p2)
		UseStateResult2(Valid == InputValidity.Valid)
		p1.updateBypassDisplayNameField(p3)
		
		if FFlagSignupDisplayNameLoggingModule then
			p1.authEventAnalytics.reportAuthFormInteraction(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.DisplayName, EventStreamConstantsModule.ActionType.Submit, Valid, UseStateResult1)
		end
	end, {
		p1.onDisplayNameTextChanged,
		p1.updateBypassDisplayNameField
	})
	local UseMemoResult = ReactModule.useMemo(function()
		-- upvalues: p1 (copy)
		return { birthday = p1.birthday }
	end, { p1.birthday })
	local MockGetUsernameRecommendationFromDisplayName = if UsernameDisplayNameRecommendationPostSwitch then if p1.mockGetUsernameRecommendationFromDisplayName then p1.mockGetUsernameRecommendationFromDisplayName else PostUsernameRecommendationFromDisplayNameModule elseif p1.mockGetUsernameRecommendationFromDisplayName then p1.mockGetUsernameRecommendationFromDisplayName else GetUsernameRecommendationFromDisplayNameModule
	
	local function _(p2, p3)
		-- upvalues: MockGetUsernameRecommendationFromDisplayName (ref), UseRoactServiceResult (copy)
		return MockGetUsernameRecommendationFromDisplayName(UseRoactServiceResult, p2, p3)
	end
	
	local FeatureDisplayNameLabelValidationFailed: string = if p1.bypassDisplayNameField then "Feature.DisplayName.Label.ValidationFailed" else "Feature.DisplayName.Label.ErrorsWithAgedUpDisplayName"
	ReactModule.useEffect(function()
		-- upvalues: p1 (copy), UseStateResult (copy), UseStateResult2_2 (copy), UseStateResult1 (copy), MockGetUsernameRecommendationFromDisplayName (ref), UseRoactServiceResult (copy), FFlagSignupDisplayNameLoggingModule (upval), EventStreamConstantsModule (upval)
		if p1.bypassDisplayNameField then
			p1.setUsernameRecommendation("")
			
			return
		end
		if UseStateResult and not p1.shouldDisableRecommendation then
			UseStateResult2_2(true)
			task.spawn(function()
				-- upvalues: UseStateResult1 (upval), p1 (upval), MockGetUsernameRecommendationFromDisplayName (upval), UseRoactServiceResult (upval), UseStateResult2_2 (upval), FFlagSignupDisplayNameLoggingModule (upval), EventStreamConstantsModule (upval)
				MockGetUsernameRecommendationFromDisplayName(UseRoactServiceResult, UseStateResult1, p1.birthday):andThen(function(Entry)
					-- upvalues: UseStateResult2_2 (upval), FFlagSignupDisplayNameLoggingModule (upval), p1 (upval), EventStreamConstantsModule (upval), UseStateResult1 (upval)
					UseStateResult2_2(false)
					local SuggestedUsername = Entry and Entry[1] and Entry[1].suggestedUsernames and Entry[1].suggestedUsernames[1] or ""
					
					if FFlagSignupDisplayNameLoggingModule then
						p1.authEventAnalytics.reportUsernameSuggestionShown(EventStreamConstantsModule.Context.SinglePageSignUpScreen, UseStateResult1, if SuggestedUsername == "" then {} else Entry[1].suggestedUsernames, EventStreamConstantsModule.Field.DisplayName)
					end
					p1.setUsernameRecommendation(SuggestedUsername)
				end):catch(function(_)
					-- upvalues: FFlagSignupDisplayNameLoggingModule (upval), p1 (upval), EventStreamConstantsModule (upval), UseStateResult2_2 (upval)
					if FFlagSignupDisplayNameLoggingModule then
						p1.authEventAnalytics.reportUsernameGenerationFailed(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.State.ReportUsernameGenerationFailed)
					end
					UseStateResult2_2(false)
					p1.setUsernameRecommendation("")
				end)
			end)
		end
	end, {
		UseStateResult,
		UseStateResult1,
		p1.shouldDisableRecommendation,
		p1.bypassDisplayNameField
	})
	
	if FFlagSignupDisplayNameLoggingModule then
		UseEffectOnMountFunction(function()
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.authEventAnalytics.reportDisplayNameFieldLoaded(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.Field.DisplayName, EventStreamConstantsModule.ActionType.Shown)
		end)
		UseEffectOnceFunction(function()
			-- upvalues: p1 (copy), EventStreamConstantsModule (upval)
			p1.authEventAnalytics.reportDisplayNameFieldBypassed(EventStreamConstantsModule.Context.SinglePageSignUpScreen, EventStreamConstantsModule.State.BypassDisplayNameField)
		end, p1.bypassDisplayNameField)
	end
	return ReactModule.createElement(CollapsingTextInputValidatorModule, {
		prerequisiteMet = true,
		titleTextKey = "Feature.DisplayName.Label.AgedUpNameField",
		debounceTime = (game:GetFastInt("DisplayNameDebounceInMilliseconds") or 500) / 1000,
		focusedTextBoxPositionChangedCallback = p1.focusedTextBoxPositionChangedCallback,
		showDetailedError = p1.bypassDisplayNameField,
		layoutOrder = p1.layoutOrder,
		onAnimationStateChangeCallback = p1.onAnimationStateChangeCallback,
		onInputTextValidated = UseResult,
		onReturnPressedFromOnScreenKeyboard = p1.onReturnPressedFromOnScreenKeyboard,
		pillClicked = p1.pillClicked,
		placeholderText = UseLocalizationResult.displayNamePlaceholder,
		resetPillClicked = p1.resetPillClicked,
		returnKeyType = Enum.ReturnKeyType.Next,
		summaryErrorTextKey = FeatureDisplayNameLabelValidationFailed,
		textBoxFocusedCallback = p1.textBoxFocusedCallback,
		textBoxFocusLostCallback = p1.textBoxFocusLostCallback,
		textBoxRef = p1.textBoxRef,
		textInputType = Enum.TextInputType.NoSuggestions,
		updatePillClicked = p1.updatePillClicked,
		validator = UniversalDisplayNameValidatorModule,
		validatorAdditionalProps = UseMemoResult,
		hasFieldFailed = p1.bypassDisplayNameField,
		shouldShowLoadingIcon = UseStateResult3
	})
end