local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local LuaApp = Modules.LuaApp
local AppGuiService = require(CorePackages.Workspace.Packages.RoactServiceTags).AppGuiService
local ConstantsModule = require(LuaApp.Constants)
local FitChildrenModule = require(LuaApp.FitChildren)
local FormFactor = require(CorePackages.Workspace.Packages.FormFactor).Enums.FormFactor
local GameButtonModule = require(LuaApp.Components.GameButton)
local DEPRECATEDImageSetButtonModule = require(Modules.LuaApp.Components.DEPRECATED_ImageSetButton)
local RoactModule = require(CorePackages.Packages.Roact)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactAnalyticsCommonGameEvents = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactAnalyticsCommonGameEvents
local FeatureContextModule = require(LuaApp.Enum.FeatureContext)
local ConvertUniverseIdToStringFunction = require(CorePackages.Workspace.Packages.SharedFlags).ConvertUniverseIdToString
local FFlagPeopleListContextualMenuFixFocusNavigation = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPeopleListContextualMenuFixFocusNavigation
local FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel = require(CorePackages.Workspace.Packages.SharedFlags).FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel
local TextModule = require(Modules.Common.Text)
local OpenGameDetailsModule = require(Modules.LuaApp.Thunks.OpenGameDetails)
local GameIconReducer = require(CorePackages.Workspace.Packages.GameIconRodux).GameIcons.GameIconReducer
local VIEWGAMEDETAILSFROMICON = ConstantsModule.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_ICON
local VIEWGAMEDETAILSFROMTITLE = ConstantsModule.AnalyticsKeyword.VIEW_GAME_DETAILS_FROM_TITLE
local UserActiveGame = RoactModule.PureComponent:extend("UserActiveGame")

local function Separator(p1)
	-- upvalues: RoactModule (copy)
	return RoactModule.createElement("Frame", {
		BorderSizePixel = 0,
		BackgroundColor3 = p1.color,
		BackgroundTransparency = p1.transparency,
		LayoutOrder = p1.layoutOrder,
		Size = UDim2.new(1, 0, 0, 1)
	})
end

local function _(p1, p2)
	-- upvalues: FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy)
	local LastLocation = p2 and p2.lastLocation
	
	return if LastLocation then LastLocation elseif p1 then if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then p1.name or "" else p1.name else ""
end

