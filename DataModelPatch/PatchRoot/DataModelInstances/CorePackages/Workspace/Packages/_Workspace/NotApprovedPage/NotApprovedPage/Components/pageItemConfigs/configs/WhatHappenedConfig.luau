local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local UseMemoFunction = ReactModule.useMemo
local EvidenceFieldModule = require(NotApprovedPage.Components.EvidenceField)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext

return {
	getIsVisible = function(): boolean
		return true
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), UseMemoFunction (copy), ReactModule (copy), View (copy), Text (copy), EvidenceFieldModule (copy)
		local UseNotApprovedPageContextResult = UseNotApprovedPageContextFunction()
		local Translations = UseNotApprovedPageContextResult.translations
		local ViolationReasons = UseNotApprovedPageContextResult.violationReasons
		local MessageToUser = p1.moderationDetail.messageToUser
		local FallbackModeratorNote = Translations.fallbackModeratorNote
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-medium",
			LayoutOrder = p1.layoutOrder
		}, {
			Heading = ReactModule.createElement(Text, {
				tag = "auto-xy text-title-large text-align-x-left content-emphasis text-wrap",
				LayoutOrder = 1,
				Text = Translations.whatHappenedLabel
			}),
			Content = ReactModule.createElement(View, {
				tag = "size-full-0 auto-y col gap-small bg-shift-100 radius-medium padding-large",
				LayoutOrder = 2
			}, {
				Reason = ReactModule.createElement(EvidenceFieldModule, {
					layoutOrder = 1,
					fieldLabel = Translations.reasonLabel,
					fieldValue = UseMemoFunction(function()
						-- upvalues: ViolationReasons (copy), Translations (copy)
						local Joined = table.concat(ViolationReasons.translatedReasons, ", ")
						
						return if Joined == "" then Translations.otherAbuseType else Joined
					end, { ViolationReasons.translatedReasons })
				}),
				ModeratorNote = ReactModule.createElement(EvidenceFieldModule, {
					layoutOrder = 2,
					fieldLabel = Translations.moderatorNoteLabel,
					fieldValue = if MessageToUser and MessageToUser ~= "" then MessageToUser else FallbackModeratorNote
				})
			})
		})
	end)
}