local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactModule = require(CorePackages.Packages.Roact)
local ReactModule = require(CorePackages.Packages.React)
local TModule = require(CorePackages.Packages.t)
local GamePlayButtonModule = require(CorePackages.Workspace.Packages.GamePlayButton)
local PlayButton = GamePlayButtonModule.PlayButton
local UsePlayButtonState = GamePlayButtonModule.usePlayButtonState
local UsePlayButtonContextualMessage = GamePlayButtonModule.usePlayButtonContextualMessage
local PlayButtonContextualMessageImpressionsDetector = GamePlayButtonModule.PlayButtonContextualMessageImpressionsDetector
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local RoactAppPolicy = require(CorePackages.Workspace.Packages.UniversalAppPolicy).RoactAppPolicy
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local ButtonSize = require(CorePackages.Packages.Foundation).Enums.ButtonSize
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local UseRoactService = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local AppUserLayers = require(CorePackages.Workspace.Packages.ExperimentLayers).AppUserLayers
local UseUserExperiment = require(CorePackages.Packages.RoactAppExperiment).useUserExperiment
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local PlayButtonContainerModule = require(Modules.LuaApp.Components.Games.PlayButtonContainer)
local GameDetailMoreButtonModule = require(Modules.LuaApp.Components.GameDetails.GameDetailMoreButton)
local GameDetailsPlayWithFriendsButtonModule = require(Modules.LuaApp.Components.GameDetails.GameDetailsPlayWithFriendsButton)
local FFlagLuaAppUnifyPlayButtonMobileEdp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonMobileEdp
local FFlagLuaAppUnifyPlayButtonAllSurfacesIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppUnifyPlayButtonAllSurfacesIxp
local GetFFlagUIBloxUseFoundationButtonFunction = require(CorePackages.Workspace.Packages.SharedFlags).UIBlox.GetFFlagUIBloxUseFoundationButton
local FFlagLuaAppEdpBackendV2HydrateLegacyIxp = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppEdpBackendV2HydrateLegacyIxp
local FFlagLuaAppPlayabilityMessageUpdate = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppPlayabilityMessageUpdate
local FFlagLuaAppLogExposurePlayButtonUX = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppLogExposurePlayButtonUX
local GAMEDETAILSACTIONBARHEIGHT = require(CorePackages.Workspace.Packages.DiscoveryTypes).Constants.GAME_DETAILS_ACTION_BAR_HEIGHT
local ActionBar = RoactModule.PureComponent:extend("ActionBar")
ActionBar.defaultProps = { bottomPadding = 0, showMorePage = true }
ActionBar.validateProps = TModule.strictInterface({
	leftPadding = TModule.number,
	rightPadding = TModule.number,
	bottomPadding = TModule.number,
	universeId = TModule.string,
	referralSource = TModule.optional(TModule.string),
	experienceJoinData = TModule.optional(TModule.table),
	placeIdOverride = TModule.optional(TModule.string),
	containerRef = TModule.optional(TModule.table),
	shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then TModule.optional(TModule.boolean) else nil,
	showMorePage = TModule.optional(TModule.boolean),
	shouldShowPlayWithFriendsPolicy = TModule.optional(TModule.boolean),
	contextualMessage = TModule.optional(TModule.string),
	playabilityStatus = TModule.optional(TModule.table),
	hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then TModule.optional(TModule.boolean) else nil,
	unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then TModule.optional(TModule.boolean) else nil
})

function ActionBar.init(p1)
	-- upvalues: RoactModule (copy)
	p1.contextLabelRef = RoactModule.createRef()
end

function ActionBar:willUnmount() end

