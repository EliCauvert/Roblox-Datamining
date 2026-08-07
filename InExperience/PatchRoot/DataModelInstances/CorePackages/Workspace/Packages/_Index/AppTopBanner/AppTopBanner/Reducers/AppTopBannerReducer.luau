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
	onAppTopBannerClick = function() --[[ line: 37 ]] end
}

return roduxModule.createReducer(t, {
	[require(appTopBanner.Actions.SetAppTopBanner).name] = function(p0, p1) --[[ line: 41 ]]
		-- upvalues: cryoModule (ref), constantsModule (ref), t (ref)
		local isDisabled = p0.isDisabled
		
		if p1.expanded then
			p0 = cryoModule.Dictionary.join(p0, {
				expanded = p1.expanded,
				appTopBannerType = p1.appTopBannerType,
				appTopBannerContentProps = p1.appTopBannerContentProps,
				onAppTopBannerClick = p1.onAppTopBannerClick,
				appTopBannerContentHeight = p1.appTopBannerContentHeight or constantsModule.CONTENT_HEIGHT,
				isDisabled = isDisabled
			})
			
			return p0
		elseif p0.expanded ~= p1.expanded then
			p0 = cryoModule.Dictionary.join(t, { isDisabled = isDisabled })
		end
		return p0
	end,
	[require(appTopBanner.Actions.DisableAppTopBanner).name] = function(p2, p3) --[[ line: 61 ]]
		-- upvalues: cryoModule (ref)
		return if p2.isDisabled == p3.isDisabled then p2 else cryoModule.Dictionary.join(p2, { isDisabled = not p2.isDisabled })
	end
})