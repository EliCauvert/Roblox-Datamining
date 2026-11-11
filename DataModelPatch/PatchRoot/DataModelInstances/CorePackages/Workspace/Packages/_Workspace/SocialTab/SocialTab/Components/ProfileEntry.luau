local SocialTab = script:FindFirstAncestor("SocialTab")
local DependenciesModule = require(SocialTab.dependencies)
local Llama = DependenciesModule.llama
local Roact = DependenciesModule.Roact
local T = DependenciesModule.t
local UIBlox = DependenciesModule.UIBlox
local VerifiedBadges = DependenciesModule.VerifiedBadges
local Foundation = DependenciesModule.Foundation
local Icon = Foundation.Icon
local IconName = Foundation.Enums.IconName
local IconSize = Foundation.Enums.IconSize
local UseTokensFunction = Foundation.Hooks.useTokens
local SharedFlagsModule = require(SocialTab.Parent.SharedFlags)
local FFlagEnableBlackbirdCheck = SharedFlagsModule.FFlagEnableBlackbirdCheck
local FFlagHidePremiumIconography = SharedFlagsModule.FFlagHidePremiumIconography
local GetFFlagFixUserInfoWidgetPlusBadgeFunction = SharedFlagsModule.GetFFlagFixUserInfoWidgetPlusBadge
local StyledTextLabelModule = require(SocialTab.Components.StyledTextLabel)
local StyledImageSetLabelModule = require(SocialTab.Components.StyledImageSetLabel)
local EnumScreensModule = require(SocialTab.EnumScreens)
local InterfaceResult = T.interface({
	userText = T.string,
	avatarImage = T.optional(T.string),
	onActivated = T.optional(T.callback),
	isPremium = T.optional(T.boolean),
	isRobloxSubscriber = T.optional(T.boolean),
	navigateToLuaAppPages = T.optional(T.table),
	hasVerifiedBadge = T.optional(T.boolean)
})
local config = {
	userText = "",
	avatarImage = "",
	isPremium = false,
	isRobloxSubscriber = false,
	hasVerifiedBadge = false,
	onActivated = function() end
}

local function MembershipIcon(Frame)
	-- upvalues: UseTokensFunction (copy), Roact (copy), Icon (copy), IconName (copy), IconSize (copy)
	return Roact.createElement(Icon, {
		name = IconName.RobloxPlus,
		size = IconSize.Small,
		style = UseTokensFunction().Color.Content.Emphasis,
		LayoutOrder = Frame.LayoutOrder
	})
end

return function(p1)
	-- upvalues: Llama (copy), config (copy), InterfaceResult (copy), GetFFlagFixUserInfoWidgetPlusBadgeFunction (copy), FFlagEnableBlackbirdCheck (copy), FFlagHidePremiumIconography (copy), VerifiedBadges (copy), UIBlox (copy), Roact (copy), StyledImageSetLabelModule (copy), EnumScreensModule (copy), StyledTextLabelModule (copy), MembershipIcon (copy)
	local JoinResult = Llama.Dictionary.join(config, p1)
	assert(InterfaceResult(JoinResult))
	local FFlagFixUserInfoWidgetPlusBadge = GetFFlagFixUserInfoWidgetPlusBadgeFunction()
	local IsRobloxSubscriber = FFlagFixUserInfoWidgetPlusBadge and (FFlagEnableBlackbirdCheck and JoinResult.isRobloxSubscriber)
	local Inverted: boolean = JoinResult.isPremium and (not IsRobloxSubscriber and not (FFlagFixUserInfoWidgetPlusBadge and FFlagHidePremiumIconography))
	local Verified = nil
	Verified = if JoinResult.hasVerifiedBadge then VerifiedBadges.emoji.verified elseif Inverted then VerifiedBadges.emoji.premium else ""
	
	return UIBlox.Style.withStyle(function(p2)
		-- upvalues: Roact (upval), JoinResult (ref), StyledImageSetLabelModule (upval), VerifiedBadges (upval), Verified (ref), Inverted (copy), EnumScreensModule (upval), StyledTextLabelModule (upval), IsRobloxSubscriber (copy), MembershipIcon (upval)
		local Theme = p2.Theme
		
		return Roact.createElement("ImageButton", {
			BackgroundTransparency = 1,
			AutomaticSize = Enum.AutomaticSize.X,
			Size = UDim2.new(0, 0, 0, 36),
			[Roact.Event.Activated] = JoinResult.onActivated,
			LayoutOrder = JoinResult.layoutOrder
		}, {
			layout = Roact.createElement("UIListLayout", {
				Padding = UDim.new(0, 4),
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Horizontal,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			avatarImage = Roact.createElement(StyledImageSetLabelModule, {
				LayoutOrder = 1,
				Image = JoinResult.avatarImage,
				BackgroundStyle = p2.Theme.PlaceHolder,
				Size = UDim2.fromOffset(36, 36)
			}, {
				corner = Roact.createElement("UICorner", { CornerRadius = UDim.new(1, 0) })
			}),
			spacer = Roact.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.fromOffset(4, 0)
			}),
			userTextWrapper = Roact.createElement(VerifiedBadges.EmojiWrapper, {
				layoutOrder = 3,
				size = UDim2.fromScale(0, 0),
				emoji = Verified,
				color = if Inverted then Theme.TextEmphasis.Color else nil,
				onActivated = if Verified == VerifiedBadges.emoji.verified then function()
					-- upvalues: JoinResult (upval), EnumScreensModule (upval)
					JoinResult.navigateToLuaAppPages[EnumScreensModule.VerifiedBadgeModal]()
				end else nil
			}, {
				userText = Roact.createElement(StyledTextLabelModule, {
					TextStyle = Theme.TextEmphasis,
					FontStyle = p2.Font.Header1,
					TextXAlignment = Enum.TextXAlignment.Left,
					Text = JoinResult.userText,
					AutomaticSize = Enum.AutomaticSize.XY
				})
			}),
			MembershipIcon = if IsRobloxSubscriber then Roact.createElement(MembershipIcon, { LayoutOrder = 4 }) else nil
		})
	end)
end