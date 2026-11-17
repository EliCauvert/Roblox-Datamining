local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local UserAgreementUtilsModule = require(Parent.UserAgreementUtils)
local Roact = DependenciesModule.Roact
local Foundation = DependenciesModule.Foundation
local Checkbox = Foundation.Checkbox
local Text = Foundation.Text
local Icon = Foundation.Icon
local Enums = Foundation.Enums
local NormalizeFontFaceFunction = Foundation.Utility.normalizeFontFace
local WithLocalizationFunction = DependenciesModule.Localization.withLocalization
local WithStyleFunction = DependenciesModule.UIBlox.Core.Style.withStyle
local T = DependenciesModule.t
local FitFrame = DependenciesModule.FitFrame
local UserAgreementsListItemModule = require(script.Parent.UserAgreementsListItem)
local FFlagEnableModularizedUserAgreementsList = DependenciesModule.SharedFlags.FFlagEnableModularizedUserAgreementsList
local GetFFlagVngTOSRevisedEnabledFunction = DependenciesModule.SharedFlags.GetFFlagVngTOSRevisedEnabled
local AgreementItemsOrderFixEnabled = game:DefineFastFlag("AgreementItemsOrderFixEnabled", false)
local UserAgreementsList = Roact.PureComponent:extend("UserAgreementsList")
UserAgreementsList.validateProps = T.strictInterface({
	LayoutOrder = T.optional(T.integer),
	agreements = T.array(T.strictInterface({
		id = T.string,
		agreementType = T.string,
		clientType = T.string,
		displayUrl = T.string,
		regulationType = T.string,
		agreementBodyText = T.optional(T.string)
	})),
	checkBoxStates = T.optional(T.map(T.string, T.boolean)),
	setCheckBoxStates = T.optional(T.callback),
	separateRequiredOptional = T.optional(T.boolean),
	margin = T.optional(T.strictInterface({
		top = T.integer,
		right = T.integer,
		bottom = T.integer,
		left = T.integer
	})),
	verticalSpaceOffset = T.optional(T.integer),
	isAgreeAllChecked = T.optional(T.boolean),
	useScrollableFrame = T.optional(T.boolean),
	disableInnerScrolling = T.optional(T.boolean),
	useMutedCheckboxText = T.optional(T.boolean),
	useExternalLinkArrowForAgreementRows = T.optional(T.boolean),
	agreementTitleKeys = T.optional(T.map(T.string, T.string)),
	agreementTypeOrder = T.optional(T.map(T.string, T.integer)),
	listItemHeight = T.optional(T.integer),
	horizontalPadding = T.optional(T.integer),
	checkboxLabelGap = T.optional(T.integer),
	useLabelMediumSectionTitles = T.optional(T.boolean),
	useContrastUncheckedCheckbox = T.optional(T.boolean),
	useChevronArrow = T.optional(T.boolean),
	useBoldTitle = T.optional(T.boolean),
	requiredSectionEndRef = T.optional(T.union(T.table, T.callback))
})
UserAgreementsList.defaultProps = { margin = FitFrame.Rect.square(0) }

function shouldCreateRowsForAgreementType(p1, p2): boolean
	local FoundAt: number? = string.find(p1.agreementType:lower(), "optional")
	
	return if tostring(p2) == tostring("REQUIRED") and not FoundAt or tostring(p2) == tostring("OPTIONAL") and FoundAt then true else false
end

function updateTable(Tbl, Key, p1)
	local Copy = table.clone(Tbl)
	Copy[Key] = p1
	
	return Copy
end

function sortAgreementsByType(Tbl, p1)
	local t = {}
	
	for i, value in ipairs(Tbl) do
		t[value] = i
	end
	local Copy = table.clone(Tbl)
	table.sort(Copy, function(A, B): boolean
		-- upvalues: p1 (copy), t (copy)
		local v1 = p1[A.agreementType] or 1e999
		local v2 = p1[B.agreementType] or 1e999
		
		return if v1 == v2 then t[A] < t[B] else v1 < v2
	end)
	
	return Copy
end

