local Parent = script:FindFirstAncestor("Moments").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local _ = require(Parent.DataHydration.MomentsStoreTypes)
local MomentsGetMomentsUserStoreModule = require(Parent.DataHydration.MomentsGetMomentsUserStore)

return function(MomentId)
	-- upvalues: SignalsReactModule (copy), MomentsGetMomentsUserStoreModule (copy)
	for _, value in SignalsReactModule.useSignalState(MomentsGetMomentsUserStoreModule(false).getPendingUserMoments) do
		if value ~= nil then
			for _, value1 in value do
				if value1.moment.momentId == MomentId then
					return if value1.publishedMoment == nil then value1 else nil
				end
			end
		end
	end
	return nil
end