function UserActiveGame.init(p1)
	-- upvalues: FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), ConvertUniverseIdToStringFunction (copy), FeatureContextModule (copy), TextModule (copy)
	function p1.createOpenGameDetailsProps()
		-- upvalues: p1 (copy)
		return { onClose = p1.props.onCloseGameDetails }
	end
	
	function p1.openGameDetails(p2)
		-- upvalues: p1 (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (upval), ConvertUniverseIdToStringFunction (upval), FeatureContextModule (upval)
		local UniversePlaceInfo = p1.props.universePlaceInfo
		
		if not FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel and not UniversePlaceInfo then return end
		local Analytics = p1.props.analytics
		local Friend = p1.props.friend
		local Index = p1.props.index
		local AbsolutePosition = p1.props.absolutePosition
		local DismissContextualMenuFunction: () -> () = p1.props.dismissContextualMenu
		local FeatureContext = p1.props.featureContext
		local UniverseRootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.universeRootPlaceId or -1 else UniversePlaceInfo.universeRootPlaceId
		local ConvertUniverseIdToStringResult = ConvertUniverseIdToStringFunction(p1.props.universeId)
		
		if FeatureContext == FeatureContextModule.PeopleList then
			Analytics.reportViewProfileFromPeopleList(Friend.id, Index, AbsolutePosition, UniverseRootPlaceId, p2)
			Analytics.reportOpenGameDetailFromPeopleList(Friend.id, Index, AbsolutePosition, UniverseRootPlaceId, ConvertUniverseIdToStringResult, p2, "GameDetailFromUserActiveGame")
		end
		if DismissContextualMenuFunction then
			DismissContextualMenuFunction()
		end
		p1.props.openGameDetails(ConvertUniverseIdToStringResult, p1.createOpenGameDetailsProps())
	end
	
	function p1.getGameTitleHeight(Name, HeaderFont, ScaledBaseSize, WidthDelta): number
		-- upvalues: TextModule (upval)
		return (math.min(40, TextModule.GetTextHeight(Name, HeaderFont, ScaledBaseSize, WidthDelta) - 2))
	end
end

function UserActiveGame.createGameNameButton(p1, YOffset, Name, TextXAlignment, TextYAlignment, p2)
	-- upvalues: RoactModule (copy), VIEWGAMEDETAILSFROMTITLE (copy)
	local Theme = p2.Theme
	local _Font = p2.Font
	
	return RoactModule.createElement("TextButton", {
		BackgroundTransparency = 1,
		BorderSizePixel = 0,
		Font = _Font.Header2.Font,
		LayoutOrder = 1,
		Size = UDim2.new(1, 0, 0, YOffset),
		Text = Name,
		TextColor3 = Theme.TextEmphasis.Color,
		TextTransparency = Theme.TextEmphasis.Transparency,
		TextSize = _Font.BaseSize * _Font.Header2.RelativeSize,
		TextTruncate = Enum.TextTruncate.AtEnd,
		TextWrapped = true,
		TextXAlignment = TextXAlignment,
		TextYAlignment = TextYAlignment,
		[RoactModule.Event.Activated] = function()
			-- upvalues: p1 (copy), VIEWGAMEDETAILSFROMTITLE (upval)
			p1.openGameDetails(VIEWGAMEDETAILSFROMTITLE, p1.createOpenGameDetailsProps())
		end
	})
end

function UserActiveGame.renderPhone(p1, p2)
	-- upvalues: FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), RoactModule (copy), FitChildrenModule (copy), DEPRECATEDImageSetButtonModule (copy), VIEWGAMEDETAILSFROMICON (copy), GameButtonModule (copy), Separator (copy)
	local Friend = p1.props.friend
	local DismissContextualMenu = p1.props.dismissContextualMenu
	local GameThumbnail = p1.props.gameThumbnail
	local UniversePlaceInfo = p1.props.universePlaceInfo
	local Theme = p2.Theme
	local _Font = p2.Font
	local LastLocation = Friend and Friend.lastLocation
	local LastLocation1 = if LastLocation then LastLocation elseif UniversePlaceInfo then if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.name or "" else UniversePlaceInfo.name else ""
	local Color = Theme.BackgroundUIDefault.Color
	local Transparency = Theme.BackgroundUIDefault.Transparency
	local Color1 = GameThumbnail and Color or Theme.PlaceHolder.Color
	local WidthDelta = p1.props.width - 30
	
	return RoactModule.createElement(FitChildrenModule.FitImageButton, {
		BackgroundTransparency = 1,
		fitAxis = FitChildrenModule.FitAxis.Height,
		LayoutOrder = p1.props.layoutOrder,
		Size = UDim2.new(1, 0, 0, 0),
		AutoButtonColor = false,
		[RoactModule.Ref] = p1.props.forwardRef
	}, {
		GameContent = RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				SortOrder = Enum.SortOrder.LayoutOrder
			}),
			GameIcon = RoactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				BackgroundColor3 = Color1,
				BackgroundTransparency = GameThumbnail and Transparency or Theme.PlaceHolder.Transparency,
				Size = UDim2.new(0, 94, 0, 94)
			}, {
				Icon = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
					BackgroundColor3 = Color1,
					BorderSizePixel = 0,
					Image = GameThumbnail,
					Position = UDim2.new(0, 2, 0, 2),
					Size = UDim2.new(0, 90, 0, 90),
					[RoactModule.Event.Activated] = function()
						-- upvalues: p1 (copy), VIEWGAMEDETAILSFROMICON (upval)
						p1.openGameDetails(VIEWGAMEDETAILSFROMICON, p1.createOpenGameDetailsProps())
					end
				})
			}),
			GameName = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, -30, 0, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
				NameButton = p1:createGameNameButton(p1.getGameTitleHeight(LastLocation1, _Font.Header2.Font, _Font.BaseSize * _Font.Header2.RelativeSize, WidthDelta), LastLocation1, Enum.TextXAlignment.Center, Enum.TextYAlignment.Center, p2),
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 12) })
			}),
			InteractiveButton = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				LayoutOrder = 3,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, -30, 0, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Center }),
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 24) }),
				Button = RoactModule.createElement(GameButtonModule, {
					showLoadingIndicatorWhenDataNotReady = true,
					maxWidth = WidthDelta,
					universeId = p1.props.universeId,
					universeRootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.universeRootPlaceId else nil,
					placeId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.placeId else nil,
					friend = Friend,
					index = p1.props.index,
					absolutePosition = p1.props.absolutePosition,
					callbackOnOpenGameDetails = DismissContextualMenu,
					callbackOnJoinGame = DismissContextualMenu,
					featureContext = p1.props.featureContext,
					source = p1.props.source
				})
			}),
			Separator = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, 0),
				fitAxis = FitChildrenModule.FitAxis.Height
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				Line = RoactModule.createElement(Separator, {
					layoutOrder = 2,
					color = Theme.Divider.Color,
					transparency = Theme.Divider.Transparency
				}),
				Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 23) })
			})
		}),
		Background = RoactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundColor3 = Color,
			BackgroundTransparency = Transparency,
			Size = UDim2.new(1, 0, 1, -47),
			Position = UDim2.new(0, 0, 0, 47)
		})
	})
