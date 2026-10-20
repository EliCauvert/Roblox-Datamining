local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local _ = require(NotApprovedPage.Common.Types)
local SplitByNewlinesModule = require(NotApprovedPage.Utils.splitByNewlines)
local _ = require(NotApprovedPage.Components.pageItemConfigs.PageItemConfigUtils)
local Parent = NotApprovedPage.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local Text = FoundationModule.Text
local View = FoundationModule.View
local NewResult = require(Parent.RobloxAppLocales).Localization.new(game:GetService("LocalizationService").RobloxLocaleId)

return function(p1)
	-- upvalues: NewResult (copy), SplitByNewlinesModule (copy), ReactModule (copy), Text (copy), View (copy)
	return {
		getIsVisible = function(_, _): boolean
			return true
		end,
		renderComponent = ReactModule.memo(function(p2)
			-- upvalues: NewResult (upval), p1 (copy), SplitByNewlinesModule (upval), ReactModule (upval), Text (upval), View (upval)
			local FormatResult = NewResult:Format(p1.description)
			local SplitByNewlinesModuleResult = if FormatResult then SplitByNewlinesModule(FormatResult) else {}
			local FormatResult1 = if p1.descriptionBullets and p1.descriptionBullets ~= "" then NewResult:Format(p1.descriptionBullets) else nil
			local SplitByNewlinesModuleResult1 = if FormatResult1 then SplitByNewlinesModule(FormatResult1) else {}
			local Elements = {}
			
			for LayoutOrder, Text1 in SplitByNewlinesModuleResult do
				table.insert(Elements, ReactModule.createElement(Text, {
					tag = "auto-xy text-body-large text-align-x-left text-wrap",
					Text = Text1,
					LayoutOrder = LayoutOrder
				}))
			end
			local Elements1 = {}
			
			for LayoutOrder1, Text2 in SplitByNewlinesModuleResult1 do
				table.insert(Elements1, ReactModule.createElement(View, {
					tag = "auto-xy row gap-small",
					LayoutOrder = LayoutOrder1
				}, {
					BulletIcon = ReactModule.createElement(Text, {
						Text = "•",
						tag = "auto-xy text-body-large",
						LayoutOrder = 1
					}),
					BulletText = ReactModule.createElement(Text, {
						tag = "auto-xy text-body-large text-wrap text-align-x-left",
						LayoutOrder = 2,
						Text = Text2
					})
				}))
			end
			return ReactModule.createElement(View, {
				tag = "col size-full-0 auto-y gap-medium",
				LayoutOrder = p2.layoutOrder
			}, {
				Title = ReactModule.createElement(Text, {
					tag = "auto-xy text-heading-medium content-emphasis text-align-x-left text-wrap",
					LayoutOrder = 1,
					Text = NewResult:Format(p1.title)
				}),
				Subtitle = if p1.subtitle then ReactModule.createElement(Text, {
					tag = "auto-xy text-title-large content-emphasis text-align-x-left text-wrap",
					LayoutOrder = 2,
					Text = NewResult:Format(p1.subtitle)
				}) else nil,
				ContentSection = ReactModule.createElement(View, {
					tag = "col size-full-0 auto-y gap-small",
					LayoutOrder = 3
				}, {
					Description = #SplitByNewlinesModuleResult > 0 and ReactModule.createElement(View, { tag = "auto-xy col gap-medium", LayoutOrder = 1 }, unpack(Elements)),
					Bullets = #SplitByNewlinesModuleResult1 > 0 and ReactModule.createElement(View, {
						tag = "auto-xy col gap-xsmall padding-x-large",
						LayoutOrder = 2
					}, unpack(Elements1))
				})
			})
		end)
	}
end