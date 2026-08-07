local corePackagesService = game:GetService("CorePackages")
local coreGuiService = game:GetService("CoreGui")
local contextActionService = game:GetService("ContextActionService")
local guiService = game:GetService("GuiService")
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local t = inGameMenuDependenciesModule.t
local baseMenu = inGameMenuDependenciesModule.UIBlox.App.Menu.BaseMenu
local parent = script.Parent.Parent
local focusHandlerModule = require(script.Parent.Connection.FocusHandler)
local rootedConnectionModule = require(script.Parent.Connection.RootedConnection)
local getFFlagIGMGamepadSelectionHistoryModule = require(parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local playerContextualMenu = roact.PureComponent:extend("PlayerContextualMenu")
playerContextualMenu.validateProps = t.strictInterface({
	moreActions = t.table,
	actionWidth = t.number,
	xOffset = t.number,
	yOffset = t.number,
	onClose = t.callback,
	canCaptureFocus = t.boolean
})

function playerContextualMenu.init(p0) --[[ line: 36 ]]
	-- upvalues: roact (ref)
	p0.firstOptionRef = roact.createRef()
	p0.containerRef = roact.createRef()
end

function playerContextualMenu.renderContextualMenuFocusHandler(p1, p2, p3) --[[ line: 41 ]]
	-- upvalues: roact (ref), focusHandlerModule (ref), contextActionService (ref), guiService (ref), getFFlagIGMGamepadSelectionHistoryModule (ref)
	return roact.createElement(focusHandlerModule, {
		isFocused = p1.props.canCaptureFocus and p2,
		didFocus = function(p4) --[[ line: 47 ]]
			-- upvalues: contextActionService (copy), p1 (ref), guiService (copy), getFFlagIGMGamepadSelectionHistoryModule (copy)
			contextActionService:BindCoreAction("player_contextual_menu_close_action", function(_, p5) --[[ line: 48 ]]
				-- upvalues: p1 (copy)
				if p5 == Enum.UserInputState.End and p1.props.onClose then
					p1.props.onClose()
					
					return Enum.ContextActionResult.Sink
				end
				return Enum.ContextActionResult.Pass
			end, false, Enum.KeyCode.ButtonB)
			guiService:RemoveSelectionGroup("player_contextual_menu_selection_parent")
			guiService:AddSelectionParent("player_contextual_menu_selection_parent", p1.containerRef:getValue())
			
			if getFFlagIGMGamepadSelectionHistoryModule() then
				guiService.SelectedCoreObject = p4 or p1.firstOptionRef:getValue()
				
				return
			end
			guiService.SelectedCoreObject = p1.firstOptionRef:getValue()
		end,
		didBlur = function() --[[ line: 68 ]]
			-- upvalues: contextActionService (copy)
			contextActionService:UnbindCoreAction("player_contextual_menu_close_action")
		end
	}, p3)
end

function playerContextualMenu.render(p6) --[[ line: 74 ]]
	-- upvalues: roact (ref), coreGuiService (ref), rootedConnectionModule (ref), baseMenu (ref)
	return roact.createElement(roact.Portal, { target = coreGuiService }, {
		InGameMenuContextGui = roact.createElement("ScreenGui", {
			DisplayOrder = 2,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			RootedConnection = roact.createElement(rootedConnectionModule, {
				render = function(p7) --[[ line: 84 ]]
					-- upvalues: p6 (ref), roact (copy), baseMenu (copy)
					return p6:renderContextualMenuFocusHandler(p7, {
						MoreActionsMenu = roact.createElement("Frame", {
							Size = UDim2.fromScale(1, 1),
							BackgroundTransparency = 1,
							[roact.Ref] = p6.containerRef
						}, {
							BaseMenu = roact.createElement(baseMenu, {
								buttonProps = p6.props.moreActions,
								setFirstItemRef = p6.firstOptionRef,
								width = UDim.new(0, p6.props.actionWidth),
								position = UDim2.fromOffset(p6.props.xOffset, p6.props.yOffset)
							})
						})
					})
				end
			})
		})
	})
end

return playerContextualMenu