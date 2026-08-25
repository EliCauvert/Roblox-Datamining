local profilePlatform = script:FindFirstAncestor("ProfilePlatform")
local telemetryService = game:GetService("TelemetryService")
local parent = profilePlatform.Parent
local reactModule = require(parent.React)
local collectionViewsModule = require(parent.CollectionViews)
local useRoactService = require(parent.RobloxAppHooks).useRoactService
local appLinking = require(parent.RoactServiceTags).AppLinking
local useLocalization = require(parent.Localization).Hooks.useLocalization
local socialLinkTileModule = require(profilePlatform.Components.SocialLinks.SocialLinkTile)
local useProfileWrapperContextModule = require(profilePlatform.Contexts.useProfileWrapperContext)
local textKeysModule = require(profilePlatform.Common.TextKeys)
local useDynamicSizeMarginModule = require(profilePlatform.Hooks.useDynamicSizeMargin)
local sendSocialLinkClickEvent = require(parent.DiscoveryAnalytics).Events.sendSocialLinkClickEvent
local collectionCarousel = collectionViewsModule.CollectionCarousel
local useCollectionLayoutParams = collectionViewsModule.useCollectionLayoutParams
local collectionItemSize = collectionViewsModule.CollectionViewTypes.CollectionItemSize
local fFlagLuaAppAddSocialLinkClickTelemetryToEdp = require(parent.SharedFlags).FFlagLuaAppAddSocialLinkClickTelemetryToEdp
local var8 = if fFlagLuaAppAddSocialLinkClickTelemetryToEdp then nil else game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0)

return function(p0)
	-- upvalues: useProfileWrapperContextModule (ref), useRoactService (ref), appLinking (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), useDynamicSizeMarginModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), fFlagLuaAppAddSocialLinkClickTelemetryToEdp (ref), sendSocialLinkClickEvent (ref), var8 (ref), telemetryService (ref), socialLinkTileModule (ref), collectionCarousel (ref)
	local var9 = useProfileWrapperContextModule()
	local openLeaveRobloxAlertUIBlox = var9.navigateTo.openLeaveRobloxAlertUIBlox
	local closeLeaveRobloxAlert = var9.navigateTo.closeLeaveRobloxAlert
	local var10 = useRoactService(appLinking)
	local var11, var12 = reactModule.useState(nil)
	local var13 = reactModule.useRef(nil)
	local var14 = useLocalization({ title = textKeysModule.SocialMedia })
	local var15, var16 = useDynamicSizeMarginModule()
	local var17 = useCollectionLayoutParams(collectionItemSize.XSmall, var11, true, { sideMargin = var15 })
	local var18 = reactModule.useCallback(function(p1)
		return p1 + 36
	end, {})
	
	local _ = function(p2, p3)
		-- upvalues: fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var9 (ref), var8 (copy), telemetryService (copy), var10 (ref), closeLeaveRobloxAlert (ref)
		return function()
			-- upvalues: fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var9 (copy), p2 (ref), p3 (ref), var8 (copy), telemetryService (copy), var10 (copy), closeLeaveRobloxAlert (copy)
			if fFlagLuaAppAddSocialLinkClickTelemetryToEdp then
				sendSocialLinkClickEvent({
					assignment_type = "group",
					social_link_display_type = "badge",
					assignment_id = var9.profileId,
					social_link_type = p2,
					social_link_url = p3
				})
			else
				telemetryService:LogEvent({
					eventName = "socialLinkClickEvent",
					description = "Event fired from the client every time a social link is clicked",
					links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
					backends = { "EventIngest" },
					throttlingPercentage = var8,
					lastUpdated = { 25, 5, 20 }
				}, {
					customFields = {
						assignment_type = "group",
						social_link_display_type = "badge",
						assignment_id = var9.profileId,
						social_link_type = p2,
						social_link_url = p3
					}
				})
			end
			if var10 then
				var10:openURL(p3):andThen(function(p4)
					-- upvalues: var10 (copy), p3 (copy)
					if p4 == false then
						var10:openURL(p3)
					end
				end)
			end
			if closeLeaveRobloxAlert then
				closeLeaveRobloxAlert()
			end
		end
	end
	
	local var19 = reactModule.useCallback(function(p5)
		-- upvalues: openLeaveRobloxAlertUIBlox (ref), var10 (ref), fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var9 (ref), var8 (copy), telemetryService (copy), closeLeaveRobloxAlert (ref)
		return function()
			-- upvalues: openLeaveRobloxAlertUIBlox (copy), var10 (copy), p5 (ref), fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var9 (copy), var8 (copy), telemetryService (copy), closeLeaveRobloxAlert (copy)
			if openLeaveRobloxAlertUIBlox and var10 and p5.url then
				local key = p5.key
				local url = p5.url
				openLeaveRobloxAlertUIBlox(function()
					-- upvalues: fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var9 (copy), key (ref), url (ref), var8 (copy), telemetryService (copy), var10 (copy), closeLeaveRobloxAlert (copy)
					if fFlagLuaAppAddSocialLinkClickTelemetryToEdp then
						sendSocialLinkClickEvent({
							assignment_type = "group",
							social_link_display_type = "badge",
							assignment_id = var9.profileId,
							social_link_type = key,
							social_link_url = url
						})
					else
						telemetryService:LogEvent({
							eventName = "socialLinkClickEvent",
							description = "Event fired from the client every time a social link is clicked",
							links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
							backends = { "EventIngest" },
							throttlingPercentage = var8,
							lastUpdated = { 25, 5, 20 }
						}, {
							customFields = {
								assignment_type = "group",
								social_link_display_type = "badge",
								assignment_id = var9.profileId,
								social_link_type = key,
								social_link_url = url
							}
						})
					end
					if var10 then
						var10:openURL(url):andThen(function(p6)
							-- upvalues: var10 (copy), url (copy)
							if p6 == false then
								var10:openURL(url)
							end
						end)
					end
					if closeLeaveRobloxAlert then
						closeLeaveRobloxAlert()
					end
				end)
			end
		end
	end, { openLeaveRobloxAlertUIBlox, var10 })
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = p0.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var16
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var12,
			scrollingFrameRef = var13,
			title = var14.title,
			items = p0.items,
			renderItem = reactModule.useCallback(function(p7, p8, _)
				-- upvalues: reactModule (copy), socialLinkTileModule (copy), var19 (ref)
				return reactModule.createElement(socialLinkTileModule, {
					tileSize = 80,
					name = p7.name,
					icon = p7.logo,
					onActivated = var19(p7),
					layoutOrder = p8
				}), p7.key
			end, { var19 }),
			getItemHeight = var18,
			numColumns = var17.numColumns,
			fractionalItemAmount = var17.fractionalItemAmount,
			columnGap = var17.columnGap,
			sideMargin = var17.sideMargin,
			maxItemsToShow = var17.maxTilesToShow,
			thresholdFromEnd = var17.loadMoreThreshold
		})
	})
end