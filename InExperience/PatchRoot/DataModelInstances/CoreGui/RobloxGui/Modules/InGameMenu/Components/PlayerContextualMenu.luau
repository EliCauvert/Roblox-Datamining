local CoreGui = game:GetService("CoreGui")
local ContextActionService = game:GetService("ContextActionService")
local GuiService = game:GetService("GuiService")
local InGameMenuDependenciesModule = require(game:GetService("CorePackages").Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local T = InGameMenuDependenciesModule.t
local BaseMenu = InGameMenuDependenciesModule.UIBlox.App.Menu.BaseMenu
local FocusHandlerModule = require(script.Parent.Connection.FocusHandler)
local RootedConnectionModule = require(script.Parent.Connection.RootedConnection)
local GetFFlagIGMGamepadSelectionHistoryModule = require(script.Parent.Parent.Flags.GetFFlagIGMGamepadSelectionHistory)
local PlayerContextualMenu = Roact.PureComponent:extend("PlayerContextualMenu")
PlayerContextualMenu.validateProps = T.strictInterface({
	moreActions = T.table,
	actionWidth = T.number,
	xOffset = T.number,
	yOffset = T.number,
	onClose = T.callback,
	canCaptureFocus = T.boolean
})

function PlayerContextualMenu.init(p1) --[[ Line: 36 ]]
	-- upvalues: Roact (copy)
	p1.firstOptionRef = Roact.createRef()
	p1.containerRef = Roact.createRef()
end

function PlayerContextualMenu.renderContextualMenuFocusHandler(p1, p2, p3) --[[ Line: 41 ]]
	-- upvalues: Roact (copy), FocusHandlerModule (copy), ContextActionService (copy), GuiService (copy), GetFFlagIGMGamepadSelectionHistoryModule (copy)
	return Roact.createElement(FocusHandlerModule, {
		isFocused = p1.props.canCaptureFocus and p2,
		didFocus = function(p4) --[[ Line: 47 ]]
			-- upvalues: ContextActionService (upval), p1 (copy), GuiService (upval), GetFFlagIGMGamepadSelectionHistoryModule (upval)
			ContextActionService:BindCoreAction("player_contextual_menu_close_action", function(_, UserInputState) --[[ Line: 48 ]]
				-- upvalues: p1 (upval)
				if UserInputState == Enum.UserInputState.End and p1.props.onClose then
					p1.props.onClose()
					
					return Enum.ContextActionResult.Sink
				else
					return Enum.ContextActionResult.Pass
				end
			end, false, Enum.KeyCode.ButtonB)
			GuiService:RemoveSelectionGroup("player_contextual_menu_selection_parent")
			GuiService:AddSelectionParent("player_contextual_menu_selection_parent", p1.containerRef:getValue())
			
			if GetFFlagIGMGamepadSelectionHistoryModule() then
				GuiService.SelectedCoreObject = p4 or p1.firstOptionRef:getValue()
				
				return
			else
				GuiService.SelectedCoreObject = p1.firstOptionRef:getValue()
			end
		end,
		didBlur = function() --[[ Line: 68 ]]
			-- upvalues: ContextActionService (upval)
			ContextActionService:UnbindCoreAction("player_contextual_menu_close_action")
		end
	}, p3)
end

function PlayerContextualMenu.render(p1) --[[ Line: 74 ]]
	-- upvalues: Roact (copy), CoreGui (copy), RootedConnectionModule (copy), BaseMenu (copy)
	return Roact.createElement(Roact.Portal, { target = CoreGui }, {
		InGameMenuContextGui = Roact.createElement("ScreenGui", {
			DisplayOrder = 2,
			ZIndexBehavior = Enum.ZIndexBehavior.Sibling
		}, {
			RootedConnection = Roact.createElement(RootedConnectionModule, {
				render = function(p2) --[[ Line: 84 ]]
					-- upvalues: p1 (copy), Roact (upval), BaseMenu (upval)
					return p1:renderContextualMenuFocusHandler(p2, {
						MoreActionsMenu = Roact.createElement("Frame", {
							Size = UDim2.fromScale(1, 1),
							BackgroundTransparency = 1,
							[Roact.Ref] = p1.containerRef
						}, {
							BaseMenu = Roact.createElement(BaseMenu, {
								buttonProps = p1.props.moreActions,
								setFirstItemRef = p1.firstOptionRef,
								width = UDim.new(0, p1.props.actionWidth),
								position = UDim2.fromOffset(p1.props.xOffset, p1.props.yOffset)
							})
						})
					})
				end
			})
		})
	})
end

return PlayerContextualMenu