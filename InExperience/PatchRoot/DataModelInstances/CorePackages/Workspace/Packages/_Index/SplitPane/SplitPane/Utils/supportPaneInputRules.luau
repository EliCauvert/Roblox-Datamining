local Parent = script:FindFirstAncestor("SplitPane").Parent
local AppSplitViewModule = require(Parent.AppSplitView)
local ResponsiveModule = require(Parent.Responsive)
local SharedFlagsModule = require(Parent.SharedFlags)
local SplitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local SupportPaneMode = AppSplitViewModule.Enums.SupportPaneMode
local FFlagLuaAppSduiEdpEnabled = SharedFlagsModule.FFlagLuaAppSduiEdpEnabled

return {
	resolveOpenedMode = function(Directional)
		-- upvalues: ResponsiveModule (copy), FFlagLuaAppSduiEdpEnabled (copy), SupportPaneMode (copy)
		return if Directional == ResponsiveModule.Input.Directional or not FFlagLuaAppSduiEdpEnabled then SupportPaneMode.Expanded else SupportPaneMode.Normal
	end,
	resolveInputChangedMode = function(Directional)
		-- upvalues: ResponsiveModule (copy), SupportPaneMode (copy), SplitPaneStoreModule (copy)
		return if Directional == ResponsiveModule.Input.Directional then SupportPaneMode.Expanded else SplitPaneStoreModule.getStore().getSupportPaneMode()
	end,
	expandSupportPaneIfCollapsed = function()
		-- upvalues: SplitPaneStoreModule (copy), SupportPaneMode (copy), ResponsiveModule (copy), FFlagLuaAppSduiEdpEnabled (copy)
		local Store = SplitPaneStoreModule.getStore()
		
		if Store.getSupportPaneModeIfActive(false) == SupportPaneMode.Collapsed then
			Store.setTemporarySupportPaneMode(if ResponsiveModule.GetInputModeStore(false).getPreferredInputType(false) == ResponsiveModule.Input.Directional or not FFlagLuaAppSduiEdpEnabled then SupportPaneMode.Expanded else SupportPaneMode.Normal)
		end
	end
}