end

function UserActiveGame.renderTablet(p1, p2)
	-- upvalues: FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), RoactModule (copy), FitChildrenModule (copy), FFlagPeopleListContextualMenuFixFocusNavigation (copy), DEPRECATEDImageSetButtonModule (copy), VIEWGAMEDETAILSFROMICON (copy), GameButtonModule (copy), Separator (copy)
	local Width: number = p1.props.width
	local Friend = p1.props.friend
	local DismissContextualMenu = p1.props.dismissContextualMenu
	local GameThumbnail = p1.props.gameThumbnail
	local UniversePlaceInfo = p1.props.universePlaceInfo
	local LastLocation = Friend and Friend.lastLocation
	local LastLocation1 = if LastLocation then LastLocation elseif UniversePlaceInfo then if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.name or "" else UniversePlaceInfo.name else ""
	local Theme = p2.Theme
	local Color = Theme.BackgroundUIDefault.Color
	local Transparency = Theme.BackgroundUIDefault.Transparency
	
	return RoactModule.createElement(FitChildrenModule.FitImageButton, {
		BackgroundColor3 = Color,
		BackgroundTransparency = Transparency,
		BorderSizePixel = 0,
		fitAxis = FitChildrenModule.FitAxis.Height,
		LayoutOrder = p1.props.layoutOrder,
		Size = UDim2.new(0, Width, 0, 0),
		AutoButtonColor = false,
		[RoactModule.Ref] = p1.props.forwardRef,
		Selectable = not FFlagPeopleListContextualMenuFixFocusNavigation and nil
	}, {
		Layout = RoactModule.createElement("UIListLayout", {
			FillDirection = Enum.FillDirection.Vertical,
			SortOrder = Enum.SortOrder.LayoutOrder
		}),
		GameContent = RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			LayoutOrder = 1,
			fitAxis = FitChildrenModule.FitAxis.Height,
			Size = UDim2.new(1, 0, 0, 0)
		}, {
			Padding = RoactModule.createElement("UIPadding", {
				PaddingTop = UDim.new(0, 12),
				PaddingLeft = UDim.new(0, 12),
				PaddingRight = UDim.new(0, 12),
				PaddingBottom = UDim.new(0, 11)
			}),
			Layout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Horizontal,
				SortOrder = Enum.SortOrder.LayoutOrder,
				Padding = UDim.new(0, 15)
			}),
			GameIcon = RoactModule.createElement(DEPRECATEDImageSetButtonModule, {
				BackgroundColor3 = GameThumbnail and Color or Theme.PlaceHolder.Color,
				BackgroundTransparency = GameThumbnail and Transparency or Theme.PlaceHolder.Transparency,
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Image = GameThumbnail,
				Size = UDim2.new(0, 90, 0, 90),
				[RoactModule.Event.Activated] = function()
					-- upvalues: p1 (copy), VIEWGAMEDETAILSFROMICON (upval)
					p1.openGameDetails(VIEWGAMEDETAILSFROMICON, p1.createOpenGameDetailsProps())
				end,
				Selectable = not FFlagPeopleListContextualMenuFixFocusNavigation and nil
			}, {
				Padding = RoactModule.createElement("UIPadding", { PaddingLeft = UDim.new(0, 12) })
			}),
			GameInfo = RoactModule.createElement(FitChildrenModule.FitFrame, {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				fitAxis = FitChildrenModule.FitAxis.Height,
				Size = UDim2.new(1, -105, 0, 0)
			}, {
				Layout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder
				}),
				NameButton = p1:createGameNameButton(40, LastLocation1, Enum.TextXAlignment.Left, Enum.TextYAlignment.Top, p2),
				InteractiveButton = RoactModule.createElement(FitChildrenModule.FitFrame, {
					BackgroundTransparency = 1,
					LayoutOrder = 2,
					Size = UDim2.new(1, 0, 0, 0),
					fitAxis = FitChildrenModule.FitAxis.Height
				}, {
					Layout = RoactModule.createElement("UIListLayout", { HorizontalAlignment = Enum.HorizontalAlignment.Right }),
					Button = RoactModule.createElement(GameButtonModule, {
						layoutOrder = 3,
						showLoadingIndicatorWhenDataNotReady = true,
						maxWidth = Width - 36 - 90,
						universeId = p1.props.universeId,
						universeRootPlaceId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.universeRootPlaceId else nil,
						placeId = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then UniversePlaceInfo.placeId else nil,
						friend = Friend,
						index = p1.props.index,
						absolutePosition = p1.props.absolutePosition,
						callbackOnOpenGameDetails = DismissContextualMenu,
						callbackOnJoinGame = DismissContextualMenu,
						featureContext = p1.props.featureContext,
						source = p1.props.source,
						selectionOrder = if FFlagPeopleListContextualMenuFixFocusNavigation then -1 else nil
					}),
					Padding = RoactModule.createElement("UIPadding", { PaddingTop = UDim.new(0, 18) })
				})
			})
		}),
		Separator = RoactModule.createElement(Separator, { layoutOrder = 2 })
	})
