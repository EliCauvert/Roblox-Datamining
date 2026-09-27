local parent = script:FindFirstAncestor("BuildExperience").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local libraryGridViewModule = require(script.Parent.LibraryGridView)
local _ = require(script.Parent.Parent.LibraryTypes)
local text = foundationModule.Text
local view = foundationModule.View

return function(p1)
	-- upvalues: reactModule (ref), view (ref), libraryGridViewModule (ref), text (ref)
	local _ = nil
	
	return reactModule.createElement(view, { tag = "col size-full", testId = "Library.CategoryPage" }, {
		Content = reactModule.createElement(view, { tag = "fill size-full-0" }, {
			Body = reactModule.createElement(view, { tag = "col size-full padding-x-medium" }, {
				Body = reactModule.createElement(view, { tag = "fill size-full-0" }, {
					Content = if p1.status == "Loading" or p1.status == "NotReady" then reactModule.createElement(view, { tag = "size-full", testId = "Library.Category.Skeleton" }, {
						Grid = reactModule.createElement(libraryGridViewModule, {
							hasMore = false,
							isLoading = true,
							items = {},
							onLoadMore = function() end
						})
					}) elseif #p1.items == 0 then reactModule.createElement(text, {
						tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
						Text = p1.strings.empty
					}) else reactModule.createElement(view, { tag = "col gap-medium size-full" }, {
						GridContainer = reactModule.createElement(view, { LayoutOrder = 1, tag = "fill size-full-0" }, {
							Grid = reactModule.createElement(libraryGridViewModule, {
								items = p1.items,
								hasMore = p1.hasMore,
								onLoadMore = p1.onLoadMore
							})
						})
					})
				})
			})
		})
	})
end