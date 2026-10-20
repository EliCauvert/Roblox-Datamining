local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local HttpService = game:GetService("HttpService")
local FullscreenPageWithSafeAreaModule = require(Modules.LuaApp.Components.FullscreenPageWithSafeArea)
local CustomizedInviteLandingPageBackgroundModule = require(Modules.LuaApp.Components.Authentication.CustomizedInviteLandingPageBackground)
local CustomStaticLandingPageBackgroundModule = require(Modules.LuaApp.Components.Authentication.CustomStaticLandingPageBackground)
local ReactModule = require(CorePackages.Packages.React)
local UseRoactServiceFunction = require(CorePackages.Workspace.Packages.RobloxAppHooks).useRoactService
local RoactNetworking = require(CorePackages.Workspace.Packages.RoactServiceTags).RoactNetworking
local GetSafeAreaSizeFunction = require(CorePackages.Workspace.Packages.InputUi).getSafeAreaSize
local UseLocalizationFunction = require(CorePackages.Workspace.Packages.Localization).Hooks.useLocalization
local AuthCommonModule = require(CorePackages.Workspace.Packages.AuthCommon)
local FetchGameMediaFunction = AuthCommonModule.Thunks.FetchGameMedia
local GetUserByIdFunction = AuthCommonModule.Thunks.GetUserById
local FoundationModule = require(CorePackages.Packages.Foundation)
local Text = FoundationModule.Text
local UseTokensFunction = FoundationModule.Hooks.useTokens
local LandingPageConstants = require(CorePackages.Workspace.Packages.LandingPage).Constants.LandingPageConstants
local Common = LandingPageConstants.Common
local CustomizedLandingPage = LandingPageConstants.CustomizedLandingPage
local GetStandardSizeAvatarHeadShotRbxthumbFunction = require(CorePackages.Workspace.Packages.UserLib).Utils.getStandardSizeAvatarHeadShotRbxthumb
local UIBloxModule = require(CorePackages.Packages.UIBlox)
local LoadableImage = UIBloxModule.App.Loading.LoadableImage
local Colors = UIBloxModule.App.Style.Colors
local AuthAnalyticsModule = require(CorePackages.Workspace.Packages.AuthAnalytics)
local EventStreamConstants = AuthAnalyticsModule.EventStreamConstants
local AuthClientErrorFunction = AuthAnalyticsModule.Events.authClientError
local AuthPageloadFunction = AuthAnalyticsModule.Events.authPageload
local AuthTimingUtil = AuthAnalyticsModule.authTimingUtil
local GetGameNameAndDescriptionFunction = require(CorePackages.Workspace.Packages.GameDetailRodux).GetGameNameAndDescription
local GameMediaImageType = require(CorePackages.Workspace.Packages.DiscoveryTypes).GameMediaImageType
local FFlagLuaEnableLandingPageTTIMeasurements = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableLandingPageTTIMeasurements
local FFlagLuaEnableGenreLandingDeeplink = require(CorePackages.Workspace.Packages.SharedFlags).FFlagLuaEnableGenreLandingDeeplink
local EnableFoundationLogoInCustomizedInviteLandingPage = game:DefineFastFlag("EnableFoundationLogoInCustomizedInviteLandingPage", false)

