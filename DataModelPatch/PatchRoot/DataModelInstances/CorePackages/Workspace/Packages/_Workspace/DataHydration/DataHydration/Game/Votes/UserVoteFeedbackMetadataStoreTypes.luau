local DataHydration = script:FindFirstAncestor("DataHydration")
local Parent = DataHydration.Parent
local _ = require(DataHydration.DataHydrationTypes)
local _ = require(Parent.Signals)
local TModule = require(Parent.t)

return {
	userVoteFeedbackMetadataResponseValidator = TModule.interface({
		capabilities = TModule.interface({
			can_submit_review = TModule.boolean,
			can_submit_category_options = TModule.optional(TModule.boolean),
			can_submit_comment = TModule.boolean
		}),
		categories = TModule.array(TModule.interface({
			type = TModule.string,
			label = TModule.string,
			allows_multiple_selections = TModule.boolean,
			options = TModule.array(TModule.interface({ id = TModule.string, label = TModule.string }))
		})),
		comment = TModule.interface({
			label = TModule.string,
			placeholder_text = TModule.string,
			minimum_length = TModule.number,
			maximum_length = TModule.number
		}),
		metadata = TModule.interface({
			disclaimer_label = TModule.string,
			submit_button_label = TModule.string,
			form_title_label = TModule.string
		})
	})
}