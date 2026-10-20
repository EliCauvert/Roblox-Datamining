local Parent = script.Parent.Parent.Parent
local DependenciesModule = require(Parent.dependencies)
local React = DependenciesModule.React
local UseLocalizationFunction = DependenciesModule.Hooks.useLocalization
local TextKeysModule = require(Parent.Common.TextKeys)
local AnalyticsModule = require(Parent.Analytics)
local EventNames = AnalyticsModule.EventNames
local BtnValues = AnalyticsModule.BtnValues
local CarouselGenericSquareTile = DependenciesModule.SocialCommon.Components.CarouselGenericSquareTile
local UIBlox = DependenciesModule.UIBlox
local Images = UIBlox.App.ImageSet.Images
local IconSize = UIBlox.App.Constant.IconSize
local IconsGraphicFindfriendsLarge = Images["icons/graphic/findfriends_large"]
local IconsNavigationPushRight = Images["icons/navigation/pushRight"]

return function(Frame: Frame)
	-- upvalues: UseLocalizationFunction (copy), TextKeysModule (copy), EventNames (copy), BtnValues (copy), React (copy), CarouselGenericSquareTile (copy), IconsGraphicFindfriendsLarge (copy), IconsNavigationPushRight (copy), IconSize (copy)
	local UseLocalizationResult = UseLocalizationFunction({
		findFriendsLabel = TextKeysModule.FindFriendsLabel,
		seeAllLabel = TextKeysModule.SeeAllLabel,
		newTextBadge = TextKeysModule.NewText
	})
	
	local function _(Btn, p1)
		-- upvalues: Frame (copy), EventNames (upval)
		return function()
			-- upvalues: Frame (upval), EventNames (upval), Btn (copy), p1 (copy)
			Frame.fireAnalyticsEvent(EventNames.CarouselGenericTileClicked, { btn = Btn })
			Frame.goToAddFriendsPage(p1)
		end
	end
	
	if Frame.id == BtnValues.FindFriends.rawValue() then
		local RawValueResult = BtnValues.FindFriends.rawValue()
		local v1 = true
		
		return React.createElement(CarouselGenericSquareTile, {
			borderThickness = 1,
			badgeValue = if Frame.shouldShowContactImporterBadge then UseLocalizationResult.newTextBadge else nil,
			icon = IconsGraphicFindfriendsLarge,
			labelText = UseLocalizationResult.findFriendsLabel,
			onActivated = function()
				-- upvalues: Frame (copy), EventNames (upval), RawValueResult (copy), v1 (copy)
				Frame.fireAnalyticsEvent(EventNames.CarouselGenericTileClicked, { btn = RawValueResult })
				Frame.goToAddFriendsPage(v1)
			end,
			tileSize = Frame.tileWidth,
			LayoutOrder = Frame.LayoutOrder
		})
	elseif Frame.id == BtnValues.SeeAll.rawValue() then
		local CreateElementFunction = React.createElement
		local Medium = IconSize.Medium
		local SeeAllLabel = UseLocalizationResult.seeAllLabel
		local RawValueResult1, RawValueResult2 = BtnValues.SeeAll.rawValue()
		
		return CreateElementFunction(CarouselGenericSquareTile, {
			icon = IconsNavigationPushRight,
			iconSize = Medium,
			labelText = SeeAllLabel,
			onActivated = function()
				-- upvalues: Frame (copy), EventNames (upval), RawValueResult1 (copy), RawValueResult2 (copy)
				Frame.fireAnalyticsEvent(EventNames.CarouselGenericTileClicked, { btn = RawValueResult1 })
				Frame.goToAddFriendsPage(RawValueResult2)
			end,
			tileSize = Frame.tileWidth,
			LayoutOrder = Frame.LayoutOrder
		})
	else
		return nil
	end
end