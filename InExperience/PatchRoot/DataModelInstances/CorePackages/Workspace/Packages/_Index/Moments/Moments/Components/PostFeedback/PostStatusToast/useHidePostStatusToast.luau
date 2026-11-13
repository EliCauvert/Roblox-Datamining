local Moments = script:FindFirstAncestor("Moments")
local Parent = Moments.Parent
local ReactModule = require(Parent.React)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)
local GetLocalUserIdModule = require(Moments.Utils.getLocalUserId)
local GetPostStatusCardStoreModule = require(Moments.Stores.GetPostStatusCardStore)
local UseMomentsTabIsVisibleModule = require(Moments.Hooks.useMomentsTabIsVisible)
local SendrPostStatusToastModule = require(script.Parent.sendrPostStatusToast)
local MomentsUpload = if require(Parent.SharedFlags).FFlagMomentsPostFeedback then require(Parent.Loggers).Logger:new("Moments.Upload") else nil

local function shouldHidePostStatusToast()
	-- upvalues: GetPostStatusCardStoreModule (copy), GetLocalUserIdModule (copy), MomentsGetMomentsUserStoreModule (copy)
	local PostStatusCardStoreModule = GetPostStatusCardStoreModule(false)
	local Flag = false
	local Flag1 = false
	local t = {}
	
	local function _(Key)
		-- upvalues: Flag (ref), PostStatusCardStoreModule (copy), Flag1 (ref), t (copy)
		Flag = true
		
		if PostStatusCardStoreModule.hadToastHidden(Key) then return end
		if PostStatusCardStoreModule.hadToastProbablySpent(Key) then
			Flag1 = true
			
			return
		else
			t[Key] = true
		end
	end
	
	for _, value in PostStatusCardStoreModule.getCards(false) do
		if value.cardType == "Live" then
			local Id = value.id
			Flag = true
			
			if not PostStatusCardStoreModule.hadToastHidden(Id) then
				if PostStatusCardStoreModule.hadToastProbablySpent(Id) then
					Flag1 = true
				else
					t[Id] = true
				end
			end
		end
	end
	local LocalUserIdModule = GetLocalUserIdModule()
	local PendingUserMoment = if LocalUserIdModule == nil then nil else MomentsGetMomentsUserStoreModule(false).getPendingUserMoments(false)[LocalUserIdModule]
	local List = {}
	
	if PendingUserMoment ~= nil then
		for _, value1 in PendingUserMoment do
			local MomentId = value1.moment.momentId
			
			if PostStatusCardStoreModule.hasHadLiveCard(MomentId) then
				Flag = true
				
				if not PostStatusCardStoreModule.hadToastHidden(MomentId) then
					if PostStatusCardStoreModule.hadToastProbablySpent(MomentId) then
						Flag1 = true
					else
						t[MomentId] = true
					end
				end
			elseif value1.status ~= "Moderated" and not PostStatusCardStoreModule.hadToastHidden(MomentId) and not PostStatusCardStoreModule.isUploading(MomentId) then
				if PostStatusCardStoreModule.hadToastProbablySpent(MomentId) then
					Flag1 = true
				elseif value1.publishedMoment ~= nil or not PostStatusCardStoreModule.isAwaitingLiveCard(MomentId) then
					return false, nil, false
				else
					table.insert(List, MomentId)
				end
			end
		end
	end
	local v1 = nil
	local Count = 0
	
	for i in t do
		v1 = i
		Count += 1
	end
	if #List > 0 then
		if Count > 0 then
			return false, nil, false
		elseif #List == 1 then
			return true, List[1], Flag1
		else
			return true, List[#List], true
		end
	elseif not Flag then
		return false, nil, false
	elseif Count == 1 then
		return true, v1, true
	else
		return true, nil, false
	end
end

return function()
	-- upvalues: UseMomentsTabIsVisibleModule (copy), ReactModule (copy), SendrPostStatusToastModule (copy), MomentsUpload (copy), shouldHidePostStatusToast (copy), GetPostStatusCardStoreModule (copy)
	local UseMomentsTabIsVisibleModuleResult = UseMomentsTabIsVisibleModule()
	ReactModule.useEffect(function()
		-- upvalues: UseMomentsTabIsVisibleModuleResult (copy), SendrPostStatusToastModule (upval), MomentsUpload (upval), shouldHidePostStatusToast (upval), GetPostStatusCardStoreModule (upval)
		return if UseMomentsTabIsVisibleModuleResult then SendrPostStatusToastModule.listen(function(p1)
			-- upvalues: SendrPostStatusToastModule (upval), MomentsUpload (upval), shouldHidePostStatusToast (upval), GetPostStatusCardStoreModule (upval)
			if not SendrPostStatusToastModule.isFailure(p1) then
				local ShouldHidePostStatusToast, ShouldHidePostStatusToast2, ShouldHidePostStatusToast3 = shouldHidePostStatusToast()
				
				if MomentsUpload ~= nil then
					MomentsUpload:debug("event=post_status_toast decision={} creditedMomentId={} guess={}", if ShouldHidePostStatusToast then "hidden" else "shown", ShouldHidePostStatusToast2 or "nil", (tostring(ShouldHidePostStatusToast3)))
				end
				if ShouldHidePostStatusToast then
					SendrPostStatusToastModule.dismiss(p1)
					
					if ShouldHidePostStatusToast2 ~= nil then
						if ShouldHidePostStatusToast3 then
							GetPostStatusCardStoreModule(false).markToastProbablySpentFor(ShouldHidePostStatusToast2)
							
							return
						end
						GetPostStatusCardStoreModule(false).markToastHiddenFor(ShouldHidePostStatusToast2)
					end
				end
				return
			elseif MomentsUpload ~= nil then
				MomentsUpload:debug("event=post_status_toast decision=shown reason=failure")
			end
		end) else nil
	end, { UseMomentsTabIsVisibleModuleResult })
end