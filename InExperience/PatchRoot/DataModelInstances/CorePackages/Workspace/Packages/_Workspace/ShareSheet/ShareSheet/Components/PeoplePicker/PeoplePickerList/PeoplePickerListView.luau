local parent = script:FindFirstAncestor("ShareSheet").Parent
local foundationModule = require(parent.Foundation)
local reactModule = require(parent.React)
local userTileModule = require(parent.UserTile)
local skeleton = foundationModule.Skeleton
local text = foundationModule.Text
local view = foundationModule.View
local radius = foundationModule.Enums.Radius
local userTile = userTileModule.UserTile
local layoutMode = userTileModule.LayoutMode

return {
	Root = function(p1)
		-- upvalues: reactModule (ref), view (ref)
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = p1.LayoutOrder,
			testId = p1.testId or "people-picker-list"
		}, p1.children)
	end,
	Item = function(p1)
		-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref), userTile (ref), layoutMode (ref), text (ref)
		local testId = p1.testId or "people-picker-list-item"
		local var1 = p1.isLoading == true
		local leading = p1.leading
		
		return reactModule.createElement(view, {
			tag = "col size-full-0 auto-y",
			LayoutOrder = p1.LayoutOrder
		}, {
			Wrapper = reactModule.createElement(view, { tag = "size-full-0 auto-y padding-y-xsmall" }, {
				Row = reactModule.createElement(view, {
					tag = "row align-y-center gap-medium size-full-0 auto-y padding-y-small radius-medium",
					onActivated = if var1 then nil else p1.onActivated,
					selection = { Selectable = not var1 },
					testId = testId
				}, {
					Leading = reactModule.createElement(view, {
						tag = "size-1400-1400",
						LayoutOrder = 1,
						testId = if leading.secondUserId then `{testId}--avatar-pile` else `{testId}--avatar`
					}, {
						Tile = if var1 then reactModule.createElement(skeleton, {
							radius = radius.Circle,
							testId = `{testId}--avatar-skeleton`
						}) else reactModule.createElement(userTile, {
							userId = leading.userId,
							facePileSecondUserId = leading.secondUserId,
							layoutMode = layoutMode.compact,
							userPresenceType = leading.userPresence
						})
					}),
					Content = reactModule.createElement(view, {
						tag = "row align-y-center fill gap-medium auto-y",
						LayoutOrder = 2
					}, {
						TextContainer = reactModule.createElement(view, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
							Title = if var1 then reactModule.createElement(view, { tag = "size-full-500", LayoutOrder = 1 }, {
								Shimmer = reactModule.createElement(skeleton, {
									Size = UDim2.new(0.5, 0, 1, 0),
									radius = radius.Small,
									testId = `{testId}--title-skeleton`
								})
							}) else reactModule.createElement(text, {
								tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
								LayoutOrder = 1,
								Text = p1.title
							}),
							Description = if var1 then reactModule.createElement(view, { tag = "size-full-400", LayoutOrder = 2 }, {
								Shimmer = reactModule.createElement(skeleton, {
									Size = UDim2.new(0.3, 0, 1, 0),
									radius = radius.Small,
									testId = `{testId}--description-skeleton`
								})
							}) elseif p1.description ~= nil then nil else reactModule.createElement(text, {
								tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-split",
								LayoutOrder = 2,
								Text = p1.description
							})
						}),
						Trailing = if p1.trailing == nil or var1 then nil else reactModule.createElement(view, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 2
						}, p1.trailing)
					})
				})
			})
		})
	end
}