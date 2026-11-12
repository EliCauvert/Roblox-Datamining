local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local Parent = InExperienceShop.Parent
local ReactModule = require(Parent.React)
local SignalsReactModule = require(Parent.SignalsReact)
local FFlagLuaAppEnableGamePassFreeTrialsModule = require(InExperienceShop.Flags.FFlagLuaAppEnableGamePassFreeTrials)
local FFlagEnableFreeTrialTopBarChipModule = require(InExperienceShop.Flags.FFlagEnableFreeTrialTopBarChip)
local GetInExperienceShopStoreModule = require(InExperienceShop.Stores.getInExperienceShopStore)
local _ = require(InExperienceShop.Types)

return function(p1, p2, p3)
	-- upvalues: SignalsReactModule (copy), GetInExperienceShopStoreModule (copy), FFlagLuaAppEnableGamePassFreeTrialsModule (copy), ReactModule (copy), FFlagEnableFreeTrialTopBarChipModule (copy)
	local UseSignalStateResult = SignalsReactModule.useSignalState(GetInExperienceShopStoreModule)
	
	return {
		isActionLoading = SignalsReactModule.useSignalState(function(p4): boolean
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy), p1 (copy)
			return if FFlagLuaAppEnableGamePassFreeTrialsModule then UseSignalStateResult.getTrialRedemptionInFlight(p4)[p1] == true else false
		end),
		isActionDisabled = SignalsReactModule.useSignalState(function(p4): boolean
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy)
			return if FFlagLuaAppEnableGamePassFreeTrialsModule then next(UseSignalStateResult.getTrialRedemptionInFlight(p4)) ~= nil else false
		end),
		onTryActivated = ReactModule.useCallback(function()
			-- upvalues: FFlagLuaAppEnableGamePassFreeTrialsModule (upval), UseSignalStateResult (copy), p1 (copy), p2 (copy), FFlagEnableFreeTrialTopBarChipModule (upval), p3 (copy)
			if FFlagLuaAppEnableGamePassFreeTrialsModule then
				UseSignalStateResult.redeemGamePassTrial(p1, p2, if FFlagEnableFreeTrialTopBarChipModule then p3 else nil)
			end
		end, {
			p1,
			p2,
			if FFlagEnableFreeTrialTopBarChipModule then p3 else nil,
			UseSignalStateResult.redeemGamePassTrial
		})
	}
end