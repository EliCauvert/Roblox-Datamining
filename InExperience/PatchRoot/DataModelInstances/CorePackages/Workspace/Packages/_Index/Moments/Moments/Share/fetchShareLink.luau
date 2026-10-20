local MomentsGetMomentsShareLinkStoreModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.MomentsGetMomentsShareLinkStore)

return function(p1)
	-- upvalues: MomentsGetMomentsShareLinkStoreModule (copy)
	local AndFetchShareLink = MomentsGetMomentsShareLinkStoreModule(false).getAndFetchShareLink(p1.momentId, p1.description, p1.title, p1.feedItemId)
	while AndFetchShareLink.status(false) == "NotReady" do
		task.wait()
	end
	return if AndFetchShareLink.status(false) == "Ready" then AndFetchShareLink.data(false) else nil
end