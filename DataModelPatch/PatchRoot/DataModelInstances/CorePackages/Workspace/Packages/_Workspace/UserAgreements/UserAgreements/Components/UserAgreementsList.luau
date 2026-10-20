local Parent = script.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local UserAgreementUtilsModule = require(Parent.UserAgreementUtils)
local Roact = DependenciesModule.Roact
local Checkbox = DependenciesModule.Foundation.Checkbox
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
		regulationType = T.string
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
	useScrollableFrame = T.optional(T.boolean)
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

function UserAgreementsList.getListItemsWithCheckBoxes(p1, _, LayoutOrder: number, p2, Tokens, CheckBoxStates, Callback)
	-- upvalues: UserAgreementUtilsModule (copy), Roact (copy), Checkbox (copy), UserAgreementsListItemModule (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), FitFrame (copy)
	local List = {}
	local List1 = {}
	
	for _, agreement in pairs(p1.props.agreements) do
		if UserAgreementUtilsModule.CheckAgreementTypeExists(agreement.agreementType) then
			table.insert(List, agreement)
		else
			table.insert(List1, agreement)
		end
	end
	local list = { true, false }
	local Frames = {}
	
	for i, value in ipairs({ List, List1 }) do
		for _, Agreement in pairs(value) do
			local Entry = list[i]
			local CheckBoxState = CheckBoxStates[Agreement.id]
			
			if shouldCreateRowsForAgreementType(Agreement, p2) then
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
						Size = UDim2.new(0, Tokens.Size.Size_1200, 1, 0)
					}, {
						Padding = Roact.createElement("UIPadding", {
							PaddingLeft = UDim.new(0, Tokens.Size.Size_600),
							PaddingTop = UDim.new(0, Tokens.Size.Size_300)
						}),
						Checkbox = Roact.createElement(Checkbox, {
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
						Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else UDim2.new(1, 0, 0, 55),
						minHeight = if GetFFlagVngTOSRevisedEnabledFunction() then 55 else nil,
						agreement = Agreement,
						agreementTypeExists = Entry,
						margin = FitFrame.Rect.quad(0, Tokens.Size.Size_600, 0, Tokens.Size.Size_400)
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

function setLayoutOrder(List, p3: number)
	assert(type(p3) == "number", "Expected 'start' to be a number")
	local Count = 0
	local List1 = {}
	
	for _, value in pairs(List) do
		for i, _ in pairs(value.props) do
			if i == "LayoutOrder" then
				Count += 1
				value.props.LayoutOrder = p3 + Count
				table.insert(List1, value)
			end
		end
	end
	return List1
end

function UserAgreementsList.getListItems(p4, _)
	-- upvalues: UserAgreementUtilsModule (copy), AgreementItemsOrderFixEnabled (copy), Roact (copy), UserAgreementsListItemModule (copy), GetFFlagVngTOSRevisedEnabledFunction (copy), FitFrame (copy)
	local Margin = p4.props.margin
	local List = {}
	local List1 = {}
	
	for _, agreement in ipairs(p4.props.agreements) do
		if UserAgreementUtilsModule.CheckAgreementTypeExists(agreement.agreementType) then
			table.insert(List, agreement)
		else
			table.insert(List1, agreement)
		end
	end
	local list = { true, false }
	local LayoutOrder = 0
	local Elements = {}
	
	for i, value in ipairs({ List, List1 }) do
		for _, Agreement in ipairs(value) do
			local Entry = list[i]
			LayoutOrder += 1
			
			if AgreementItemsOrderFixEnabled then
				table.insert(Elements, (Roact.createElement(UserAgreementsListItemModule, {
					LayoutOrder = LayoutOrder,
					Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else UDim2.new(1, 0, 0, 55),
					minHeight = if GetFFlagVngTOSRevisedEnabledFunction() then 55 else nil,
					agreement = Agreement,
					agreementTypeExists = Entry,
					margin = FitFrame.Rect.quad(0, Margin.right, 0, Margin.left)
				})))
			else
				Elements["Item." .. Agreement.id] = Roact.createElement(UserAgreementsListItemModule, {
					LayoutOrder = LayoutOrder,
					Size = if GetFFlagVngTOSRevisedEnabledFunction() then nil else UDim2.new(1, 0, 0, 55),
					minHeight = if GetFFlagVngTOSRevisedEnabledFunction() then 55 else nil,
					agreement = Agreement,
					agreementTypeExists = Entry,
					margin = FitFrame.Rect.quad(0, Margin.right, 0, Margin.left)
				})
			end
		end
	end
	return Elements
end

function UserAgreementsList.checkBoxPropsExist(p5): boolean
	return p5.props.checkBoxStates ~= nil and (p5.props.setCheckBoxStates ~= nil and p5.props.isAgreeAllChecked ~= nil)
end

function UserAgreementsList.shouldReturnScrollableFrame(p5)
	-- upvalues: FFlagEnableModularizedUserAgreementsList (copy)
	local UseScrollableFrame = p5.props.useScrollableFrame or false
	
	return FFlagEnableModularizedUserAgreementsList and UseScrollableFrame
end

function UserAgreementsList.render(p5)
	-- upvalues: WithStyleFunction (copy), Roact (copy), FitFrame (copy), WithLocalizationFunction (copy)
	return WithStyleFunction(function(p6)
		-- upvalues: p5 (copy), Roact (upval), FitFrame (upval), WithLocalizationFunction (upval)
		local Theme = p6.Theme
		local _Font = p6.Font
		local LayoutOrder = p5.props.LayoutOrder
		local Margin = p5.props.margin
		local ListItems = p5:getListItems(Theme)
		
		if not p5:shouldReturnScrollableFrame() then
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
		local SeparateRequiredOptional = p5.props.separateRequiredOptional or false
		local VerticalSpaceOffset = p5.props.verticalSpaceOffset or 0
		local Tokens = p6.Tokens
		local config = {
			required = "CommonUI.UserAgreements.Popup.Agreement.Required",
			optional = "CommonUI.UserAgreements.Popup.Agreement.Optional"
		}
		local SetLayoutOrderResult = {}
		local SetLayoutOrderResult1 = {}
		local REQUIREDListItemsWithCheckBoxes = nil
		
		if p5:checkBoxPropsExist() then
			REQUIREDListItemsWithCheckBoxes = p5:getListItemsWithCheckBoxes(Theme, 0, "REQUIRED", Tokens, p5.props.checkBoxStates, p5.props.setCheckBoxStates)
			SetLayoutOrderResult1 = p5:getListItemsWithCheckBoxes(Theme, getTableCount(ListItems), "OPTIONAL", Tokens, p5.props.checkBoxStates, p5.props.setCheckBoxStates)
		else
			REQUIREDListItemsWithCheckBoxes = p5:getListItems(Theme)
		end
		SetLayoutOrderResult = setLayoutOrder(REQUIREDListItemsWithCheckBoxes, 1)
		SetLayoutOrderResult1 = setLayoutOrder(SetLayoutOrderResult1, getTableCount(ListItems) + 4)
		
		return WithLocalizationFunction(config)(function(p7)
			-- upvalues: Roact (upval), LayoutOrder (copy), VerticalSpaceOffset (copy), SeparateRequiredOptional (copy), Tokens (copy), p6 (copy), _Font (copy), SetLayoutOrderResult (ref), ListItems (copy), SetLayoutOrderResult1 (ref)
			return Roact.createElement("ScrollingFrame", {
				BackgroundTransparency = 1,
				ScrollingEnabled = true,
				BorderSizePixel = 0,
				ScrollBarThickness = 2,
				LayoutOrder = LayoutOrder,
				Size = UDim2.new(1, 0, 1, -VerticalSpaceOffset),
				CanvasSize = UDim2.new(1, 0, 1, 0),
				ScrollingDirection = Enum.ScrollingDirection.Y
			}, {
				UIListLayout = Roact.createElement("UIListLayout", { SortOrder = Enum.SortOrder.LayoutOrder }),
				RequiredTitleText = SeparateRequiredOptional and Roact.createElement("Frame", {
					LayoutOrder = 0,
					BackgroundTransparency = 1,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, Tokens.Size.Size_600),
						PaddingTop = UDim.new(0, Tokens.Size.Size_200),
						PaddingBottom = UDim.new(0, Tokens.Size.Size_200)
					}),
					TextLabel = Roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p7.required,
						TextSize = Tokens.FontSize.FontSize_400,
						TextColor3 = Tokens.Color.Content.Emphasis.Color3,
						TextTransparency = p6.Theme.TextDefault.Transparency,
						Font = _Font.Header1.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					})
				}),
				ItemsRequired = Roact.createFragment(SetLayoutOrderResult),
				OptionalTitleText = SeparateRequiredOptional and Roact.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = getTableCount(ListItems) + 2,
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y
				}, {
					Padding = Roact.createElement("UIPadding", {
						PaddingLeft = UDim.new(0, Tokens.Size.Size_600),
						PaddingTop = UDim.new(0, Tokens.Size.Size_200),
						PaddingBottom = UDim.new(0, Tokens.Size.Size_200)
					}),
					TextLabel = Roact.createElement("TextLabel", {
						BackgroundTransparency = 1,
						TextWrapped = true,
						Text = p7.optional,
						TextSize = Tokens.FontSize.FontSize_400,
						TextColor3 = Tokens.Color.Content.Emphasis.Color3,
						TextTransparency = p6.Theme.TextDefault.Transparency,
						Font = _Font.Header1.Font,
						TextXAlignment = Enum.TextXAlignment.Left,
						AutomaticSize = Enum.AutomaticSize.Y,
						Size = UDim2.new(1, 0, 0, 0)
					})
				}),
				OptionalItems = SeparateRequiredOptional and Roact.createFragment(SetLayoutOrderResult1)
			})
		end)
	end)
end

return UserAgreementsList