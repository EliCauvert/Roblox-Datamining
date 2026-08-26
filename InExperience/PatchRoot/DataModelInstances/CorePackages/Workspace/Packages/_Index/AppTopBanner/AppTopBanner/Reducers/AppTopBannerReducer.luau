local appTopBanner = script:FindFirstAncestor("AppTopBanner")
local parent = appTopBanner.Parent
local cryoModule = require(parent.Cryo)
local roduxModule = require(parent.Rodux)
local constantsModule = require(appTopBanner.Constants)
local t = {
	isDisabled = true,
	expanded = false,
	appTopBannerContentProps = nil,
	appTopBannerContentHeight = 0,
	appTopBannerType = require(appTopBanner.Enums.AppTopBannerType).None,
	onAppTopBannerClick = function() end
}

return roduxModule.createReducer(t, {
	[require(appTopBanner.Actions.SetAppTopBanner).name] = function(p1, p2)
		-- upvalues: cryoModule (ref), constantsModule (ref), t (ref)
		local isDisabled = p1.isDisabled
		
		if p2.expanded then
			p1 = cryoModule.Dictionary.join(p1, {
				expanded = p2.expanded,
				appTopBannerType = p2.appTopBannerType,
				appTopBannerContentProps = p2.appTopBannerContentProps,
				onAppTopBannerClick = p2.onAppTopBannerClick,
				appTopBannerContentHeight = p2.appTopBannerContentHeight or constantsModule.CONTENT_HEIGHT,
				isDisabled = isDisabled
			})
			
			return p1
		elseif p1.expanded ~= p2.expanded then
			p1 = cryoModule.Dictionary.join(t, { isDisabled = isDisabled })
		end
		return p1
	end,
	[require(appTopBanner.Actions.DisableAppTopBanner).name] = function(p1, p2)
		-- upvalues: cryoModule (ref)
		return if p1.isDisabled == p2.isDisabled then p1 else cryoModule.Dictionary.join(p1, { isDisabled = not p1.isDisabled })
	end
})