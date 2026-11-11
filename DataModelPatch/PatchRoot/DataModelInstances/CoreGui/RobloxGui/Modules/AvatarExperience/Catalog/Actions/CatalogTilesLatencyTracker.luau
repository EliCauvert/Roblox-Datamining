local RoduxModule = require(game:GetService("CorePackages").Packages.Rodux)
local AXCatalogPerfReduxReductionIXPModule = require(game:GetService("CoreGui").RobloxGui.Modules.AvatarExperience.Experiments.AXCatalogPerfReduxReductionIXP)

return {
	StartTracking = RoduxModule.makeActionCreator("StartTracking", function(SearchUuid)
		return {
			type = "StartTracking",
			searchUuid = SearchUuid,
			startTime = os.clock()
		}
	end),
	PercievedTrackingStarted = RoduxModule.makeActionCreator("PercievedTrackingStarted", function()
		return {
			type = "PercievedTrackingStarted",
			startPerceivedTime = os.clock()
		}
	end),
	EndTracking = RoduxModule.makeActionCreator("EndTracking", function(SearchUuid, EndTime)
		return {
			type = "EndTracking",
			searchUuid = SearchUuid,
			endTime = EndTime
		}
	end),
	AppendThumbnail = RoduxModule.makeActionCreator("AppendThumbnail", function(SearchUuid, ThumbnailId)
		return {
			type = "AppendThumbnail",
			searchUuid = SearchUuid,
			thumbnailId = ThumbnailId
		}
	end),
	SetLoadedThumbnail = RoduxModule.makeActionCreator("SetLoadedThumbnail", function(SearchUuid, ThumbnailId)
		return {
			type = "SetLoadedThumbnail",
			searchUuid = SearchUuid,
			thumbnailId = ThumbnailId
		}
	end),
	AppendThumbnails = RoduxModule.makeActionCreator("AppendThumbnails", function(ThumbnailsMap)
		-- upvalues: AXCatalogPerfReduxReductionIXPModule (copy)
		return if AXCatalogPerfReduxReductionIXPModule.isEnabled() then { type = "AppendThumbnails", thumbnailsMap = ThumbnailsMap } else {}
	end),
	SetLoadedThumbnails = RoduxModule.makeActionCreator("SetLoadedThumbnails", function(SearchUuid, ThumbnailIds)
		-- upvalues: AXCatalogPerfReduxReductionIXPModule (copy)
		return if AXCatalogPerfReduxReductionIXPModule.isEnabled() then {
			type = "SetLoadedThumbnails",
			searchUuid = SearchUuid,
			thumbnailIds = ThumbnailIds
		} else {}
	end)
}