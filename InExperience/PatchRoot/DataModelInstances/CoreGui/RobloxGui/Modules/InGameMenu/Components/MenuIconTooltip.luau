local coreGuiService = game:GetService("CoreGui")
local corePackagesService = game:GetService("CorePackages")
local signalsModule = require(corePackagesService.Packages.Signals)
local displayModule = require(corePackagesService.Workspace.Packages.Display)
local inGameMenuDependenciesModule = require(corePackagesService.Packages.InGameMenuDependencies)
local roact = inGameMenuDependenciesModule.Roact
local roactRodux = inGameMenuDependenciesModule.RoactRodux
local t = inGameMenuDependenciesModule.t
local UIBlox = inGameMenuDependenciesModule.UIBlox
local parent = script.Parent.Parent
local withLocalizationModule = require(parent.Localization.withLocalization)
local setMenuIconTooltipOpenModule = require(parent.Actions.SetMenuIconTooltipOpen)
local constantsModule = require(parent.Parent.TopBar.Constants)
local tooltip = UIBlox.App.Dialog.Tooltip
local menuIconTooltip = roact.PureComponent:extend("MenuIconTooltip")
menuIconTooltip.validateProps = t.strictInterface({ isTooltipOpen = t.boolean, onDismiss = t.callback })

function menuIconTooltip.init(p1)
	-- upvalues: signalsModule (ref), displayModule (ref)
	p1.disposeUiScaleEffect = signalsModule.createEffect(function(p2)
		-- upvalues: displayModule (copy), p1 (ref)
		p1:setState({
			UiScale = displayModule.GetDisplayStore(p2).getUIScale(p2)
		})
	end)
end

function menuIconTooltip.render(p1)
	-- upvalues: withLocalizationModule (ref), constantsModule (ref), roact (ref), coreGuiService (ref), tooltip (ref)
	return withLocalizationModule({
		bodyText = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
	})(function(p2)
		-- upvalues: constantsModule (copy), p1 (ref), roact (copy), coreGuiService (copy), tooltip (copy)
		return p1.props.isTooltipOpen and roact.createElement(roact.Portal, { target = coreGuiService }, {
			TooltipScreenGui = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Tooltip = roact.createElement(tooltip, {
					forceClickTriggerPoint = true,
					triggerPosition = Vector2.new(constantsModule.ScreenSideOffset * p1.state.UiScale, constantsModule.TopBarHeight * p1.state.UiScale - 32),
					triggerSize = Vector2.new(32, 32),
					bodyText = p2.bodyText,
					onDismiss = p1.props.onDismiss
				})
			})
		})
	end)
end

function menuIconTooltip.willUnmount(p1)
	if p1.disposeUiScaleEffect then
		p1.disposeUiScaleEffect()
	end
end

return roactRodux.UNSTABLE_connect2(function(p1, _)
	return { isTooltipOpen = p1.nativeClosePrompt.menuIconTooltipOpen }
end, function(p1)
	-- upvalues: setMenuIconTooltipOpenModule (ref)
	return {
		onDismiss = function()
			-- upvalues: p1 (ref), setMenuIconTooltipOpenModule (copy)
			p1(setMenuIconTooltipOpenModule(false))
		end
	}
end)(menuIconTooltip)