function ActionBar.render(p1)
	-- upvalues: GAMEDETAILSACTIONBARHEIGHT (copy), WithStyleFunction (copy), RoactModule (copy), FFlagLuaAppUnifyPlayButtonMobileEdp (copy), GetFFlagUIBloxUseFoundationButtonFunction (copy), FFlagRenameDeprecatedUIBloxTokens (copy), GAMEDETAILSACTIONBARHEIGHT (copy), GameDetailMoreButtonModule (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (copy), GameDetailsPlayWithFriendsButtonModule (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), PlayButtonContainerModule (copy), PlayButton (copy), ButtonSize (copy), FFlagLuaAppPlayabilityMessageUpdate (copy), PlayButtonContextualMessageImpressionsDetector (copy), AppPage (copy)
	local LeftPadding = p1.props.leftPadding
	local RightPadding = p1.props.rightPadding
	local BottomPadding = p1.props.bottomPadding
	local UniverseId = p1.props.universeId
	local ExperienceJoinData = p1.props.experienceJoinData
	local ShowMorePage = p1.props.showMorePage
	local ShouldShowPlayWithFriendsPolicy = p1.props.shouldShowPlayWithFriendsPolicy
	local Offset: number = if ShowMorePage then 10 else 0
	local XOffset = -(ShowMorePage and GAMEDETAILSACTIONBARHEIGHT or 0) - Offset
	
	if ShouldShowPlayWithFriendsPolicy then
		XOffset = 2 * XOffset
	end
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), p1 (copy), FFlagLuaAppUnifyPlayButtonMobileEdp (upval), GetFFlagUIBloxUseFoundationButtonFunction (upval), FFlagRenameDeprecatedUIBloxTokens (upval), LeftPadding (copy), RightPadding (copy), BottomPadding (copy), GAMEDETAILSACTIONBARHEIGHT (upval), Offset (copy), ShowMorePage (copy), GameDetailMoreButtonModule (upval), UniverseId (copy), FFlagLuaAppEdpBackendV2HydrateLegacyIxp (upval), ShouldShowPlayWithFriendsPolicy (copy), GameDetailsPlayWithFriendsButtonModule (upval), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (upval), PlayButtonContainerModule (upval), XOffset (ref), ExperienceJoinData (copy), PlayButton (upval), ButtonSize (upval), FFlagLuaAppPlayabilityMessageUpdate (upval), PlayButtonContextualMessageImpressionsDetector (upval), AppPage (upval)
		return RoactModule.createElement("Frame", {
			Size = UDim2.new(1, 0, 0, 0),
			AutomaticSize = Enum.AutomaticSize.Y,
			AnchorPoint = Vector2.new(0, 1),
			Position = UDim2.new(0, 0, 1, 0),
			BackgroundTransparency = 1,
			[RoactModule.Ref] = p1.props.containerRef
		}, {
			ListLayout = RoactModule.createElement("UIListLayout", {
				FillDirection = Enum.FillDirection.Vertical,
				SortOrder = Enum.SortOrder.LayoutOrder,
				VerticalAlignment = Enum.VerticalAlignment.Center
			}),
			Gradient = RoactModule.createElement("ImageLabel", {
				BackgroundTransparency = 1,
				Image = "rbxasset://textures/ui/LuaApp/graphic/gradient_0_100.png",
				LayoutOrder = 1,
				Size = UDim2.new(1, 0, 0, 40),
				ImageColor3 = p2.Theme.BackgroundDefault.Color,
				ZIndex = if FFlagLuaAppUnifyPlayButtonMobileEdp or GetFFlagUIBloxUseFoundationButtonFunction() then 1 else nil
			}),
			ContentFrame = RoactModule.createElement("Frame", {
				LayoutOrder = 2,
				BackgroundTransparency = 0,
				BorderSizePixel = 0,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				BackgroundColor3 = p2.Theme.BackgroundDefault.Color,
				ZIndex = if FFlagLuaAppUnifyPlayButtonMobileEdp or GetFFlagUIBloxUseFoundationButtonFunction() then 2 else nil
			}, {
				ContentListLayout = RoactModule.createElement("UIListLayout", {
					FillDirection = Enum.FillDirection.Vertical,
					SortOrder = Enum.SortOrder.LayoutOrder,
					VerticalAlignment = Enum.VerticalAlignment.Center,
					Padding = UDim.new(0, if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Size.Size_300 else p2.Tokens.Global.Space_150)
				}),
				ContentPadding = RoactModule.createElement("UIPadding", {
					PaddingLeft = UDim.new(0, LeftPadding),
					PaddingRight = UDim.new(0, RightPadding),
					PaddingBottom = UDim.new(0, BottomPadding)
				}),
				ActionBar = RoactModule.createElement("Frame", {
					BackgroundTransparency = 1,
					LayoutOrder = 1,
					Size = UDim2.new(1, 0, 0, GAMEDETAILSACTIONBARHEIGHT)
				}, {
					ActionListLayout = RoactModule.createElement("UIListLayout", {
						FillDirection = Enum.FillDirection.Horizontal,
						HorizontalAlignment = Enum.HorizontalAlignment.Left,
						VerticalAlignment = if FFlagLuaAppUnifyPlayButtonMobileEdp or GetFFlagUIBloxUseFoundationButtonFunction() then Enum.VerticalAlignment.Center else nil,
						SortOrder = Enum.SortOrder.LayoutOrder,
						Padding = UDim.new(0, Offset)
					}),
					MoreButton = ShowMorePage and RoactModule.createElement(GameDetailMoreButtonModule, {
						testId = "--experience-details--more-button",
						universeId = UniverseId,
						leftPadding = LeftPadding,
						shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
					}),
					PlayWithFriendsButton = ShouldShowPlayWithFriendsPolicy and RoactModule.createElement(GameDetailsPlayWithFriendsButtonModule, {
						universeId = UniverseId,
						leftPadding = LeftPadding,
						shouldHydrateLegacyIxp = if FFlagLuaAppEdpBackendV2HydrateLegacyIxp then p1.props.shouldHydrateLegacyIxp else nil
					}) or nil,
					PlayButtonContainer = if FFlagLuaAppUnifyPlayButtonMobileEdp and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.props.hasUnifiedPlayButtonIxp) then nil else RoactModule.createElement(PlayButtonContainerModule, {
						LayoutOrder = 4,
						testId = "--experience-details--play-button",
						Size = UDim2.new(1, XOffset, if GetFFlagUIBloxUseFoundationButtonFunction() then 0 else 1, if GetFFlagUIBloxUseFoundationButtonFunction() then GAMEDETAILSACTIONBARHEIGHT else 0),
						universeId = UniverseId,
						referralSource = p1.props.referralSource,
						experienceJoinData = ExperienceJoinData,
						placeId = p1.props.placeIdOverride
					}),
					PlayButton = if FFlagLuaAppUnifyPlayButtonMobileEdp and (not FFlagLuaAppUnifyPlayButtonAllSurfacesIxp or p1.props.hasUnifiedPlayButtonIxp) then RoactModule.createElement(PlayButton, {
						launchSource = "LuaGameCard",
						LayoutOrder = 4,
						testId = "--experience-details--play-button",
						universeId = UniverseId,
						referralSource = p1.props.referralSource,
						experienceJoinData = ExperienceJoinData,
						placeId = p1.props.placeIdOverride,
						buttonSize = ButtonSize.Large,
						width = UDim.new(1, XOffset),
						useUIBloxButton = p1.props.unifyToUIBloxIxp
					}) else nil
				}),
				ContextLabel = if p1.props.contextualMessage then RoactModule.createElement("TextLabel", {
					Size = UDim2.new(1, 0, 0, 0),
					AutomaticSize = Enum.AutomaticSize.Y,
					Text = p1.props.contextualMessage,
					TextXAlignment = Enum.TextXAlignment.Left,
					TextWrapped = true,
					BackgroundTransparency = 1,
					Font = if FFlagLuaAppPlayabilityMessageUpdate then if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.BodyLarge.Font else p2.Tokens.Semantic.Typography.Body.Font elseif FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.CaptionLarge.Font else p2.Tokens.Semantic.Typography.CaptionHeader.Font,
					TextSize = if FFlagLuaAppPlayabilityMessageUpdate then if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.FontSize.FontSize_350 else p2.Tokens.Global.FontSize_75 elseif FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.FontSize.FontSize_300 else p2.Tokens.Semantic.Typography.CaptionHeader.FontSize,
					TextColor3 = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Emphasis else p2.Tokens.Semantic.Color.Text.Emphasis).Color3,
					TextTransparency = (if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Color.Content.Emphasis else p2.Tokens.Semantic.Color.Text.Emphasis).Transparency,
					LayoutOrder = 2,
					[RoactModule.Ref] = p1.contextLabelRef
				}) else nil,
				ContextLabelImpressionsDetector = if p1.props.contextualMessage then RoactModule.createElement(PlayButtonContextualMessageImpressionsDetector, {
					containerRef = p1.contextLabelRef,
					universeId = p1.props.universeId,
					playabilityStatus = p1.props.playabilityStatus,
					contextualMessage = p1.props.contextualMessage,
					pageContext = AppPage.GameDetail
				}) else nil
			})
		})
	end)
