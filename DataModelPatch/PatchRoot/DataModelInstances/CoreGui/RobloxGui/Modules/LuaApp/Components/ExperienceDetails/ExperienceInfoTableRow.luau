local CorePackages = game:GetService("CorePackages")
local IXPService = game:GetService("IXPService")
local RoactModule = require(CorePackages.Packages.Roact)
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local FFlagRenameDeprecatedUIBloxTokens = require(CorePackages.Workspace.Packages.SharedFlags).FFlagRenameDeprecatedUIBloxTokens
local WithStyleFunction = UIBloxModule.Core.Style.withStyle
local Cell = UIBloxModule.App.Table.Cell
local CellHeadDetail = UIBloxModule.App.Table.CellHeadDetail
local CellTailDescription = UIBloxModule.App.Table.CellTailDescription
local TModule = require(CorePackages.Packages.t)
local AppPage = require(CorePackages.Workspace.Packages.RobloxAppEnums).AppPage
local EnableCommunityProfilePageIXPModule = require(CorePackages.Workspace.Packages.ProfilePlatform.EnableCommunityProfilePageIXP)
local GameDetailsSubpageFunction = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.LuaApp.Analytics.Events.Games.GameDetailsEvents.GameDetailsSubpage
local TransitionAnimationModule = require(game:GetService("CoreGui").RobloxGui.Modules.LuaApp.Enum.TransitionAnimation)
local FFlagExperienceDetailsTextUseTokensModule = require(script.Parent.Flags.FFlagExperienceDetailsTextUseTokens)
local FFlagLuaAppAddUniverseIdToGameDetailsEvents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppAddUniverseIdToGameDetailsEvents
local FStringLuaAppBadgesSeeAllIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppBadgesSeeAllIxpLayer
local FFlagLuaAppBadgesSeeAllLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppBadgesSeeAllLogExposure
local FStringLuaAppDevStoreSeeAllSduiIxpLayer = require(CorePackages.Workspace.Packages.SharedFlags).FStringLuaAppDevStoreSeeAllSduiIxpLayer
local FFlagLuaAppDevStoreSeeAllSduiLogExposure = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaAppDevStoreSeeAllSduiLogExposure
local FFlagEnableBlackbirdPageCloseCallback = require(CorePackages.Workspace.Packages.SharedFlags).FFlagEnableBlackbirdPageCloseCallback

local function _(p1, p2)
	-- upvalues: FFlagRenameDeprecatedUIBloxTokens (copy)
	return p1 * (p2.Stroke and p2.Stroke.Standard or (p2.Global and (if FFlagRenameDeprecatedUIBloxTokens then p2.Stroke.Standard else p2.Global.Stroke_100) or 1))
end

local ExperienceInfoTableRow = RoactModule.PureComponent:extend("ExperienceInfoTableRow")
ExperienceInfoTableRow.validateProps = TModule.strictInterface({
	horizontalPadding = TModule.optional(TModule.number),
	infoName = TModule.string,
	infoData = TModule.string,
	infoIcon = TModule.optional(TModule.string),
	renderTextOverride = TModule.optional(TModule.callback),
	linkProps = TModule.optional(TModule.strictInterface({
		linkPage = TModule.optional(TModule.string),
		analyticsSubPage = TModule.string,
		rootPlaceId = TModule.string,
		eventIngest = TModule.table,
		navigate = TModule.callback,
		navigateProps = TModule.optional(TModule.any),
		onClose = TModule.optional(TModule.callback)
	})),
	externalLinkProps = TModule.optional(TModule.strictInterface({
		linkUrl = TModule.string,
		openLeaveRobloxAlert = TModule.callback,
		closeAlert = TModule.callback,
		linking = TModule.table,
		clickCallback = TModule.optional(TModule.callback)
	})),
	universeId = if FFlagLuaAppAddUniverseIdToGameDetailsEvents then TModule.optional(TModule.string) else nil,
	testId = TModule.optional(TModule.string)
})

