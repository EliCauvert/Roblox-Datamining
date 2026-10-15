local parent = script:FindFirstAncestor("Gifting").Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local giftSheetLayoutViewModule = require(script.Parent.Parent.GiftSheetLayout.GiftSheetLayoutView)
local giftStateViewModule = require(script.Parent.Parent.GiftState.GiftStateView)
local recipientRowViewModule = require(script.Parent.RecipientRowView)
local inputSize = foundationModule.Enums.InputSize
local searchInputShape = foundationModule.Enums.SearchInputShape
local list = { 0.93 }

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), recipientRowViewModule (ref), foundationModule (ref), inputSize (ref), searchInputShape (ref), giftStateViewModule (ref), giftSheetLayoutViewModule (ref), list (ref)
	return reactModule.createElement(giftSheetLayoutViewModule, {
		centerSheetHeight = 1,
		isOpen = p1.isOpen,
		titleText = p1.titleText,
		content = reactModule.createElement(foundationModule.View, { tag = "col gap-medium size-full-0 auto-y" }, {
			Search = if p1.isSearchVisible then reactModule.createElement(foundationModule.SearchInput, {
				testId = "recipient-picker-search",
				LayoutOrder = 1,
				text = p1.searchText,
				placeholder = p1.searchPlaceholder,
				onChanged = p1.onSearchChanged,
				size = inputSize.Medium,
				shape = searchInputShape.Pill,
				width = UDim.new(1, 0)
			}) else nil,
			SectionTitle = if not p1.state then reactModule.createElement(foundationModule.Text, {
				tag = "size-full-0 auto-y text-title-medium text-align-x-left content-emphasis",
				testId = "recipient-picker-section-title",
				LayoutOrder = 2,
				Text = p1.sectionTitle
			}) else nil,
			Body = reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 3 }, {
				State = if p1.state then reactModule.createElement(giftStateViewModule, p1.state) else nil,
				RecipientList = if not p1.state then reactModule.createElement(foundationModule.View, { tag = "col size-full-0 auto-y", LayoutOrder = 1 }, reactModule.useMemo(function()
					-- upvalues: p1 (ref), reactModule (copy), recipientRowViewModule (copy)
					local t = {}
					
					for i, v in p1.rows do
						t[`Recipient_{v.userId}`] = reactModule.createElement(recipientRowViewModule, {
							userId = v.userId,
							displayName = v.displayName,
							username = v.username,
							isAvailable = v.isAvailable,
							unavailableLabel = p1.unavailableLabel,
							avatarBackgroundStyle = p1.avatarBackgroundStyle,
							onActivated = function()
								-- upvalues: p1 (copy), v (ref)
								p1.onRecipientSelected(v.userId)
							end,
							LayoutOrder = i
						})
					end
					return t
				end, {
					p1.rows,
					p1.avatarBackgroundStyle,
					p1.onRecipientSelected,
					p1.unavailableLabel
				})) else nil
			})
		}),
		snapPoints = list,
		onClose = p1.onClose
	})
end)