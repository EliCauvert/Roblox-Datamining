local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local FoundationModule = require(Parent.Foundation)
local MomentsCommonModule = require(Parent.MomentsCommon)
local _ = require(Parent.MomentsTypes)
local ReactModule = require(Parent.React)
local Sheet = FoundationModule.Sheet
local Text = FoundationModule.Text
local View = FoundationModule.View
local LocalizationService = game:GetService("LocalizationService")
local LocalizationModule = require(Parent.Localization)
local UseLocalizationFunction = LocalizationModule.Hooks.useLocalization
local AbbreviateCountFunction = LocalizationModule.abbreviateCount
local Reaction = MomentsCommonModule.Components.Reaction
local ReactionSize = MomentsCommonModule.Enums.ReactionSize
local UseConfigurationModule = require(Moments.Hooks.useConfiguration)
local config = { title = "Feature.Moments.Label.Reactions" }

return function(p1) --[[ Line: 35 | Named "ReactionsSheet" ]]
	-- upvalues: UseLocalizationFunction (copy), config (copy), UseConfigurationModule (copy), ReactModule (copy), View (copy), Reaction (copy), ReactionSize (copy), Text (copy), AbbreviateCountFunction (copy), LocalizationService (copy), Sheet (copy), FoundationModule (copy)
	return ReactModule.createElement(Sheet.Root, {
		isOpen = true,
		preferCenterSheet = true,
		onClose = p1.onClose,
		size = FoundationModule.Enums.DialogSize.Large
	}, {
		Header = ReactModule.createElement(Sheet.Header, nil, {
			Title = ReactModule.createElement(Text, {
				tag = "auto-xy text-heading-small content-emphasis",
				Text = UseLocalizationFunction(config).title
			})
		}),
		Content = ReactModule.createElement(Sheet.Content, if UseConfigurationModule("android_tv_enabled", false) then { Selectable = false } else nil, {
			ReactionsContainer = ReactModule.createElement(View, {
				tag = "row wrap align-y-center gap-small size-full-0 auto-y padding-bottom-large"
			}, (ReactModule.useMemo(function() --[[ Line: 39 ]]
				-- upvalues: p1 (copy), ReactModule (upval), View (upval), Reaction (upval), ReactionSize (upval), Text (upval), AbbreviateCountFunction (upval), LocalizationService (upval)
				local Elements = {}
				
				for LayoutOrder, reactionCount in ipairs(p1.reactionCounts) do
					if reactionCount.count > 0 then
						Elements[reactionCount.reaction] = ReactModule.createElement(View, {
							tag = "row align-y-center gap-xsmall auto-xy padding-xsmall",
							LayoutOrder = LayoutOrder
						}, {
							Icon = ReactModule.createElement(Reaction, {
								layoutOrder = 1,
								reactionType = reactionCount.reaction,
								size = ReactionSize.XSmall
							}),
							Count = ReactModule.createElement(Text, {
								LayoutOrder = 2,
								tag = "auto-xy text-body-medium content-emphasis",
								Text = AbbreviateCountFunction(reactionCount.count, LocalizationService.RobloxLocaleId)
							})
						})
					end
				end
				return Elements
			end, { p1.reactionCounts })))
		})
	})
end