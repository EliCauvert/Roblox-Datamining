local Parent = script:FindFirstAncestor("BuildExperience").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local LibraryGridViewModule = require(script.Parent.LibraryGridView)
local _ = require(script.Parent.Parent.LibraryTypes)
local Text = FoundationModule.Text
local View = FoundationModule.View

return function(p1)
	-- upvalues: ReactModule (copy), View (copy), LibraryGridViewModule (copy), Text (copy)
	return ReactModule.createElement(View, { tag = "col size-full", testId = "Library.CategoryPage" }, {
		Content = ReactModule.createElement(View, { tag = "fill size-full-0" }, {
			Body = ReactModule.createElement(View, { tag = "col size-full padding-x-medium" }, {
				Body = ReactModule.createElement(View, { tag = "fill size-full-0" }, {
					Content = if p1.status == "Loading" or p1.status == "NotReady" then ReactModule.createElement(View, { tag = "size-full", testId = "Library.Category.Skeleton" }, {
						Grid = ReactModule.createElement(LibraryGridViewModule, {
							hasMore = false,
							isLoading = true,
							items = {},
							onLoadMore = function() end
						})
					}) elseif #p1.items == 0 then ReactModule.createElement(Text, {
						tag = "size-full-0 auto-y padding-large text-body-medium text-align-x-center content-muted",
						Text = p1.strings.empty
					}) else ReactModule.createElement(View, { tag = "col gap-medium size-full" }, {
						GridContainer = ReactModule.createElement(View, { LayoutOrder = 1, tag = "fill size-full-0" }, {
							Grid = ReactModule.createElement(LibraryGridViewModule, {
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