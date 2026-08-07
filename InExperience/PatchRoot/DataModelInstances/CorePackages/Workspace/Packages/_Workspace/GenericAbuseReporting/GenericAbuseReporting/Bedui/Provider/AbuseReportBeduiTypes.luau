local parent = script:FindFirstAncestor("GenericAbuseReporting").Parent
local tModule = require(parent.t)
local fFlagAddThumbnailSelectorReport = require(parent.SharedFlags).FFlagAddThumbnailSelectorReport
local t = {
	componentType = tModule.literal("dropdown"),
	isOptional = tModule.boolean,
	formDataKey = tModule.string,
	requirementMessage = tModule.string,
	dropdown = tModule.interface({
		prompt = tModule.string,
		placeholder = tModule.string,
		items = tModule.array(tModule.interface({
			label = tModule.string,
			formDataValue = tModule.union(tModule.number, tModule.string)
		}))
	})
}
local t_1 = {
	componentType = tModule.literal("freeComment"),
	isOptional = tModule.boolean,
	formDataKey = tModule.string,
	requirementMessage = tModule.string,
	freeComment = tModule.interface({ prompt = tModule.string, placeholder = tModule.string })
}
local t_2 = {
	componentType = tModule.literal("paragraph"),
	isOptional = tModule.boolean,
	formDataKey = tModule.optional(tModule.string),
	paragraph = tModule.interface({
		text = tModule.string,
		links = tModule.optional(tModule.map(tModule.string, tModule.interface({
			label = tModule.string,
			linkButtonLabel = tModule.string,
			url = tModule.string
		})))
	})
}
local t_3 = {
	componentType = tModule.literal("link"),
	isOptional = tModule.boolean,
	formDataKey = tModule.optional(tModule.string),
	link = tModule.interface({
		label = tModule.string,
		linkButtonLabel = tModule.string,
		url = tModule.string
	})
}
local var5 = tModule.union(tModule.interface({
	type = tModule.literal("configurableComponentList"),
	configurableComponentList = tModule.interface({
		components = if fFlagAddThumbnailSelectorReport then tModule.array(tModule.union(tModule.interface(t), tModule.interface(t_1), tModule.interface(t_2), tModule.interface({
			componentType = tModule.literal("selector"),
			isOptional = tModule.boolean,
			formDataKey = tModule.string,
			requirementMessage = tModule.string,
			selector = tModule.interface({ prompt = tModule.string })
		}), tModule.interface(t_3))) else tModule.array(tModule.union(tModule.interface(t), tModule.interface(t_1), tModule.interface(t_2), tModule.interface(t_3)))
	})
}))

return {
	AbuseReportBeduiContextStatus = {
		Loading = "Loading",
		Success = "Success",
		Error = "Error"
	},
	BeduiDataTypeInterface = {
		rootStepId = tModule.number,
		nodes = tModule.array(tModule.interface({
			title = tModule.string,
			subtitle = tModule.string,
			actionInfo = tModule.interface({
				actionLabel = tModule.optional(tModule.string),
				predefinedNextStepId = tModule.number,
				shouldSubmit = tModule.optional(tModule.boolean)
			}),
			stepId = tModule.number,
			internalStepName = tModule.string,
			isCompletionStep = tModule.optional(tModule.boolean),
			innerContentConfig = tModule.optional(var5),
			footerContentConfig = tModule.optional(var5)
		}))
	},
	ComponentType = {
		Dropdown = "dropdown",
		FreeComment = "freeComment",
		Paragraph = "paragraph",
		WebViewLink = "link",
		Selector = if fFlagAddThumbnailSelectorReport then "selector" else nil
	},
	ContentConfigType = {
		InnerContentConfig = "innerContentConfig",
		FooterContentConfig = "footerContentConfig"
	},
	InnerContentConfigType = { ConfigurableComponentList = "configurableComponentList" },
	NotificationType = { OpenCustomWebView = 20 }
}