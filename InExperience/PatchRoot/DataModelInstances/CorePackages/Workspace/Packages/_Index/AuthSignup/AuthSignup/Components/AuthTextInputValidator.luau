local AuthSignup = script:FindFirstAncestor("AuthSignup")
local Parent = AuthSignup.Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local UIBloxModule = require(Parent.UIBlox)
local UseDesignTokensFunction = require(Parent.Style).useDesignTokens
local UseStyleFunction = UIBloxModule.Core.Style.useStyle
local StyledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local FoundationModule = require(Parent.Foundation)
local TextInput = FoundationModule.TextInput
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local AuthCommonModule = require(Parent.AuthCommon)
local InputValidity = AuthCommonModule.Enums.InputValidity
local IssueCondition = AuthCommonModule.Enums.IssueCondition
local UIConstants = AuthCommonModule.Common.UIConstants
local DebounceModule = require(AuthSignup.Util.debounce)
local SharedFlagsModule = require(Parent.SharedFlags)
local GetFFlagEnableMultiPageSignupV2UpdatesFunction = SharedFlagsModule.GetFFlagEnableMultiPageSignupV2Updates
local GetFFlagEnableLuafiedRecoveryFlowFunction = SharedFlagsModule.GetFFlagEnableLuafiedRecoveryFlow

