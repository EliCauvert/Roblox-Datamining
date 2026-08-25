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

local function renderSkeletonRow(p0, p1, p2, p3)
	-- upvalues: reactModule (ref), view (ref), skeleton (ref), radius (ref)
	local size900 = p1.Size.Size_900
	
	return reactModule.createElement(view, {
		testId = "ConversationMessageSkeletonRow",
		LayoutOrder = p3,
		tag = {
			["row align-y-bottom gap-small size-full-0 auto-y"] = true,
			["align-x-left"] = p0.isIncoming,
			["align-x-right"] = not p0.isIncoming
		},
		padding = {
			left = UDim.new(0, p2.left),
			right = UDim.new(0, p2.right),
			bottom = UDim.new(0, if p0.addBottomPadding then p1.Size.Size_600 else p1.Size.Size_100),
			top = if p0.addTopPadding then UDim.new(0, p1.Size.Size_600) else nil
		}
	}, {
		Avatar = if p0.isIncoming and p0.showAvatarCircle then reactModule.createElement(skeleton, {
			LayoutOrder = 1,
			radius = radius.Circle,
			Size = UDim2.fromOffset(size900, size900)
		}) else nil,
		Bubble = reactModule.createElement(skeleton, {
			LayoutOrder = 2,
			radius = radius.Medium,
			Size = UDim2.new(p0.widthPercentage, 0, 0, p0.heightFactor * p1.Size.Size_500 + p1.Size.Size_400)
		})
	})
end

return memo(function(p4)
	-- upvalues: cryoModule (ref), t (ref), useTokens (ref), useChatPagePaddingModule (ref), list (ref), renderSkeletonRow (ref), reactModule (ref), view (ref)
	local var8 = cryoModule.Dictionary.union(t, p4)
	local var9 = useTokens()
	local var10 = useChatPagePaddingModule()
	local t_1 = {}
	
	for i, v in var8.itemList or list do
		t_1["SkeletonRow" .. i] = renderSkeletonRow(v, var9, var10, i)
	end
	return reactModule.createElement(view, {
		testId = "ConversationMessageSkeletonList",
		tag = "size-full clip",
		Size = var8.size,
		LayoutOrder = var8.layoutOrder,
		layout = {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder,
			VerticalAlignment = Enum.VerticalAlignment.Bottom
		}
	}, t_1)
end)