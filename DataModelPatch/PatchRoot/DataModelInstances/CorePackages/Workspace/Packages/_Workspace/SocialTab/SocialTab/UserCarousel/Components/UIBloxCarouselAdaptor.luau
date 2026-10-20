local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local MemoizeFunction = DependenciesModule.memoize
local FreeFlowCarousel = DependenciesModule.UIBlox.App.Container.Carousel.FreeFlowCarousel
local AddFriendHintModule = require(script.Parent.AddFriendHint)
local UIBloxCarouselAdaptor = Roact.PureComponent:extend("UIBloxCarouselAdaptor")
UIBloxCarouselAdaptor.defaultProps = {
	friendThumbnailSize = 96,
	LayoutOrder = 0,
	wideMode = false,
	tileHeight = 96,
	friends = {}
}
UIBloxCarouselAdaptor.validateProps = T.interface({
	createUserEntry = T.callback,
	friends = T.array(require(SocialTab.User).validateUser),
	friendThumbnailSize = T.optional(T.number),
	LayoutOrder = T.optional(T.number),
	onFriendSelected = T.optional(T.callback),
	wideMode = T.optional(T.boolean)
})

function UIBloxCarouselAdaptor.init(p1)
	-- upvalues: Roact (copy), AddFriendHintModule (copy), MemoizeFunction (copy)
	function p1.identifier(p2)
		return p2.absolutePosition
	end
	
	function p1.createUserEntry(p2)
		-- upvalues: Roact (upval), AddFriendHintModule (upval), p1 (copy)
		return if p2.absolutePosition == 2 and p2.addFriendHint then Roact.createElement(AddFriendHintModule, {
			layoutOrder = 2,
			maxHintHeight = p1.props.friendThumbnailSize
		}) elseif p2.absolutePosition > 0 and p2.isPlaceHolder == true then Roact.createElement("Frame", {
			BackgroundTransparency = 1,
			Size = UDim2.new(0, p1.props.friendThumbnailSize, 1, 0)
		}) else p1.props.createUserEntry(p2)
	end
	
	p1.formatFriends = MemoizeFunction(function(List)
		local List1 = {}
		table.insert(List1, { absolutePosition = 1 })
		
		if #List == 0 then
			table.insert(List1, { absolutePosition = 2, addFriendHint = true })
		end
		for i, User in ipairs(List) do
			table.insert(List1, {
				layoutOrder = i + 1,
				absolutePosition = i + 1,
				user = User
			})
		end
		return List1
	end)
end

function UIBloxCarouselAdaptor.render(p2)
	-- upvalues: Roact (copy), FreeFlowCarousel (copy)
	local XOffset: number = if p2.props.wideMode then 48 else 24
	
	return Roact.createElement("Frame", {
		BackgroundTransparency = 1,
		LayoutOrder = p2.props.LayoutOrder,
		Size = UDim2.new(1, XOffset, 0, p2.props.tileHeight + 18)
	}, {
		Padding = Roact.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, -XOffset),
			PaddingTop = UDim.new(0, -38)
		}),
		CarouselContent = Roact.createElement(FreeFlowCarousel, {
			identifier = p2.identifier,
			itemList = p2.formatFriends(p2.props.friends),
			renderItem = p2.createUserEntry,
			itemSize = Vector2.new(p2.props.friendThumbnailSize, p2.props.tileHeight + 18),
			carouselMargin = XOffset
		})
	})
end

return UIBloxCarouselAdaptor