local function createContrastStrokeCheckbox(p2, IsChecked, p3)
	-- upvalues: Roact (copy), Icon (copy), Enums (copy)
	local DefaultColor3 = p2.Color.Stroke.Default.Color3
	local Background = p2.Color.ActionSubEmphasis.Background
	
	return Roact.createElement("ImageButton", {
		Size = UDim2.fromOffset(p2.Size.Size_600, p2.Size.Size_600),
		BackgroundColor3 = if IsChecked then Background.Color3 else Color3.new(1, 1, 1),
		BackgroundTransparency = if IsChecked then Background.Transparency else 1,
		AutoButtonColor = false,
		BorderSizePixel = 0,
		[Roact.Event.Activated] = p3
	}, {
		UICorner = Roact.createElement("UICorner", { CornerRadius = UDim.new(0, p2.Radius.Small) }),
		UIStroke = Roact.createElement("UIStroke", {
			Thickness = 1,
			Color = if IsChecked then Background.Color3 else DefaultColor3,
			Transparency = if IsChecked then Background.Transparency else 0.6
		}),
		Check = if IsChecked then Roact.createElement(Icon, {
			name = Enums.IconName.Check,
			size = Enums.IconSize.Small,
			style = p2.Color.ActionSubEmphasis.Foreground,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.fromScale(0.5, 0.5)
		}) else nil
	})
end

function UserAgreementsList.getListItemsWithCheckBoxes(p2, _, TableCount, p3, Tokens, CheckBoxStates, Callback)
	-- upvalues: UserAgreementUtilsModule (copy), Roact (copy), createContrastStrokeCheckbox (copy), Checkbox (copy), UserAgreementsListItemModule (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), FitFrame (copy)
	local SortAgreementsByTypeResult = {}
	
	if p2.props.agreementTypeOrder then
		SortAgreementsByTypeResult = sortAgreementsByType(p2.props.agreements, p2.props.agreementTypeOrder)
	else
		for _, agreement in pairs(p2.props.agreements) do
			table.insert(SortAgreementsByTypeResult, agreement)
		end
	end
	local LayoutOrder: number = TableCount
	local HorizontalPadding = p2.props.horizontalPadding or Tokens.Size.Size_600
	local CheckboxLabelGap = p2.props.checkboxLabelGap or Tokens.Size.Size_400
	local ListItemHeight = p2.props.listItemHeight or 55
	local NewHorizontalPadding = HorizontalPadding + Tokens.Size.Size_600
	local Negated = if p2.props.listItemHeight then -Tokens.Size.Size_600 else 0
	local List = {}
	local List1 = {}
	
	for _, value in ipairs(SortAgreementsByTypeResult) do
		if UserAgreementUtilsModule.CheckAgreementTypeExists(value.agreementType) then
			table.insert(List, value)
		else
			table.insert(List1, value)
		end
	end
	local list = { List, List1 }
	local list1 = { true, false }
	local Frames = {}
	
	for i, value1 in ipairs(list) do
		for _, Agreement in ipairs(value1) do
			local Entry = list1[i]
			local CheckBoxState = CheckBoxStates[Agreement.id]
			
			if shouldCreateRowsForAgreementType(Agreement, p3) then
				LayoutOrder += 1
				Frames["Item." .. Agreement.id] = Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					AutomaticSize = Enum.AutomaticSize.Y,
					Size = UDim2.new(1, 0, 0, 0),
					LayoutOrder = LayoutOrder
				}, {
					Layout = Roact.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						SortOrder = Enum.SortOrder.LayoutOrder
					}),
					CheckboxFrame = Roact.createElement("Frame", {
						BackgroundTransparency = 1,
						LayoutOrder = 0,
						Size = UDim2.new(0, NewHorizontalPadding, 1, 0)
					}, {
						Padding = Roact.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, HorizontalPadding),
							PaddingTop = UDim.new(0, if p2.props.listItemHeight then 0 else Tokens.Size.Size_300)
						}),
						Layout = if p2.props.listItemHeight then Roact.createElement("UIListLayout", { VerticalAlignment = Enum.VerticalAlignment.Center }) else nil,
						Checkbox = if p2.props.useContrastUncheckedCheckbox then createContrastStrokeCheckbox(Tokens, CheckBoxState, function()
							-- upvalues: CheckBoxState (copy), CheckBoxStates (copy), Agreement (copy), Callback (copy)
							local NoCheckBoxState = not CheckBoxState
							Callback(updateTable(CheckBoxStates, Agreement.id, NoCheckBoxState), Agreement.id, NoCheckBoxState)
						end) else Roact.createElement(Checkbox, {
							label = "",
							Size = UDim2.new(1, 0, 1, 0),
							isChecked = CheckBoxState,
							onActivated = function()
								-- upvalues: CheckBoxState (copy), CheckBoxStates (copy), Agreement (copy), Callback (copy)
								local NoCheckBoxState = not CheckBoxState
								Callback(updateTable(CheckBoxStates, Agreement.id, NoCheckBoxState), Agreement.id, NoCheckBoxState)
							end
						})
					}),
					AgreementRow = Roact.createElement(UserAgreementsListItemModule, {
						hideLink = true,
						checkBoxPresent = true,
						LayoutOrder = LayoutOrder,
						Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else UDim2.new(1, Negated, 0, ListItemHeight),
						minHeight = if GetFFlagVngTOSRevisedEnabledFunction() then ListItemHeight else nil,
						widthOffset = if GetFFlagVngTOSRevisedEnabledFunction() then Negated else nil,
						agreement = Agreement,
						agreementTitleKey = p2.props.agreementTitleKeys and p2.props.agreementTitleKeys[Agreement.agreementType],
						agreementTypeExists = Entry,
						margin = FitFrame.Rect.quad(0, HorizontalPadding, 0, CheckboxLabelGap),
						useMutedText = p2.props.useMutedCheckboxText,
						useExternalLinkArrow = p2.props.useExternalLinkArrowForAgreementRows
					})
				})
			end
		end
	end
	return Frames
