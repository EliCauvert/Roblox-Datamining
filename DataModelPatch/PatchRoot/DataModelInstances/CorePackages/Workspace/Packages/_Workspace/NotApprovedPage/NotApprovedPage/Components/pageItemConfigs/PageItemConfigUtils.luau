local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local _ = require(NotApprovedPage.Common.Types)
local ReactModule = require(Parent.React)
local View = require(Parent.Foundation).View

return {
	renderPageItemsFromList = function(List, ModerationDetail, Dispatch, p1, HasEducationalPages, Enabled, p2, p3)
		-- upvalues: ReactModule (copy), View (copy)
		local Elements = {}
		
		for LayoutOrder, value in ipairs(List) do
			if value.getIsVisible(ModerationDetail, p1, p2, p3) then
				local Element = ReactModule.createElement(value.renderComponent, {
					moderationDetail = ModerationDetail,
					layoutOrder = LayoutOrder,
					dispatch = Dispatch,
					hasEducationalPages = HasEducationalPages
				})
				
				if Enabled == false then
					table.insert(Elements, ReactModule.createElement(View, {
						tag = "size-full-0 auto-y padding-bottom-large",
						LayoutOrder = LayoutOrder
					}, { Content = Element }))
				else
					table.insert(Elements, Element)
				end
			end
		end
		return Elements
	end,
	EDUCATIONAL_PAGE_PREFIXES = { Rule = "policy-rule-", Importance = "policy-importance-" },
	STATIC_PAGE_NAMES = {
		Intro = "intro",
		Resolution = "resolution",
		SecondChanceIntro = "second-chance-intro",
		SecondChanceConclusion = "second-chance-conclusion",
		Unknown = "unknown"
	}
}