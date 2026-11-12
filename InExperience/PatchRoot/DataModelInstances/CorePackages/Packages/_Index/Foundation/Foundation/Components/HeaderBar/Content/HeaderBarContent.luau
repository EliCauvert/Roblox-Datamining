local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local ConstantsModule = require(Foundation.Constants)
local FlagsModule = require(Foundation.Utility.Flags)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)
local HeaderBarSlotModule = require(Foundation.Enums.HeaderBarSlot)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule1 = require(Foundation.Components.HeaderBar.constants)
local UseHeaderBarContextModule = require(Foundation.Components.HeaderBar.useHeaderBarContext)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)

return function(p1)
	-- upvalues: UseHeaderBarContextModule (copy), FlagsModule (copy), UseTokensModule (copy), ReactModule (copy), HeaderBarContextModule (copy), HeaderBarSlotModule (copy), ViewModule (copy), ConstantsModule1 (copy), ConstantsModule (copy)
	local UseHeaderBarContextModuleResult = UseHeaderBarContextModule()
	
	if FlagsModule.FoundationHeaderBarSlotSizing then
		local UseTokensModuleResult = UseTokensModule()
		local LeadingWidth = UseHeaderBarContextModuleResult.leadingWidth or 0
		local TrailingWidth = UseHeaderBarContextModuleResult.trailingWidth or 0
		local NewLeadingWidth = if LeadingWidth > 0 then LeadingWidth + UseTokensModuleResult.Gap.Small else 0
		local NewTrailingWidth = if TrailingWidth > 0 then TrailingWidth + UseTokensModuleResult.Gap.Small else 0
		local XSmall: number = UseTokensModuleResult.Padding.XSmall
		local Value = NewTrailingWidth - NewLeadingWidth
		
		return ReactModule.createElement(HeaderBarContextModule.Provider, {
			testId = UseHeaderBarContextModuleResult.testId,
			slot = HeaderBarSlotModule.Content,
			leadingWidth = UseHeaderBarContextModuleResult.leadingWidth,
			trailingWidth = UseHeaderBarContextModuleResult.trailingWidth,
			onSideWidthChanged = UseHeaderBarContextModuleResult.onSideWidthChanged
		}, ReactModule.createElement(ViewModule, {
			tag = "size-full",
			ZIndex = 1,
			LayoutOrder = ConstantsModule1.CONTENT_LAYOUT_ORDER,
			testId = `{UseHeaderBarContextModuleResult.testId}--content`
		}, {
			Content = ReactModule.createElement(ViewModule, {
				tag = "row align-x-center align-y-center padding-x-xsmall clip",
				LayoutOrder = 1,
				Position = UDim2.fromOffset(NewLeadingWidth - XSmall, 0),
				Size = UDim2.new(1, 2 * XSmall - NewLeadingWidth - NewTrailingWidth, 1, 0),
				testId = `{UseHeaderBarContextModuleResult.testId}--content--content`
			}, {
				CenteringSpacer = ReactModule.createElement(ViewModule, {
					tag = "shrink",
					Size = UDim2.fromOffset(math.abs(Value), 0),
					LayoutOrder = if Value > 0 then ConstantsModule.MIN_LAYOUT_ORDER else ConstantsModule.MAX_LAYOUT_ORDER - 1
				}),
				Children = ReactModule.createElement(ReactModule.Fragment, nil, p1.children)
			})
		}))
	else
		return ReactModule.createElement(HeaderBarContextModule.Provider, {
			testId = UseHeaderBarContextModuleResult.testId,
			slot = HeaderBarSlotModule.Content
		}, ReactModule.createElement(ViewModule, {
			tag = "align-y-center grow size-0-full auto-x",
			LayoutOrder = ConstantsModule1.CONTENT_LAYOUT_ORDER,
			testId = `{UseHeaderBarContextModuleResult.testId}--content`
		}, p1.children))
	end
end