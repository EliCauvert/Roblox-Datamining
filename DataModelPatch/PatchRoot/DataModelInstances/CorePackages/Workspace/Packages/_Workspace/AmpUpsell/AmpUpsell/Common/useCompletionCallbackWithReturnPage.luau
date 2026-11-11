local AmpUpsell = script:FindFirstAncestor("AmpUpsell")
local Parent = AmpUpsell.Parent
local ReactModule = require(Parent.React)
local UrlBase = require(Parent.UrlBuilder).UrlBase
local AppScreensModule = require(AmpUpsell.Common.AppScreens)
local _ = require(AmpUpsell.Common.Enums)

return function(p1, Callback, p2)
	-- upvalues: ReactModule (copy), UrlBase (copy), AppScreensModule (copy)
	return ReactModule.useCallback(function(p3, p4)
		-- upvalues: p2 (copy), UrlBase (upval), p1 (copy), AppScreensModule (upval), Callback (copy)
		if p2 and p2.returnPage then
			local Text = UrlBase.new("www") .. "/" .. p2.returnPage
			p1.pop()
			p1.push(AppScreensModule.GenericWebPage, {
				detail = Text,
				extraProps = { titleKey = "CommonUI.Features.Label.Settings" }
			})
			
			return
		else
			Callback(p3, p4)
		end
	end, { p2, Callback, p1 })
end