local Foundation = script:FindFirstAncestor("Foundation")
local ReactModule = require(Foundation.Parent.React)
local TextModule = require(Foundation.Components.Text)
local _ = require(Foundation.Components.Types)
local ViewModule = require(Foundation.Components.View)
local UseTokensModule = require(Foundation.Providers.Style.useTokens)
local WithCommonPropsModule = require(Foundation.Utility.withCommonProps)
local _ = require(Foundation.Enums.ControlState)
local _ = require(Foundation.Enums.InputSize)
local UseBaseMenuItemVariantsModule = require(script.Parent.useBaseMenuItemVariants)

return ReactModule.memo(ReactModule.forwardRef(function(p1, Ref) --[[ Line: 30 | Named "BaseMenuTitleItem" ]]
	-- upvalues: UseTokensModule (copy), UseBaseMenuItemVariantsModule (copy), ReactModule (copy), ViewModule (copy), WithCommonPropsModule (copy), TextModule (copy)
	local UseBaseMenuItemVariantsModuleResult = UseBaseMenuItemVariantsModule(UseTokensModule(), p1.size, false)
	local IsMenuHasCheck = p1.menuHasCheck == true
	
	return ReactModule.createElement(ViewModule, WithCommonPropsModule(p1, {
		tag = `row align-y-center {UseBaseMenuItemVariantsModuleResult.container.tag}`,
		padding = {
			left = UDim.new(0, if IsMenuHasCheck then (UseBaseMenuItemVariantsModuleResult.container.paddingLeftWithCheck or 0) + (UseBaseMenuItemVariantsModuleResult.title.checkColumnWidth or 0) else UseBaseMenuItemVariantsModuleResult.container.paddingLeftWithoutCheck or 0),
			right = UDim.new(0, UseBaseMenuItemVariantsModuleResult.container.paddingRight or 0)
		},
		ref = Ref
	}), ReactModule.createElement(TextModule, {
		Text = p1.text,
		tag = UseBaseMenuItemVariantsModuleResult.title.tag
	}))
end))