local Parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local TModule = require(Parent.t)
local FFlagAddThumbnailSelectorReport = require(Parent.SharedFlags).FFlagAddThumbnailSelectorReport
local config = {
	componentType = TModule.literal("dropdown"),
	isOptional = TModule.boolean,
	formDataKey = TModule.string,
	requirementMessage = TModule.string,
	dropdown = TModule.interface({
		prompt = TModule.string,
		placeholder = TModule.string,
		items = TModule.array(TModule.interface({
			label = TModule.string,
			formDataValue = TModule.union(TModule.number, TModule.string)
		}))
	})
}
local config1 = {
	componentType = TModule.literal("freeComment"),
	isOptional = TModule.boolean,
	formDataKey = TModule.string,
	requirementMessage = TModule.string,
	freeComment = TModule.interface({ prompt = TModule.string, placeholder = TModule.string })
}
local config2 = {
	componentType = TModule.literal("paragraph"),
	isOptional = TModule.boolean,
	formDataKey = TModule.optional(TModule.string),
	paragraph = TModule.interface({
		text = TModule.string,
		links = TModule.optional(TModule.map(TModule.string, TModule.interface({
			label = TModule.string,
			linkButtonLabel = TModule.string,
			url = TModule.string
		})))
	})
}
local config3 = {
	componentType = TModule.literal("selector"),
	isOptional = TModule.boolean,
	formDataKey = TModule.string,
	requirementMessage = TModule.string,
	selector = TModule.interface({ prompt = TModule.string })
}
local config4 = {
	componentType = TModule.literal("link"),
	isOptional = TModule.boolean,
	formDataKey = TModule.optional(TModule.string),
	link = TModule.interface({
		label = TModule.string,
		linkButtonLabel = TModule.string,
		url = TModule.string
	})
}
local UnionResult = TModule.union(TModule.interface({
	type = TModule.literal("configurableComponentList"),
	configurableComponentList = TModule.interface({
		components = if FFlagAddThumbnailSelectorReport then TModule.array(TModule.union(TModule.interface(config), TModule.interface(config1), TModule.interface(config2), TModule.interface(config3), TModule.interface(config4))) else TModule.array(TModule.union(TModule.interface(config), TModule.interface(config1), TModule.interface(config2), TModule.interface(config4)))
	})
}))

return {
	AbuseReportBeduiContextStatus = {
		Loading = "Loading",
		Success = "Success",
		Error = "Error"
	},
	BeduiDataTypeInterface = {
		rootStepId = TModule.number,
		nodes = TModule.array(TModule.interface({
			title = TModule.string,
			subtitle = TModule.string,
			actionInfo = TModule.interface({
				actionLabel = TModule.optional(TModule.string),
				predefinedNextStepId = TModule.number,
				shouldSubmit = TModule.optional(TModule.boolean)
			}),
			stepId = TModule.number,
			internalStepName = TModule.string,
			isCompletionStep = TModule.optional(TModule.boolean),
			innerContentConfig = TModule.optional(UnionResult),
			footerContentConfig = TModule.optional(UnionResult)
		}))
	},
	ComponentType = {
		Dropdown = "dropdown",
		FreeComment = "freeComment",
		Paragraph = "paragraph",
		WebViewLink = "link",
		Selector = if FFlagAddThumbnailSelectorReport then "selector" else nil
	},
	ContentConfigType = {
		InnerContentConfig = "innerContentConfig",
		FooterContentConfig = "footerContentConfig"
	},
	InnerContentConfigType = { ConfigurableComponentList = "configurableComponentList" },
	NotificationType = { OpenCustomWebView = 20 }
}