function ExperienceInfoTableRow.init(p1)
	-- upvalues: AppPage (copy), TransitionAnimationModule (copy), FFlagEnableBlackbirdPageCloseCallback (copy), GameDetailsSubpageFunction (copy), FFlagLuaAppAddUniverseIdToGameDetailsEvents (copy), EnableCommunityProfilePageIXPModule (copy), FFlagLuaAppBadgesSeeAllLogExposure (copy), IXPService (copy), FStringLuaAppBadgesSeeAllIxpLayer (copy), FFlagLuaAppDevStoreSeeAllSduiLogExposure (copy), FStringLuaAppDevStoreSeeAllSduiIxpLayer (copy)
	function p1.onActivated()
		-- upvalues: p1 (copy), AppPage (upval), TransitionAnimationModule (upval), FFlagEnableBlackbirdPageCloseCallback (upval), GameDetailsSubpageFunction (upval), FFlagLuaAppAddUniverseIdToGameDetailsEvents (upval), EnableCommunityProfilePageIXPModule (upval), FFlagLuaAppBadgesSeeAllLogExposure (upval), IXPService (upval), FStringLuaAppBadgesSeeAllIxpLayer (upval), FFlagLuaAppDevStoreSeeAllSduiLogExposure (upval), FStringLuaAppDevStoreSeeAllSduiIxpLayer (upval)
		local ExternalLinkProps = p1.props.externalLinkProps
		
		if ExternalLinkProps then
			ExternalLinkProps.openLeaveRobloxAlert(function()
				-- upvalues: ExternalLinkProps (copy)
				ExternalLinkProps.linking:openURL(ExternalLinkProps.linkUrl)
				ExternalLinkProps.closeAlert()
				local ClickCallbackFunction: () -> () = ExternalLinkProps.clickCallback
				
				if ClickCallbackFunction then
					ClickCallbackFunction()
				end
			end)
			
			return
		end
		local LinkProps = p1.props.linkProps
		
		if not LinkProps then return end
		local InfoName = p1.props.infoName
		local LinkPage = LinkProps.linkPage
		local AnalyticsSubPage = LinkProps.analyticsSubPage
		local NavigateFunction: (any) -> () = LinkProps.navigate
		local NavigateProps = if LinkProps.navigateProps then LinkProps.navigateProps else {
			name = AppPage.GenericWebPage,
			detail = LinkPage,
			extraProps = {
				title = InfoName,
				transitionAnimation = TransitionAnimationModule.SlideInFromRight,
				onClose = if FFlagEnableBlackbirdPageCloseCallback then LinkProps.onClose else nil
			}
		}
		GameDetailsSubpageFunction(LinkProps.eventIngest, "GameInfoRow", LinkProps.rootPlaceId, AnalyticsSubPage, if FFlagLuaAppAddUniverseIdToGameDetailsEvents then p1.props.universeId else nil)
		
		if EnableCommunityProfilePageIXPModule.FFlagIsSetupEnabled and (AnalyticsSubPage == "Developer" or AnalyticsSubPage == "Group") then
			EnableCommunityProfilePageIXPModule.logExposure()
		end
		if FFlagLuaAppBadgesSeeAllLogExposure and AnalyticsSubPage == "Badges" then
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppBadgesSeeAllIxpLayer)
		end
		if FFlagLuaAppDevStoreSeeAllSduiLogExposure and AnalyticsSubPage == "PassesAndGear" then
			IXPService:LogFlagLinkedUserLayerExposure(FStringLuaAppDevStoreSeeAllSduiIxpLayer)
		end
		NavigateFunction(NavigateProps)
	end
end

function ExperienceInfoTableRow.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), Cell (copy), FFlagRenameDeprecatedUIBloxTokens (copy), CellHeadDetail (copy), FFlagExperienceDetailsTextUseTokensModule (copy), CellTailDescription (copy)
	local InfoName = p1.props.infoName
	local InfoData = p1.props.infoData
	local InfoIcon = p1.props.infoIcon
	local TestId = p1.props.testId
	local ExternalLinkProps = p1.props.externalLinkProps
	local ShowArrow: boolean = if p1.props.linkProps or ExternalLinkProps then true else false
	local RenderTextOverride = p1.props.renderTextOverride
	
	return WithStyleFunction(function(p2)
		-- upvalues: RoactModule (upval), Cell (upval), FFlagRenameDeprecatedUIBloxTokens (upval), ShowArrow (copy), p1 (copy), CellHeadDetail (upval), InfoName (copy), FFlagExperienceDetailsTextUseTokensModule (upval), CellTailDescription (upval), InfoData (copy), RenderTextOverride (copy), InfoIcon (copy), TestId (copy)
		local Tokens = p2.Tokens
		
		return RoactModule.createElement(Cell, {
			selectable = true,
			size = UDim2.new(1, 0, 0, 56 * (Tokens.Stroke and Tokens.Stroke.Standard or (Tokens.Global and (if FFlagRenameDeprecatedUIBloxTokens then Tokens.Stroke.Standard else Tokens.Global.Stroke_100) or 1))),
			userInteractionEnabled = ShowArrow,
			onActivated = ShowArrow and p1.onActivated or nil,
			horizontalPadding = p1.props.horizontalPadding,
			head = RoactModule.createElement(CellHeadDetail, {
				labelText = InfoName,
				labelTextColor = p2.Theme.TextDefault,
				labelTextFont = if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.BodyLarge else p2.Tokens.Semantic.Typography.Body else p2.Font.Body
			}),
			tail = RoactModule.createElement(CellTailDescription, {
				text = InfoData,
				textColor = p2.Theme.TextEmphasis,
				textFont = if FFlagExperienceDetailsTextUseTokensModule then if FFlagRenameDeprecatedUIBloxTokens then p2.Tokens.Typography.TitleLarge else p2.Tokens.Semantic.Typography.Subheader else p2.Font.Body,
				renderTextOverride = RenderTextOverride,
				showArrow = ShowArrow,
				infoIcon = InfoIcon,
				testId = TestId
			})
		})
	end)
end

return ExperienceInfoTableRow