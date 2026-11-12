local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local GetPostStatusCardStoreModule = require(Moments.Stores.GetPostStatusCardStore)
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local SendrPostStatusToastModule = require(script.Parent.sendrPostStatusToast)

local function shouldHidePostStatusToast()
	-- upvalues: GetPostStatusCardStoreModule (copy), GetLocalUserIdModule (copy), MomentsGetMomentsUserStoreModule (copy)
	local PostStatusCardStoreModule = GetPostStatusCardStoreModule(false)
	local Flag = false
	
	for _, value in PostStatusCardStoreModule.getCards(false) do
		if value.cardType == "Live" then
			Flag = true
			break
		end
	end
	local LocalUserIdModule = GetLocalUserIdModule()
	local PendingUserMoment = if LocalUserIdModule == nil then nil else MomentsGetMomentsUserStoreModule(false).getPendingUserMoments(false)[LocalUserIdModule]
	local Flag1: boolean = Flag
	local v1 = nil
	
	if PendingUserMoment ~= nil then
		for _, value1 in PendingUserMoment do
			local MomentId = value1.moment.momentId
			
			if PostStatusCardStoreModule.hasHadLiveCard(MomentId) then
				Flag1 = true
			elseif value1.status ~= "Moderated" then
				if value1.publishedMoment ~= nil or not PostStatusCardStoreModule.isAwaitingLiveCard(MomentId) or v1 ~= nil then
					return false, nil
				end
				v1 = MomentId
			end
		end
	end
	if Flag1 and v1 ~= nil then
		return false, nil
	else
		return Flag1 or v1 ~= nil, v1
	end
end

return function()
	-- upvalues: UseMomentsTabIsVisibleModule (copy), ReactModule (copy), SendrPostStatusToastModule (copy), shouldHidePostStatusToast (copy), GetPostStatusCardStoreModule (copy)
	local UseMomentsTabIsVisibleModuleResult = UseMomentsTabIsVisibleModule()
	ReactModule.useEffect(function()
		-- upvalues: UseMomentsTabIsVisibleModuleResult (copy), SendrPostStatusToastModule (upval), shouldHidePostStatusToast (upval), GetPostStatusCardStoreModule (upval)
		return if UseMomentsTabIsVisibleModuleResult then SendrPostStatusToastModule.listen(function(p1)
			-- upvalues: SendrPostStatusToastModule (upval), shouldHidePostStatusToast (upval), GetPostStatusCardStoreModule (upval)
			if SendrPostStatusToastModule.isFailure(p1) then return end
			local ShouldHidePostStatusToast, ShouldHidePostStatusToast2 = shouldHidePostStatusToast()
			
			if ShouldHidePostStatusToast then
				SendrPostStatusToastModule.dismiss(p1)
				
				if ShouldHidePostStatusToast2 ~= nil then
					GetPostStatusCardStoreModule(false).markToastHiddenFor(ShouldHidePostStatusToast2)
				end
			end
		end) else nil
	end, { UseMomentsTabIsVisibleModuleResult })
end