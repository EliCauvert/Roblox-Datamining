local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local FlagsModule = require(Foundation.Utility.Flags)
local HeaderBarContextModule = require(Foundation.Components.HeaderBar.HeaderBarContext)
local HeaderBarSlotModule = require(Foundation.Enums.HeaderBarSlot)
local ViewModule = require(Foundation.Components.View)
local ConstantsModule = require(Foundation.Components.HeaderBar.constants)
local UseHeaderBarContextModule = require(Foundation.Components.HeaderBar.useHeaderBarContext)

return function(p1)
	-- upvalues: UseHeaderBarContextModule (copy), FlagsModule (copy), ReactModule (copy), HeaderBarSlotModule (copy), HeaderBarContextModule (copy), ViewModule (copy), ConstantsModule (copy)
	local UseHeaderBarContextModuleResult = UseHeaderBarContextModule()
	
	if FlagsModule.FoundationHeaderBarSlotSizing then
		local OnSideWidthChangedFunction = UseHeaderBarContextModuleResult.onSideWidthChanged
		ReactModule.useLayoutEffect(function()
			-- upvalues: OnSideWidthChangedFunction (copy), HeaderBarSlotModule (upval)
			return function()
				-- upvalues: OnSideWidthChangedFunction (upval), HeaderBarSlotModule (upval)
				if OnSideWidthChangedFunction then
					OnSideWidthChangedFunction(HeaderBarSlotModule.Trailing, 0)
				end
			end
		end, { OnSideWidthChangedFunction })
		
		return ReactModule.createElement(HeaderBarContextModule.Provider, {
			testId = UseHeaderBarContextModuleResult.testId,
			slot = HeaderBarSlotModule.Trailing,
			leadingWidth = UseHeaderBarContextModuleResult.leadingWidth,
			trailingWidth = UseHeaderBarContextModuleResult.trailingWidth,
			onSideWidthChanged = OnSideWidthChangedFunction
		}, ReactModule.createElement(ViewModule, {
			tag = "row align-x-right align-y-center size-full",
			ZIndex = 2,
			LayoutOrder = ConstantsModule.TRAILING_LAYOUT_ORDER,
			testId = `{UseHeaderBarContextModuleResult.testId}--trailing`
		}, {
			Content = ReactModule.createElement(ViewModule, {
				tag = "row align-y-center gap-small size-0-full auto-x",
				LayoutOrder = 1,
				onAbsoluteSizeChanged = function(Frame)
					-- upvalues: OnSideWidthChangedFunction (copy), HeaderBarSlotModule (upval)
					if OnSideWidthChangedFunction then
						OnSideWidthChangedFunction(HeaderBarSlotModule.Trailing, Frame.AbsoluteSize.X)
					end
				end,
				testId = `{UseHeaderBarContextModuleResult.testId}--trailing--content`
			}, p1.children)
		}))
	else
		return ReactModule.createElement(HeaderBarContextModule.Provider, {
			testId = UseHeaderBarContextModuleResult.testId,
			slot = HeaderBarSlotModule.Trailing
		}, ReactModule.createElement(ViewModule, {
			tag = "row align-x-right align-y-center shrink gap-small size-full",
			LayoutOrder = ConstantsModule.TRAILING_LAYOUT_ORDER,
			testId = `{UseHeaderBarContextModuleResult.testId}--trailing`
		}, p1.children))
	end
end