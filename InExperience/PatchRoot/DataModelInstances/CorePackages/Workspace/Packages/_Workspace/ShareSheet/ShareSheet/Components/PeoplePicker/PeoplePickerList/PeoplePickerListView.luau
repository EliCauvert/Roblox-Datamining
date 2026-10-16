local Parent = script:FindFirstAncestor("ShareSheet").Parent
local FoundationModule = require(Parent.Foundation)
local ReactModule = require(Parent.React)
local UserTileModule = require(Parent.UserTile)
local Skeleton = FoundationModule.Skeleton
local Text = FoundationModule.Text
local View = FoundationModule.View
local Radius = FoundationModule.Enums.Radius
local UserTile = UserTileModule.UserTile
local LayoutMode = UserTileModule.LayoutMode
local UseTokensFunction = FoundationModule.Hooks.useTokens

return {
	getItemLayoutMetrics = function(p1) --[[ Line: 30 ]]
		local Size1400 = p1.Size.Size_1400
		local Small: number = p1.Padding.Small
		local XSmall: number = p1.Padding.XSmall
		
		return {
			avatarSize = Size1400,
			rowVerticalPadding = Small,
			wrapperVerticalPadding = XSmall,
			estimatedRowHeight = Size1400 + 2 * Small + 2 * XSmall
		}
	end,
	Item = function(p1) --[[ Line: 61 ]]
		-- upvalues: UseTokensFunction (copy), ReactModule (copy), View (copy), Skeleton (copy), Radius (copy), UserTile (copy), LayoutMode (copy), Text (copy)
		local UseTokensResult = UseTokensFunction()
		local Size1400 = UseTokensResult.Size.Size_1400
		local Small: number = UseTokensResult.Padding.Small
		local XSmall: number = UseTokensResult.Padding.XSmall
		local config = {
			avatarSize = Size1400,
			rowVerticalPadding = Small,
			wrapperVerticalPadding = XSmall,
			estimatedRowHeight = Size1400 + 2 * Small + 2 * XSmall
		}
		local TestId = p1.testId or "people-picker-list-item"
		local IsIsLoading = p1.isLoading == true
		local Leading = p1.leading
		
		return ReactModule.createElement(View, { tag = "col size-full-0 auto-y" }, {
			Wrapper = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y",
				padding = {
					top = UDim.new(0, config.wrapperVerticalPadding),
					bottom = UDim.new(0, config.wrapperVerticalPadding)
				}
			}, {
				Row = ReactModule.createElement(View, {
					tag = "row align-y-center gap-medium size-full-0 auto-y radius-medium",
					padding = {
						top = UDim.new(0, config.rowVerticalPadding),
						bottom = UDim.new(0, config.rowVerticalPadding)
					},
					onActivated = if IsIsLoading then nil else p1.onActivated,
					selection = { Selectable = not IsIsLoading },
					testId = TestId
				}, {
					Leading = ReactModule.createElement(View, {
						LayoutOrder = 1,
						Size = UDim2.fromOffset(config.avatarSize, config.avatarSize),
						testId = if Leading.secondUserId then `{TestId}--avatar-pile` else `{TestId}--avatar`
					}, {
						Tile = if IsIsLoading then ReactModule.createElement(Skeleton, {
							radius = Radius.Circle,
							testId = `{TestId}--avatar-skeleton`
						}) else ReactModule.createElement(UserTile, {
							userId = Leading.userId,
							facePileSecondUserId = Leading.secondUserId,
							layoutMode = LayoutMode.compact,
							userPresenceType = Leading.userPresence
						})
					}),
					Content = ReactModule.createElement(View, {
						tag = "row align-y-center fill gap-medium auto-y",
						LayoutOrder = 2
					}, {
						TextContainer = ReactModule.createElement(View, { tag = "col fill gap-xsmall auto-y", LayoutOrder = 1 }, {
							Title = if IsIsLoading then ReactModule.createElement(View, { tag = "size-full-500", LayoutOrder = 1 }, {
								Shimmer = ReactModule.createElement(Skeleton, {
									Size = UDim2.new(0.5, 0, 1, 0),
									radius = Radius.Small,
									testId = `{TestId}--title-skeleton`
								})
							}) else ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-title-large text-wrap text-align-x-left content-emphasis",
								LayoutOrder = 1,
								Text = p1.title
							}),
							Description = if IsIsLoading then ReactModule.createElement(View, { tag = "size-full-400", LayoutOrder = 2 }, {
								Shimmer = ReactModule.createElement(Skeleton, {
									Size = UDim2.new(0.3, 0, 1, 0),
									radius = Radius.Small,
									testId = `{TestId}--description-skeleton`
								})
							}) elseif p1.description == nil then nil else ReactModule.createElement(Text, {
								tag = "size-full-0 auto-y text-body-medium text-align-x-left text-truncate-split",
								LayoutOrder = 2,
								Text = p1.description
							})
						}),
						Trailing = if p1.trailing == nil or IsIsLoading then nil else ReactModule.createElement(View, {
							tag = "align-x-center align-y-center auto-xy",
							LayoutOrder = 2
						}, p1.trailing)
					})
				})
			})
		})
	end
}