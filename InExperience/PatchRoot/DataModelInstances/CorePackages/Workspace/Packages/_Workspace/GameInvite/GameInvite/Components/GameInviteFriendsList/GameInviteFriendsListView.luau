local GameInvite = script:FindFirstAncestor("GameInvite")
local Parent = GameInvite.Parent
local ReactModule = require(Parent.React)
local ReactRobloxModule = require(Parent.ReactRoblox)
local FoundationModule = require(Parent.Foundation)
local FFlagGameInviteInExpJoinCtaModule = require(GameInvite.Flags.FFlagGameInviteInExpJoinCta)
local _ = require(script.Parent.useGameInviteJoinCard)
local VerticalUserList = require(Parent.UserList).VerticalUserList.VerticalUserList
local FriendsMenuShareGameInviteLink = require(Parent.FriendsMenu).FriendsMenuShareGameInviteLink
local Configs = { disableRowActivation = true }

local function GameInviteJoinCardPortal(p1)
	-- upvalues: FoundationModule (copy), ReactRobloxModule (copy), ReactModule (copy)
	local UseOverlayResult = FoundationModule.Hooks.useOverlay()
	local JoinCard = p1.joinCard
	local CardComponent = JoinCard.cardComponent
	
	return if UseOverlayResult == nil or CardComponent == nil then nil else ReactRobloxModule.createPortal({
		GameInviteJoinCard = ReactModule.createElement(CardComponent, {
			userId = JoinCard.userId,
			onJoin = JoinCard.join,
			onClose = JoinCard.close
		})
	}, UseOverlayResult)
end

return function(p1)
	-- upvalues: ReactModule (copy), FoundationModule (copy), FriendsMenuShareGameInviteLink (copy), VerticalUserList (copy), Configs (copy), FFlagGameInviteInExpJoinCtaModule (copy), GameInviteJoinCardPortal (copy)
	return ReactModule.createElement(FoundationModule.View, {
		tag = "col",
		testId = "GameInviteFriendsListView",
		Size = p1.size,
		LayoutOrder = p1.layoutOrder
	}, {
		ShareGameInviteLink = if p1.showShareGameInviteLink then ReactModule.createElement(FriendsMenuShareGameInviteLink, { layoutOrder = 1 }) else nil,
		Rows = ReactModule.createElement(FoundationModule.View, {
			tag = "col fill size-full-0 padding-x-xxlarge",
			testId = "GameInviteFriendsListRows",
			LayoutOrder = 2
		}, {
			List = ReactModule.createElement(VerticalUserList, {
				isScrollEnabled = true,
				entities = p1.entities,
				renderRow = p1.renderRow,
				onRowSelected = p1.onRowSelected,
				configs = Configs,
				ctaConfig = if FFlagGameInviteInExpJoinCtaModule then p1.ctaConfig else nil
			})
		}),
		JoinCard = if FFlagGameInviteInExpJoinCtaModule and p1.joinCard and p1.joinCard.userId then ReactModule.createElement(GameInviteJoinCardPortal, { joinCard = p1.joinCard }) else nil
	})
end