local authSignup = script:FindFirstAncestor("AuthSignup")
local parent = authSignup.Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local UIBloxModule = require(parent.UIBlox)
local useDesignTokens = require(parent.Style).useDesignTokens
local useStyle = UIBloxModule.Core.Style.useStyle
local styledTextLabel = UIBloxModule.App.Text.StyledTextLabel
local foundationModule = require(parent.Foundation)
local textInput = foundationModule.TextInput
local text = foundationModule.Text
local useTokens = foundationModule.Hooks.useTokens
local useLocalization = require(parent.Localization).Hooks.useLocalization
local authCommonModule = require(parent.AuthCommon)
local inputValidity = authCommonModule.Enums.InputValidity
local issueCondition = authCommonModule.Enums.IssueCondition
local UIConstants = authCommonModule.Common.UIConstants
local debounceModule = require(authSignup.Util.debounce)
local sharedFlagsModule = require(parent.SharedFlags)
local getFFlagEnableMultiPageSignupV2Updates = sharedFlagsModule.GetFFlagEnableMultiPageSignupV2Updates
local getFFlagEnableLuafiedRecoveryFlow = sharedFlagsModule.GetFFlagEnableLuafiedRecoveryFlow

return function(p1)
	-- upvalues: useDesignTokens (ref), useTokens (ref), useDispatch (ref), useRoactService (ref), roactNetworking (ref), useStyle (ref), reactModule (ref), inputValidity (ref), debounceModule (ref), getFFlagEnableLuafiedRecoveryFlow (ref), issueCondition (ref), getFFlagEnableMultiPageSignupV2Updates (ref), UIConstants (ref), useLocalization (ref), text (ref), styledTextLabel (ref), textInput (ref)
	local var1 = useDesignTokens()
	local var2 = useTokens()
	local var3 = useDispatch()
	local var4 = useRoactService(roactNetworking)
	local var5 = useStyle()
	local var6, var7 = reactModule.useState("")
	local var8, var9 = reactModule.useState("")
	local var10, var11 = reactModule.useState(p1.validator.getDefaultIssues())
	local var12, var13 = reactModule.useState(true)
	local var14, var15 = reactModule.useState(inputValidity.Unvalidated)
	local var16, var17 = reactModule.useState(nil)
	local var18, var19 = reactModule.useState(false)
	local var20 = reactModule.useCallback(debounceModule(function(p2)
		-- upvalues: var9 (ref)
		var9(p2)
	end, p1.debounceTime or 0.5), { var9 })
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var6 (ref), var20 (ref)
		if var8 ~= var6 then
			var20(var6)
		end
	end, { var6 })
	local list = { var8 }
	
	if getFFlagEnableLuafiedRecoveryFlow() then
		local validationDependencies = p1.validationDependencies
		
		if validationDependencies then
			for i = 1, #validationDependencies do
				list[#list + 1] = validationDependencies[i]
			end
		end
	end
	reactModule.useEffect(function()
		-- upvalues: var8 (ref), var15 (ref), inputValidity (copy), var11 (ref), p1 (ref), var3 (ref), var4 (ref), var10 (ref), var6 (ref), var7 (ref)
		if #var8 == 0 then
			var15(inputValidity.Unvalidated)
			var11(p1.validator.getDefaultIssues())
			
			return
		end
		var3(p1.validator.validateFunction(var4, var8, var10, p1.validatorAdditionalProps)):andThen(function(p2)
			-- upvalues: inputValidity (copy), var6 (copy), p1 (copy), var11 (copy), var15 (copy), var7 (copy)
			local var21 = if p2.InputValid then inputValidity.Valid else inputValidity.Invalid
			
			if var6 == p2.Input and p1.onTextChanged then
				p1.onTextChanged(p2.Input, var21)
			end
			var11(p2.IssueCondition)
			var15(var21)
			var7(p2.Input)
		end)
	end, list)
	reactModule.useEffect(function()
		-- upvalues: var14 (ref), inputValidity (copy), var17 (ref), p1 (ref), var10 (ref), issueCondition (copy)
		if var14 ~= inputValidity.Invalid then
			var17(nil)
			
			return
		end
		local var21 = nil
		
		if p1.validatorIssuePriorityList then
			for i, v in ipairs(p1.validatorIssuePriorityList) do
				if var10[v] == issueCondition.Problematic then
					var21 = v
				end
			end
		else
			for i, v in pairs(var10) do
				if v == issueCondition.Problematic then
					var21 = i
					break
				end
			end
		end
		if var21 == nil then
			var17(nil)
			
			return
		elseif p1.onErrorShown then
			p1.onErrorShown(var21)
		end
		if p1.validatorIssueMessageList then
			var17(p1.validatorIssueMessageList[var21])
			
			return
		end
		var17(p1.validator.getIssueMessageList()[var21])
	end, { var14 })
	reactModule.useEffect(function()
		-- upvalues: getFFlagEnableMultiPageSignupV2Updates (copy), var18 (ref), p1 (ref), var19 (ref)
		if getFFlagEnableMultiPageSignupV2Updates() and var18 then
			local textBoxRef = p1.textBoxRef
			
			if textBoxRef.current and textBoxRef.current.focus then
				textBoxRef.current.focus()
			end
			var19(false)
		end
	end, { var18 })
	
	local var22 = function(p2)
		-- upvalues: p1 (ref), inputValidity (copy), var15 (ref), var7 (ref)
		p1.onTextChanged(p2, inputValidity.Unvalidated)
		var15(inputValidity.Unvalidated)
		var7(p2)
	end
	
	local function _()
		-- upvalues: p1 (ref), var12 (ref)
		return if p1.textInputType == Enum.TextInputType.Password then if var12 then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown else p1.textInputType
	end
	
	local var23 = useLocalization({ errorText = var16 })
	local var24, var25 = (function()
		-- upvalues: p1 (ref), var12 (ref), UIConstants (copy), var13 (ref), getFFlagEnableMultiPageSignupV2Updates (copy), var19 (ref)
		if p1.textInputType ~= Enum.TextInputType.Password then
			return nil, nil
		elseif var12 then
			return UIConstants.HIDE_PASSWORD_ICON, function()
				-- upvalues: var13 (copy), getFFlagEnableMultiPageSignupV2Updates (copy), var19 (copy)
				var13(false)
				
				if getFFlagEnableMultiPageSignupV2Updates() then
					var19(true)
				end
			end
		end
		return UIConstants.SHOW_PASSWORD_ICON, function()
			-- upvalues: var13 (copy), getFFlagEnableMultiPageSignupV2Updates (copy), var19 (copy)
			var13(true)
			
			if getFFlagEnableMultiPageSignupV2Updates() then
				var19(true)
			end
		end
	end)()
	local var26 = if var14 == inputValidity.Invalid and getFFlagEnableLuafiedRecoveryFlow() and p1.useFoundationTextForIssue then reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		Size = UDim2.new(1, 0, 0, var2.Size.Size_200)
	}, {
		IssuePadding = reactModule.createElement("UIPadding", {
			PaddingTop = UDim.new(0, p1.foundationIssueTextPadding or 0)
		}),
		IssueText = reactModule.createElement(text, {
			Text = var23.errorText or "",
			fontStyle = var2.Typography.CaptionSmall,
			textStyle = var2.Color.System.Alert,
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			TextXAlignment = Enum.TextXAlignment.Left,
			TextYAlignment = Enum.TextYAlignment.Center
		})
	}) elseif var14 == inputValidity.Invalid then reactModule.createElement(styledTextLabel, {
		textWrapped = true,
		text = var23.errorText or "",
		fontStyle = var5.Font.BodySmall,
		colorStyle = var5.Theme.Alert,
		automaticSize = Enum.AutomaticSize.XY
	}) else nil
	local size100 = var1.Size.Size_100
	
	if getFFlagEnableLuafiedRecoveryFlow() then
		size100 = p1.customPadding or var1.Size.Size_100
	end
	return reactModule.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y
	}, {
		UIListLayout = reactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			Padding = UDim.new(0, size100),
			HorizontalFlex = Enum.UIFlexAlignment.Fill
		}),
		TextInputBox = reactModule.createElement(textInput, {
			LayoutOrder = 1,
			label = "",
			textInputType = if p1.textInputType == Enum.TextInputType.Password then if var12 then Enum.TextInputType.Password else Enum.TextInputType.PasswordShown else p1.textInputType,
			width = UDim.new(1, 0),
			text = p1.initialText or "",
			placeholder = p1.placeholder,
			onChanged = var22,
			iconTrailing = if getFFlagEnableLuafiedRecoveryFlow() and p1.hideIconButton then nil elseif var24 then { name = var24, onActivated = var25 } else nil,
			hasError = var14 == inputValidity.Invalid and #var6 > 0,
			textBoxRef = p1.textBoxRef,
			size = p1.size
		}),
		IssueWrapper = reactModule.createElement("Frame", {
			LayoutOrder = 3,
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 0, if getFFlagEnableLuafiedRecoveryFlow() then p1.issueHeight else var1.Size.Size_400)
		}, { Issue = var26 })
	})
end