end

function UserActiveGame.render(p1)
	-- upvalues: FormFactor (copy), WithStyleFunction (copy)
	local FormFactor1 = p1.props.formFactor
	
	return WithStyleFunction(function(p2)
		-- upvalues: FormFactor1 (copy), FormFactor (upval), p1 (copy)
		return if FormFactor1 == FormFactor.COMPACT then p1:renderPhone(p2) else p1:renderTablet(p2)
	end)
end

local v1 = RoactServices.connect({
	analytics = RoactAnalyticsCommonGameEvents,
	guiService = AppGuiService
})((RoactRoduxModule.connect(function(p1, p2)
	-- upvalues: ConvertUniverseIdToStringFunction (copy), GameIconReducer (copy), ConstantsModule (copy), FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel (copy), CryoModule (copy)
	local ConvertUniverseIdToStringResult = ConvertUniverseIdToStringFunction(p2.universeId)
	local v2 = p1[GameIconReducer.key][ConvertUniverseIdToStringResult]
	local Config = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then {
		universeId = ConvertUniverseIdToStringResult,
		universeRootPlaceId = tonumber(p2.universeRootPlaceId),
		placeId = p2.placeId
	} else nil
	
	return {
		formFactor = p1.FormFactor,
		gameThumbnail = v2 and v2.url or ConstantsModule.DEFAULT_GAME_ICON,
		universePlaceInfo = if FFlagJoinGameCardPassThroughUniversePlaceInfoFromFriendsCarousel then CryoModule.Dictionary.union(p1.UniversePlaceInfos[ConvertUniverseIdToStringResult] or {}, Config) else p1.UniversePlaceInfos[ConvertUniverseIdToStringResult]
	}
end, function(Callback)
	-- upvalues: OpenGameDetailsModule (copy)
	return {
		openGameDetails = function(p1, p2)
			-- upvalues: Callback (copy), OpenGameDetailsModule (upval)
			Callback(OpenGameDetailsModule(p1, p2))
		end
	}
end)(UserActiveGame)))

return RoactModule.forwardRef(function(p1, ForwardRef)
	-- upvalues: RoactModule (copy), v1 (ref), CryoModule (copy)
	return RoactModule.createElement(v1, CryoModule.Dictionary.join(p1, { forwardRef = ForwardRef }))
end)