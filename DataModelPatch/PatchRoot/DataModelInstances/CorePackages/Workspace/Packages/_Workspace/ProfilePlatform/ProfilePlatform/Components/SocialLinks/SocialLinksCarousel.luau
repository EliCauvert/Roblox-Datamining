local ProfilePlatform = script:FindFirstAncestor("ProfilePlatform")
local TelemetryService = game:GetService("TelemetryService")
local Parent = ProfilePlatform.Parent
local ReactModule = require(Parent.React)
local CollectionViewsModule = require(Parent.CollectionViews)
local UseRoactServiceFunction = require(Parent.RobloxAppHooks).useRoactService
local AppLinking = require(Parent.RoactServiceTags).AppLinking
local UseLocalizationFunction = require(Parent.Localization).Hooks.useLocalization
local SocialLinkTileModule = require(ProfilePlatform.Components.SocialLinks.SocialLinkTile)
local UseProfileWrapperContextModule = require(ProfilePlatform.Contexts.useProfileWrapperContext)
local TextKeysModule = require(ProfilePlatform.Common.TextKeys)
local UseDynamicSizeMarginModule = require(ProfilePlatform.Hooks.useDynamicSizeMargin)
local SendSocialLinkClickEventFunction = require(Parent.DiscoveryAnalytics).Events.sendSocialLinkClickEvent
local CollectionCarousel = CollectionViewsModule.CollectionCarousel
local UseCollectionLayoutParamsFunction = CollectionViewsModule.useCollectionLayoutParams
local CollectionItemSize = CollectionViewsModule.CollectionViewTypes.CollectionItemSize
local FFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(Parent.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local SocialLinkClickTelemetryThrottlePermyriad = if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then nil else game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0)