end

function getTableCount(List): number
	local Count = 0
	
	for _ in pairs(List) do
		Count += 1
	end
	return Count
end

function setLayoutOrder(List, p4: number)
	assert(type(p4) == "number", "Expected 'start' to be a number")
	local Count = 0
	local List1 = {}
	
	for _, value in pairs(List) do
		for prop in pairs(value.props) do
			if prop == "LayoutOrder" then
				Count += 1
				value.props.LayoutOrder = p4 + Count
				table.insert(List1, value)
			end
		end
	end
	return List1
end

local function setLayoutOrderPreservingExistingOrder(OPTIONALListItemsWithCheckBoxes, NewTableCount)
	local List = {}
	
	for _, oPTIONALListItemsWithCheckBox in pairs(OPTIONALListItemsWithCheckBoxes) do
		if oPTIONALListItemsWithCheckBox.props and oPTIONALListItemsWithCheckBox.props.LayoutOrder ~= nil then
			table.insert(List, oPTIONALListItemsWithCheckBox)
		end
	end
	table.sort(List, function(A, B): boolean
		return A.props.LayoutOrder < B.props.LayoutOrder
	end)
	
	for i, value in ipairs(List) do
		value.props.LayoutOrder = NewTableCount + i
	end
	return OPTIONALListItemsWithCheckBoxes
end

function UserAgreementsList.getListItems(p5, _)
	-- upvalues: UserAgreementUtilsModule (copy), AgreementItemsOrderFixEnabled (copy), Roact (copy), UserAgreementsListItemModule (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), FitFrame (copy)
	local Margin = p5.props.margin
	local List = {}
	local List1 = {}
	
	for _, agreement in ipairs(p5.props.agreements) do
		if UserAgreementUtilsModule.CheckAgreementTypeExists(agreement.agreementType) then
			table.insert(List, agreement)
		else
			table.insert(List1, agreement)
		end
	end
	local list = { List, List1 }
	local list1 = { true, false }
	local LayoutOrder = 0
	local Elements = {}
	
	for i, value in ipairs(list) do
		for _, Agreement in ipairs(value) do
			local Entry = list1[i]
			LayoutOrder += 1
			
			if AgreementItemsOrderFixEnabled then
				table.insert(Elements, (Roact.createElement(UserAgreementsListItemModule, {
					LayoutOrder = LayoutOrder,
					Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else UDim2.new(1, 0, 0, 55),
					minHeight = if GetFFlagVngTOSRevisedEnabledFunction() then 55 else nil,
					agreement = Agreement,
					agreementTypeExists = Entry,
					margin = FitFrame.Rect.quad(0, Margin.right, 0, Margin.left),
					useChevronArrow = p5.props.useChevronArrow,
					useBoldTitle = p5.props.useBoldTitle
				})))
			else
				Elements["Item." .. Agreement.id] = Roact.createElement(UserAgreementsListItemModule, {
					LayoutOrder = LayoutOrder,
					Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else UDim2.new(1, 0, 0, 55),
					minHeight = if GetFFlagVngTOSRevisedEnabledFunction() then 55 else nil,
					agreement = Agreement,
					agreementTypeExists = Entry,
					margin = FitFrame.Rect.quad(0, Margin.right, 0, Margin.left),
					useChevronArrow = p5.props.useChevronArrow,
					useBoldTitle = p5.props.useBoldTitle
				})
			end
		end
	end
	return Elements
