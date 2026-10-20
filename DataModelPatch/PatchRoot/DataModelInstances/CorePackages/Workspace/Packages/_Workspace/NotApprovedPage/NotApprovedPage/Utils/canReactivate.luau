local NotApprovedPage = script:FindFirstAncestor("NotApprovedPage")
local Parent = NotApprovedPage.Parent
local INTERVENTIONTYPES = require(Parent.NotApprovedPageShared).Constants.INTERVENTION_TYPES
local MockableProxyServicesModule = require(Parent.MockableProxyServices)
local _ = require(NotApprovedPage.Common.Types)

return function(Banned, p1, p2): boolean
	-- upvalues: MockableProxyServicesModule (copy), INTERVENTIONTYPES (copy)
	if p2 == "" then
		local ScaledServerTimeNow = MockableProxyServicesModule.Workspace:GetServerTimeNow() * 1000
		local _DateTime = DateTime.fromIsoDate(p1)
		local IsScaledServerTimeNowAbove: boolean = _DateTime and ScaledServerTimeNow > _DateTime.UnixTimestampMillis
		
		return Banned == INTERVENTIONTYPES.Warning or (if Banned == INTERVENTIONTYPES.Banned and IsScaledServerTimeNowAbove then true else false)
	else
		return true
	end
end