return function(p1)
	-- upvalues: UseRoactServiceFunction (copy), RoactNetworking (copy), ReactModule (copy), GetGameNameAndDescriptionFunction (copy), AuthClientErrorFunction (copy), EventStreamConstants (copy), GetUserByIdFunction (copy), Common (copy), FFlagLuaEnableGenreLandingDeeplink (copy), FetchGameMediaFunction (copy), GameMediaImageType (copy), LandingPageConstants (copy), GetSafeAreaSizeFunction (copy), UseLocalizationFunction (copy), UseTokensFunction (copy), EnableFoundationLogoInCustomizedInviteLandingPage (copy), FoundationModule (copy), CustomizedLandingPage (copy), Colors (copy), LoadableImage (copy), Text (copy), GetStandardSizeAvatarHeadShotRbxthumbFunction (copy), FFlagLuaEnableLandingPageTTIMeasurements (copy), AuthTimingUtil (copy), AuthPageloadFunction (copy), HttpService (copy), FullscreenPageWithSafeAreaModule (copy), CustomStaticLandingPageBackgroundModule (copy), CustomizedInviteLandingPageBackgroundModule (copy)
	local UseRoactServiceResult = UseRoactServiceFunction(RoactNetworking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(0)
	local UseStateResult1, UseStateResult2_1 = ReactModule.useState(nil)
	local UseStateResult3, UseStateResult2_2 = ReactModule.useState(nil)
	local UseStateResult4, UseStateResult2_3 = ReactModule.useState(nil)
	local Text1 = if p1.deepLinkData.universeId and p1.deepLinkData.universeId ~= 0 then tostring(p1.deepLinkData.universeId) else nil
	local Text2 = if p1.deepLinkData.inviterId then tostring(p1.deepLinkData.inviterId) else nil
	
	local function v35(Frame: Frame)
		-- upvalues: UseStateResult (copy), UseStateResult2 (copy)
		if UseStateResult ~= Frame.AbsoluteSize.Y then
			UseStateResult2(Frame.AbsoluteSize.Y)
		end
	end
	
	local function v36()
		-- upvalues: Text1 (copy), GetGameNameAndDescriptionFunction (upval), UseRoactServiceResult (copy), UseStateResult2_2 (copy), AuthClientErrorFunction (upval), EventStreamConstants (upval), Text2 (copy), GetUserByIdFunction (upval), UseStateResult2_3 (copy)
		if Text1 then
			GetGameNameAndDescriptionFunction(UseRoactServiceResult, Text1):andThen(function(Result)
				-- upvalues: UseStateResult2_2 (upval)
				UseStateResult2_2(Result.Name)
			end):catch(function(_)
				-- upvalues: AuthClientErrorFunction (upval), EventStreamConstants (upval), Text1 (upval)
				AuthClientErrorFunction(EventStreamConstants.Context.LandingScreenCustomizedInvite, EventStreamConstants.State.FetchGameInfoError, nil, Text1)
			end)
		end
		if Text2 then
			GetUserByIdFunction(UseRoactServiceResult, Text2):andThen(function(Result)
				-- upvalues: UseStateResult2_3 (upval)
				UseStateResult2_3(Result.displayName)
			end):catch(function(_)
				-- upvalues: AuthClientErrorFunction (upval), EventStreamConstants (upval), Text2 (upval)
				AuthClientErrorFunction(EventStreamConstants.Context.LandingScreenCustomizedInvite, EventStreamConstants.State.FetchUserInfoError, nil, Text2)
			end)
		end
	end
	
	local function v37(p2): string
		-- upvalues: Common (upval)
		return string.format(Common.IMAGE_ASSET_URL_TEMPLATE, p2)
	end
	
	local function v38()
		-- upvalues: UseStateResult1 (copy), v37 (copy), FFlagLuaEnableGenreLandingDeeplink (upval), Common (upval), p1 (copy)
		if UseStateResult1 then
			return v37(UseStateResult1)
		end
		if FFlagLuaEnableGenreLandingDeeplink then
			local GenreBackgroundAssetId = Common.GetGenreBackgroundAssetId(p1.deepLinkData.genre)
			
			if GenreBackgroundAssetId then
				return "rbxassetid://" .. GenreBackgroundAssetId
			end
		end
		if (not p1.deepLinkData.universeId or p1.deepLinkData.universeId == 0) and p1.deepLinkData.genre then
			local GenreBackgrounds = Common.GenreBackgrounds
			local Entry = ({
				["trending-in-rpg"] = "RPG",
				["trending-in-simulation"] = "Simulation",
				["trending-in-shooter"] = "Shooter",
				["trending-in-sports-and-racing"] = "SportsAndRacing"
			})[p1.deepLinkData.genre]
			
			if Entry and GenreBackgrounds[Entry] then
				return GenreBackgrounds[Entry].IMAGE
			end
		end
		return Common.DefaultBackground.IMAGE
	end
	
	ReactModule.useEffect(function()
		-- upvalues: Text1 (copy), FetchGameMediaFunction (upval), UseRoactServiceResult (copy), GameMediaImageType (upval), UseStateResult2_1 (copy), AuthClientErrorFunction (upval), EventStreamConstants (upval), v36 (copy)
		if Text1 then
			FetchGameMediaFunction(UseRoactServiceResult, Text1):andThen(function(Result)
				-- upvalues: GameMediaImageType (upval), UseStateResult2_1 (upval)
				for _, value in ipairs(Result) do
					if value.assetTypeId == GameMediaImageType.Image then
						UseStateResult2_1(value.imageId)
						break
					end
				end
			end):catch(function(_)
				-- upvalues: AuthClientErrorFunction (upval), EventStreamConstants (upval), Text1 (upval)
				AuthClientErrorFunction(EventStreamConstants.Context.LandingScreenCustomizedInvite, EventStreamConstants.State.FetchGameMediaError, nil, Text1)
			end)
		end
		v36()
	end, {})
	local ContentFocusedStyle = LandingPageConstants.ContentProps.ContentFocusedStyle
	local OffsetDelta = GetSafeAreaSizeFunction(p1.screenSize, p1.globalGuiInset).Y.Offset - p1.statusBarHeight
	local ScaledOffsetDelta = OffsetDelta * ContentFocusedStyle.BodyPositionYScale
	local ScaledOffsetDelta1 = OffsetDelta * ContentFocusedStyle.LogoPositionYScale
	local UseLocalizationResult = UseLocalizationFunction({
		invitedBy = if UseStateResult4 then {
			"Feature.Landing.Label.InvitedBy",
			name = UseStateResult4
		} else nil
	})
	local UseTokensResult = UseTokensFunction()
	local config = {
		Logo = if EnableFoundationLogoInCustomizedInviteLandingPage then ReactModule.createElement(FoundationModule.Image, {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Position = UDim2.new(0.5, 0, 0, ScaledOffsetDelta1),
			ScaleType = Enum.ScaleType.Fit,
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.7, 0, 0.7, 0),
			Image = Common.RobloxLogo.IMAGE,
			sizeConstraint = {
				MaxSize = Vector2.new(Common.RobloxLogo.MAX_WIDTH_SMALL, Common.RobloxLogo.MAX_WIDTH_SMALL / Common.RobloxLogo.ASPECT_RATIO)
			},
			aspectRatio = Common.RobloxLogo.ASPECT_RATIO
		}) else ReactModule.createElement("ImageLabel", {
			BackgroundTransparency = 1,
			ZIndex = 1,
			Position = UDim2.new(0.5, 0, 0, ScaledOffsetDelta1),
			AnchorPoint = Vector2.new(0.5, 0.5),
			Size = UDim2.new(0.7, 0, 0.7, 0),
			Image = Common.RobloxLogo.IMAGE
		}, {
			UISizeConstraint = ReactModule.createElement("UISizeConstraint", {
				MaxSize = Vector2.new(Common.RobloxLogo.MAX_WIDTH_SMALL, Common.RobloxLogo.MAX_WIDTH_SMALL / Common.RobloxLogo.ASPECT_RATIO)
			}),
			UIAspectRatioConstraint = ReactModule.createElement("UIAspectRatioConstraint", {
				AspectRatio = Common.RobloxLogo.ASPECT_RATIO,
				AspectType = Enum.AspectType.FitWithinMaxSize
			})
		}),
		ContentContainer = ReactModule.createElement("Frame", {
			BackgroundTransparency = 1,
			ZIndex = 2,
			Position = UDim2.new(0.5, 0, 0, ScaledOffsetDelta),
			Size = UDim2.new(1, 0, 1, -ScaledOffsetDelta),
			AnchorPoint = Vector2.new(0.5, 0)
		}, {
			UIListLayout = ReactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				FillDirection = Enum.FillDirection.Vertical,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				VerticalAlignment = Enum.VerticalAlignment.Bottom
			}),
			GameIconFrame = if Text1 then ReactModule.createElement("Frame", {
				BorderSizePixel = 0,
				LayoutOrder = 1,
				Size = UDim2.fromOffset(CustomizedLandingPage.GameIcon.SIZE, CustomizedLandingPage.GameIcon.SIZE),
				BackgroundColor3 = Colors.White
			}, {
				UICorner = ReactModule.createElement("UICorner", {
					CornerRadius = UDim.new(CustomizedLandingPage.GameIcon.CORNER_RADIUS, 0)
				}),
				UIListLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 10),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Vertical,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				GameIcon = ReactModule.createElement(LoadableImage, {
					BackgroundTransparency = 1,
					useShimmerAnimationWhileLoading = true,
					showFailedStateWhenLoadingFailed = true,
					shouldHandleReloads = true,
					LayoutOrder = 1,
					Size = UDim2.fromOffset(CustomizedLandingPage.GameIcon.SIZE - CustomizedLandingPage.GameIcon.PADDING, CustomizedLandingPage.GameIcon.SIZE - CustomizedLandingPage.GameIcon.PADDING),
					Image = string.format(CustomizedLandingPage.GameIcon.IMAGE_URI_TEMPLATE, Text1),
					cornerRadius = UDim.new(CustomizedLandingPage.GameIcon.CORNER_RADIUS, 0)
				})
			}) else nil,
			GameIconPadding = if Text1 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 2,
				Size = UDim2.new(1, 0, 0, 20)
			}) else nil,
			GameTitleText = if Text1 and UseStateResult3 then ReactModule.createElement(Text, {
				TextWrapped = true,
				LayoutOrder = 3,
				Text = UseStateResult3,
				textStyle = UseTokensResult.Color.Content.Emphasis,
				fontStyle = UseTokensResult.Typography.HeadingMedium,
				Size = UDim2.new(1, -40, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				TextXAlignment = Enum.TextXAlignment.Center,
				TextYAlignment = Enum.TextYAlignment.Bottom
			}) else nil,
			GameTitlePadding = if Text1 then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 4,
				Size = UDim2.new(1, 0, 0, 6)
			}) else nil,
			InviterTextFrame = if UseStateResult4 and p1.deepLinkData.inviterId then ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 5,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y
			}, {
				HorizontalLayout = ReactModule.createElement("UIListLayout", {
					Padding = UDim.new(0, 8),
					SortOrder = Enum.SortOrder.LayoutOrder,
					FillDirection = Enum.FillDirection.Horizontal,
					HorizontalAlignment = Enum.HorizontalAlignment.Center,
					VerticalAlignment = Enum.VerticalAlignment.Center
				}),
				InviterThumbnail = ReactModule.createElement(LoadableImage, {
					LayoutOrder = 1,
					useShimmerAnimationWhileLoading = true,
					shouldHandleReloads = true,
					Size = UDim2.new(0, 24, 0, 24),
					Image = GetStandardSizeAvatarHeadShotRbxthumbFunction((tostring(p1.deepLinkData.inviterId))),
					cornerRadius = UDim.new(0.5, 0)
				}),
				InviterText = ReactModule.createElement(Text, {
					LayoutOrder = 2,
					TextWrapped = true,
					Text = UseLocalizationResult.invitedBy,
					textStyle = UseTokensResult.Color.Content.Default,
					fontStyle = UseTokensResult.Typography.BodyMedium,
					AutomaticSize = Enum.AutomaticSize.XY,
					TextXAlignment = Enum.TextXAlignment.Center
				})
			}) else nil,
			InviterTextPadding = ReactModule.createElement("Frame", {
				BackgroundTransparency = 1,
				LayoutOrder = 6,
				Size = UDim2.new(1, 0, 0, 40)
			}),
			Content = ReactModule.createElement("Frame", {
				Position = ContentFocusedStyle.Position,
				Size = UDim2.new(1, 0, 0, 0),
				AutomaticSize = Enum.AutomaticSize.Y,
				AnchorPoint = ContentFocusedStyle.AnchorPoint,
				BackgroundTransparency = 1,
				LayoutOrder = 7,
				[ReactModule.Change.AbsoluteSize] = v35
			}, { p1.children })
		})
	}
	
	if FFlagLuaEnableLandingPageTTIMeasurements then
		local LandingPageLoadFinishResult = AuthTimingUtil.landingPageLoadFinish()
		
		if LandingPageLoadFinishResult then
			AuthPageloadFunction(EventStreamConstants.Context.LandingPageRender, HttpService:JSONEncode({
				variant = EventStreamConstants.Context.LandingScreenCustomizedInvite,
				timing = LandingPageLoadFinishResult
			}))
		end
	end
	return ReactModule.createElement(FullscreenPageWithSafeAreaModule, {
		includeStatusBar = true,
		buttonRef = p1.containerRef,
		renderFullscreenBackground = function(_)
			-- upvalues: FFlagLuaEnableGenreLandingDeeplink (upval), Common (upval), p1 (copy), ReactModule (upval), CustomStaticLandingPageBackgroundModule (upval), v38 (copy), CustomizedInviteLandingPageBackgroundModule (upval)
			return if FFlagLuaEnableGenreLandingDeeplink and Common.GetGenreBackgroundAssetId(p1.deepLinkData.genre) ~= nil then ReactModule.createElement(CustomStaticLandingPageBackgroundModule, { backgroundImage = v38() }) else ReactModule.createElement(CustomizedInviteLandingPageBackgroundModule, { backgroundImage = v38() })
		end
	}, {
		Contents = ReactModule.createElement("Frame", {
			BorderSizePixel = 0,
			BackgroundTransparency = 1,
			ZIndex = 2,
			Size = UDim2.new(1, 0, 1, 0)
		}, { config })
	})
end