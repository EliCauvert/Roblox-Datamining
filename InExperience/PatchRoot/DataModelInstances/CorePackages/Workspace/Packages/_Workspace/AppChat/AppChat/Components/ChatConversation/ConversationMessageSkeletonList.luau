local appChat = script:FindFirstAncestor("AppChat")
local parent = appChat.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local memo = reactModule.memo
local foundationModule = require(parent.Foundation)
local view = foundationModule.View
local skeleton = foundationModule.Skeleton
local radius = foundationModule.Enums.Radius
local useTokens = foundationModule.Hooks.useTokens
local useChatPagePaddingModule = require(appChat.Contexts.ChatPagePadding.useChatPagePadding)
local list = {
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
local t = { size = UDim2.fromScale(1, 1), itemList = list }

local function renderSkeletonRow(p1, p2, p3, p4)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local size900 = p2.Size.Size_900
	
	return reactModule.createElement(view, {
		testId = "ConversationMessageSkeletonRow",
		LayoutOrder = p4,
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
		Avatar = if p1.isIncoming and p1.showAvatarCircle then reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			radius = radius.Circle,
			Size = UDim2.fromOffset(size900, size900)
		}) else nil,
		Bubble = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.new(p1.widthPercentage, 0, 0, p1.heightFactor * p2.Size.Size_500 + p2.Size.Size_400)
		})
	})
end

return memo(function(p1)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useChatPagePaddingModule (ref), list (ref), renderSkeletonRow (ref), reactModule (ref), view (ref)
	local var1 = cryoModule.Dictionary.union(t, p1)
	local var2 = useTokens()
	local var3 = useChatPagePaddingModule()
	local t_1 = {}
	
	for i, v in var1.itemList or list do
		t_1["SkeletonRow" .. i] = renderSkeletonRow(v, var2, var3, i)
	end
	return reactModule.createElement(view, {
		testId = "ConversationMessageSkeletonList",
		tag = "size-full clip",
		Size = var1.size,
		LayoutOrder = var1.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}
	}, t_1)
end)