local Parent = script:FindFirstAncestor("Moments").Parent
local ReactModule = require(Parent.React)
local UseSignalStateFunction = require(Parent.SignalsReact).useSignalState
local _ = require(script.Parent.createPostInsightsPageStore)
local GetPostInsightsPageStoreModule = require(script.Parent.getPostInsightsPageStore)
local PostInsightsPageViewModule = require(script.Parent.PostInsightsPageView)
local UsePostInsightsPageViewModelModule = require(script.Parent.usePostInsightsPageViewModel)

local function PostInsightsPage(p1) --[[ Line: 22 ]]
	-- upvalues: UsePostInsightsPageViewModelModule (copy), ReactModule (copy), PostInsightsPageViewModule (copy)
	return ReactModule.createElement(PostInsightsPageViewModule, (UsePostInsightsPageViewModelModule(p1.context, p1.onBack)))
end

return ReactModule.memo(function() --[[ Line: 27 | Named "PostInsightsPageContainer" ]]
	-- upvalues: GetPostInsightsPageStoreModule (copy), UseSignalStateFunction (copy), ReactModule (copy), PostInsightsPage (copy)
	local PostInsightsPageStoreModule = GetPostInsightsPageStoreModule(false)
	local UseSignalStateResult = UseSignalStateFunction(PostInsightsPageStoreModule.getIsOpen)
	local UseSignalStateResult1 = UseSignalStateFunction(PostInsightsPageStoreModule.getContext)
	
	return if UseSignalStateResult and UseSignalStateResult1 ~= nil then ReactModule.createElement(PostInsightsPage, {
		key = UseSignalStateResult1.moment.momentId,
		context = UseSignalStateResult1,
		onBack = PostInsightsPageStoreModule.close
	}) else nil
end)