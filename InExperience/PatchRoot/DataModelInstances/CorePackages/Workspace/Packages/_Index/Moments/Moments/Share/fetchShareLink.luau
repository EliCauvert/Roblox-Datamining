local momentsGetMomentsShareLinkStoreModule = require(script:FindFirstAncestor("Moments").Parent.DataHydration.MomentsGetMomentsShareLinkStore)

return function(p0) --[[ line: 16 | named "fetchShareLink" ]]
	-- upvalues: momentsGetMomentsShareLinkStoreModule (ref)
	local andFetchShareLink = momentsGetMomentsShareLinkStoreModule(false).getAndFetchShareLink(p0.momentId, p0.description, p0.title, p0.feedItemId)
	while andFetchShareLink.status(false) == "NotReady" do
		task.wait()
	end
	return if andFetchShareLink.status(false) == "Ready" then andFetchShareLink.data(false) else nil
end