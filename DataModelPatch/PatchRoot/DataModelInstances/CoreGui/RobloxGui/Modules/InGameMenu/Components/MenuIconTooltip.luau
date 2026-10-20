local CoreGui = game:GetService("CoreGui")
local CorePackages = game:GetService("CorePackages")
local SignalsModule = require(CorePackages.Packages.Signals)
local DisplayModule = require(CorePackages.Workspace.Packages.Display)
local InGameMenuDependenciesModule = require(CorePackages.Packages.InGameMenuDependencies)
local Roact = InGameMenuDependenciesModule.Roact
local RoactRodux = InGameMenuDependenciesModule.RoactRodux
local T = InGameMenuDependenciesModule.t
local Parent = script.Parent.Parent
local WithLocalizationModule = require(Parent.Localization.withLocalization)
local SetMenuIconTooltipOpenModule = require(Parent.Actions.SetMenuIconTooltipOpen)
local ConstantsModule = require(Parent.Parent.TopBar.Constants)
local Tooltip = InGameMenuDependenciesModule.UIBlox.App.Dialog.Tooltip
local MenuIconTooltip = Roact.PureComponent:extend("MenuIconTooltip")
MenuIconTooltip.validateProps = T.strictInterface({ isTooltipOpen = T.boolean, onDismiss = T.callback })

function MenuIconTooltip.init(p1)
	-- upvalues: SignalsModule (copy), DisplayModule (copy)
	p1.disposeUiScaleEffect = SignalsModule.createEffect(function(p2)
		-- upvalues: DisplayModule (upval), p1 (copy)
		p1:setState({
			UiScale = DisplayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function MenuIconTooltip.render(p1)
	-- upvalues: WithLocalizationModule (copy), ConstantsModule (copy), Roact (copy), CoreGui (copy), Tooltip (copy)
	return WithLocalizationModule({
		bodyText = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
	})(function(p2)
		-- upvalues: ConstantsModule (upval), p1 (copy), Roact (upval), CoreGui (upval), Tooltip (upval)
		local _Vector2 = Vector2.new(ConstantsModule.ScreenSideOffset * p1.state.UiScale, ConstantsModule.TopBarHeight * p1.state.UiScale - 32)
		
		return p1.props.isTooltipOpen and Roact.createElement(Roact.Portal, { target = CoreGui }, {
			TooltipScreenGui = Roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Tooltip = Roact.createElement(Tooltip, {
					forceClickTriggerPoint = true,
					triggerPosition = _Vector2,
					triggerSize = Vector2.new(32, 32),
					bodyText = p2.bodyText,
					onDismiss = p1.props.onDismiss
				})
			})
		})
	end)
end

function MenuIconTooltip.willUnmount(p1)
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

return RoactRodux.UNSTABLE_connect2(function(p1, _)
	return { isTooltipOpen = p1.nativeClosePrompt.menuIconTooltipOpen }
end, function(Callback)
	-- upvalues: SetMenuIconTooltipOpenModule (copy)
	return {
		onDismiss = function()
			-- upvalues: Callback (copy), SetMenuIconTooltipOpenModule (upval)
			Callback(SetMenuIconTooltipOpenModule(false))
		end
	}
end)(MenuIconTooltip)