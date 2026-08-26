local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local _ = require(appChat.types)
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local useCallback = reactModule.useCallback
local useStyle = require(parent.UIBlox).Core.Style.useStyle
local bidirectionalFlatList = require(parent.VirtualizedList).BidirectionalFlatList
local pendingShimmerBubbleModule = require(script.Parent.PendingShimmerBubble)
local t = {
	minTransparency = 0.5,
	maxTransparency = 0.9,
	itemList = {
		{
			addBottomPadding = true,
			heightFactor = 1,
			isIncoming = true,
			showAvatarCircle = true,
			widthPercentage = 0.5
		},
		{
			addBottomPadding = false,
			heightFactor = 1,
			isIncoming = true,
			showAvatarCircle = false,
			widthPercentage = 0.2
		},
		{
			addBottomPadding = true,
			heightFactor = 1,
			isIncoming = false,
			showAvatarCircle = false,
			widthPercentage = 0.6
		},
		{
			addBottomPadding = true,
			heightFactor = 2,
			isIncoming = true,
			showAvatarCircle = true,
			widthPercentage = 0.75
		},
		{
			addBottomPadding = true,
			heightFactor = 2,
			isIncoming = false,
			showAvatarCircle = false,
			widthPercentage = 0.75
		},
		{
			addBottomPadding = false,
			heightFactor = 1,
			isIncoming = false,
			showAvatarCircle = false,
			widthPercentage = 0.75
		},
		{
			addBottomPadding = false,
			heightFactor = 1,
			isIncoming = false,
			showAvatarCircle = false,
			widthPercentage = 0.2
		},
		{
			addBottomPadding = true,
			heightFactor = 2,
			isIncoming = true,
			showAvatarCircle = true,
			widthPercentage = 0.7
		},
		{
			addBottomPadding = false,
			heightFactor = 1,
			isIncoming = true,
			showAvatarCircle = false,
			widthPercentage = 0.5
		},
		{
			addTopPadding = true,
			addBottomPadding = false,
			heightFactor = 1,
			isIncoming = true,
			showAvatarCircle = false,
			widthPercentage = 0.2
		}
	},
	size = UDim2.new(1, 0, 1, 0)
}

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useStyle (ref), useCallback (ref), reactModule (ref), pendingShimmerBubbleModule (ref), bidirectionalFlatList (ref)
	local var1 = cryoModule.Dictionary.join(t, p1)
	local style = var1.style or useStyle()
	
	return reactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = style.Theme.BackgroundDefault.Color,
		Size = var1.size,
		Transparency = style.Tokens.Color.None.Transparency,
		LayoutOrder = var1.layoutOrder
	}, {
		ShimmerMessageList = reactModule.createElement(bidirectionalFlatList, {
			inverted = true,
			optimizeInvertedCanvasResize = true,
			data = var1.itemList,
			renderItem = useCallback(function(p2)
				-- upvalues: var1 (ref), reactModule (copy), pendingShimmerBubbleModule (copy), cryoModule (copy)
				return reactModule.createElement(pendingShimmerBubbleModule, cryoModule.Dictionary.join(p2.item, {
					backgroundTransparency = var1.maxTransparency - (var1.maxTransparency - var1.minTransparency) * (p2.index - 1) / math.max(1, #var1.itemList)
				}))
			end, { #var1.itemList }),
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Name = "ShimmerMessageList"
			},
			contentContainerStyle = { BackgroundTransparency = 1 },
			keyExtractor = function(_, p2)
				return p2
			end
		})
	})
end)