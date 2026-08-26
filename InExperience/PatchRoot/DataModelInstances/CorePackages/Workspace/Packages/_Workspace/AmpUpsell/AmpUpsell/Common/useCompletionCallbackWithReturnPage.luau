local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local urlBase = require(parent.UrlBuilder).UrlBase
local appScreensModule = require(ampUpsell.Common.AppScreens)
local _ = require(ampUpsell.Common.Enums)

return function(p1, p2, p3)
	-- upvalues: reactModule (ref), urlBase (ref), appScreensModule (ref)
	return reactModule.useCallback(function(p4, p5)
		-- upvalues: p3 (ref), urlBase (copy), p1 (ref), appScreensModule (copy), p2 (ref)
		if p3 and p3.returnPage then
			local text = urlBase.new("www") .. "/" .. p2.returnPage
			p1.pop()
			p1.push(appScreensModule.GenericWebPage, {
				detail = text,
				extraProps = { titleKey = "CommonUI.Features.Label.Settings" }
			})
			
			return
		end
		p2(p4, p5)
	end, { p3, p2, p1 })
end