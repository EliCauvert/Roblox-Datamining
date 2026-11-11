local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local TModule = require(CorePackages.Packages.t)
local CentralOverlayType = require(CorePackages.Workspace.Packages.RobloxAppEnums).CentralOverlayType
local RetrievalStatus = require(CorePackages.Workspace.Packages.Http).Enum.RetrievalStatus
local ApiFetchGameDetails = require(CorePackages.Workspace.Packages.GameDetailRodux).GameDetails.ApiFetchGameDetails
local GameInfosReducer = require(CorePackages.Workspace.Packages.GameInfosRodux).GameInfosReducer
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local Skeleton = require(CorePackages.Packages.Foundation).Skeleton
local WithStyleFunction = UIBloxModule.Style.withStyle
local ImageSetButton = UIBloxModule.Core.ImageSet.ImageSetButton
local ImageSetLabel = UIBloxModule.Core.ImageSet.ImageSetLabel
local Images = UIBloxModule.App.ImageSet.Images
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local ApiFetchExperienceDetailsPageModule = require(Modules.LuaApp.Thunks.Games.ApiFetchExperienceDetailsPage)
local OpenCentralOverlayForGameDetailMoreModule = require(Modules.LuaApp.Thunks.OpenCentralOverlayForGameDetailMore)
local FFlagLuaAppEdpBackendV2HydrateLegacyDefault = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyDefault
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local _UDim2 = UDim2.new(0, 44, 0, 44)
local _UDim2_1 = UDim2.new(0, 37, 0, 37)
local ComponentAssetsCircle17 = Images["component_assets/circle_17"]
local _Rect = Rect.new(8, 8, 9, 9)
local IconsMenuMoreOn = Images["icons/menu/more_on"]
local IconsMenuMoreOff = Images["icons/menu/more_off"]
local GameDetailMoreButton = RoactModule.PureComponent:extend("GameDetailMoreButton")
GameDetailMoreButton.validateProps = TModule.strictInterface({
	universeId = TModule.string,
	leftPadding = TModule.number,
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	screenWidth = TModule.number,
	isLoading = TModule.boolean,
	isDisabled = TModule.boolean,
	openContextualMenu = TModule.callback,
	testId = TModule.optional(TModule.string)
})

function GameDetailMoreButton.getMoreMenuPosition(p1): UDim2
	local ScreenWidth: number = p1.props.screenWidth
	local LeftPadding: number = p1.props.leftPadding
	local Current = p1.moreButtonRef.current
	
	if Current == nil then
		return UDim2.new(0, 0, 0, 0)
	else
		local NewX = Current.AbsolutePosition.x + Current.AbsoluteSize.x / 2
		local ScreenWidthRatio = (ScreenWidth - 300) / 2
		
		return UDim2.new(0, if ScreenWidth < 600 then 0 elseif NewX < LeftPadding + 150 then LeftPadding - ScreenWidthRatio else NewX - 150 - ScreenWidthRatio, 0, Current.AbsolutePosition.Y - 15)
	end
end

