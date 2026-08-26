local authCommon = script:FindFirstAncestor("AuthCommon")
local parent = authCommon.Parent
local roactModule = require(parent.Roact)
local roactRoduxModule = require(parent.RoactRodux)
local roactServices = require(parent.RoactServices).RoactServices
local roactNetworking = require(parent.RoactServiceTags).RoactNetworking
local tModule = require(parent.t)
local tutilsModule = require(parent.tutils)
local argCheckModule = require(parent.ArgCheck)
local UIBloxModule = require(parent.UIBlox)
local withStyle = UIBloxModule.Style.withStyle
local withLocalization = require(parent.Localization).withLocalization
local foundationModule = require(parent.Foundation)
local icon = foundationModule.Icon
local iconName = foundationModule.Enums.IconName
local iconSize = foundationModule.Enums.IconSize
local iconVariant = foundationModule.Enums.IconVariant
local fitChildrenModule = require(authCommon.Components.FitChildren)
local fitTextLabelModule = require(authCommon.Components.FitTextLabel)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local loggerModule = require(authCommon.Components.Logger)
local issueConditionModule = require(authCommon.Enums.IssueCondition)
local inputValidityModule = require(authCommon.Enums.InputValidity)
local var1 = roactModule.createBinding(0)
local var2 = tModule.interface({
	validateFunction = tModule.callback,
	getIssueMessageList = tModule.callback,
	getDefaultIssues = tModule.callback
})
local issueTracker = roactModule.PureComponent:extend("IssueTracker")
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignUpTrackFailedRequest = sharedFlagsModule.FFlagSignUpTrackFailedRequest
local fFlagAuthValidatorStyleOverrides = sharedFlagsModule.FFlagAuthValidatorStyleOverrides
local getFFlagIssueTrackerUseFoundationIconModule = require(authCommon.Flags.GetFFlagIssueTrackerUseFoundationIcon)

