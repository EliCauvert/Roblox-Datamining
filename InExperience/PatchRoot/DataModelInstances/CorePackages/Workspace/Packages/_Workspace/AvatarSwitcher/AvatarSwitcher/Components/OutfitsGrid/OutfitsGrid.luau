local avatarSwitcher = script:FindFirstAncestor("AvatarSwitcher")
local parent = avatarSwitcher.Parent
local reactModule = require(parent.React)
local foundationModule = require(parent.Foundation)
local useTokens = foundationModule.Hooks.useTokens
local flatList = require(parent.VirtualizedList).FlatList
local outfitsRowModule = require(avatarSwitcher.Components.OutfitsRow)
local _ = require(avatarSwitcher.types)
local avatarSwitcherGridWindowSize = game:DefineFastInt("AvatarSwitcherGridWindowSize", 10)
local avatarSwitcherGridInitialNumToRender = game:DefineFastInt("AvatarSwitcherGridInitialNumToRender", 10)
local var1 = game:DefineFastInt("AvatarSwitcherGridOnEndReachedThreshold", 200) / 100
local var2 = if require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes then game:DefineFastInt("AvatarSwitcherTileSize", 98) else 108

return function(p1)
	-- upvalues: useTokens (ref), reactModule (ref), outfitsRowModule (ref), var2 (ref), foundationModule (ref), flatList (ref), avatarSwitcherGridWindowSize (ref), avatarSwitcherGridInitialNumToRender (ref), var1 (ref)
	local var3 = useTokens()
	local var4, var5 = reactModule.useState(3)
	reactModule.useEffect(function()
		-- upvalues: p1 (ref)
		task.spawn(function()
			-- upvalues: p1 (copy)
			p1.fetchNextOutfitsPage()
		end)
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-full",
		onAbsoluteSizeChanged = reactModule.useCallback(function(p2)
			-- upvalues: var5 (ref), var2 (copy)
			var5(math.max(3, math.floor(p2.AbsoluteSize.X / var2)))
		end, {}),
		padding = {
			left = UDim.new(0, -var3.Padding.XXSmall),
			right = UDim.new(0, -var3.Padding.XXSmall)
		}
	}, {
		ClipFrame = reactModule.createElement(foundationModule.View, {
			tag = "size-full-full clip",
			padding = {
				top = UDim.new(0, var3.Padding.XXSmall),
				left = UDim.new(0, var3.Padding.XXSmall),
				right = UDim.new(0, var3.Padding.XXSmall)
			}
		}, {
			OutfitsList = reactModule.createElement(flatList, {
				renderItem = reactModule.useCallback(function(p2)
					-- upvalues: reactModule (copy), outfitsRowModule (copy), var4 (ref), p1 (ref)
					return reactModule.createElement(outfitsRowModule, {
						outfits = p2.item,
						desiredItemsCount = var4,
						rowNumber = p2.index,
						disabled = p1.disabled
					})
				end, { var4 }),
				data = reactModule.useMemo(function()
					-- upvalues: p1 (ref), var4 (ref)
					local t = {}
					
					for i = 1, #p1.outfits, var4 do
						table.insert(t, { unpack(p1.outfits, i, i + var4 - 1) })
					end
					return t
				end, { p1.outfits, var4 }),
				onEndReached = p1.fetchNextOutfitsPage,
				windowSize = avatarSwitcherGridWindowSize,
				initialNumToRender = avatarSwitcherGridInitialNumToRender,
				onEndReachedThreshold = var1,
				contentContainerStyle = { BackgroundTransparency = 1 },
				style = {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					ClipsDescendants = false
				},
				ListFooterComponent = not p1.lastPageReached and reactModule.createElement(foundationModule.View, { tag = "size-0-full position-top-center padding-small" }, { reactModule.createElement(foundationModule.Loading) })
			})
		})
	})
end