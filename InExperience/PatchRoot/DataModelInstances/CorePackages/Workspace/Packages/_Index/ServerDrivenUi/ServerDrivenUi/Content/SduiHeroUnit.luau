local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local heroUnitContainer = require(parent.DiscoveryHeroUnit).HeroUnitContainer
local sduiAttributionRow = require(parent.SduiSharedContent).SduiAttributionRow
local sduiTextPillModule = require(serverDrivenUi.Content.SduiTextPill)
local _ = require(parent.SduiCoreSystem)

return reactModule.memo(function(p1)
	-- upvalues: reactModule (ref), sduiAttributionRow (ref), sduiTextPillModule (ref), cryoModule (ref), heroUnitContainer (ref)
	local children = p1.children
	local var1 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), sduiAttributionRow (copy)
		return if p1.asset then reactModule.createElement(sduiAttributionRow, {
			image = p1.asset.image,
			title = p1.asset.title,
			subtitle = p1.asset.subtitle,
			rightButtonContent = p1.ctaButtonComponent,
			sduiContext = p1.sduiContext,
			onActivated = p1.onActivated
		}) else nil
	end, {
		p1.asset,
		p1.ctaButtonComponent,
		p1.sduiContext,
		p1.onActivated
	})
	local var2 = reactModule.useMemo(function()
		-- upvalues: p1 (ref), reactModule (copy), sduiTextPillModule (copy)
		return if p1.badgeText then reactModule.createElement(sduiTextPillModule, { sduiContext = p1.sduiContext, text = p1.badgeText }) else nil
	end, { p1.badgeText, p1.sduiContext })
	
	return reactModule.createElement(heroUnitContainer, reactModule.useMemo(function()
		-- upvalues: cryoModule (copy), var1 (ref), var2 (ref), p1 (ref)
		return cryoModule.Dictionary.join({
			bottomRowComponent = var1,
			overlayComponent = var2,
			sideMargin = p1.pageSideMargin
		}, p1)
	end, { p1, var1, var2, p1.pageSideMargin }), children)
end)