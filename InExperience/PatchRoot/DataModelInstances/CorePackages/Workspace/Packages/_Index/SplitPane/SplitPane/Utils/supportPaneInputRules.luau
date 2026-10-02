local parent = script:FindFirstAncestor("SplitPane").Parent
local appSplitViewModule = require(parent.AppSplitView)
local responsiveModule = require(parent.Responsive)
local sharedFlagsModule = require(parent.SharedFlags)
local splitPaneStoreModule = require(script.Parent.Parent.Stores.SplitPaneStore)
local supportPaneMode = appSplitViewModule.Enums.SupportPaneMode
local fFlagLuaAppSduiEdpEnabled = sharedFlagsModule.FFlagLuaAppSduiEdpEnabled

return {
	resolveOpenedMode = function(p1)
		-- upvalues: responsiveModule (ref), fFlagLuaAppSduiEdpEnabled (ref), supportPaneMode (ref)
		return if p1 == responsiveModule.Input.Directional or not fFlagLuaAppSduiEdpEnabled then supportPaneMode.Expanded else supportPaneMode.Normal
	end,
	resolveInputChangedMode = function(p1)
		-- upvalues: responsiveModule (ref), supportPaneMode (ref), splitPaneStoreModule (ref)
		return if p1 == responsiveModule.Input.Directional then supportPaneMode.Expanded else splitPaneStoreModule.getStore().getSupportPaneMode()
	end
}