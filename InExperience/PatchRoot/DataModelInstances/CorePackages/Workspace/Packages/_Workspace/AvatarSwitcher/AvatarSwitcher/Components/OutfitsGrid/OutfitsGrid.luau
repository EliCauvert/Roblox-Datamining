local AvatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local Parent = AvatarSwitcher.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local UseTokensFunction = FoundationModule.Hooks.useTokens
local FlatList = require(Parent.VirtualizedList).FlatList
local OutfitsRowModule = require(AvatarSwitcher.Components.OutfitsRow)
local _ = require(AvatarSwitcher.types)
local AvatarSwitcherGridWindowSize = game:DefineFastInt("AvatarSwitcherGridWindowSize", 10)
local AvatarSwitcherGridInitialNumToRender = game:DefineFastInt("AvatarSwitcherGridInitialNumToRender", 10)
local AvatarSwitcherGridOnEndReachedThresholdRatio = game:DefineFastInt("AvatarSwitcherGridOnEndReachedThreshold", 200) / 100
local AvatarSwitcherTileSize = if require(Parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes then game:DefineFastInt("AvatarSwitcherTileSize", 98) else 108

return function(p1) --[[ Line: 35 | Named "OutfitsGrid" ]]
	-- upvalues: UseTokensFunction (copy), ReactModule (copy), OutfitsRowModule (copy), AvatarSwitcherTileSize (copy), FoundationModule (copy), FlatList (copy), AvatarSwitcherGridWindowSize (copy), AvatarSwitcherGridInitialNumToRender (copy), AvatarSwitcherGridOnEndReachedThresholdRatio (copy)
	local UseTokensResult = UseTokensFunction()
	local UseStateResult, UseStateResult2 = ReactModule.useState(3)
	ReactModule.useEffect(function() --[[ Line: 40 ]]
		-- upvalues: p1 (copy)
		task.spawn(function() --[[ Line: 41 ]]
			-- upvalues: p1 (upval)
			p1.fetchNextOutfitsPage()
		end)
	end, {})
	
	return (ReactModule.createElement(FoundationModule.View, {
		tag = "size-full-full",
		onAbsoluteSizeChanged = ReactModule.useCallback(function(Frame) --[[ Line: 64 ]]
			-- upvalues: UseStateResult2 (copy), AvatarSwitcherTileSize (upval)
			UseStateResult2((math.max(3, (math.floor(Frame.AbsoluteSize.X / AvatarSwitcherTileSize)))))
		end, {}),
		padding = {
			left = UDim.new(0, -UseTokensResult.Padding.XXSmall),
			right = UDim.new(0, -UseTokensResult.Padding.XXSmall)
		}
	}, {
		ClipFrame = ReactModule.createElement(FoundationModule.View, {
			tag = "size-full-full clip",
			padding = {
				top = UDim.new(0, UseTokensResult.Padding.XXSmall),
				left = UDim.new(0, UseTokensResult.Padding.XXSmall),
				right = UDim.new(0, UseTokensResult.Padding.XXSmall)
			}
		}, {
			OutfitsList = ReactModule.createElement(FlatList, {
				renderItem = ReactModule.useCallback(function(p2) --[[ Line: 55 ]]
					-- upvalues: ReactModule (upval), OutfitsRowModule (upval), UseStateResult (copy), p1 (copy)
					return ReactModule.createElement(OutfitsRowModule, {
						outfits = p2.item,
						desiredItemsCount = UseStateResult,
						rowNumber = p2.index,
						disabled = p1.disabled
					})
				end, { UseStateResult }),
				data = ReactModule.useMemo(function() --[[ Line: 46 ]]
					-- upvalues: p1 (copy), UseStateResult (copy)
					local List = {}
					
					for i = 1, #p1.outfits, UseStateResult do
						table.insert(List, { unpack(p1.outfits, i, i + UseStateResult - 1) })
					end
					return List
				end, { p1.outfits, UseStateResult }),
				onEndReached = p1.fetchNextOutfitsPage,
				windowSize = AvatarSwitcherGridWindowSize,
				initialNumToRender = AvatarSwitcherGridInitialNumToRender,
				onEndReachedThreshold = AvatarSwitcherGridOnEndReachedThresholdRatio,
				contentContainerStyle = { BackgroundTransparency = 1 },
				style = {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					ClipsDescendants = false
				},
				ListFooterComponent = not p1.lastPageReached and ReactModule.createElement(FoundationModule.View, { tag = "size-0-full position-top-center padding-small" }, { ReactModule.createElement(FoundationModule.Loading) })
			})
		})
	}))
end