local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local _ = require(AppChat.types)
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local UseCallbackFunction = ReactModule.useCallback
local UseStyleFunction = require(Parent.UIBlox).Core.Style.useStyle
local BidirectionalFlatList = require(Parent.VirtualizedList).BidirectionalFlatList
local PendingShimmerBubbleModule = require(script.Parent.PendingShimmerBubble)
local config = {
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

return ReactModule.memo(function(p1) --[[ Line: 113 | Named "PendingStateIndicator" ]]
	-- upvalues: CryoModule (copy), config (copy), UseStyleFunction (copy), UseCallbackFunction (copy), ReactModule (copy), PendingShimmerBubbleModule (copy), BidirectionalFlatList (copy)
	local JoinResult = CryoModule.Dictionary.join(config, p1)
	local UseStyleResult = UseStyleFunction()
	local Style = JoinResult.style or UseStyleResult
	
	return ReactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = Style.Theme.BackgroundDefault.Color,
		Size = JoinResult.size,
		Transparency = Style.Tokens.Color.None.Transparency,
		LayoutOrder = JoinResult.layoutOrder
	}, {
		ShimmerMessageList = ReactModule.createElement(BidirectionalFlatList, {
			inverted = true,
			optimizeInvertedCanvasResize = true,
			data = JoinResult.itemList,
			renderItem = UseCallbackFunction(function(p2) --[[ Line: 119 ]]
				-- upvalues: JoinResult (copy), ReactModule (upval), PendingShimmerBubbleModule (upval), CryoModule (upval)
				return ReactModule.createElement(PendingShimmerBubbleModule, CryoModule.Dictionary.join(p2.item, {
					backgroundTransparency = JoinResult.maxTransparency - (JoinResult.maxTransparency - JoinResult.minTransparency) * (p2.index - 1) / math.max(1, #JoinResult.itemList)
				}))
			end, { #JoinResult.itemList }),
			style = {
				BackgroundTransparency = 1,
				ScrollBarThickness = 0,
				Name = "ShimmerMessageList"
			},
			contentContainerStyle = { BackgroundTransparency = 1 },
			keyExtractor = function(_, p2) --[[ Line: 154 ]]
				return p2
			end
		})
	})
end)