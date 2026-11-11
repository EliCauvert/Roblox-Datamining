local AppTopBanner = script:FindFirstAncestor("AppTopBanner")
local Parent = AppTopBanner.Parent
local CryoModule = require(Parent.Cryo)
local ConstantsModule = require(AppTopBanner.Constants)
local config = {
	isDisabled = true,
	expanded = false,
	appTopBannerContentProps = nil,
	appTopBannerContentHeight = 0,
	appTopBannerType = require(AppTopBanner.Enums.AppTopBannerType).None,
	onAppTopBannerClick = function() end
}

return require(Parent.Rodux).createReducer(config, {
	[require(AppTopBanner.Actions.SetAppTopBanner).name] = function(JoinResult, p1)
		-- upvalues: CryoModule (copy), ConstantsModule (copy), config (copy)
		local IsDisabled = JoinResult.isDisabled
		
		if p1.expanded then
			JoinResult = CryoModule.Dictionary.join(JoinResult, {
				expanded = p1.expanded,
				appTopBannerType = p1.appTopBannerType,
				appTopBannerContentProps = p1.appTopBannerContentProps,
				onAppTopBannerClick = p1.onAppTopBannerClick,
				appTopBannerContentHeight = p1.appTopBannerContentHeight or ConstantsModule.CONTENT_HEIGHT,
				isDisabled = IsDisabled
			})
			
			return JoinResult
		end
		if JoinResult.expanded ~= p1.expanded then
			JoinResult = CryoModule.Dictionary.join(config, { isDisabled = IsDisabled })
		end
		return JoinResult
	end,
	[require(AppTopBanner.Actions.DisableAppTopBanner).name] = function(p1, p2)
		-- upvalues: CryoModule (copy)
		return if p1.isDisabled == p2.isDisabled then p1 else CryoModule.Dictionary.join(p1, { isDisabled = not p1.isDisabled })
	end
})