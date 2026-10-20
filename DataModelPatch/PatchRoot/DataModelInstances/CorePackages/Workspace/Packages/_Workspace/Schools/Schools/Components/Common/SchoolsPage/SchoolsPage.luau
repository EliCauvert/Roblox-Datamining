local Schools = script:FindFirstAncestor("Schools")
local Parent = Schools.Parent
local ReactModule = require(Parent.React)
local FoundationModule = require(Parent.Foundation)
local ResponsiveModule = require(Parent.Responsive)
local UseIsWideModeFunction = require(Parent.SocialCommon).Hooks.useIsWideMode
local SchoolsPageHeaderModule = require(Schools.Components.Common.SchoolsPageHeader)
local ConstantsModule = require(Schools.Common.Constants)
local View = FoundationModule.View
local UseTokensFunction = FoundationModule.Hooks.useTokens

return function(p1)
	-- upvalues: UseIsWideModeFunction (copy), ResponsiveModule (copy), UseTokensFunction (copy), ConstantsModule (copy), ReactModule (copy), View (copy), SchoolsPageHeaderModule (copy)
	local UseIsWideModeResult = UseIsWideModeFunction()
	local UseDeviceInsetsResult = ResponsiveModule.useDeviceInsets()
	local UseTokensResult = UseTokensFunction()
	local Config = if UseIsWideModeResult then { top = UDim.new(0, UseTokensResult.Size.Size_600) } else {
		top = if UseDeviceInsetsResult.top > 0 then UDim.new(0, UseDeviceInsetsResult.top) else nil,
		bottom = if UseDeviceInsetsResult.bottom > 0 then UDim.new(0, UseDeviceInsetsResult.bottom) else nil
	}
	local Copy = if typeof(p1.children) == "table" then table.clone(p1.children) else { Content = p1.children }
	Copy.WidthConstraint = ReactModule.createElement("UISizeConstraint", {
		MaxSize = Vector2.new(p1.maxContentWidth or ConstantsModule.PAGE_MAX_CONTENT_WIDTH, 1e999)
	})
	
	return ReactModule.createElement(View, {
		tag = {
			["col size-full bg-surface-0"] = true,
			["align-x-center gap-xxlarge"] = UseIsWideModeResult
		},
		padding = Config,
		testId = p1.testId
	}, {
		Header = ReactModule.createElement(SchoolsPageHeaderModule, {
			layoutOrder = 1,
			title = p1.title,
			onBack = p1.onBack,
			renderTrailing = p1.renderTrailing
		}),
		ContentArea = ReactModule.createElement(View, {
			LayoutOrder = 2,
			tag = "col align-x-center fill size-full-0 padding-x-xlarge"
		}, {
			Column = ReactModule.createElement(View, {
				tag = {
					["col gap-large size-full-0 padding-top-medium"] = true,
					fill = p1.fillContent == true,
					["auto-y"] = p1.fillContent ~= true
				}
			}, Copy)
		})
	})
end