return function(p1) --[[ Line: 68 | Named "AuthTextInputValidator" ]]
	-- upvalues: UseDesignTokensFunction (copy), UseTokensFunction (copy), UseDispatchFunction (copy), UseRoactServiceFunction (copy), RoactNetworking (copy), UseStyleFunction (copy), ReactModule (copy), InputValidity (copy), DebounceModule (copy), GetFFlagEnableLuafiedRecoveryFlowFunction (copy), IssueCondition (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (copy), UIConstants (copy), UseLocalizationFunction (copy), Text (copy), StyledTextLabel (copy), TextInput (copy)
	local UseDesignTokensResult = UseDesignTokensFunction()
	local UseTokensResult = UseTokensFunction()
	local UseDispatchResult = UseDispatchFunction()
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStyleResult = UseStyleFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState("")
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState("")
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(p1.validator.getDefaultIssues())
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(true)
	local UseStateResult5, UseStateResult2_4 = ReactModule.useState(InputValidity.Unvalidated)
	local UseStateResult6, UseStateResult2_5 = ReactModule.useState(nil)
	local UseStateResult7, UseStateResult2_6 = ReactModule.useState(false)
	local UseResult = ReactModule.useCallback(DebounceModule(function(p2) --[[ Line: 87 ]]
		-- upvalues: UseStateResult2_1 (copy)
		UseStateResult2_1(p2)
	end, p1.debounceTime or 0.5), { UseStateResult2_1 })
	ReactModule.useEffect(function() --[[ Line: 92 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult (copy), UseResult (copy)
		if UseStateResult1 ~= UseStateResult then
			UseResult(UseStateResult)
		end
	end, { UseStateResult })
	local list = { UseStateResult1 }
	
	if GetFFlagEnableLuafiedRecoveryFlowFunction() then
		local ValidationDependencies = p1.validationDependencies
		
		if ValidationDependencies then
			for i = 1, #ValidationDependencies do
				list[#list + 1] = ValidationDependencies[i]
			end
		end
	end
	ReactModule.useEffect(function() --[[ Line: 108 ]]
		-- upvalues: UseStateResult1 (copy), UseStateResult2_4 (copy), InputValidity (upval), UseStateResult2_2 (copy), p1 (copy), UseDispatchResult (copy), UseRoactServiceResult (copy), UseStateResult3 (copy), UseStateResult (copy), UseStateResult2 (copy)
		if #UseStateResult1 == 0 then
			UseStateResult2_4(InputValidity.Unvalidated)
			UseStateResult2_2(p1.validator.getDefaultIssues())
			
			return
		else
			UseDispatchResult(p1.validator.validateFunction(UseRoactServiceResult, UseStateResult1, UseStateResult3, p1.validatorAdditionalProps)):andThen(function(Result) --[[ Line: 117 ]]
				-- upvalues: InputValidity (upval), UseStateResult (upval), p1 (upval), UseStateResult2_2 (upval), UseStateResult2_4 (upval), UseStateResult2 (upval)
				local Valid = if Result.InputValid then InputValidity.Valid else InputValidity.Invalid
				
				if UseStateResult == Result.Input and p1.onTextChanged then
					p1.onTextChanged(Result.Input, Valid)
				end
				UseStateResult2_2(Result.IssueCondition)
				UseStateResult2_4(Valid)
				UseStateResult2(Result.Input)
			end)
		end
	end, list)
	ReactModule.useEffect(function() --[[ Line: 131 ]]
		-- upvalues: UseStateResult5 (copy), InputValidity (upval), UseStateResult2_5 (copy), p1 (copy), UseStateResult3 (copy), IssueCondition (upval)
		if UseStateResult5 ~= InputValidity.Invalid then
			UseStateResult2_5(nil)
			
			return
		end
		local v1 = nil
		repeat
			if p1.validatorIssuePriorityList then
				for _, value in ipairs(p1.validatorIssuePriorityList) do
					if UseStateResult3[value] == IssueCondition.Problematic then
						v1 = value
						break
					end
				end
				break
			end
			for i, value1 in pairs(UseStateResult3) do
				if value1 == IssueCondition.Problematic then
					v1 = i
				else
					continue
				end
			end
			break
		until true
		if v1 == nil then
			UseStateResult2_5(nil)
			
			return
		end
		if p1.onErrorShown then
			p1.onErrorShown(v1)
		end
		if p1.validatorIssueMessageList then
			UseStateResult2_5(p1.validatorIssueMessageList[v1])
			
			return
		else
			UseStateResult2_5(p1.validator.getIssueMessageList()[v1])
		end
	end, { UseStateResult5 })
	ReactModule.useEffect(function() --[[ Line: 172 ]]
		-- upvalues: GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseStateResult7 (copy), p1 (copy), UseStateResult2_6 (copy)
		if GetFFlagEnableMultiPageSignupV2UpdatesFunction() and UseStateResult7 then
			local TextBoxRef = p1.textBoxRef
			
			if TextBoxRef.current and TextBoxRef.current.focus then
				TextBoxRef.current.focus()
			end
			UseStateResult2_6(false)
		end
	end, { UseStateResult7 })
	
	local function OnChanged(p2) --[[ Line: 185 ]]
		-- upvalues: p1 (copy), InputValidity (upval), UseStateResult2_4 (copy), UseStateResult2 (copy)
		p1.onTextChanged(p2, InputValidity.Unvalidated)
		UseStateResult2_4(InputValidity.Unvalidated)
		UseStateResult2(p2)
	end
	
	local function _() --[[ Line: 191 | Named "getTextInputType" ]]
		-- upvalues: p1 (copy), UseStateResult4 (copy)
		return if p1.textInputType == Enum.TextInputType.Password then if UseStateResult4 then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown else p1.textInputType
	end
	
	local function getShowPasswordIconButton() --[[ Line: 201 ]]
		-- upvalues: p1 (copy), UseStateResult4 (copy), UIConstants (upval), UseStateResult2_3 (copy), GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseStateResult2_6 (copy)
		if p1.textInputType ~= Enum.TextInputType.Password then
			return nil, nil
		elseif UseStateResult4 then
			return UIConstants.HIDE_PASSWORD_ICON, function() --[[ Line: 205 ]]
				-- upvalues: UseStateResult2_3 (upval), GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseStateResult2_6 (upval)
				UseStateResult2_3(false)
				
				if GetFFlagEnableMultiPageSignupV2UpdatesFunction() then
					UseStateResult2_6(true)
				end
			end
		else
			return UIConstants.SHOW_PASSWORD_ICON, function() --[[ Line: 213 ]]
				-- upvalues: UseStateResult2_3 (upval), GetFFlagEnableMultiPageSignupV2UpdatesFunction (upval), UseStateResult2_6 (upval)
				UseStateResult2_3(true)
				
				if GetFFlagEnableMultiPageSignupV2UpdatesFunction() then
					UseStateResult2_6(true)
				end
			end
		end
	end
	
	local UseLocalizationResult = UseLocalizationFunction({ errorText = UseStateResult6 })
	local ShowPasswordIconButton, ShowPasswordIconButton2 = getShowPasswordIconButton()
	
	return ReactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = ReactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, GetFFlagEnableLuafiedRecoveryFlowFunction() and p1.customPadding or UseDesignTokensResult.Size.Size_100),
			HorizontalFlex = Enum.UIFlexAlignment.Fill
		}),
		TextInputBox = ReactModule.createElement(TextInput, {
			LayoutOrder = 1,
			label = "",
			textInputType = if p1.textInputType == Enum.TextInputType.Password then if UseStateResult4 then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown else p1.textInputType,
			width = UDim.new(1, 0),
			text = p1.initialText or "",
			placeholder = p1.placeholder,
			onChanged = OnChanged,
			iconTrailing = if GetFFlagEnableLuafiedRecoveryFlowFunction() and p1.hideIconButton then nil elseif ShowPasswordIconButton then {
				name = ShowPasswordIconButton,
				onActivated = ShowPasswordIconButton2
			} else nil,
			hasError = UseStateResult5 == InputValidity.Invalid and #UseStateResult > 0,
			textBoxRef = p1.textBoxRef,
			size = p1.size
		}),
		IssueWrapper = ReactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, GetFFlagEnableLuafiedRecoveryFlowFunction() and p1.issueHeight or UseDesignTokensResult.Size.Size_400)
		}, {
			Issue = if UseStateResult5 == InputValidity.Invalid and GetFFlagEnableLuafiedRecoveryFlowFunction() and p1.useFoundationTextForIssue then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				Size = UDim2.new(1, 0, 0, UseTokensResult.Size.Size_200)
			}, {
				IssuePadding = ReactModule.createElement("UIPadding", {
					PaddingTop = UDim.new(0, p1.foundationIssueTextPadding or 0)
				}),
				IssueText = ReactModule.createElement(Text, {
					Text = UseLocalizationResult.errorText or "",
					fontStyle = UseTokensResult.Typography.CaptionSmall,
					textStyle = UseTokensResult.Color.System.Alert,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextYAlignment = Enum.TextYAlignment.Center
				})
			}) elseif UseStateResult5 == InputValidity.Invalid then ReactModule.createElement(StyledTextLabel, {
				textWrapped = true,
				text = UseLocalizationResult.errorText or "",
				fontStyle = UseStyleResult.Font.BodySmall,
				colorStyle = UseStyleResult.Theme.Alert,
				automaticSize = Enum.AutomaticSize.XY
			}) else nil
		})
	})
end