end

function UserAgreementsList.checkBoxPropsExist(p6): boolean
	return p6.props.checkBoxStates ~= nil and (p6.props.setCheckBoxStates ~= nil and p6.props.isAgreeAllChecked ~= nil)
end

function UserAgreementsList.shouldReturnScrollableFrame(p6)
	-- upvalues: FFlagEnableModularizedUserAgreementsList (copy)
	local UseScrollableFrame = p6.props.useScrollableFrame or false
	
	return FFlagEnableModularizedUserAgreementsList and UseScrollableFrame
end

function UserAgreementsList.render(p6)
	-- upvalues: WithStyleFunction (copy), Roact (copy), FitFrame (copy), setLayoutOrderPreservingExistingOrder (copy), WithLocalizationFunction (copy), Text (copy), NormalizeFontFaceFunction (copy)
	return WithStyleFunction(function(p7)
		-- upvalues: p6 (copy), Roact (upval), FitFrame (upval), setLayoutOrderPreservingExistingOrder (upval), WithLocalizationFunction (upval), Text (upval), NormalizeFontFaceFunction (upval)
		local Theme = p7.Theme
		local LayoutOrder = p6.props.LayoutOrder
		local Margin = p6.props.margin
		local ListItems = p6:getListItems(Theme)
		
		if not p6:shouldReturnScrollableFrame() then
			return Roact.createElement(FitFrame.FitFrameVertical, {
				BackgroundTransparency = 1,
				LayoutOrder = LayoutOrder,
				width = UDim.new(1, 0),
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Right,
				VerticalAlignment = Enum.VerticalAlignment.Center,
				margin = FitFrame.Rect.quad(Margin.top, 0, Margin.bottom, 0)
			}, ListItems)
		end
		local SeparateRequiredOptional = p6.props.separateRequiredOptional or false
		local VerticalSpaceOffset = p6.props.verticalSpaceOffset or 0
		local Tokens = p7.Tokens
		local config = {
			required = "CommonUI.UserAgreements.Popup.Agreement.Required",
			optional = "CommonUI.UserAgreements.Popup.Agreement.Optional"
		}
		local SetLayoutOrderPreservingExistingOrderResult = {}
		local SetLayoutOrderPreservingExistingOrderResult1 = {}
		local REQUIREDListItemsWithCheckBoxes = nil
		
		if p6:checkBoxPropsExist() then
			REQUIREDListItemsWithCheckBoxes = p6:getListItemsWithCheckBoxes(Theme, 0, "REQUIRED", Tokens, p6.props.checkBoxStates, p6.props.setCheckBoxStates)
			SetLayoutOrderPreservingExistingOrderResult1 = p6:getListItemsWithCheckBoxes(Theme, getTableCount(ListItems), "OPTIONAL", Tokens, p6.props.checkBoxStates, p6.props.setCheckBoxStates)
		else
			REQUIREDListItemsWithCheckBoxes = p6:getListItems(Theme)
		end
		if p6.props.agreementTypeOrder then
			SetLayoutOrderPreservingExistingOrderResult = setLayoutOrderPreservingExistingOrder(REQUIREDListItemsWithCheckBoxes, 1)
			SetLayoutOrderPreservingExistingOrderResult1 = setLayoutOrderPreservingExistingOrder(SetLayoutOrderPreservingExistingOrderResult1, getTableCount(ListItems) + 4)
		else
			SetLayoutOrderPreservingExistingOrderResult = setLayoutOrder(REQUIREDListItemsWithCheckBoxes, 1)
			SetLayoutOrderPreservingExistingOrderResult1 = setLayoutOrder(SetLayoutOrderPreservingExistingOrderResult1, getTableCount(ListItems) + 4)
		end
		local DisableInnerScrolling = p6.props.disableInnerScrolling or false
		local Frame: string = if DisableInnerScrolling then "Frame" else "ScrollingFrame"
		local config1 = {
			BackgroundTransparency = 1,
			BorderSizePixel = 0,
			LayoutOrder = LayoutOrder,
			Size = if DisableInnerScrolling then UDim2.new(1, 0, 0, 0) else UDim2.new(1, 0, 1, -VerticalSpaceOffset),
			AutomaticSize = if DisableInnerScrolling then Enum.AutomaticSize.Y else nil,
			ScrollingEnabled = not DisableInnerScrolling or nil,
			CanvasSize = if DisableInnerScrolling then nil else UDim2.new(1, 0, 1, 0),
			ScrollingDirection = if DisableInnerScrolling then nil else Enum.ScrollingDirection.Y,
			ScrollBarThickness = if DisableInnerScrolling then nil else 2
		}
		
		return WithLocalizationFunction(config)(function(p8)
			-- upvalues: Roact (upval), Frame (copy), config1 (copy), SeparateRequiredOptional (copy), p6 (upval), Tokens (copy), DisableInnerScrolling (copy), Text (upval), p7 (copy), NormalizeFontFaceFunction (upval), SetLayoutOrderPreservingExistingOrderResult (ref), ListItems (copy), SetLayoutOrderPreservingExistingOrderResult1 (ref)
			return Roact.createElement(Frame, config1, {
				UIListLayout = Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				RequiredTitleText = SeparateRequiredOptional and Roact.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, p6.props.horizontalPadding or Tokens.Size.Size_600),
						PaddingTop = UDim.new(0, if DisableInnerScrolling then 0 else Tokens.Size.Size_200),
						PaddingBottom = UDim.new(0, if p6.props.listItemHeight then Tokens.Size.Size_300 else Tokens.Size.Size_200)
					}),
					TextLabel = if p6.props.useLabelMediumSectionTitles then Roact.createElement(Text, {
						tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
						Text = p8.required
					}) else Roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p8.required,
						TextSize = Tokens.FontSize.FontSize_400,
						TextColor3 = Tokens.Color.Content.Emphasis.Color3,
						TextTransparency = p7.Theme.TextDefault.Transparency,
						FontFace = NormalizeFontFaceFunction(Tokens.Typography.HeadingSmall.Font),
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					})
				}),
				ItemsRequired = Roact.createFragment(SetLayoutOrderPreservingExistingOrderResult),
				RequiredSectionEnd = if p6.props.requiredSectionEndRef then Roact.createElement("Frame", {
					LayoutOrder = getTableCount(ListItems) + 1,
					Size = UDim2.new(1, 0, 0, 0),
					BackgroundTransparency = 1,
					BorderSizePixel = 0,
					[Roact.Ref] = p6.props.requiredSectionEndRef
				}) else nil,
				OptionalTitleText = SeparateRequiredOptional and Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = getTableCount(ListItems) + 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, p6.props.horizontalPadding or Tokens.Size.Size_600),
						PaddingTop = UDim.new(0, if p6.props.listItemHeight then Tokens.Size.Size_500 else Tokens.Size.Size_200),
						PaddingBottom = UDim.new(0, if p6.props.listItemHeight then Tokens.Size.Size_300 else Tokens.Size.Size_200)
					}),
					TextLabel = if p6.props.useLabelMediumSectionTitles then Roact.createElement(Text, {
						tag = "size-full-0 auto-y text-title-medium text-wrap text-align-x-left content-emphasis",
						Text = p8.optional
					}) else Roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p8.optional,
						TextSize = Tokens.FontSize.FontSize_400,
						TextColor3 = Tokens.Color.Content.Emphasis.Color3,
						TextTransparency = p7.Theme.TextDefault.Transparency,
						FontFace = NormalizeFontFaceFunction(Tokens.Typography.HeadingSmall.Font),
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					})
				}),
				OptionalItems = SeparateRequiredOptional and Roact.createFragment(SetLayoutOrderPreservingExistingOrderResult1)
			})
		end)
	end)
end

return UserAgreementsList