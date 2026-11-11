local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local WithStyleFunction = UIBloxModule.Style.withStyle
local Images = UIBloxModule.App.ImageSet.Images
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local OpenCentralOverlayForGameDetailsPlayWithFriendsModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForGameDetailsPlayWithFriends)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local _UDim2 = UDim2.new(0, 44, 0, 44)
local _UDim2_1 = UDim2.new(0, 37, 0, 37)
local _Rect = Rect.new(8, 8, 9, 9)
local GameDetailsPlayWithFriendsButton = RoactModule.PureComponent:extend("GameDetailsPlayWithFriendsButton")
GameDetailsPlayWithFriendsButton.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	leftPadding = TModule.number,
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	screenWidth = TModule.number,
	isLoading = TModule.boolean,
	isDisabled = TModule.boolean,
	openContextualMenu = TModule.callback
})

function GameDetailsPlayWithFriendsButton.getMoreMenuPosition(p1): UDim2
	local ScreenWidth: number = p1.props.screenWidth
	local LeftPadding: number = p1.props.leftPadding
	local Current = p1.moreButtonRef.current
	
	if Current == nil then
		return UDim2.new(0, 0, 0, 0)
	else
		local NewX = Current.AbsolutePosition.X + Current.AbsoluteSize.X / 2
		local ScreenWidthRatio = (ScreenWidth - 300) / 2
		
		return UDim2.new(0, if ScreenWidth < 600 then 0 elseif NewX < LeftPadding + 150 then LeftPadding - ScreenWidthRatio else NewX - 150 - ScreenWidthRatio, 0, Current.AbsolutePosition.Y - 15)
	end
end

function GameDetailsPlayWithFriendsButton.init(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	p1.moreButtonRef = RoactModule.createRef()
	local OpenContextualMenuFunction = p1.props.openContextualMenu
	
	function p1.onActivated()
		-- upvalues: p1 (copy), OpenContextualMenuFunction (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
		local UniverseId = p1.props.universeId
		
		if not p1.props.isDisabled then
			OpenContextualMenuFunction(UniverseId, p1:getMoreMenuPosition(), if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil)
			
			return
		end
	end
end

function GameDetailsPlayWithFriendsButton.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

function GameDetailsPlayWithFriendsButton.renderWithStyle(p1, p2)
	-- upvalues: RoactModule (copy), ImageSetButton (copy), _UDim2 (copy), Images (copy), _Rect (copy), ImageSetLabel (copy), _UDim2_1 (copy)
	local Theme = p2.Theme
	local IsDisabled = p1.props.isDisabled
	
	return RoactModule.createElement(ImageSetButton, {
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = _UDim2,
		Image = Images["component_assets/circle_17"],
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		ImageTransparency = if p1.props.isLoading or IsDisabled then 0.5 else Theme.BackgroundDefault.Transparency,
		ImageColor3 = Theme.BackgroundDefault.Color,
		LayoutOrder = 1,
		ClipsDescendants = false,
		[RoactModule.Event.Activated] = p1.onActivated,
		[RoactModule.Ref] = p1.moreButtonRef
	}, {
		Icon = RoactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = _UDim2_1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = Images["icons/actions/friends/friendsplaying"],
			ImageTransparency = Theme.IconEmphasis.Transparency,
			ImageColor3 = Theme.IconEmphasis.Color
		})
	})
end

local function _(Fetching): boolean
	-- upvalues: RetrievalStatus (copy)
	return Fetching == RetrievalStatus.NotStarted or Fetching == RetrievalStatus.Fetching
end

local _ = function(Failed, GameDetailMore, p1): boolean
	-- upvalues: RetrievalStatus (copy), CentralOverlayType (copy)
	return Failed == RetrievalStatus.Failed and not p1 or (GameDetailMore == CentralOverlayType.GameDetailMore or GameDetailMore == CentralOverlayType.GameDetailsPlayWithFriends)
end

return RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameDetails (copy), GameInfosReducer (copy), RetrievalStatus (copy), CentralOverlayType (copy)
	local FetchingStatus = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p2.shouldHydrateLegacyIxp then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p1, p2.universeId) else ApiFetchGameDetails.GetFetchingStatus(p1, p2.universeId)
	local OverlayType = p1.CentralOverlay.OverlayType
	local PersonalizationEntry = p1.Personalization[GameInfosReducer.key][p2.universeId]
	
	return {
		screenWidth = p1.ScreenSize.X,
		isLoading = FetchingStatus == RetrievalStatus.NotStarted or FetchingStatus == RetrievalStatus.Fetching,
		isDisabled = FetchingStatus == RetrievalStatus.Failed and not PersonalizationEntry or (OverlayType == CentralOverlayType.GameDetailMore or OverlayType == CentralOverlayType.GameDetailsPlayWithFriends)
	}
end, function(Callback)
	-- upvalues: OpenCentralOverlayForGameDetailsPlayWithFriendsModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	return {
		openContextualMenu = function(p1, p2, p3)
			-- upvalues: Callback (copy), OpenCentralOverlayForGameDetailsPlayWithFriendsModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			Callback(OpenCentralOverlayForGameDetailsPlayWithFriendsModule(p1, p2, nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p3 else nil))
		end
	}
end)(GameDetailsPlayWithFriendsButton)