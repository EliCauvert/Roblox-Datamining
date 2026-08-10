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
local fitChildrenModule = require(authCommon.Components.FitChildren)
local fitTextLabelModule = require(authCommon.Components.FitTextLabel)
local imageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local getImageData = require(parent.RobloxAppAssets).GetImageData
local loggerModule = require(authCommon.Components.Logger)
local issueConditionModule = require(authCommon.Enums.IssueCondition)
local inputValidityModule = require(authCommon.Enums.InputValidity)
local var12 = roactModule.createBinding(0)
local var13 = tModule.interface({
	validateFunction = tModule.callback,
	getIssueMessageList = tModule.callback,
	getDefaultIssues = tModule.callback
})
local issueTracker = roactModule.PureComponent:extend("IssueTracker")
local sharedFlagsModule = require(parent.SharedFlags)
local fFlagSignUpTrackFailedRequest = sharedFlagsModule.FFlagSignUpTrackFailedRequest
local fFlagAuthValidatorStyleOverrides = sharedFlagsModule.FFlagAuthValidatorStyleOverrides

function issueTracker.init(p0) --[[ line: 51 ]]
	-- upvalues: var13 (ref), issueConditionModule (ref), inputValidityModule (ref), roactModule (ref), fFlagSignUpTrackFailedRequest (ref), loggerModule (ref), tutilsModule (ref)
	local validator = p0.props.validator
	assert(var13(validator))
	local issueMessageList = validator.getIssueMessageList()
	local defaultIssues = validator.getDefaultIssues()
	local t = {}
	
	for i in pairs(issueMessageList) do
		t[i] = defaultIssues[i] ~= issueConditionModule.Hidden and true
	end
	p0.state = {
		listOfIssuesOnDisplay = t,
		issueMessageList = issueMessageList,
		issueCondition = defaultIssues,
		inputValidity = inputValidityModule.Unvalidated
	}
	p0.isMounted = false
	p0.containerRef = roactModule.createRef()
	
	function p0.validateText() --[[ line: 78 ]]
		-- upvalues: p0 (ref), var13 (copy), validator (ref), inputValidityModule (copy), fFlagSignUpTrackFailedRequest (copy), loggerModule (copy)
		local networking = p0.props.networking
		local textToValidate = p0.props.textToValidate
		local validate = p0.props.validate
		local validatorAdditionalProps = p0.props.validatorAdditionalProps
		local issueCondition = p0.state.issueCondition
		assert(var13(validator))
		validate(networking, validator.validateFunction, textToValidate, issueCondition, validatorAdditionalProps):andThen(function(p1) --[[ line: 91 ]]
			-- upvalues: p0 (copy), inputValidityModule (copy), fFlagSignUpTrackFailedRequest (copy)
			spawn(function() --[[ line: 92 ]]
				-- upvalues: p0 (copy), inputValidityModule (copy), p1 (ref), fFlagSignUpTrackFailedRequest (copy)
				local onTextValidated = p0.props.onTextValidated
				local textToValidate = p0.props.textToValidate
				local invalid = inputValidityModule.Invalid
				
				if p0.isMounted and p1.Input == textToValidate then
					if textToValidate == "" then
						invalid = inputValidityModule.Unvalidated
					elseif p1.InputValid then
						invalid = inputValidityModule.Valid
					end
					if onTextValidated then
						if fFlagSignUpTrackFailedRequest then
							onTextValidated(p1.Input, invalid, p1.hasRequestFailed)
						else
							onTextValidated(p1.Input, invalid)
						end
					end
					p0:setState({
						issueCondition = p1.IssueCondition,
						inputValidity = invalid
					})
					
					if p0.props.updateIssueCondition then
						p0.props.updateIssueCondition(p1.IssueCondition)
					end
				end
			end)
		end, function(p2) --[[ line: 124 ]]
			-- upvalues: loggerModule (copy), p0 (copy), inputValidityModule (copy)
			loggerModule:warning(string.format("Input issueTracker error: %s", tostring(p2)))
			p0:setState({ inputValidity = inputValidityModule.Unvalidated })
		end)
	end
	
	function p0.updateListOfIssuesOnDisplay() --[[ line: 134 ]]
		-- upvalues: p0 (ref), issueConditionModule (copy), tutilsModule (copy)
		local height = p0.props.height
		local issueMessageList = p0.state.issueMessageList
		local issueCondition = p0.state.issueCondition
		local var19 = 0
		local t = {}
		local t_1 = {}
		local t_2 = {}
		local t_3 = {}
		
		for i, v in pairs(p0.containerRef.current and p0.containerRef.current:GetChildren() or {}) do
			if v:IsA("GuiObject") then
				t_3[v.Name] = v.AbsoluteSize.Y
			end
		end
		for i_1 in pairs(issueMessageList) do
			t[i_1] = false
			local var25 = issueCondition[i_1] == issueConditionModule.Problematic
			
			if issueCondition[i_1] ~= issueConditionModule.Hidden then
				local var26 = t_3[i_1] or 0
				table.insert(t_1, i_1)
				var19 += var26
				
				if not var25 then
					table.insert(t_2, #t_1)
				end
			end
		end
		var19 += (#t_1 - 1) * 5
		
		if height then
			for i_2 = #t_2, 1, -1 do
				if height >= var19 then break end
				local var24 = t_2[i_2]
				var19 = var19 - (t_3[t_1[var24]] or 0) - 5
				table.remove(t_1, var24)
			end
			for i_3 = #t_1, 1, -1 do
				if height >= var19 then break end
				var19 = var19 - (t_3[t_1[i_3]] or 0) - 5
				table.remove(t_1, i_3)
			end
		end
		for i_4, v_1 in pairs(t_1) do
			t[v_1] = true
		end
		spawn(function() --[[ line: 210 ]]
			-- upvalues: p0 (copy), tutilsModule (copy), t (ref)
			if p0.isMounted and not tutilsModule.shallowEqual(t, p0.state.listOfIssuesOnDisplay) then
				p0:setState({ listOfIssuesOnDisplay = t })
			end
		end)
	end
end

function issueTracker.didMount(p3) --[[ line: 222 ]]
	p3.isMounted = true
	p3.updateListOfIssuesOnDisplay()
end

function issueTracker.willUnmount(p4) --[[ line: 227 ]]
	p4.isMounted = false
end

function issueTracker.didUpdate(p5, p6, _) --[[ line: 231 ]]
	-- upvalues: argCheckModule (ref), tutilsModule (ref), fFlagSignUpTrackFailedRequest (ref)
	local validator = p5.props.validator
	local validatorAdditionalProps = p5.props.validatorAdditionalProps
	local textToValidate = p5.props.textToValidate
	
	if validator ~= p6.validator then
		argCheckModule.assert(validator == p6.validator, "IssueTracker expects the validator to never change")
	end
	if textToValidate ~= p6.textToValidate or not tutilsModule.shallowEqual(validatorAdditionalProps, p6.validatorAdditionalProps) then
		spawn(function() --[[ line: 244 ]]
			-- upvalues: fFlagSignUpTrackFailedRequest (copy), p5 (ref), textToValidate (ref)
			if fFlagSignUpTrackFailedRequest then
				task.wait(if p5.props.debounceTime then p5.props.debounceTime else 0.3)
			else
				wait(0.3)
			end
			if textToValidate == p5.props.textToValidate then
				p5.validateText()
			end
		end)
	end
	p5.updateListOfIssuesOnDisplay()
end

function issueTracker.render(p7) --[[ line: 260 ]]
	-- upvalues: withStyle (ref), var12 (ref), fFlagAuthValidatorStyleOverrides (ref), roactModule (ref), issueConditionModule (ref), withLocalization (ref), inputValidityModule (ref), fitChildrenModule (ref), imageSetLabel (ref), getImageData (ref), fitTextLabelModule (ref)
	local height = p7.props.height
	local issueMessageList = p7.state.issueMessageList
	local issueCondition = p7.state.issueCondition
	local listOfIssuesOnDisplay = p7.state.listOfIssuesOnDisplay
	
	return withStyle(function(p8) --[[ line: 268 ]]
		-- upvalues: p7 (ref), var12 (copy), fFlagAuthValidatorStyleOverrides (copy), roactModule (copy), issueMessageList (ref), issueCondition (ref), issueConditionModule (copy), withLocalization (copy), inputValidityModule (copy), fitChildrenModule (copy), listOfIssuesOnDisplay (ref), imageSetLabel (copy), getImageData (copy), fitTextLabelModule (copy), height (ref)
		local font = p8.Font.CaptionBody.Font
		local var27 = p8.Font.BaseSize * p8.Font.CaptionBody.RelativeSize
		local contentTransparency = p7.props.contentTransparency
		local checkmarkTransparency = p7.props.checkmarkTransparency or var12
		local var29 = if fFlagAuthValidatorStyleOverrides and p7.props.colorContentOverride then p7.props.colorContentOverride else p8.Theme.TextDefault.Color
		
		if not contentTransparency then
			local transparency = p8.Theme.TextDefault.Transparency
			
			if transparency ~= p7.textDefaultTransparency then
				p7.textDefaultTransparency = transparency
				p7.textDefaultTransparencyBinding = roactModule.createBinding(transparency)
			end
			contentTransparency = p7.textDefaultTransparencyBinding
		end
		local var30 = roactModule.joinBindings({
			content = contentTransparency,
			checkmark = checkmarkTransparency
		})
		local t = {}
		
		for i in pairs(issueMessageList) do
			table.insert(t, i)
		end
		if p7.props.sortProblematicIssues then
			table.sort(t, function(p9, p10) --[[ line: 298 ]]
				-- upvalues: issueCondition (copy), issueConditionModule (copy)
				return issueCondition[p9] == issueConditionModule.Problematic and issueCondition[p10] ~= issueConditionModule.Problematic
			end)
		end
		return withLocalization(issueMessageList)(function(p11) --[[ line: 309 ]]
			-- upvalues: roactModule (copy), p7 (copy), t (ref), issueCondition (copy), issueConditionModule (copy), inputValidityModule (copy), fitChildrenModule (copy), listOfIssuesOnDisplay (copy), imageSetLabel (copy), getImageData (copy), p8 (ref), var29 (ref), var30 (ref), fitTextLabelModule (copy), font (ref), var27 (ref), contentTransparency (write), height (copy), checkmarkTransparency (ref)
			local list = {
				roactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
					[roactModule.Change.AbsoluteContentSize] = p7.updateListOfIssuesOnDisplay
				})
			}
			
			for i, v in ipairs(t) do
				local var33 = issueCondition[v] == issueConditionModule.Problematic
				local var34 = var33 and p7.state.inputValidity ~= inputValidityModule.Unvalidated
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
						CheckMark = roactModule.createElement(imageSetLabel, {
							BackgroundTransparency = 1,
							Image = if var33 then getImageData("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close" else getImageData("LuaApp/icons/progress_small") or "LuaApp/icons/progress_small",
							ImageColor3 = if var34 then p8.Theme.Alert.Color else var29,
							ImageTransparency = var30:map(function(p12) --[[ line: 345 ]]
								return (p12.content - 1) * (1 - p12.checkmark) + 1
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
						Text = p11[v],
						Font = font,
						TextSize = var27,
						TextColor3 = if var34 then p8.Theme.Alert.Color else var29,
						TextTransparency = contentTransparency,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			end
			return if height then roactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, height),
				BackgroundTransparency = 1,
				[roactModule.Ref] = p7.containerRef,
				Position = checkmarkTransparency:map(function(p14) --[[ line: 374 ]]
					return UDim2.new(0, 19 * -p14, 0, 0)
				end)
			}, list) else roactModule.createElement(fitChildrenModule.FitFrame, {
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = fitChildrenModule.FitAxis.Height,
				BackgroundTransparency = 1,
				[roactModule.Ref] = p7.containerRef,
				Position = checkmarkTransparency:map(function(p13) --[[ line: 384 ]]
					return UDim2.new(0, 19 * -p13, 0, 0)
				end)
			}, list)
		end)
	end)
end

return roactServices.connect({ networking = roactNetworking })(roactRoduxModule.connect(nil, function(p15) --[[ line: 393 ]]
	return {
		validate = function(p16, p17, p18, p19, p20) --[[ line: 395 ]]
			-- upvalues: p15 (ref)
			return p15(p17(p16, p18, p19, p20))
		end
	}
end)(issueTracker))