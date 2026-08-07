local dataHydration = script:FindFirstAncestor("DataHydration")
local parent = dataHydration.Parent
local _ = require(dataHydration.DataHydrationTypes)
local _ = require(parent.Signals)
local tModule = require(parent.t)

return {
	userVoteFeedbackMetadataResponseValidator = tModule.interface({
		capabilities = tModule.interface({
			can_submit_review = tModule.boolean,
			can_submit_category_options = tModule.optional(tModule.boolean),
			can_submit_comment = tModule.boolean
		}),
		categories = tModule.array(tModule.interface({
			type = tModule.string,
			label = tModule.string,
			allows_multiple_selections = tModule.boolean,
			options = tModule.array(tModule.interface({ id = tModule.string, label = tModule.string }))
		})),
		comment = tModule.interface({
			label = tModule.string,
			placeholder_text = tModule.string,
			minimum_length = tModule.number,
			maximum_length = tModule.number
		}),
		metadata = tModule.interface({
			disclaimer_label = tModule.string,
			submit_button_label = tModule.string,
			form_title_label = tModule.string
		})
	})
}