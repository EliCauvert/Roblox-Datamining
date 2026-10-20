local AppChat = script:FindFirstAncestor("AppChat")
local Parent = AppChat.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local View = FoundationModule.View
local Skeleton = FoundationModule.Skeleton
local Radius = FoundationModule.Enums.Radius
local UseTokensFunction = FoundationModule.Hooks.useTokens
local UseChatPagePaddingModule = require(AppChat.Contexts.ChatPagePadding.useChatPagePadding)
local ItemList = {
	{
		heightFactor = 1,
		isIncoming = true,
		showAvatarCircle = true,
		widthPercentage = 0.5,
		addBottomPadding = true
	},
	{
		heightFactor = 1,
		isIncoming = true,
		showAvatarCircle = false,
		widthPercentage = 0.2
	},
	{
		heightFactor = 1,
		isIncoming = false,
		showAvatarCircle = false,
		widthPercentage = 0.6,
		addBottomPadding = true
	},
	{
		heightFactor = 2,
		isIncoming = true,
		showAvatarCircle = true,
		widthPercentage = 0.75,
		addBottomPadding = true
	},
	{
		heightFactor = 2,
		isIncoming = false,
		showAvatarCircle = false,
		widthPercentage = 0.75,
		addBottomPadding = true
	},
	{
		heightFactor = 1,
		isIncoming = false,
		showAvatarCircle = false,
		widthPercentage = 0.4
	},
	{
		heightFactor = 1,
		isIncoming = true,
		showAvatarCircle = true,
		widthPercentage = 0.7,
		addBottomPadding = true
	},
	{
		heightFactor = 1,
		isIncoming = true,
		showAvatarCircle = false,
		widthPercentage = 0.5
	}
}
local config = { size = UDim2.fromScale(1, 1), itemList = ItemList }

local function renderSkeletonRow(p1, p2, p3, LayoutOrder)
	-- upvalues: ReactModule (copy), View (copy), Skeleton (copy), Radius (copy)
	local Size900 = p2.Size.Size_900
	
	return ReactModule.createElement(View, {
		testId = "ConversationMessageSkeletonRow",
		LayoutOrder = LayoutOrder,
		tag = {
			["row align-y-bottom gap-small size-full-0 auto-y"] = true,
			["align-x-left"] = p1.isIncoming,
			["align-x-right"] = not p1.isIncoming
		},
		padding = {
			left = UDim.new(0, p3.left),
			right = UDim.new(0, p3.right),
			bottom = UDim.new(0, if p1.addBottomPadding then p2.Size.Size_600 else p2.Size.Size_100),
			top = if p1.addTopPadding then UDim.new(0, p2.Size.Size_600) else nil
		}
	}, {
		Avatar = if p1.isIncoming and p1.showAvatarCircle then ReactModule.createElement(Skeleton, {
			LayoutOrder = 1,
			radius = Radius.Circle,
			Size = UDim2.fromOffset(Size900, Size900)
		}) else nil,
		Bubble = ReactModule.createElement(Skeleton, {
			LayoutOrder = 2,
			radius = Radius.Medium,
			Size = UDim2.new(p1.widthPercentage, 0, 0, p1.heightFactor * p2.Size.Size_500 + p2.Size.Size_400)
		})
	})
end

return ReactModule.memo(function(p1)
	-- upvalues: CryoModule (copy), config (copy), UseTokensFunction (copy), UseChatPagePaddingModule (copy), ItemList (copy), renderSkeletonRow (copy), ReactModule (copy), View (copy)
	local UnionResult = CryoModule.Dictionary.union(config, p1)
	local UseTokensResult = UseTokensFunction()
	local UseChatPagePaddingModuleResult = UseChatPagePaddingModule()
	local t = {}
	
	for i, value in UnionResult.itemList or ItemList do
		t["SkeletonRow" .. i] = renderSkeletonRow(value, UseTokensResult, UseChatPagePaddingModuleResult, i)
	end
	return ReactModule.createElement(View, {
		testId = "ConversationMessageSkeletonList",
		tag = "size-full clip",
		Size = UnionResult.size,
		LayoutOrder = UnionResult.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}
	}, t)
end)