local avatarExperienceCatalog = script:FindFirstAncestor("AvatarExperienceCatalog")
local normalize = require(avatarExperienceCatalog.Parent.AvatarExperienceCommon).Utils.normalize
local normalizeBoolean = normalize.normalizeBoolean
local normalizeString = normalize.normalizeString
local normalizeNumber = normalize.normalizeNumber
local normalizeStringToBoolean = normalize.normalizeStringToBoolean
local makeNormalizeTableFn = normalize.makeNormalizeTableFn
local makeNormalizeListFn = normalize.makeNormalizeListFn
local makeNormalizeUnionFn = normalize.makeNormalizeUnionFn
local makeNormalizeValueFn = normalize.makeNormalizeValueFn
local makeRequired = normalize.makeRequired
local _ = require(avatarExperienceCatalog.Models.WidgetListInfo)

local function _(p0) --[[ line: 27 | named "makeNormalizeResponsiveValueFn" ]]
	-- upvalues: makeNormalizeTableFn (ref)
	return makeNormalizeTableFn({
		default = p0,
		xSmall = p0,
		small = p0,
		medium = p0,
		large = p0,
		xLarge = p0,
		x2Large = p0,
		landscape = p0,
		portrait = p0
	})
end

local _ = function(p1) --[[ line: 41 | named "makeNormalizedThemeValueFn" ]]
	-- upvalues: makeNormalizeTableFn (ref)
	return makeNormalizeTableFn({ default = p1, light = p1, dark = p1 })
end

