local moments = script:FindFirstAncestor("Moments")
local parent = moments.Parent
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local _ = require(parent.MomentsTypes)
local reactModule = require(parent.React)
local sheet = foundationModule.Sheet
local text = foundationModule.Text
local view = foundationModule.View
local localizationService = game:GetService("LocalizationService")
local localizationModule = require(parent.Localization)
local useLocalization = localizationModule.Hooks.useLocalization
local abbreviateCount = localizationModule.abbreviateCount
local reaction = momentsCommonModule.Components.Reaction
local reactionSize = momentsCommonModule.Enums.ReactionSize
local useConfigurationModule = require(moments.Hooks.useConfiguration)
local t = { title = "Feature.Moments.Label.Reactions" }

return function(p0)
	-- upvalues: useLocalization (ref), t (ref), useConfigurationModule (ref), reactModule (ref), view (ref), reaction (ref), reactionSize (ref), text (ref), abbreviateCount (ref), localizationService (ref), sheet (ref), foundationModule (ref)
	return reactModule.createElement(sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p0.onClose,
		size = foundationModule.Enums.DialogSize.Large
	}, {
		Header = reactModule.createElement(sheet.Header, nil, {
			Title = reactModule.createElement(text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = useLocalization(t).title
			})
		}),
		Content = reactModule.createElement(sheet.Content, if useConfigurationModule("android_tv_enabled", false) then { Selectable = false } else nil, {
			ReactionsContainer = reactModule.createElement(view, {
				tag = "row wrap align-y-center gap-small size-full-0 auto-y padding-bottom-large"
			}, reactModule.useMemo(function()
				-- upvalues: p0 (ref), reactModule (copy), view (copy), reaction (copy), reactionSize (copy), text (copy), abbreviateCount (copy), localizationService (copy)
				local t = {}
				
				for i, v in ipairs(p0.reactionCounts) do
					if v.count > 0 then
						t[v.reaction] = reactModule.createElement(view, {
							tag = "row align-y-center gap-xsmall auto-xy padding-xsmall",
							LayoutOrder = i
						}, {
							Icon = reactModule.createElement(reaction, {
								layoutOrder = 1,
								reactionType = v.reaction,
								size = reactionSize.XSmall
							}),
							Count = reactModule.createElement(text, {
								LayoutOrder = 2,
								tag = "auto-xy text-body-medium content-emphasis",
								Text = abbreviateCount(v.count, localizationService.RobloxLocaleId)
							})
						})
					end
				end
				return t
			end, { p0.reactionCounts }))
		})
	})
end