return function(p1)
	-- upvalues: UseProfileWrapperContextModule (copy), UseRoactServiceFunction (copy), AppLinking (copy), ReactModule (copy), UseLocalizationFunction (copy), TextKeysModule (copy), UseDynamicSizeMarginModule (copy), UseCollectionLayoutParamsFunction (copy), CollectionItemSize (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), SendSocialLinkClickEventFunction (copy), SocialLinkClickTelemetryThrottlePermyriad (copy), TelemetryService (copy), SocialLinkTileModule (copy), CollectionCarousel (copy)
	local UseProfileWrapperContextModuleResult = UseProfileWrapperContextModule()
	local OpenLeaveRobloxAlertUIBloxFunction = UseProfileWrapperContextModuleResult.navigateTo.openLeaveRobloxAlertUIBlox
	local CloseLeaveRobloxAlertFunction = UseProfileWrapperContextModuleResult.navigateTo.closeLeaveRobloxAlert
	local UseRoactServiceResult = UseRoactServiceFunction(AppLinking)
	local UseStateResult, UseStateResult2 = ReactModule.useState(nil)
	local UseRefResult = ReactModule.useRef(nil)
	local UseLocalizationResult = UseLocalizationFunction({ title = TextKeysModule.SocialMedia })
	local UseDynamicSizeMarginModuleResult, UseDynamicSizeMarginModuleResult2 = UseDynamicSizeMarginModule()
	local UseCollectionLayoutParamsResult = UseCollectionLayoutParamsFunction(CollectionItemSize.XSmall, UseStateResult, true, { sideMargin = UseDynamicSizeMarginModuleResult })
	
	local function _(Social_link_type, Social_link_url)
		-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), UseProfileWrapperContextModuleResult (copy), SocialLinkClickTelemetryThrottlePermyriad (upval), TelemetryService (upval), UseRoactServiceResult (copy), CloseLeaveRobloxAlertFunction (copy)
		return function()
			-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), UseProfileWrapperContextModuleResult (upval), Social_link_type (copy), Social_link_url (copy), SocialLinkClickTelemetryThrottlePermyriad (upval), TelemetryService (upval), UseRoactServiceResult (upval), CloseLeaveRobloxAlertFunction (upval)
			if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
				SendSocialLinkClickEventFunction({
					assignment_type = "group",
					social_link_display_type = "badge",
					assignment_id = UseProfileWrapperContextModuleResult.profileId,
					social_link_type = Social_link_type,
					social_link_url = Social_link_url
				})
			else
				TelemetryService:LogEvent({
					eventName = "socialLinkClickEvent",
					description = "Event fired from the client every time a social link is clicked",
					links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
					backends = { "EventIngest" },
					throttlingPercentage = SocialLinkClickTelemetryThrottlePermyriad,
					lastUpdated = { 25, 5, 20 }
				}, {
					customFields = {
						assignment_type = "group",
						social_link_display_type = "badge",
						assignment_id = UseProfileWrapperContextModuleResult.profileId,
						social_link_type = Social_link_type,
						social_link_url = Social_link_url
					}
				})
			end
			if UseRoactServiceResult then
				UseRoactServiceResult:openURL(Social_link_url):andThen(function(Enabled)
					-- upvalues: UseRoactServiceResult (upval), Social_link_url (upval)
					if Enabled == false then
						UseRoactServiceResult:openURL(Social_link_url)
					end
				end)
			end
			if CloseLeaveRobloxAlertFunction then
				CloseLeaveRobloxAlertFunction()
			end
		end
	end
	
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: OpenLeaveRobloxAlertUIBloxFunction (copy), UseRoactServiceResult (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), UseProfileWrapperContextModuleResult (copy), SocialLinkClickTelemetryThrottlePermyriad (upval), TelemetryService (upval), CloseLeaveRobloxAlertFunction (copy)
		return function()
			-- upvalues: OpenLeaveRobloxAlertUIBloxFunction (upval), UseRoactServiceResult (upval), p2 (copy), FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), UseProfileWrapperContextModuleResult (upval), SocialLinkClickTelemetryThrottlePermyriad (upval), TelemetryService (upval), CloseLeaveRobloxAlertFunction (upval)
			if OpenLeaveRobloxAlertUIBloxFunction and UseRoactServiceResult and p2.url then
				local Key = p2.key
				local Url = p2.url
				OpenLeaveRobloxAlertUIBloxFunction(function()
					-- upvalues: FFlagLuaAppAddSocialLinkClickTelemetryToEdp (upval), SendSocialLinkClickEventFunction (upval), UseProfileWrapperContextModuleResult (upval), Key (copy), Url (copy), SocialLinkClickTelemetryThrottlePermyriad (upval), TelemetryService (upval), UseRoactServiceResult (upval), CloseLeaveRobloxAlertFunction (upval)
					if FFlagLuaAppAddSocialLinkClickTelemetryToEdp then
						SendSocialLinkClickEventFunction({
							assignment_type = "group",
							social_link_display_type = "badge",
							assignment_id = UseProfileWrapperContextModuleResult.profileId,
							social_link_type = Key,
							social_link_url = Url
						})
					else
						TelemetryService:LogEvent({
							eventName = "socialLinkClickEvent",
							description = "Event fired from the client every time a social link is clicked",
							links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
							backends = { "EventIngest" },
							throttlingPercentage = SocialLinkClickTelemetryThrottlePermyriad,
							lastUpdated = { 25, 5, 20 }
						}, {
							customFields = {
								assignment_type = "group",
								social_link_display_type = "badge",
								assignment_id = UseProfileWrapperContextModuleResult.profileId,
								social_link_type = Key,
								social_link_url = Url
							}
						})
					end
					if UseRoactServiceResult then
						UseRoactServiceResult:openURL(Url):andThen(function(Enabled)
							-- upvalues: UseRoactServiceResult (upval), Url (upval)
							if Enabled == false then
								UseRoactServiceResult:openURL(Url)
							end
						end)
					end
					if CloseLeaveRobloxAlertFunction then
						CloseLeaveRobloxAlertFunction()
					end
				end)
			end
		end
	end, {
		OpenLeaveRobloxAlertUIBloxFunction,
		UseRoactServiceResult
	})
	
	return ReactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[ReactModule.Change.AbsoluteSize] = UseDynamicSizeMarginModuleResult2
	}, {
		UIPadding = ReactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = ReactModule.createElement(CollectionCarousel, {
			LayoutOrder = 1,
			containerRef = UseStateResult2,
			scrollingFrameRef = UseRefResult,
			title = UseLocalizationResult.title,
			items = p1.items,
			renderItem = ReactModule.useCallback(function(p2, LayoutOrder, _)
				-- upvalues: ReactModule (upval), SocialLinkTileModule (upval), UseResult (copy)
				return ReactModule.createElement(SocialLinkTileModule, {
					tileSize = 80,
					name = p2.name,
					icon = p2.logo,
					onActivated = UseResult(p2),
					layoutOrder = LayoutOrder
				}), p2.key
			end, { UseResult }),
			getItemHeight = ReactModule.useCallback(function(p2: number): number
				return p2 + 36
			end, {}),
			numColumns = UseCollectionLayoutParamsResult.numColumns,
			fractionalItemAmount = UseCollectionLayoutParamsResult.fractionalItemAmount,
			columnGap = UseCollectionLayoutParamsResult.columnGap,
			sideMargin = UseCollectionLayoutParamsResult.sideMargin,
			maxItemsToShow = UseCollectionLayoutParamsResult.maxTilesToShow,
			thresholdFromEnd = UseCollectionLayoutParamsResult.loadMoreThreshold
		})
	})
end