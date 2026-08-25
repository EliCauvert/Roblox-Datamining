local momentsCreation = script:FindFirstAncestor("MomentsCreation")
local parent = momentsCreation.Parent
local builderIconsModule = require(parent.BuilderIcons)
local foundationModule = require(parent.Foundation)
local momentsCommonModule = require(parent.MomentsCommon)
local reactModule = require(parent.React)
local icon = foundationModule.Icon
local menu = foundationModule.Menu
local view = foundationModule.View
local useTokens = foundationModule.Hooks.useTokens
local useDeviceInsets = momentsCommonModule.Hooks.useDeviceInsets
local useToggleState = momentsCommonModule.Hooks.useToggleState
local useCreationController = require(momentsCreation.CreationController).useCreationController
local list = {
	{ id = "discard", text = "Discard change" },
	{ id = "keep", text = "Keep editing" }
}

return function()
	-- upvalues: useCreationController (ref), useTokens (ref), useDeviceInsets (ref), useToggleState (ref), reactModule (ref), view (ref), menu (ref), foundationModule (ref), list (ref), icon (ref), builderIconsModule (ref)
	local var6 = useCreationController()
	local var7 = useTokens()
	local var8 = useDeviceInsets()
	local var9 = useToggleState(false)
	
	return reactModule.createElement(view, {
		tag = "position-top-left anchor-top-left auto-xy",
		ZIndex = 10,
		padding = {
			top = UDim.new(0, var8.top + var7.Padding.Medium),
			left = UDim.new(0, var8.left + var7.Padding.Medium)
		}
	}, {
		DiscardMenu = reactModule.createElement(menu, {
			isOpen = var9.enabled,
			side = foundationModule.Enums.PopoverSide.Bottom,
			align = foundationModule.Enums.PopoverAlign.Start,
			onPressedOutside = var9.disable,
			onActivated = function(p0)
				-- upvalues: var9 (ref), var6 (ref)
				var9.disable()
				
				if p0 == "discard" then
					var6.discardActiveTool()
				end
			end,
			items = list
		}, {
			BackButton = reactModule.createElement(view, {
				tag = "auto-xy padding-small radius-circle",
				onActivated = function()
					-- upvalues: var6 (ref), var9 (ref)
					local activeSession = var6.getActiveSession(false)
					
					if activeSession ~= nil and activeSession.getIsDirty(false) then
						var9.toggle()
						
						return
					end
					var6.commitActiveTool()
				end,
				stateLayer = {
					affordance = foundationModule.Enums.StateLayerAffordance.Background
				}
			}, {
				BackIcon = reactModule.createElement(icon, {
					name = builderIconsModule.Icon.ChevronLargeLeft,
					size = foundationModule.Enums.IconSize.Large,
					style = var7.Color.Content.Emphasis
				})
			})
		})
	})
end