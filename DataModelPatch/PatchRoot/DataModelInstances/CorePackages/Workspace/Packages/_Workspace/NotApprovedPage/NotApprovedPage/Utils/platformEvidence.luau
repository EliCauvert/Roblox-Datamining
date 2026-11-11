local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local TModule = require(NotApprovedPage.Parent.t)
local IntersectionResult = if require(NotApprovedPage.Flags.FFlagNapPublicEvidenceTranslationKeys) then TModule.intersection(TModule.interface({
	type = TModule.literal("text"),
	labelKey = TModule.match(".+"),
	text = TModule.optional(TModule.match(".+")),
	textKey = TModule.optional(TModule.match(".+")),
	textKeyParameters = TModule.optional(TModule.table)
}), function(p1)
	if not p1.text and not p1.textKey then
		return false, "textElement must have at least one of 'text' or 'textKey'"
	elseif p1.textKeyParameters and not p1.textKey then
		return false, "textKeyParameters requires textKey to be present"
	else
		return true, ""
	end
end) else TModule.interface({
	type = TModule.literal("text"),
	text = TModule.match(".+"),
	labelKey = TModule.match(".+")
})
local PlatformEvidenceModule = {
	validateViolation = TModule.interface({
		evidence = TModule.interface({
			type = TModule.literal("platform"),
			elements = TModule.table,
			displayMeta = TModule.optional(TModule.interface({
				lowercaseKey = TModule.match(".+"),
				capitalizedKey = TModule.match(".+"),
				icon = TModule.match(".+")
			}))
		}),
		abuseTypeTranslationKeys = TModule.table,
		uid = TModule.match(".+")
	}),
	checkElementIsVisible = TModule.union(IntersectionResult),
	checkElementIsValid = TModule.union(IntersectionResult, TModule.interface({
		type = TModule.literal("timestamp"),
		labelKey = TModule.match(".+"),
		unix = TModule.numberMin(1)
	}), (TModule.interface({
		type = TModule.literal("image"),
		labelKey = TModule.match(".+"),
		url = TModule.match(".+"),
		altLabelKey = TModule.optional(TModule.match(".+"))
	})))
}

function PlatformEvidenceModule.filterForVisibleElements(Elements)
	-- upvalues: PlatformEvidenceModule (copy)
	local List = {}
	
	for _, element in Elements do
		if PlatformEvidenceModule.checkElementIsValid(element) and PlatformEvidenceModule.checkElementIsVisible(element) then
			table.insert(List, element)
		end
	end
	return List
end

function PlatformEvidenceModule.isVisibleInView(p1): boolean
	-- upvalues: PlatformEvidenceModule (copy)
	return if PlatformEvidenceModule.validateViolation(p1) and #p1.evidence.elements ~= 0 then #PlatformEvidenceModule.filterForVisibleElements(p1.evidence.elements) > 0 else false
end

return PlatformEvidenceModule