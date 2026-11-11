local CorePackages = game:GetService("CorePackages")
local ReactModule = require(CorePackages.Packages.React)
local OmniFeedProps = require(CorePackages.Workspace.Packages.DiscoveryMonolith).Modules.Personalization.OmniFeed.OmniFeedProps
local UsePageSideMarginFunction = require(CorePackages.Workspace.Packages.CollectionViews).usePageSideMargin
local UseDesignTokensFunction = require(CorePackages.Workspace.Packages.Style).useDesignTokens
local View = require(CorePackages.Packages.Foundation).View
local PromptsHandler = require(CorePackages.Workspace.Packages.ServerTriggeredModals).PromptsHandler
local SharedFlagsModule = require(CorePackages.Workspace.Packages.SharedFlags)
local FFlagLuaAppCompositionAlways = SharedFlagsModule.FFlagLuaAppCompositionAlways
local FFlagHomepagePromptsPaddingFix = SharedFlagsModule.FFlagHomepagePromptsPaddingFix

return function(p1)
	-- upvalues: FFlagLuaAppCompositionAlways (copy), OmniFeedProps (copy), ReactModule (copy), UsePageSideMarginFunction (copy), FFlagHomepagePromptsPaddingFix (copy), UseDesignTokensFunction (copy), View (copy), PromptsHandler (copy)
	local AppCompositionEnabled = if FFlagLuaAppCompositionAlways then true else p1[OmniFeedProps.key].appCompositionEnabled
	local UseRefResult = ReactModule.useRef(nil)
	local UsePageSideMarginResult = if FFlagLuaAppCompositionAlways then nil else UsePageSideMarginFunction(UseRefResult.current)
	local _UDim = if AppCompositionEnabled then nil else UDim.new(0, UsePageSideMarginResult)
	local TopPadding = nil
	local BottomPadding = nil
	
	if FFlagHomepagePromptsPaddingFix then
		local LayoutPadding = UseDesignTokensFunction().LuaApps.HomeOmniFeed.getLayoutSpacing(false).layoutPadding
		TopPadding = p1.topPadding or LayoutPadding
		BottomPadding = p1.bottomPadding or LayoutPadding
	end
	return ReactModule.createElement(View, {
		Size = UDim2.new(1, 0, 0, 0),
		AutomaticSize = Enum.AutomaticSize.Y,
		padding = { left = _UDim, right = _UDim, top = UDim.new(0, 1) },
		ref = UseRefResult
	}, {
		PromptsHandler = ReactModule.createElement(PromptsHandler, {
			entryPoint = p1.entryPoint,
			promptStyle = p1.promptStyle,
			topPadding = if FFlagHomepagePromptsPaddingFix then TopPadding else nil,
			bottomPadding = if FFlagHomepagePromptsPaddingFix then BottomPadding else nil
		})
	})
end