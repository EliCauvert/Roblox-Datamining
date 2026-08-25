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
local var6 = game:DefineFastInt("AvatarSwitcherGridOnEndReachedThreshold", 200) / 100
local var7 = if require(parent.AvatarExperienceFlags).FFlagAvatarSwitcherUiFixes then game:DefineFastInt("AvatarSwitcherTileSize", 98) else 108

return function(p0)
	-- upvalues: useTokens (ref), reactModule (ref), outfitsRowModule (ref), var7 (ref), foundationModule (ref), flatList (ref), avatarSwitcherGridWindowSize (ref), avatarSwitcherGridInitialNumToRender (ref), var6 (ref)
	local var8 = useTokens()
	local var9, var10 = reactModule.useState(3)
	reactModule.useEffect(function()
		-- upvalues: p0 (ref)
		task.spawn(function()
			-- upvalues: p0 (copy)
			p0.fetchNextOutfitsPage()
		end)
	end, {})
	
	return reactModule.createElement(foundationModule.View, {
		tag = "size-full-full",
		onAbsoluteSizeChanged = reactModule.useCallback(function(p1)
			-- upvalues: var10 (ref), var7 (copy)
			var10(math.max(3, math.floor(p1.AbsoluteSize.X / var7)))
		end, {}),
		padding = {
			left = UDim.new(0, -var8.Padding.XXSmall),
			right = UDim.new(0, -var8.Padding.XXSmall)
		}
	}, {
		ClipFrame = reactModule.createElement(foundationModule.View, {
			tag = "size-full-full clip",
			padding = {
				top = UDim.new(0, var8.Padding.XXSmall),
				left = UDim.new(0, var8.Padding.XXSmall),
				right = UDim.new(0, var8.Padding.XXSmall)
			}
		}, {
			OutfitsList = reactModule.createElement(flatList, {
				renderItem = reactModule.useCallback(function(p2)
					-- upvalues: reactModule (copy), outfitsRowModule (copy), var9 (ref), p0 (ref)
					return reactModule.createElement(outfitsRowModule, {
						outfits = p2.item,
						desiredItemsCount = var9,
						rowNumber = p2.index,
						disabled = p0.disabled
					})
				end, { var9 }),
				data = reactModule.useMemo(function()
					-- upvalues: p0 (ref), var9 (ref)
					local t = {}
					
					for i = 1, #p0.outfits, var9 do
						table.insert(t, { unpack(p0.outfits, i, i + var9 - 1) })
					end
					return t
				end, { p0.outfits, var9 }),
				onEndReached = p0.fetchNextOutfitsPage,
				windowSize = avatarSwitcherGridWindowSize,
				initialNumToRender = avatarSwitcherGridInitialNumToRender,
				onEndReachedThreshold = var6,
				contentContainerStyle = { BackgroundTransparency = 1 },
				style = {
					BackgroundTransparency = 1,
					ScrollBarThickness = 0,
					ClipsDescendants = false
				},
				ListFooterComponent = not p0.lastPageReached and reactModule.createElement(foundationModule.View, { tag = "size-0-full position-top-center padding-small" }, { reactModule.createElement(foundationModule.Loading) })
			})
		})
	})
end