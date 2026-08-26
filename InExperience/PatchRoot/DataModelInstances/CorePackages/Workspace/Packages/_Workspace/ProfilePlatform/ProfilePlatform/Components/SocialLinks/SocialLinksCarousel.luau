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
local var1 = if fFlagLuaAppAddSocialLinkClickTelemetryToEdp then nil else game:DefineFastInt("SocialLinkClickTelemetryThrottlePermyriad", 0)

return function(p1)
	-- upvalues: useProfileWrapperContextModule (ref), useRoactService (ref), appLinking (ref), reactModule (ref), useLocalization (ref), textKeysModule (ref), useDynamicSizeMarginModule (ref), useCollectionLayoutParams (ref), collectionItemSize (ref), fFlagLuaAppAddSocialLinkClickTelemetryToEdp (ref), sendSocialLinkClickEvent (ref), var1 (ref), telemetryService (ref), socialLinkTileModule (ref), collectionCarousel (ref)
	local var2 = useProfileWrapperContextModule()
	local openLeaveRobloxAlertUIBlox = var2.navigateTo.openLeaveRobloxAlertUIBlox
	local closeLeaveRobloxAlert = var2.navigateTo.closeLeaveRobloxAlert
	local var3 = useRoactService(appLinking)
	local var4, var5 = reactModule.useState(nil)
	local var6 = reactModule.useRef(nil)
	local var7 = useLocalization({ title = textKeysModule.SocialMedia })
	local var8, var9 = useDynamicSizeMarginModule()
	local var10 = useCollectionLayoutParams(collectionItemSize.XSmall, var4, true, { sideMargin = var8 })
	local var11 = reactModule.useCallback(function(p2)
		return p2 + 36
	end, {})
	
	local _ = function(p2, p3)
		-- upvalues: fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var2 (ref), var1 (copy), telemetryService (copy), var3 (ref), closeLeaveRobloxAlert (ref)
		return function()
			-- upvalues: fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var2 (copy), p2 (ref), p3 (ref), var1 (copy), telemetryService (copy), var3 (copy), closeLeaveRobloxAlert (copy)
			if fFlagLuaAppAddSocialLinkClickTelemetryToEdp then
				sendSocialLinkClickEvent({
					assignment_type = "group",
					social_link_display_type = "badge",
					assignment_id = var2.profileId,
					social_link_type = p2,
					social_link_url = p3
				})
			else
				telemetryService:LogEvent({
					eventName = "socialLinkClickEvent",
					description = "Event fired from the client every time a social link is clicked",
					links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
					backends = { "EventIngest" },
					throttlingPercentage = var1,
					lastUpdated = { 25, 5, 20 }
				}, {
					customFields = {
						assignment_type = "group",
						social_link_display_type = "badge",
						assignment_id = var2.profileId,
						social_link_type = p2,
						social_link_url = p3
					}
				})
			end
			if var3 then
				var3:openURL(p3):andThen(function(p4)
					-- upvalues: var3 (copy), p3 (copy)
					if p4 == false then
						var3:openURL(p3)
					end
				end)
			end
			if closeLeaveRobloxAlert then
				closeLeaveRobloxAlert()
			end
		end
	end
	
	local var12 = reactModule.useCallback(function(p2)
		-- upvalues: openLeaveRobloxAlertUIBlox (ref), var3 (ref), fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var2 (ref), var1 (copy), telemetryService (copy), closeLeaveRobloxAlert (ref)
		return function()
			-- upvalues: openLeaveRobloxAlertUIBlox (copy), var3 (copy), p2 (ref), fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var2 (copy), var1 (copy), telemetryService (copy), closeLeaveRobloxAlert (copy)
			if openLeaveRobloxAlertUIBlox and var3 and p2.url then
				local key = p2.key
				local url = p2.url
				openLeaveRobloxAlertUIBlox(function()
					-- upvalues: fFlagLuaAppAddSocialLinkClickTelemetryToEdp (copy), sendSocialLinkClickEvent (copy), var2 (copy), key (ref), url (ref), var1 (copy), telemetryService (copy), var3 (copy), closeLeaveRobloxAlert (copy)
					if fFlagLuaAppAddSocialLinkClickTelemetryToEdp then
						sendSocialLinkClickEvent({
							assignment_type = "group",
							social_link_display_type = "badge",
							assignment_id = var2.profileId,
							social_link_type = key,
							social_link_url = url
						})
					else
						telemetryService:LogEvent({
							eventName = "socialLinkClickEvent",
							description = "Event fired from the client every time a social link is clicked",
							links = "https://github.rbx.com/Roblox/proto-schemas/blob/master/production/eventstream/usercommunities/social_link_click_event.proto",
							backends = { "EventIngest" },
							throttlingPercentage = var1,
							lastUpdated = { 25, 5, 20 }
						}, {
							customFields = {
								assignment_type = "group",
								social_link_display_type = "badge",
								assignment_id = var2.profileId,
								social_link_type = key,
								social_link_url = url
							}
						})
					end
					if var3 then
						var3:openURL(url):andThen(function(p3)
							-- upvalues: var3 (copy), url (copy)
							if p3 == false then
								var3:openURL(url)
							end
						end)
					end
					if closeLeaveRobloxAlert then
						closeLeaveRobloxAlert()
					end
				end)
			end
		end
	end, { openLeaveRobloxAlertUIBlox, var3 })
	
	return reactModule.createElement("Frame", {
		AutomaticSize = Enum.AutomaticSize.Y,
		Size = UDim2.new(1, 0, 0, 0),
		BackgroundTransparency = 1,
		LayoutOrder = p1.layoutOrder,
		[reactModule.Change.AbsoluteSize] = var9
	}, {
		UIPadding = reactModule.createElement("UIPadding", {
			PaddingLeft = UDim.new(0, 0),
			PaddingRight = UDim.new(0, 0)
		}),
		CollectionCarousel = reactModule.createElement(collectionCarousel, {
			LayoutOrder = 1,
			containerRef = var5,
			scrollingFrameRef = var6,
			title = var7.title,
			items = p1.items,
			renderItem = reactModule.useCallback(function(p2, p3, _)
				-- upvalues: reactModule (copy), socialLinkTileModule (copy), var12 (ref)
				return reactModule.createElement(socialLinkTileModule, {
					tileSize = 80,
					name = p2.name,
					icon = p2.logo,
					onActivated = var12(p2),
					layoutOrder = p3
				}), p2.key
			end, { var12 }),
			getItemHeight = var11,
			numColumns = var10.numColumns,
			fractionalItemAmount = var10.fractionalItemAmount,
			columnGap = var10.columnGap,
			sideMargin = var10.sideMargin,
			maxItemsToShow = var10.maxTilesToShow,
			thresholdFromEnd = var10.loadMoreThreshold
		})
	})
end