local var1 = makeNormalizeTableFn({
	default = normalizeNumber,
	xSmall = normalizeNumber,
	small = normalizeNumber,
	medium = normalizeNumber,
	large = normalizeNumber,
	xLarge = normalizeNumber,
	x2Large = normalizeNumber,
	landscape = normalizeNumber,
	portrait = normalizeNumber
})
local var2 = makeNormalizeTableFn({
	r = makeRequired(normalizeNumber),
	g = makeRequired(normalizeNumber),
	b = makeRequired(normalizeNumber)
})
local var3 = makeNormalizeTableFn({
	x = makeRequired(normalizeNumber),
	y = makeRequired(normalizeNumber)
})
local var4 = makeNormalizeTableFn({
	default = var3,
	xSmall = var3,
	small = var3,
	medium = var3,
	large = var3,
	xLarge = var3,
	x2Large = var3,
	landscape = var3,
	portrait = var3
})
local var5 = makeNormalizeListFn(makeNormalizeUnionFn({
	makeNormalizeTableFn({
		type = makeRequired(makeNormalizeValueFn({ "ImageBackground" })),
		color = var2,
		resourceIdentifier = makeNormalizeTableFn({
			default = normalizeString,
			xSmall = normalizeString,
			small = normalizeString,
			medium = normalizeString,
			large = normalizeString,
			xLarge = normalizeString,
			x2Large = normalizeString,
			landscape = normalizeString,
			portrait = normalizeString
		}),
		anchorPoint = var4,
		position = var4,
		transparency = var1
	}),
	makeNormalizeTableFn({
		type = makeRequired(makeNormalizeValueFn({ "GradientBackground" })),
		colorSequence = makeRequired(makeNormalizeListFn(makeNormalizeTableFn({
			time = makeRequired(normalizeNumber),
			color = makeRequired(var2)
		}))),
		rotation = normalizeNumber,
		transparency = makeNormalizeUnionFn({
			normalizeNumber,
			makeNormalizeListFn(makeNormalizeTableFn({
				time = makeRequired(normalizeNumber),
				number = makeRequired(normalizeNumber)
			}))
		}),
		offset = var3
	})
}))
local var6 = makeNormalizeTableFn({ default = var5, light = var5, dark = var5 })
local var7 = makeNormalizeTableFn({ backgroundLayers = var6 })
local var8 = makeNormalizeTableFn({
	backgroundLayers = var6,
	thumbnailAspectRatio = makeNormalizeUnionFn({
		makeNormalizeValueFn({ "Wide", "Tall", "Square" }),
		function(p2) --[[ line: 102 ]]
			return if p2 then tonumber(p2) else nil
		end
	})
})
local var9 = makeNormalizeListFn(makeNormalizeTableFn({
	contentType = makeNormalizeValueFn({ "ItemName", "AgentName", "Price", "PriceRange" })
}))
local var10 = makeNormalizeTableFn({
	continueBrowsingTitle = normalizeString,
	shouldUseDefaultTemplatesAcrossTabs = normalizeString,
	creatorNameTileFooterEnabled = normalizeString,
	hydrateOnlyVisibleItems = normalizeStringToBoolean,
	disableOrganicContentFetch = normalizeStringToBoolean
})
local var11 = makeNormalizeTableFn({
	type = makeRequired(makeNormalizeValueFn({ "Carousel" })),
	numItemsToShow = normalizeNumber,
	seeAllButton = normalizeBoolean,
	title = normalizeString,
	localizedTitle = normalizeString,
	description = normalizeString,
	localizedDescription = normalizeString,
	widgetStyle = var7,
	cardStyle = var8,
	itemFooters = var9,
	previewRows = var1,
	previewColumns = var1
})
local var12 = makeNormalizeTableFn({
	type = makeRequired(makeNormalizeValueFn({ "ItemGroup" })),
	seeAllButton = normalizeBoolean,
	title = normalizeString,
	localizedTitle = normalizeString,
	description = normalizeString,
	localizedDescription = normalizeString,
	widgetStyle = var7,
	cardStyle = var8,
	itemFooters = var9,
	previewRows = var1,
	previewColumns = var1
})
local var13 = makeNormalizeTableFn({
	id = makeRequired(normalizeString),
	type = makeRequired(normalizeString),
	content = makeRequired(makeNormalizeListFn(makeNormalizeUnionFn({
		makeNormalizeTableFn({
			id = makeRequired(normalizeNumber),
			type = makeRequired(makeNormalizeValueFn({ "Bundle" }))
		}),
		makeNormalizeTableFn({
			id = makeRequired(normalizeNumber),
			type = makeRequired(makeNormalizeValueFn({ "Asset" }))
		}),
		makeNormalizeTableFn({
			id = makeRequired(normalizeString),
			type = makeRequired(makeNormalizeValueFn({ "Look" })),
			displayProperties = makeNormalizeTableFn({ animatedAvatarEmoteAssetIds = normalizeString })
		})
	}))),
	template = makeRequired(makeNormalizeUnionFn({
		var12,
		var11,
		makeNormalizeTableFn({
			type = makeRequired(makeNormalizeValueFn({ "HeroUnit" })),
			numItemsToShow = normalizeNumber,
			seeAllButton = normalizeBoolean,
			title = normalizeString,
			localizedTitle = normalizeString,
			description = normalizeString,
			localizedDescription = normalizeString,
			widgetStyle = var7,
			cardStyle = var8,
			itemFooters = var9,
			previewRows = var1,
			previewColumns = var1,
			availableUntil = normalizeString
		})
	})),
	tagId = normalizeString
})

return makeNormalizeTableFn({
	configuration = makeNormalizeTableFn({
		customizedDataMap = var10,
		defaultItemCarouselTemplate = var11,
		defaultItemGroupTemplate = var12,
		defaultTemplate = var12
	}),
	widgets = function(p3) --[[ line: 215 ]]
		-- upvalues: var13 (ref)
		if typeof(p3) ~= "table" then
			return nil, nil
		end
		local t = {}
		local t_1 = {}
		
		for i, v in p3 do
			local var16, var17 = var13(v)
			table.insert(t_1, var17)
			t[tostring(tonumber(i) + 1)] = var16
		end
		return t, if next(t_1) then table.concat(t_1, " ") else nil
	end
})