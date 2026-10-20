local AvatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local Normalize = require(AvatarExperienceCatalog.Parent.AvatarExperienceCommon).Utils.normalize
local NormalizeBoolean = Normalize.normalizeBoolean
local NormalizeString = Normalize.normalizeString
local NormalizeNumber = Normalize.normalizeNumber
local NormalizeStringToBoolean = Normalize.normalizeStringToBoolean
local MakeNormalizeTableFnFunction = Normalize.makeNormalizeTableFn
local MakeNormalizeListFnFunction = Normalize.makeNormalizeListFn
local MakeNormalizeUnionFnFunction = Normalize.makeNormalizeUnionFn
local MakeNormalizeValueFnFunction = Normalize.makeNormalizeValueFn
local MakeRequiredFunction = Normalize.makeRequired
local _ = require(AvatarExperienceCatalog.Models.WidgetListInfo)

local function _(Default)
	-- upvalues: MakeNormalizeTableFnFunction (copy)
	return MakeNormalizeTableFnFunction({
		default = Default,
		xSmall = Default,
		small = Default,
		medium = Default,
		large = Default,
		xLarge = Default,
		x2Large = Default,
		landscape = Default,
		portrait = Default
	})
end

local _ = function(Dark)
	-- upvalues: MakeNormalizeTableFnFunction (copy)
	return MakeNormalizeTableFnFunction({ default = Dark, light = Dark, dark = Dark })
end

