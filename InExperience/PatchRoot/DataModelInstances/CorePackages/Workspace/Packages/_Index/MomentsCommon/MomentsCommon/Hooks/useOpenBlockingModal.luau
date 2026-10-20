local Parent = script:FindFirstAncestor("MomentsCommon").Parent
local ReactModule = require(Parent.React)
local UseDispatchFunction = require(Parent.RoactUtils).Hooks.RoactRodux.useDispatch
local AppPage = require(Parent.RobloxAppEnums).AppPage
local SetCurrentToastMessageFunction = require(Parent.ToastRodux).Actions.SetCurrentToastMessage
local Images = require(Parent.UIBlox).App.ImageSet.Images
local FFlagMomentsBlockingModalInOverlay = require(Parent.SharedFlags).FFlagMomentsBlockingModalInOverlay

return function(p1)
	-- upvalues: UseDispatchFunction (copy), ReactModule (copy), AppPage (copy), FFlagMomentsBlockingModalInOverlay (copy), SetCurrentToastMessageFunction (copy), Images (copy)
	local UseDispatchResult = UseDispatchFunction()
	local UseResult = ReactModule.useCallback(function(p2)
		-- upvalues: p1 (copy), AppPage (upval), FFlagMomentsBlockingModalInOverlay (upval), UseDispatchResult (copy), SetCurrentToastMessageFunction (upval), Images (upval)
		p1.push(AppPage.BlockingModal, {
			navProps = {
				userId = p2.userId,
				onBlockConfirmed = p2.onBlockConfirmed,
				onBlockFailed = p2.onBlockFailed,
				openReportUser = p2.openReportUser,
				presentInOverlay = if FFlagMomentsBlockingModalInOverlay then true else nil,
				onBlockSuccess = function()
					-- upvalues: UseDispatchResult (upval), SetCurrentToastMessageFunction (upval), Images (upval), p2 (copy)
					UseDispatchResult(SetCurrentToastMessageFunction({
						toastMessage = "Feature.Profile.Action.UserBlocked",
						toastIcon = Images["icons/actions/block"]
					}))
					
					if p2.onBlockSucceeded ~= nil then
						p2.onBlockSucceeded()
					end
				end
			}
		})
	end, { p1, UseDispatchResult })
	
	return if p1 == nil then nil else UseResult
end