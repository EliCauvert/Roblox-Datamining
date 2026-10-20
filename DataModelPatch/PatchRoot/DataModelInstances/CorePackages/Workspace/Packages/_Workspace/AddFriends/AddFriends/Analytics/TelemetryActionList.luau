local EventNamesModule = require(script.Parent.EventNames)
local Parent = script:FindFirstAncestor("AddFriends").Parent
local SocialLuaAnalyticsModule = require(Parent.SocialLuaAnalytics)
local SupportedTelemetryBackends = SocialLuaAnalyticsModule.Analytics.Enums.SupportedTelemetryBackends
local EventTypes = SocialLuaAnalyticsModule.Analytics.Enums.EventTypes
local Contexts = SocialLuaAnalyticsModule.Analytics.Enums.Contexts
local FFlagAddFriendsPageFAEUpsell = require(Parent.SharedFlags).FFlagAddFriendsPageFAEUpsell
local FFlagEnableSchoolEntry = require(Parent.SharedFlags).FFlagEnableSchoolEntry

return {
	defaults = {
		links = "",
		throttlingThousandths = game:DefineFastInt("AddFriendsPageAnalyticsThrottlingThousandths", 1000)
	},
	[EventNamesModule.AddFriendsPageLoadingTime] = {
		description = "Add friends page requests and recommendation promise loading time",
		lastUpdated = { 24, 6, 7 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryStat,
				dynamicCustomFields = {
					status = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.AFPUserTileLoadFromHomeCarousel] = if require(Parent.SharedFlags).FFlagAddFriendsTileLoadFromHomeCarouselAnalytics then {
		description = "Time from home-carousel Add Friends tile click to first user tile rendered on AFP",
		lastUpdated = { 26, 5, 6 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter },
			{ type = SupportedTelemetryBackends.RobloxTelemetryStat }
		}
	} else nil,
	[EventNamesModule.FAEModalImpression] = if FFlagAddFriendsPageFAEUpsell then {
		description = "FAE upsell modal seen on Add Friends Page",
		lastUpdated = { 26, 5, 14 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = { action = "FAEmodal", eventContext = Contexts.AddFriends }
			},
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				overrideName = function(): string
					return "FAEModalImpressionOnAFP"
				end
			}
		}
	} else nil,
	[EventNamesModule.PlayerTileClick] = {
		description = "Add friends page clicks on user tiles",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					namespace = function(p1)
						return p1
					end,
					entityType = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.RequestFriendshipBtnClick] = {
		description = "Add friends page clicks on Request Friendship button on user tile",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					namespace = function(p1)
						return p1
					end,
					entityType = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.AcceptFriendshipBtnClick] = {
		description = "Add friends page clicks on Accept Friendship button on user tile",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					namespace = function(p1)
						return p1
					end,
					entityType = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.DeclineFriendshipBtnClick] = {
		description = "Add friends page clicks on Decline Friendship button on user tile",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.RobloxTelemetryCounter,
				dynamicCustomFields = {
					namespace = function(p1)
						return p1
					end,
					entityType = function(p1)
						return p1
					end
				}
			}
		}
	},
	[EventNamesModule.UserSearchClick] = {
		description = "Add friends page clicks on user search input",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CIBtnClick] = {
		description = "Add friends page clicks on contact importer banner",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.QRCodeBtnClick] = {
		description = "Add friends page clicks on QRcode banner",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.CIBtnImpression] = {
		description = "Add friends page impressions for contact importer banner",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.QRCodeBtnImpression] = {
		description = "Add friends page impressions for QRcode banner",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.SchoolBtnClick] = if FFlagEnableSchoolEntry then {
		description = "Add friends page clicks on school entry tile",
		lastUpdated = { 26, 6, 8 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.SchoolBtnImpression] = if FFlagEnableSchoolEntry then {
		description = "Add friends page impressions for school entry tile",
		lastUpdated = { 26, 6, 8 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	} else nil,
	[EventNamesModule.ShowMoreBtnClick] = {
		description = "Add friends page clicks on Show More button",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.IgnoreAllBtnClick] = {
		description = "Add friends page clicks on Ignore All button",
		lastUpdated = { 24, 11, 13 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FriendingOSAEducationSubtitleImpression] = {
		description = "Friending OSA Education subtitle impression",
		lastUpdated = { 25, 6, 11 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TrustedContactsEducationalBannerClick] = {
		description = "Trusted Contacts Educational Banner Click",
		lastUpdated = { 25, 6, 11 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TrustedContactsEducationalBannerClose] = {
		description = "Trusted Contacts Educational Banner Close",
		lastUpdated = { 25, 6, 11 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.TrustedContactsEducationalBannerImpression] = {
		description = "Trusted Contacts Educational Banner Impression",
		lastUpdated = { 25, 6, 11 },
		backendsList = {
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FAEEligibleBannerClick] = {
		description = "FAE Eligible Banner Click on Add Friends Page",
		lastUpdated = { 26, 5, 15 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					action = "FAEEligibleBanner",
					btn = "Unlock",
					eventContext = Contexts.AddFriends
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FAEEligibleBannerClose] = {
		description = "FAE Eligible Banner Close on Add Friends Page",
		lastUpdated = { 26, 5, 15 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.ButtonClick
				end,
				staticCustomFields = {
					action = "FAEEligibleBanner",
					btn = "Close",
					eventContext = Contexts.AddFriends
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	},
	[EventNamesModule.FAEEligibleBannerImpression] = {
		description = "FAE Eligible Banner Impression on Add Friends Page",
		lastUpdated = { 26, 5, 15 },
		backendsList = {
			{
				type = SupportedTelemetryBackends.EventIngest,
				overrideName = function()
					-- upvalues: EventTypes (copy)
					return EventTypes.UserSeen
				end,
				staticCustomFields = {
					action = "FAEEligibleBanner",
					eventContext = Contexts.AddFriends
				}
			},
			{ type = SupportedTelemetryBackends.RobloxTelemetryCounter }
		}
	}
}