local AuthCommon = script:FindFirstAncestor("AuthCommon")
local Parent = AuthCommon.Parent
local RoactModule = require(Parent.Roact)
local RoactRoduxModule = require(Parent.RoactRodux)
local RoactServices = require(Parent.RoactServices).RoactServices
local RoactNetworking = require(Parent.RoactServiceTags).RoactNetworking
local TModule = require(Parent.t)
local TutilsModule = require(Parent.tutils)
local ArgCheckModule = require(Parent.ArgCheck)
local UIBloxModule = require(Parent.UIBlox)
local WithStyleFunction = UIBloxModule.Style.withStyle
local WithLocalizationFunction = require(Parent.Localization).withLocalization
local FoundationModule = require(Parent.Foundation)
local Icon = FoundationModule.Icon
local IconName = FoundationModule.Enums.IconName
local IconSize = FoundationModule.Enums.IconSize
local IconVariant = FoundationModule.Enums.IconVariant
local FitChildrenModule = require(AuthCommon.Components.FitChildren)
local FitTextLabelModule = require(AuthCommon.Components.FitTextLabel)
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local GetImageDataFunction = require(Parent.RobloxAppAssets).GetImageData
local LoggerModule = require(AuthCommon.Components.Logger)
local IssueConditionModule = require(AuthCommon.Enums.IssueCondition)
local InputValidityModule = require(AuthCommon.Enums.InputValidity)
local Binding = RoactModule.createBinding(0)
local InterfaceResult = TModule.interface({
	validateFunction = TModule.callback,
	getIssueMessageList = TModule.callback,
	getDefaultIssues = TModule.callback
})
local IssueTracker = RoactModule.PureComponent:extend("IssueTracker")
local SharedFlagsModule = require(Parent.SharedFlags)
local FFlagSignUpTrackFailedRequest = SharedFlagsModule.FFlagSignUpTrackFailedRequest
local FFlagAuthValidatorStyleOverrides = SharedFlagsModule.FFlagAuthValidatorStyleOverrides
local GetFFlagIssueTrackerUseFoundationIconModule = require(AuthCommon.Flags.GetFFlagIssueTrackerUseFoundationIcon)

