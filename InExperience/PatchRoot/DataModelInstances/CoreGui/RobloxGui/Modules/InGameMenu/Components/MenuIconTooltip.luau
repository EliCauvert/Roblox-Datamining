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

function menuIconTooltip.init(p0) --[[ line: 28 ]]
	-- upvalues: signalsModule (ref), displayModule (ref)
	p0.disposeUiScaleEffect = signalsModule.createEffect(function(p1) --[[ line: 29 ]]
		-- upvalues: displayModule (copy), p0 (ref)
		p0:setState({
			UiScale = displayModule.GetDisplayStore(p1).getUIScale(p1)
		})
	end)
end

function menuIconTooltip.render(p2) --[[ line: 37 ]]
	-- upvalues: withLocalizationModule (ref), constantsModule (ref), roact (ref), coreGuiService (ref), tooltip (ref)
	return withLocalizationModule({
		bodyText = "CoreScripts.InGameMenu.EducationalPopup.MenuIconTooltip"
	})(function(p3) --[[ line: 40 ]]
		-- upvalues: constantsModule (copy), p2 (ref), roact (copy), coreGuiService (copy), tooltip (copy)
		return p2.props.isTooltipOpen and roact.createElement(roact.Portal, { target = coreGuiService }, {
			TooltipScreenGui = roact.createElement("ScreenGui", {
				IgnoreGuiInset = true,
				ZIndexBehavior = Enum.ZIndexBehavior.Sibling
			}, {
				Tooltip = roact.createElement(tooltip, {
					forceClickTriggerPoint = true,
					triggerPosition = Vector2.new(constantsModule.ScreenSideOffset * p2.state.UiScale, constantsModule.TopBarHeight * p2.state.UiScale - 32),
					triggerSize = Vector2.new(32, 32),
					bodyText = p3.bodyText,
					onDismiss = p2.props.onDismiss
				})
			})
		})
	end)
end

function menuIconTooltip.willUnmount(p4) --[[ line: 65 ]]
	if p4.disposeUiScaleEffect then
		p4.disposeUiScaleEffect()
	end
end

return roactRodux.UNSTABLE_connect2(function(p5, _) --[[ line: 72 ]]
	return { isTooltipOpen = p5.nativeClosePrompt.menuIconTooltipOpen }
end, function(p6) --[[ line: 76 ]]
	-- upvalues: setMenuIconTooltipOpenModule (ref)
	return {
		onDismiss = function() --[[ line: 78 ]]
			-- upvalues: p6 (ref), setMenuIconTooltipOpenModule (copy)
			p6(setMenuIconTooltipOpenModule(false))
		end
	}
end)(menuIconTooltip)