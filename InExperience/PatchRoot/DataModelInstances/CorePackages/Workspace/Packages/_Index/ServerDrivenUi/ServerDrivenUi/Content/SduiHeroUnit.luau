local ServerDrivenUi = script:FindFirstAncestor("ServerDrivenUi")
local Parent = ServerDrivenUi.Parent
local CryoModule = require(Parent.Cryo)
local ReactModule = require(Parent.React)
local HeroUnitContainer = require(Parent.DiscoveryHeroUnit).HeroUnitContainer
local SduiAttributionRow = require(Parent.SduiSharedContent).SduiAttributionRow
local SduiTextPillModule = require(ServerDrivenUi.Content.SduiTextPill)
local _ = require(Parent.SduiCoreSystem)

return ReactModule.memo(function(p1) --[[ Line: 103 | Named "SduiHeroUnit" ]]
	-- upvalues: ReactModule (copy), SduiAttributionRow (copy), SduiTextPillModule (copy), CryoModule (copy), HeroUnitContainer (copy)
	local UseMemoResult = ReactModule.useMemo(function() --[[ Line: 108 ]]
		-- upvalues: p1 (copy), ReactModule (upval), SduiAttributionRow (upval)
		return if p1.asset then ReactModule.createElement(SduiAttributionRow, {
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
	local UseMemoResult1 = ReactModule.useMemo(function() --[[ Line: 124 ]]
		-- upvalues: p1 (copy), ReactModule (upval), SduiTextPillModule (upval)
		return if p1.badgeText then ReactModule.createElement(SduiTextPillModule, { sduiContext = p1.sduiContext, text = p1.badgeText }) else nil
	end, { p1.badgeText, p1.sduiContext })
	
	return ReactModule.createElement(HeroUnitContainer, ReactModule.useMemo(function() --[[ Line: 134 ]]
		-- upvalues: CryoModule (upval), UseMemoResult (copy), UseMemoResult1 (copy), p1 (copy)
		return (CryoModule.Dictionary.join({
			bottomRowComponent = UseMemoResult,
			overlayComponent = UseMemoResult1,
			sideMargin = p1.pageSideMargin
		}, p1))
	end, { p1, UseMemoResult, UseMemoResult1, p1.pageSideMargin }), p1.children)
end)