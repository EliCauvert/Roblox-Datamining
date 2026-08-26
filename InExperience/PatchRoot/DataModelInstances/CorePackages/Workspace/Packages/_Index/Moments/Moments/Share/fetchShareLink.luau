local momentsGetMomentsShareLinkStoreModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.MomentsGetMomentsShareLinkStore)

return function(p1)
	-- upvalues: momentsGetMomentsShareLinkStoreModule (ref)
	local andFetchShareLink = momentsGetMomentsShareLinkStoreModule(false).getAndFetchShareLink(p1.momentId, p1.description, p1.title, p1.feedItemId)
	while andFetchShareLink.status(false) == "NotReady" do
		task.wait()
	end
	return if andFetchShareLink.status(false) == "Ready" then andFetchShareLink.data(false) else nil
end