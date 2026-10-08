local parent = script:FindFirstAncestor("MomentsCommon").Parent
local reactModule = require(parent.React)
local useDispatch = require(parent.RoactUtils).Hooks.RoactRodux.useDispatch
local appPage = require(parent.RobloxAppEnums).AppPage
local setCurrentToastMessage = require(parent.ToastRodux).Actions.SetCurrentToastMessage
local images = require(parent.UIBlox).App.ImageSet.Images
local fFlagMomentsBlockingModalInOverlay = require(parent.SharedFlags).FFlagMomentsBlockingModalInOverlay

return function(p1)
	-- upvalues: useDispatch (ref), reactModule (ref), appPage (ref), fFlagMomentsBlockingModalInOverlay (ref), setCurrentToastMessage (ref), images (ref)
	local var1 = useDispatch()
	
	return if p1 == nil then nil else reactModule.useCallback(function(p2)
		-- upvalues: p1 (ref), appPage (copy), fFlagMomentsBlockingModalInOverlay (copy), var1 (ref), setCurrentToastMessage (copy), images (copy)
		p1.push(appPage.BlockingModal, {
			navProps = {
				userId = p2.userId,
				onBlockConfirmed = p2.onBlockConfirmed,
				onBlockFailed = p2.onBlockFailed,
				openReportUser = p2.openReportUser,
				presentInOverlay = if fFlagMomentsBlockingModalInOverlay then true else nil,
				onBlockSuccess = function()
					-- upvalues: var1 (copy), setCurrentToastMessage (copy), images (copy), p2 (ref)
					var1(setCurrentToastMessage({
						toastMessage = "Feature.Profile.Action.UserBlocked",
						toastIcon = images["icons/actions/block"]
					}))
					
					if p2.onBlockSucceeded ~= nil then
						p2.onBlockSucceeded()
					end
				end
			}
		})
	end, { p1, var1 })
end