function GameDetailMoreButton.init(p1)
	-- upvalues: RoactModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	p1.moreButtonRef = RoactModule.createRef()
	
	function p1.deselectMoreButton()
		-- upvalues: p1 (copy)
		p1:setState({ isMoreButtonSelected = false })
	end
	
	p1.deselectMoreButton()
	local OpenContextualMenuFunction = p1.props.openContextualMenu
	
	function p1.onActivated()
		-- upvalues: p1 (copy), OpenContextualMenuFunction (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
		local UniverseId = p1.props.universeId
		
		if not p1.props.isDisabled then
			p1:setState({ isMoreButtonSelected = true })
			OpenContextualMenuFunction(UniverseId, p1:getMoreMenuPosition(), p1.deselectMoreButton, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil)
			
			return
		end
	end
end

function GameDetailMoreButton.render(p1)
	-- upvalues: WithStyleFunction (copy)
	return WithStyleFunction(function(p2)
		-- upvalues: p1 (copy)
		return p1:renderWithStyle(p2)
	end)
end

function GameDetailMoreButton.renderWithStyle(p1, p2)
	-- upvalues: IconsMenuMoreOn (copy), IconsMenuMoreOff (copy), RoactModule (copy), Skeleton (copy), ImageSetLabel (copy), _UDim2_1 (copy), ImageSetButton (copy), ReactModule (copy), _UDim2 (copy), ComponentAssetsCircle17 (copy), _Rect (copy)
	local IsLoading = p1.props.isLoading
	local IsDisabled = p1.props.isDisabled
	local Theme = p2.Theme
	local IconsMenuMoreOn1 = if p1.state.isMoreButtonSelected then IconsMenuMoreOn else IconsMenuMoreOff
	
	return RoactModule.createElement(ImageSetButton, {
		[ReactModule.Tag] = if p1.props.testId then `data-testid={p1.props.testId}` else nil,
		BorderSizePixel = 0,
		BackgroundTransparency = 1,
		Size = _UDim2,
		Image = ComponentAssetsCircle17,
		ScaleType = Enum.ScaleType.Slice,
		SliceCenter = _Rect,
		ImageTransparency = if IsLoading or IsDisabled then 0.5 else Theme.BackgroundDefault.Transparency,
		ImageColor3 = Theme.BackgroundDefault.Color,
		LayoutOrder = 1,
		ClipsDescendants = false,
		[RoactModule.Event.Activated] = p1.onActivated,
		[RoactModule.Ref] = p1.moreButtonRef
	}, {
		if IsLoading then RoactModule.createElement(Skeleton, {
			Size = UDim2.new(1, 0, 1, 0),
			Position = UDim2.new(0, 0, 0, 0)
		}) else RoactModule.createElement(ImageSetLabel, {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			Size = _UDim2_1,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Position = UDim2.new(0.5, 0, 0.5, 0),
			Image = IconsMenuMoreOn1,
			ImageTransparency = Theme.IconEmphasis.Transparency,
			ImageColor3 = Theme.IconEmphasis.Color
		})
	})
end

local function _(Fetching): boolean
	-- upvalues: RetrievalStatus (copy)
	return Fetching == RetrievalStatus.NotStarted or Fetching == RetrievalStatus.Fetching
end

local _ = function(Failed, GameDetailMore, p3): boolean
	-- upvalues: RetrievalStatus (copy), CentralOverlayType (copy)
	return Failed == RetrievalStatus.Failed and not p3 or (GameDetailMore == CentralOverlayType.GameDetailMore or GameDetailMore == CentralOverlayType.GameDetailsPlayWithFriends)
end

return RoactRoduxModule.connect(function(p3, p4)
	-- upvalues: FFlagLuaAppEdpBackendV2HydrateLegacyDefault (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), ApiFetchExperienceDetailsPageModule (copy), ApiFetchGameDetails (copy), GameInfosReducer (copy), RetrievalStatus (copy), CentralOverlayType (copy)
	local FetchingStatus = if FFlagLuaAppEdpBackendV2HydrateLegacyDefault or FFlagLuaAppEdpBackendV2HydrateLegacyIxp and p4.shouldHydrateLegacyIxp then ApiFetchExperienceDetailsPageModule.GetFetchingStatus(p3, p4.universeId) else ApiFetchGameDetails.GetFetchingStatus(p3, p4.universeId)
	local PersonalizationEntry = p3.Personalization[GameInfosReducer.key][p4.universeId]
	local OverlayType = p3.CentralOverlay.OverlayType
	
	return {
		screenWidth = p3.ScreenSize.X,
		isLoading = FetchingStatus == RetrievalStatus.NotStarted or FetchingStatus == RetrievalStatus.Fetching,
		isDisabled = FetchingStatus == RetrievalStatus.Failed and not PersonalizationEntry or (OverlayType == CentralOverlayType.GameDetailMore or OverlayType == CentralOverlayType.GameDetailsPlayWithFriends)
	}
end, function(Callback)
	-- upvalues: OpenCentralOverlayForGameDetailMoreModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy)
	return {
		openContextualMenu = function(p3, p4, p5, p6)
			-- upvalues: Callback (copy), OpenCentralOverlayForGameDetailMoreModule (upval), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval)
			Callback(OpenCentralOverlayForGameDetailMoreModule(p3, p4, p5, nil, nil, if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p6 else nil))
		end
	}
end)(GameDetailMoreButton)