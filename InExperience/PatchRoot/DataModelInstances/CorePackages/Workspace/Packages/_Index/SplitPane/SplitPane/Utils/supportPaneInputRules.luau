local Parent = script:FindFirstAncestor("SplitPane").Parent
local ResponsiveModule = require(Parent.Responsive)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local SupportPaneMode = require(Parent.AppSplitView).Enums.SupportPaneMode
local FFlagLuaAppSduiEdpEnabled = require(Parent.SharedFlags).FFlagLuaAppSduiEdpEnabled

return {
	resolveOpenedMode = function(Directional)
		-- upvalues: ResponsiveModule (copy), FFlagLuaAppSduiEdpEnabled (copy), SupportPaneMode (copy)
		return if Directional == ResponsiveModule.Input.Directional or not FFlagLuaAppSduiEdpEnabled then SupportPaneMode.Expanded else SupportPaneMode.Normal
	end,
	resolveInputChangedMode = function(Directional)
		-- upvalues: ResponsiveModule (copy), SupportPaneMode (copy), SplitPaneStoreModule (copy)
		return if Directional == ResponsiveModule.Input.Directional then SupportPaneMode.Expanded else SplitPaneStoreModule.getStore().getSupportPaneMode()
	end
}