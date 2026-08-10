local serverDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local parent = serverDrivenUi.Parent
local cryoModule = require(parent.Cryo)
local reactModule = require(parent.React)
local heroUnitContainer = require(parent.DiscoveryHeroUnit).HeroUnitContainer
local sduiAttributionRow = require(parent.SduiSharedContent).SduiAttributionRow
local sduiTextPillModule = require(serverDrivenUi.Content.SduiTextPill)
local _ = require(parent.SduiCoreSystem)

return reactModule.memo(function(p0) --[[ line: 103 | named "SduiHeroUnit" ]]
	-- upvalues: reactModule (ref), sduiAttributionRow (ref), sduiTextPillModule (ref), cryoModule (ref), heroUnitContainer (ref)
	local children = p0.children
	local var4 = reactModule.useMemo(function() --[[ line: 108 ]]
		-- upvalues: p0 (ref), reactModule (copy), sduiAttributionRow (copy)
		return if p0.asset then reactModule.createElement(sduiAttributionRow, {
			image = p0.asset.image,
			title = p0.asset.title,
			subtitle = p0.asset.subtitle,
			rightButtonContent = p0.ctaButtonComponent,
			sduiContext = p0.sduiContext,
			onActivated = p0.onActivated
		}) else nil
	end, {
		p0.asset,
		p0.ctaButtonComponent,
		p0.sduiContext,
		p0.onActivated
	})
	local var5 = reactModule.useMemo(function() --[[ line: 124 ]]
		-- upvalues: p0 (ref), reactModule (copy), sduiTextPillModule (copy)
		return if p0.badgeText then reactModule.createElement(sduiTextPillModule, { sduiContext = p0.sduiContext, text = p0.badgeText }) else nil
	end, { p0.badgeText, p0.sduiContext })
	
	return reactModule.createElement(heroUnitContainer, reactModule.useMemo(function() --[[ line: 134 ]]
		-- upvalues: cryoModule (copy), var4 (ref), var5 (ref), p0 (ref)
		return cryoModule.Dictionary.join({
			bottomRowComponent = var4,
			overlayComponent = var5,
			sideMargin = p0.pageSideMargin
		}, p0)
	end, { p0, var4, var5, p0.pageSideMargin }), children)
end)