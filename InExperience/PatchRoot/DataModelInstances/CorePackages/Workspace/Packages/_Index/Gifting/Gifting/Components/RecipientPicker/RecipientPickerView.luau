local Parent = script:FindFirstAncestor("Gifting").Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local GiftSheetLayoutViewModule = require(script.Parent.Parent.GiftSheetLayout.GiftSheetLayoutView)
local GiftStateViewModule = require(script.Parent.Parent.GiftState.GiftStateView)
local RecipientRowViewModule = require(script.Parent.RecipientRowView)
local InputSize = FoundationModule.Enums.InputSize
local SearchInputShape = FoundationModule.Enums.SearchInputShape
local SnapPoints = { 0.93 }

return ReactModule.memo(function(p1) --[[ Line: 43 | Named "RecipientPickerView" ]]
	-- upvalues: ReactModule (copy), RecipientRowViewModule (copy), FoundationModule (copy), InputSize (copy), SearchInputShape (copy), GiftStateViewModule (copy), GiftSheetLayoutViewModule (copy), SnapPoints (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 44 ]]
		-- upvalues: p1 (copy), ReactModule (upval), RecipientRowViewModule (upval)
		local Elements = {}
		
		for LayoutOrder, row in p1.rows do
			Elements[`Recipient_{row.userId}`] = ReactModule.createElement(RecipientRowViewModule, {
				userId = row.userId,
				displayName = row.displayName,
				username = row.username,
				isAvailable = row.isAvailable,
				unavailableLabel = p1.unavailableLabel,
				avatarBackgroundStyle = p1.avatarBackgroundStyle,
				onActivated = function() --[[ Line: 54 ]]
					-- upvalues: p1 (upval), row (copy)
					p1.onRecipientSelected(row.userId)
				end,
				LayoutOrder = LayoutOrder
			})
		end
		return Elements
	end, {
		p1.rows,
		p1.avatarBackgroundStyle,
		p1.onRecipientSelected,
		p1.unavailableLabel
	})
	
	return ReactModule.createElement(GiftSheetLayoutViewModule, {
		centerSheetHeight = 1,
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		content = ReactModule.createElement(FoundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
			Search = if p1.isSearchVisible then ReactModule.createElement(FoundationModule.SearchInput, {
				testId = "recipient-picker-search",
				LayoutOrder = 1,
				text = p1.searchText,
				placeholder = p1.searchPlaceholder,
				onChanged = p1.onSearchChanged,
				size = InputSize.Medium,
				shape = SearchInputShape.Pill,
				width = UDim.new(1, 0)
			}) else nil,
			SectionTitle = if p1.state then nil else ReactModule.createElement(FoundationModule.Text, {
				tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
				testId = "recipient-picker-section-title",
				LayoutOrder = 2,
				Text = p1.sectionTitle
			}),
			Body = ReactModule.createElement(FoundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 3 }, {
				State = if p1.state then ReactModule.createElement(GiftStateViewModule, p1.state) else nil,
				RecipientList = if p1.state then nil else ReactModule.createElement(FoundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, UseMemoResult)
			})
		}),
		snapPoints = SnapPoints,
		onClose = p1.onClose
	})
end)