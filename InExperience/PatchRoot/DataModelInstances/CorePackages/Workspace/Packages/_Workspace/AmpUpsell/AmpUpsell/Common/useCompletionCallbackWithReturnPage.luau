local ampUpsell = script:FindFirstAncestor("AmpUpsell")
local parent = ampUpsell.Parent
local reactModule = require(parent.React)
local urlBase = require(parent.UrlBuilder).UrlBase
local appScreensModule = require(ampUpsell.Common.AppScreens)
local _ = require(ampUpsell.Common.Enums)

return function(p0, p1, p2) --[[ line: 15 | named "useCompletionCallbackWithReturnPage" ]]
	-- upvalues: reactModule (ref), urlBase (ref), appScreensModule (ref)
	return reactModule.useCallback(function(p3, p4) --[[ line: 20 ]]
		-- upvalues: p2 (ref), urlBase (copy), p0 (ref), appScreensModule (copy), p1 (ref)
		if p2 and p2.returnPage then
			local text = urlBase.new("www") .. "/" .. p2.returnPage
			p0.pop()
			p0.push(appScreensModule.GenericWebPage, {
				detail = text,
				extraProps = { titleKey = "CommonUI.Features.Label.Settings" }
			})
			
			return
		end
		p1(p3, p4)
	end, { p2, p1, p0 })
end