local NormalizeTableFn = MakeNormalizeTableFnFunction({
	default = NormalizeNumber,
	xSmall = NormalizeNumber,
	small = NormalizeNumber,
	medium = NormalizeNumber,
	large = NormalizeNumber,
	xLarge = NormalizeNumber,
	x2Large = NormalizeNumber,
	landscape = NormalizeNumber,
	portrait = NormalizeNumber
})
local NormalizeTableFn1 = MakeNormalizeTableFnFunction({
	r = MakeRequiredFunction(NormalizeNumber),
	g = MakeRequiredFunction(NormalizeNumber),
	b = MakeRequiredFunction(NormalizeNumber)
})
local NormalizeTableFn2 = MakeNormalizeTableFnFunction({
	x = MakeRequiredFunction(NormalizeNumber),
	y = MakeRequiredFunction(NormalizeNumber)
})
local NormalizeTableFn3 = MakeNormalizeTableFnFunction({
	default = NormalizeTableFn2,
	xSmall = NormalizeTableFn2,
	small = NormalizeTableFn2,
	medium = NormalizeTableFn2,
	large = NormalizeTableFn2,
	xLarge = NormalizeTableFn2,
	x2Large = NormalizeTableFn2,
	landscape = NormalizeTableFn2,
	portrait = NormalizeTableFn2
})
local NormalizeListFn = MakeNormalizeListFnFunction((MakeNormalizeUnionFnFunction({
	MakeNormalizeTableFnFunction({
		type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "ImageBackground" })),
		color = NormalizeTableFn1,
		resourceIdentifier = MakeNormalizeTableFnFunction({
			default = NormalizeString,
			xSmall = NormalizeString,
			small = NormalizeString,
			medium = NormalizeString,
			large = NormalizeString,
			xLarge = NormalizeString,
			x2Large = NormalizeString,
			landscape = NormalizeString,
			portrait = NormalizeString
		}),
		anchorPoint = NormalizeTableFn3,
		position = NormalizeTableFn3,
		transparency = NormalizeTableFn
	}),
	(MakeNormalizeTableFnFunction({
		type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "GradientBackground" })),
		colorSequence = MakeRequiredFunction(MakeNormalizeListFnFunction((MakeNormalizeTableFnFunction({
			time = MakeRequiredFunction(NormalizeNumber),
			color = MakeRequiredFunction(NormalizeTableFn1)
		})))),
		rotation = NormalizeNumber,
		transparency = MakeNormalizeUnionFnFunction({
			NormalizeNumber,
			MakeNormalizeListFnFunction((MakeNormalizeTableFnFunction({
				time = MakeRequiredFunction(NormalizeNumber),
				number = MakeRequiredFunction(NormalizeNumber)
			})))
		}),
		offset = NormalizeTableFn2
	}))
})))
local NormalizeTableFn4 = MakeNormalizeTableFnFunction({
	default = NormalizeListFn,
	light = NormalizeListFn,
	dark = NormalizeListFn
})
local NormalizeTableFn5 = MakeNormalizeTableFnFunction({ backgroundLayers = NormalizeTableFn4 })
local NormalizeTableFn6 = MakeNormalizeTableFnFunction({
	backgroundLayers = NormalizeTableFn4,
	thumbnailAspectRatio = MakeNormalizeUnionFnFunction({
		MakeNormalizeValueFnFunction({ "Wide", "Tall", "Square" }),
		function(p1)
			return if p1 then tonumber(p1) else nil
		end
	})
})
local NormalizeListFn1 = MakeNormalizeListFnFunction((MakeNormalizeTableFnFunction({
	contentType = MakeNormalizeValueFnFunction({ "ItemName", "AgentName", "Price", "PriceRange" })
})))
local NormalizeTableFn7 = MakeNormalizeTableFnFunction({
	continueBrowsingTitle = NormalizeString,
	shouldUseDefaultTemplatesAcrossTabs = NormalizeString,
	creatorNameTileFooterEnabled = NormalizeString,
	hydrateOnlyVisibleItems = NormalizeStringToBoolean,
	disableOrganicContentFetch = NormalizeStringToBoolean
})
local NormalizeTableFn8 = MakeNormalizeTableFnFunction({
	type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "Carousel" })),
	numItemsToShow = NormalizeNumber,
	seeAllButton = NormalizeBoolean,
	title = NormalizeString,
	localizedTitle = NormalizeString,
	description = NormalizeString,
	localizedDescription = NormalizeString,
	widgetStyle = NormalizeTableFn5,
	cardStyle = NormalizeTableFn6,
	itemFooters = NormalizeListFn1,
	previewRows = NormalizeTableFn,
	previewColumns = NormalizeTableFn
})
local NormalizeTableFn9 = MakeNormalizeTableFnFunction({
	type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "ItemGroup" })),
	seeAllButton = NormalizeBoolean,
	title = NormalizeString,
	localizedTitle = NormalizeString,
	description = NormalizeString,
	localizedDescription = NormalizeString,
	widgetStyle = NormalizeTableFn5,
	cardStyle = NormalizeTableFn6,
	itemFooters = NormalizeListFn1,
	previewRows = NormalizeTableFn,
	previewColumns = NormalizeTableFn
})
local NormalizeTableFn10 = MakeNormalizeTableFnFunction({
	type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "HeroUnit" })),
	numItemsToShow = NormalizeNumber,
	seeAllButton = NormalizeBoolean,
	title = NormalizeString,
	localizedTitle = NormalizeString,
	description = NormalizeString,
	localizedDescription = NormalizeString,
	widgetStyle = NormalizeTableFn5,
	cardStyle = NormalizeTableFn6,
	itemFooters = NormalizeListFn1,
	previewRows = NormalizeTableFn,
	previewColumns = NormalizeTableFn,
	availableUntil = NormalizeString
})
local NormalizeTableFn11 = MakeNormalizeTableFnFunction({
	customizedDataMap = NormalizeTableFn7,
	defaultItemCarouselTemplate = NormalizeTableFn8,
	defaultItemGroupTemplate = NormalizeTableFn9,
	defaultTemplate = NormalizeTableFn9
})
local NormalizeTableFn111 = MakeNormalizeTableFnFunction({
	id = MakeRequiredFunction(NormalizeString),
	type = MakeRequiredFunction(NormalizeString),
	content = MakeRequiredFunction((MakeNormalizeListFnFunction(MakeNormalizeUnionFnFunction({
		MakeNormalizeTableFnFunction({
			id = MakeRequiredFunction(NormalizeNumber),
			type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "Bundle" }))
		}),
		MakeNormalizeTableFnFunction({
			id = MakeRequiredFunction(NormalizeNumber),
			type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "Asset" }))
		}),
		(MakeNormalizeTableFnFunction({
			id = MakeRequiredFunction(NormalizeString),
			type = MakeRequiredFunction(MakeNormalizeValueFnFunction({ "Look" })),
			displayProperties = MakeNormalizeTableFnFunction({ animatedAvatarEmoteAssetIds = NormalizeString })
		}))
	})))),
	template = MakeRequiredFunction(MakeNormalizeUnionFnFunction({ NormalizeTableFn9, NormalizeTableFn8, NormalizeTableFn10 })),
	tagId = NormalizeString
})

return (MakeNormalizeTableFnFunction({
	configuration = NormalizeTableFn11,
	widgets = function(List)
		-- upvalues: NormalizeTableFn111 (copy)
		if typeof(List) ~= "table" then
			return nil, nil
		end
		local t = {}
		local List1 = {}
		
		for i, value in List do
			local NormalizeTableFnResult, NormalizeTableFnResult2 = NormalizeTableFn111(value)
			table.insert(List1, NormalizeTableFnResult2)
			t[tostring(tonumber(i) + 1)] = NormalizeTableFnResult
		end
		return t, if next(List1) then table.concat(List1, " ") else nil
	end
}))