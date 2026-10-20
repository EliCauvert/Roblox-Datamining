local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local EvidenceFieldModule = require(NotApprovedPage.Components.EvidenceField)
local PlatformEvidenceModule = require(NotApprovedPage.Utils.platformEvidence)
local ParseDateFromStringModule = require(NotApprovedPage.Utils.parseDateFromString)
local _ = require(NotApprovedPage.Common.Types)
local UseNotApprovedPageContextFunction = require(NotApprovedPage.Contexts.NotApprovedPageContext).useNotApprovedPageContext
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local UseStateFunction = ReactModule.useState
local UseCallbackFunction = ReactModule.useCallback
local UseMemoFunction = ReactModule.useMemo
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local Divider = FoundationModule.Divider
local LinkButton = require(Parent.UIBlox).App.Button.LinkButton

local function BadUtterancesContent(Frame)
	-- upvalues: UseNotApprovedPageContextFunction (copy), UseStateFunction (copy), UseCallbackFunction (copy), UseMemoFunction (copy), ReactModule (copy), Text (copy), View (copy), LinkButton (copy)
	local Translations = UseNotApprovedPageContextFunction().translations
	local UseStateResult, UseStateResult2 = UseStateFunction(false)
	local BadUtterances = Frame.badUtterances
	local UseCallbackResult = UseCallbackFunction(function()
		-- upvalues: UseStateResult2 (copy)
		UseStateResult2(function(p1): boolean
			return not p1
		end)
	end, { UseStateResult })
	local UseMemoResult = UseMemoFunction(function()
		-- upvalues: UseStateResult (copy), BadUtterances (copy)
		return if UseStateResult or #BadUtterances <= 4 then BadUtterances else { unpack(BadUtterances, 1, 4) }
	end, { BadUtterances, UseStateResult })
	
	return ReactModule.createElement(View, {
		tag = "auto-xy col gap-small",
		LayoutOrder = Frame.LayoutOrder
	}, {
		BadUtteranceItems = ReactModule.createElement(View, { tag = "auto-xy col gap-xxsmall", LayoutOrder = 1 }, {
			OffensiveItemLabel = ReactModule.createElement(Text, {
				tag = "auto-xy text-body-medium text-align-x-left text-wrap content-emphasis",
				RichText = true,
				LayoutOrder = 1,
				Text = `<b>{Translations.offensiveItemLabel}:</b>`
			}),
			ListOfItems = ReactModule.createElement(View, { tag = "auto-xy col", LayoutOrder = 2 }, unpack((UseMemoFunction(function()
				-- upvalues: UseMemoResult (copy), ReactModule (upval), Text (upval)
				local Elements = {}
				
				for LayoutOrder, value in UseMemoResult do
					table.insert(Elements, ReactModule.createElement(Text, {
						tag = "auto-xy text-body-medium text-align-x-left text-wrap",
						RichText = true,
						Text = value.utteranceText,
						LayoutOrder = LayoutOrder
					}))
				end
				return Elements
			end, { UseMemoResult }))))
		}),
		ToggleButton = #BadUtterances > 4 and ReactModule.createElement(LinkButton, {
			fontStyle = "CaptionHeader",
			minPaddingX = 0,
			minPaddingY = 0,
			layoutOrder = 2,
			text = if UseStateResult then Translations.viewLessButton else Translations.viewMoreButton,
			onActivated = UseCallbackResult
		}) or nil
	})
end

return {
	getIsVisible = function(p1): boolean
		-- upvalues: PlatformEvidenceModule (copy)
		local BadUtterances = p1.badUtterances
		
		return not PlatformEvidenceModule.isVisibleInView(p1.violation) and (BadUtterances and #BadUtterances ~= 0)
	end,
	renderComponent = ReactModule.memo(function(p1)
		-- upvalues: UseNotApprovedPageContextFunction (copy), ReactModule (copy), View (copy), BadUtterancesContent (copy), Divider (copy), EvidenceFieldModule (copy), ParseDateFromStringModule (copy)
		local Translations = UseNotApprovedPageContextFunction().translations
		
		return ReactModule.createElement(View, {
			tag = "size-full-0 auto-y col gap-small",
			LayoutOrder = 1
		}, {
			BadUtterancesContent = ReactModule.createElement(BadUtterancesContent, {
				LayoutOrder = 1,
				badUtterances = p1.moderationDetail.badUtterances
			}),
			Divider = ReactModule.createElement(View, { tag = "auto-xy padding-y-small", LayoutOrder = 2 }, { Divider = ReactModule.createElement(Divider, nil) }),
			ReviewDate = ReactModule.createElement(EvidenceFieldModule, {
				layoutOrder = 4,
				fieldLabel = Translations.dateReviewedLabel,
				fieldValue = ParseDateFromStringModule(p1.moderationDetail.beginDate, Translations)
			})
		})
	end)
}