function issueTracker.init(p1)
	-- upvalues: var2 (ref), issueConditionModule (ref), inputValidityModule (ref), roactModule (ref), fFlagSignUpTrackFailedRequest (ref), loggerModule (ref), tutilsModule (ref)
	local validator = p1.props.validator
	assert(var2(validator))
	local issueMessageList = validator.getIssueMessageList()
	local defaultIssues = validator.getDefaultIssues()
	local t = {}
	
	for i in pairs(issueMessageList) do
		t[i] = defaultIssues[i] ~= issueConditionModule.Hidden and true
	end
	p1.state = {
		listOfIssuesOnDisplay = t,
		issueMessageList = issueMessageList,
		issueCondition = defaultIssues,
		inputValidity = inputValidityModule.Unvalidated
	}
	p1.isMounted = false
	p1.containerRef = roactModule.createRef()
	
	function p0.validateText()
		-- upvalues: p1 (ref), var2 (copy), validator (ref), inputValidityModule (copy), fFlagSignUpTrackFailedRequest (copy), loggerModule (copy)
		local networking = p1.props.networking
		local textToValidate = p1.props.textToValidate
		local validate = p1.props.validate
		local validatorAdditionalProps = p1.props.validatorAdditionalProps
		local issueCondition = p1.state.issueCondition
		assert(var2(validator))
		validate(networking, validator.validateFunction, textToValidate, issueCondition, validatorAdditionalProps):andThen(function(p2)
			-- upvalues: p1 (copy), inputValidityModule (copy), fFlagSignUpTrackFailedRequest (copy)
			spawn(function()
				-- upvalues: p1 (copy), inputValidityModule (copy), p2 (ref), fFlagSignUpTrackFailedRequest (copy)
				local onTextValidated = p1.props.onTextValidated
				local textToValidate = p1.props.textToValidate
				local invalid = inputValidityModule.Invalid
				
				if p1.isMounted and p2.Input == textToValidate then
					if textToValidate == "" then
						invalid = inputValidityModule.Unvalidated
					elseif p2.InputValid then
						invalid = inputValidityModule.Valid
					end
					if onTextValidated then
						if fFlagSignUpTrackFailedRequest then
							onTextValidated(p2.Input, invalid, p2.hasRequestFailed)
						else
							onTextValidated(p2.Input, invalid)
						end
					end
					p1:setState({
						issueCondition = p2.IssueCondition,
						inputValidity = invalid
					})
					
					if p1.props.updateIssueCondition then
						p1.props.updateIssueCondition(p2.IssueCondition)
					end
				end
			end)
		end, function(p2)
			-- upvalues: loggerModule (copy), p1 (copy), inputValidityModule (copy)
			loggerModule:warning(string.format("Input issueTracker error: %s", tostring(p2)))
			p1:setState({ inputValidity = inputValidityModule.Unvalidated })
		end)
	end
	
	function p0.updateListOfIssuesOnDisplay()
		-- upvalues: p1 (ref), issueConditionModule (copy), tutilsModule (copy)
		local height = p1.props.height
		local issueMessageList = p1.state.issueMessageList
		local issueCondition = p1.state.issueCondition
		local var3 = 0
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in pairs(p1.containerRef.current and p1.containerRef.current:GetChildren() or {}) do
			if v:IsA("GuiObject") then
				t_3[v.Name] = v.AbsoluteSize.Y
			end
		end
		for i_1 in pairs(issueMessageList) do
			t[i_1] = false
			local var4 = issueCondition[i_1] == issueConditionModule.Problematic
			
			if issueCondition[i_1] ~= issueConditionModule.Hidden then
				local var5 = t_3[i_1] or 0
				table.insert(t_1, i_1)
				var3 += var5
				
				if not var4 then
					table.insert(t_2, #t_1)
				end
			end
		end
		var3 += (#t_1 - 1) * 5
		
		if height then
			for i_2 = #t_2, 1, -1 do
				if height >= var3 then break end
				local var6 = t_2[i_2]
				var3 = var3 - (t_3[t_1[var6]] or 0) - 5
				table.remove(t_1, var6)
			end
			for i_3 = #t_1, 1, -1 do
				if height >= var3 then break end
				var3 = var3 - (t_3[t_1[i_3]] or 0) - 5
				table.remove(t_1, i_3)
			end
		end
		for i_4, v_1 in pairs(t_1) do
			t[v_1] = true
		end
		spawn(function()
			-- upvalues: p1 (copy), tutilsModule (copy), t (ref)
			if p1.isMounted and not tutilsModule.shallowEqual(t, p1.state.listOfIssuesOnDisplay) then
				p1:setState({ listOfIssuesOnDisplay = t })
			end
		end)
	end
end

function issueTracker.didMount(p2)
	p2.isMounted = true
	p2.updateListOfIssuesOnDisplay()
end

function issueTracker.willUnmount(p2)
	p2.isMounted = false
end

function issueTracker.didUpdate(p2, p3, _)
	-- upvalues: argCheckModule (ref), tutilsModule (ref), fFlagSignUpTrackFailedRequest (ref)
	local validator = p2.props.validator
	local validatorAdditionalProps = p2.props.validatorAdditionalProps
	local textToValidate = p2.props.textToValidate
	
	if validator ~= p3.validator then
		argCheckModule.assert(validator == p3.validator, "IssueTracker expects the validator to never change")
	end
	if textToValidate ~= p3.textToValidate or not tutilsModule.shallowEqual(validatorAdditionalProps, p3.validatorAdditionalProps) then
		spawn(function()
			-- upvalues: fFlagSignUpTrackFailedRequest (copy), p2 (ref), textToValidate (ref)
			if fFlagSignUpTrackFailedRequest then
				task.wait(if p2.props.debounceTime then p2.props.debounceTime else 0.3)
			else
				wait(0.3)
			end
			if textToValidate == p2.props.textToValidate then
				p2.validateText()
			end
		end)
	end
	p2.updateListOfIssuesOnDisplay()
end

function issueTracker.render(p2)
	-- upvalues: withStyle (ref), var1 (ref), fFlagAuthValidatorStyleOverrides (ref), roactModule (ref), issueConditionModule (ref), withLocalization (ref), inputValidityModule (ref), fitChildrenModule (ref), getFFlagIssueTrackerUseFoundationIconModule (ref), icon (ref), iconName (ref), iconVariant (ref), iconSize (ref), imageSetLabel (ref), getImageData (ref), fitTextLabelModule (ref)
	local height = p2.props.height
	local issueMessageList = p2.state.issueMessageList
	local issueCondition = p2.state.issueCondition
	local listOfIssuesOnDisplay = p2.state.listOfIssuesOnDisplay
	
	return withStyle(function(p3)
		-- upvalues: p2 (ref), var1 (copy), fFlagAuthValidatorStyleOverrides (copy), roactModule (copy), issueMessageList (ref), issueCondition (ref), issueConditionModule (copy), withLocalization (copy), inputValidityModule (copy), fitChildrenModule (copy), listOfIssuesOnDisplay (ref), getFFlagIssueTrackerUseFoundationIconModule (copy), icon (copy), iconName (copy), iconVariant (copy), iconSize (copy), imageSetLabel (copy), getImageData (copy), fitTextLabelModule (copy), height (ref)
		local font = p3.Font.CaptionBody.Font
		local var7 = p3.Font.BaseSize * p3.Font.CaptionBody.RelativeSize
		local contentTransparency = p2.props.contentTransparency
		local checkmarkTransparency = p2.props.checkmarkTransparency or var1
		local var8 = if fFlagAuthValidatorStyleOverrides and p2.props.colorContentOverride then p2.props.colorContentOverride else p3.Theme.TextDefault.Color
		
		if not contentTransparency then
			local transparency = p3.Theme.TextDefault.Transparency
			
			if transparency ~= p2.textDefaultTransparency then
				p2.textDefaultTransparency = transparency
				p2.textDefaultTransparencyBinding = roactModule.createBinding(transparency)
			end
			contentTransparency = p2.textDefaultTransparencyBinding
		end
		local var9 = roactModule.joinBindings({
			content = contentTransparency,
			checkmark = checkmarkTransparency
		})
		local t = {}
		
		for i in pairs(issueMessageList) do
			table.insert(t, i)
		end
		if p2.props.sortProblematicIssues then
			table.sort(t, function(p4, p5)
				-- upvalues: issueCondition (copy), issueConditionModule (copy)
				return issueCondition[p4] == issueConditionModule.Problematic and issueCondition[p5] ~= issueConditionModule.Problematic
			end)
		end
		return withLocalization(issueMessageList)(function(p4)
			-- upvalues: roactModule (copy), p2 (copy), t (ref), issueCondition (copy), issueConditionModule (copy), inputValidityModule (copy), fitChildrenModule (copy), listOfIssuesOnDisplay (copy), getFFlagIssueTrackerUseFoundationIconModule (copy), icon (copy), iconName (copy), iconVariant (copy), iconSize (copy), var9 (ref), p3 (ref), var8 (ref), imageSetLabel (copy), getImageData (copy), fitTextLabelModule (copy), font (ref), var7 (ref), contentTransparency (write), height (copy), checkmarkTransparency (ref)
			local list = {
				roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
					[roactModule.Change.AbsoluteContentSize] = p2.updateListOfIssuesOnDisplay
				})
			}
			
			for i, v in ipairs(t) do
				local var10 = issueCondition[v] == issueConditionModule.Problematic
				local var11 = var10 and p2.state.inputValidity ~= inputValidityModule.Unvalidated
				list[v] = roactModule.createElement(fitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = fitChildrenModule.FitAxis.Height,
					LayoutOrder = i,
					Visible = listOfIssuesOnDisplay[v]
				}, {
					List = roactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, 7),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					CheckHolder = roactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 12, 0, 12)
					}, {
						CheckMark = if getFFlagIssueTrackerUseFoundationIconModule() then roactModule.createElement(icon, {
							name = if var10 then iconName.X else iconName.Check,
							variant = iconVariant.Filled,
							size = iconSize.XSmall,
							style = var9:map(function(p5)
								-- upvalues: var11 (ref), p3 (copy), var8 (copy)
								return {
									Color3 = if var11 then p3.Theme.Alert.Color else var8,
									Transparency = (p5.content - 1) * (1 - p5.checkmark) + 1
								}
							end),
							Position = UDim2.new(0.5, 0, 0.65, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						}) else roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							Image = if var10 then getImageData("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close" else getImageData("LuaApp/icons/progress_small") or "LuaApp/icons/progress_small",
							ImageColor3 = if var11 then p3.Theme.Alert.Color else var8,
							ImageTransparency = var9:map(function(p5)
								return (p5.content - 1) * (1 - p5.checkmark) + 1
							end),
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0.65, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						})
					}),
					IssueLabel = roactModule.createElement(fitTextLabelModule, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = fitChildrenModule.FitAxis.Height,
						Text = p4[v],
						Font = font,
						TextSize = var7,
						TextColor3 = if var11 then p3.Theme.Alert.Color else var8,
						TextTransparency = contentTransparency,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			end
			return if height then roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, height),
				BackgroundTransparency = 1,
				[roactModule.Ref] = p2.containerRef,
				Position = checkmarkTransparency:map(function(p5)
					return UDim2.new(0, 19 * -p5, 0, 0)
				end)
			}, list) else roactModule.createElement(fitChildrenModule.FitFrame, {
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = fitChildrenModule.FitAxis.Height,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p2.containerRef,
				Position = checkmarkTransparency:map(function(p5)
					return UDim2.new(0, 19 * -p5, 0, 0)
				end)
			}, list)
		end)
	end)
end

return roactServices.connect({ networking = roactNetworking })(roactRoduxModule.connect(nil, function(p4)
	return {
		validate = function(p5, p6, p7, p8, p9)
			-- upvalues: p4 (ref)
			return p4(p6(p5, p7, p8, p9))
		end
	}
end)(issueTracker))