function IssueTracker.init(p1)
	-- upvalues: InterfaceResult (copy), IssueConditionModule (copy), InputValidityModule (copy), RoactModule (copy), FFlagSignUpTrackFailedRequest (copy), LoggerModule (copy), TutilsModule (copy)
	local Validator = p1.props.validator
	assert(InterfaceResult(Validator))
	local IssueMessageList = Validator.getIssueMessageList()
	local DefaultIssues = Validator.getDefaultIssues()
	local ListOfIssuesOnDisplay = {}
	
	for i in pairs(IssueMessageList) do
		ListOfIssuesOnDisplay[i] = DefaultIssues[i] ~= IssueConditionModule.Hidden
	end
	p1.state = {
		listOfIssuesOnDisplay = ListOfIssuesOnDisplay,
		issueMessageList = IssueMessageList,
		issueCondition = DefaultIssues,
		inputValidity = InputValidityModule.Unvalidated
	}
	p1.isMounted = false
	p1.containerRef = RoactModule.createRef()
	
	function p1.validateText()
		-- upvalues: p1 (copy), InterfaceResult (upval), Validator (copy), InputValidityModule (upval), FFlagSignUpTrackFailedRequest (upval), LoggerModule (upval)
		local Networking = p1.props.networking
		local TextToValidate = p1.props.textToValidate
		local ValidateFunction = p1.props.validate
		local ValidatorAdditionalProps = p1.props.validatorAdditionalProps
		local IssueCondition = p1.state.issueCondition
		assert(InterfaceResult(Validator))
		ValidateFunction(Networking, Validator.validateFunction, TextToValidate, IssueCondition, ValidatorAdditionalProps):andThen(function(Result)
			-- upvalues: p1 (upval), InputValidityModule (upval), FFlagSignUpTrackFailedRequest (upval)
			spawn(function()
				-- upvalues: p1 (upval), InputValidityModule (upval), Result (copy), FFlagSignUpTrackFailedRequest (upval)
				local OnTextValidatedFunction: (any, any, any) -> () = p1.props.onTextValidated
				local TextToValidate = p1.props.textToValidate
				local Invalid = InputValidityModule.Invalid
				
				if p1.isMounted and Result.Input == TextToValidate then
					if TextToValidate == "" then
						Invalid = InputValidityModule.Unvalidated
					elseif Result.InputValid then
						Invalid = InputValidityModule.Valid
					end
					if OnTextValidatedFunction then
						if FFlagSignUpTrackFailedRequest then
							OnTextValidatedFunction(Result.Input, Invalid, Result.hasRequestFailed)
						else
							OnTextValidatedFunction(Result.Input, Invalid)
						end
					end
					p1:setState({
						issueCondition = Result.IssueCondition,
						inputValidity = Invalid
					})
					
					if p1.props.updateIssueCondition then
						p1.props.updateIssueCondition(Result.IssueCondition)
					end
				end
			end)
		end, function(p2)
			-- upvalues: LoggerModule (upval), p1 (upval), InputValidityModule (upval)
			LoggerModule:warning(string.format("Input issueTracker error: %s", (tostring(p2))))
			p1:setState({ inputValidity = InputValidityModule.Unvalidated })
		end)
	end
	
	function p1.updateListOfIssuesOnDisplay()
		-- upvalues: p1 (copy), IssueConditionModule (upval), TutilsModule (upval)
		local Height = p1.props.height
		local IssueMessageList = p1.state.issueMessageList
		local IssueCondition = p1.state.issueCondition
		local Total = 0
		local ListOfIssuesOnDisplay = {}
		local List = {}
		local List1 = {}
		local t = {}
		local Children = p1.containerRef.current and p1.containerRef.current:GetChildren() or {}
		for _, Gui in pairs(Children) do
			if Gui:IsA("GuiObject") then
				t[Gui.Name] = Gui.AbsoluteSize.Y
			end
		end
		for i in pairs(IssueMessageList) do
			ListOfIssuesOnDisplay[i] = false
			local IsIssueConditionEntryMatch = IssueCondition[i] == IssueConditionModule.Problematic
			
			if IssueCondition[i] ~= IssueConditionModule.Hidden then
				local Entry = t[i] or 0
				table.insert(List, i)
				Total += Entry
				
				if not IsIssueConditionEntryMatch then
					table.insert(List1, #List)
				end
			end
		end
		local NewTotal = Total + (#List - 1) * 5
		
		if Height then
			for i1 = #List1, 1, -1 do
				if Height >= NewTotal then break end
				local Index = List1[i1]
				NewTotal = NewTotal - (t[List[Index]] or 0) - 5
				table.remove(List, Index)
			end
			for i2 = #List, 1, -1 do
				if Height >= NewTotal then break end
				NewTotal = NewTotal - (t[List[i2]] or 0) - 5
				table.remove(List, i2)
			end
		end
		for _, value in pairs(List) do
			ListOfIssuesOnDisplay[value] = true
		end
		spawn(function()
			-- upvalues: p1 (upval), TutilsModule (upval), ListOfIssuesOnDisplay (copy)
			if p1.isMounted and not TutilsModule.shallowEqual(ListOfIssuesOnDisplay, p1.state.listOfIssuesOnDisplay) then
				p1:setState({ listOfIssuesOnDisplay = ListOfIssuesOnDisplay })
			end
		end)
	end
end

function IssueTracker.didMount(p2)
	p2.isMounted = true
	p2.updateListOfIssuesOnDisplay()
end

function IssueTracker.willUnmount(p2)
	p2.isMounted = false
end

function IssueTracker.didUpdate(p2, p3, _)
	-- upvalues: ArgCheckModule (copy), TutilsModule (copy), FFlagSignUpTrackFailedRequest (copy)
	local Validator = p2.props.validator
	local ValidatorAdditionalProps = p2.props.validatorAdditionalProps
	local TextToValidate = p2.props.textToValidate
	
	if Validator ~= p3.validator then
		ArgCheckModule.assert(Validator == p3.validator, "IssueTracker expects the validator to never change")
	end
	if TextToValidate ~= p3.textToValidate or not TutilsModule.shallowEqual(ValidatorAdditionalProps, p3.validatorAdditionalProps) then
		spawn(function()
			-- upvalues: FFlagSignUpTrackFailedRequest (upval), p2 (copy), TextToValidate (copy)
			if FFlagSignUpTrackFailedRequest then
				task.wait(if p2.props.debounceTime then p2.props.debounceTime else 0.3)
			else
				wait(0.3)
			end
			if TextToValidate == p2.props.textToValidate then
				p2.validateText()
			end
		end)
	end
	p2.updateListOfIssuesOnDisplay()
end

function IssueTracker.render(p2)
	-- upvalues: WithStyleFunction (copy), Binding (copy), FFlagAuthValidatorStyleOverrides (copy), RoactModule (copy), IssueConditionModule (copy), WithLocalizationFunction (copy), InputValidityModule (copy), FitChildrenModule (copy), GetFFlagIssueTrackerUseFoundationIconModule (copy), Icon (copy), IconName (copy), IconVariant (copy), IconSize (copy), ImageSetLabel (copy), GetImageDataFunction (copy), FitTextLabelModule (copy)
	local Height = p2.props.height
	local IssueMessageList = p2.state.issueMessageList
	local IssueCondition = p2.state.issueCondition
	local ListOfIssuesOnDisplay = p2.state.listOfIssuesOnDisplay
	
	return WithStyleFunction(function(p3)
		-- upvalues: p2 (copy), Binding (upval), FFlagAuthValidatorStyleOverrides (upval), RoactModule (upval), IssueMessageList (copy), IssueCondition (copy), IssueConditionModule (upval), WithLocalizationFunction (upval), InputValidityModule (upval), FitChildrenModule (upval), ListOfIssuesOnDisplay (copy), GetFFlagIssueTrackerUseFoundationIconModule (upval), Icon (upval), IconName (upval), IconVariant (upval), IconSize (upval), ImageSetLabel (upval), GetImageDataFunction (upval), FitTextLabelModule (upval), Height (copy)
		local CaptionBodyFont = p3.Font.CaptionBody.Font
		local ScaledBaseSize = p3.Font.BaseSize * p3.Font.CaptionBody.RelativeSize
		local ContentTransparency = p2.props.contentTransparency
		local CheckmarkTransparency = p2.props.checkmarkTransparency or Binding
		local ColorContentOverride = if FFlagAuthValidatorStyleOverrides and p2.props.colorContentOverride then p2.props.colorContentOverride else p3.Theme.TextDefault.Color
		
		if not ContentTransparency then
			local Transparency = p3.Theme.TextDefault.Transparency
			
			if Transparency ~= p2.textDefaultTransparency then
				p2.textDefaultTransparency = Transparency
				p2.textDefaultTransparencyBinding = RoactModule.createBinding(Transparency)
			end
			ContentTransparency = p2.textDefaultTransparencyBinding
		end
		local JoinBindingsResult = RoactModule.joinBindings({
			content = ContentTransparency,
			checkmark = CheckmarkTransparency
		})
		local List = {}
		
		for i in pairs(IssueMessageList) do
			table.insert(List, i)
		end
		if p2.props.sortProblematicIssues then
			table.sort(List, function(A, B): boolean
				-- upvalues: IssueCondition (upval), IssueConditionModule (upval)
				return IssueCondition[A] == IssueConditionModule.Problematic and IssueCondition[B] ~= IssueConditionModule.Problematic
			end)
		end
		return WithLocalizationFunction(IssueMessageList)(function(p4)
			-- upvalues: RoactModule (upval), p2 (upval), List (copy), IssueCondition (upval), IssueConditionModule (upval), InputValidityModule (upval), FitChildrenModule (upval), ListOfIssuesOnDisplay (upval), GetFFlagIssueTrackerUseFoundationIconModule (upval), Icon (upval), IconName (upval), IconVariant (upval), IconSize (upval), JoinBindingsResult (copy), p3 (copy), ColorContentOverride (copy), ImageSetLabel (upval), GetImageDataFunction (upval), FitTextLabelModule (upval), CaptionBodyFont (copy), ScaledBaseSize (copy), ContentTransparency (ref), Height (upval), CheckmarkTransparency (copy)
			local Elements = {
				RoactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 5),
					SortOrder = Enum.SortOrder.LayoutOrder,
					[RoactModule.Change.AbsoluteContentSize] = p2.updateListOfIssuesOnDisplay
				})
			}
			
			for LayoutOrder, value in ipairs(List) do
				local IsIssueConditionEntryMatch = IssueCondition[value] == IssueConditionModule.Problematic
				local IsNotInputValidityMatch: boolean = IsIssueConditionEntryMatch and p2.state.inputValidity ~= InputValidityModule.Unvalidated
				Elements[value] = RoactModule.createElement(FitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height,
					LayoutOrder = LayoutOrder,
					Visible = ListOfIssuesOnDisplay[value]
				}, {
					List = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						Padding = UDim.new(0, 7),
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					CheckHolder = RoactModule.createElement("Frame", {
						LayoutOrder = 1,
						BackgroundTransparency = 1,
						Size = UDim2.new(0, 12, 0, 12)
					}, {
						CheckMark = if GetFFlagIssueTrackerUseFoundationIconModule() then RoactModule.createElement(Icon, {
							name = if IsIssueConditionEntryMatch then IconName.X else IconName.Check,
							variant = IconVariant.Filled,
							size = IconSize.XSmall,
							style = JoinBindingsResult:map(function(p5)
								-- upvalues: IsNotInputValidityMatch (copy), p3 (upval), ColorContentOverride (upval)
								return {
									Color3 = IsNotInputValidityMatch and p3.Theme.Alert.Color or ColorContentOverride,
									Transparency = (p5.content - 1) * (1 - p5.checkmark) + 1
								}
							end),
							Position = UDim2.new(0.5, 0, 0.65, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						}) else RoactModule.createElement(ImageSetLabel, {
							BackgroundTransparency = 1,
							Image = if IsIssueConditionEntryMatch then GetImageDataFunction("LuaApp/icons/navigation/close") or "LuaApp/icons/navigation/close" else GetImageDataFunction("LuaApp/icons/progress_small") or "LuaApp/icons/progress_small",
							ImageColor3 = IsNotInputValidityMatch and p3.Theme.Alert.Color or ColorContentOverride,
							ImageTransparency = JoinBindingsResult:map(function(p5): number
								return (p5.content - 1) * (1 - p5.checkmark) + 1
							end),
							Size = UDim2.new(1, 0, 1, 0),
							Position = UDim2.new(0.5, 0, 0.65, 0),
							AnchorPoint = Vector2.new(0.5, 0.5)
						})
					}),
					IssueLabel = RoactModule.createElement(FitTextLabelModule, {
						LayoutOrder = 2,
						BackgroundTransparency = 1,
						TextWrapped = true,
						Size = UDim2.new(1, 0, 0, 0),
						fitAxis = FitChildrenModule.FitAxis.Height,
						Text = p4[value],
						Font = CaptionBodyFont,
						TextSize = ScaledBaseSize,
						TextColor3 = IsNotInputValidityMatch and p3.Theme.Alert.Color or ColorContentOverride,
						TextTransparency = ContentTransparency,
						TextXAlignment = Enum.TextXAlignment.Left
					})
				})
			end
			return if Height then RoactModule.createElement("Frame", {
				Size = UDim2.new(1, 0, 0, Height),
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p2.containerRef,
				Position = CheckmarkTransparency:map(function(p5): UDim2
					return UDim2.new(0, 19 * -p5, 0, 0)
				end)
			}, Elements) else RoactModule.createElement(FitChildrenModule.FitFrame, {
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height,
				BackgroundTransparency = 1,
				[RoactModule.Ref] = p2.containerRef,
				Position = CheckmarkTransparency:map(function(p5): UDim2
					return UDim2.new(0, 19 * -p5, 0, 0)
				end)
			}, Elements)
		end)
	end)
end

return (RoactServices.connect({ networking = RoactNetworking })((RoactRoduxModule.connect(nil, function(Callback)
	return {
		validate = function(p4, Callback1, p5, p6, p7)
			-- upvalues: Callback (copy)
			return Callback(Callback1(p4, p5, p6, p7))
		end
	}
end)(IssueTracker))))