end

local v1 = RoactAppPolicy.connect(function(p1, _)
	return {
		showMorePage = p1.getGameDetailsMorePage(),
		shouldShowPlayWithFriendsPolicy = p1.getGameDetailsPlayWithFriends()
	}
end)(ActionBar)

return function(p1)
	-- upvalues: UseRoactService (copy), RoactNetworking (copy), UsePlayButtonState (copy), UsePlayButtonContextualMessage (copy), FFlagLuaAppUnifyPlayButtonAllSurfacesIxp (copy), UseUserExperiment (copy), AppUserLayers (copy), FFlagLuaAppLogExposurePlayButtonUX (copy), ReactModule (copy), IXPService (copy), CryoModule (copy), RoactModule (copy), v1 (copy)
	local v2 = UsePlayButtonState(UseRoactService(RoactNetworking), p1.universeId, nil)
	local ContextualMessage = UsePlayButtonContextualMessage(p1.universeId, v2.playButtonState, v2.playabilityStatus)
	local v3 = nil
	local v4 = nil
	
	if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then
		v3, v41 = UseUserExperiment({ AppUserLayers.PlayButtonUXExposureLayer }, function(p2)
			-- upvalues: AppUserLayers (upval)
			local v5 = p2[AppUserLayers.PlayButtonUXExposureLayer] or {}
			
			return v5.HasUnifiedPlayButton, v5.UnifyToUIBlox
		end, true)
	end
	if FFlagLuaAppLogExposurePlayButtonUX then
		ReactModule.useEffect(function()
			-- upvalues: IXPService (upval), AppUserLayers (upval)
			IXPService:LogUserLayerExposure(AppUserLayers.PlayButtonUXExposureLayer)
		end, {})
	end
	return RoactModule.createElement(v1, (CryoModule.Dictionary.join(p1, {
		contextualMessage = ContextualMessage,
		playabilityStatus = v2.playabilityStatus,
		hasUnifiedPlayButtonIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v3 else nil,
		unifyToUIBloxIxp = if FFlagLuaAppUnifyPlayButtonAllSurfacesIxp then v4 else nil
	})))
end