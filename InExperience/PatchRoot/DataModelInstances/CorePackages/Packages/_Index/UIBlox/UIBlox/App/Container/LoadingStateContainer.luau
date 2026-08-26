local parent = script.Parent.Parent.Parent
local parent_1 = parent.Parent
local roactModule = require(parent_1.Roact)
local tModule = require(parent_1.t)
local retrievalStatusModule = require(parent.App.Loading.Enum.RetrievalStatus)
local loadingStatePageModule = require(parent.App.Container.LoadingStatePage)
local failedStatePageModule = require(parent.App.Container.FailedStatePage)
local loadingStateContainer = roactModule.PureComponent:extend("LoadingStateContainer")
loadingStateContainer.validateProps = tModule.strictInterface({
	dataStatus = retrievalStatusModule.isEnumValue,
	renderOnLoaded = tModule.callback,
	renderOnFailed = tModule.optional(tModule.callback),
	onRetry = tModule.optional(tModule.callback),
	renderOnLoading = tModule.optional(tModule.callback),
	renderOnEmpty = tModule.optional(tModule.callback)
})

function loadingStateContainer.init(p1)
	-- upvalues: retrievalStatusModule (ref), roactModule (ref), loadingStatePageModule (ref), failedStatePageModule (ref)
	p1.statePages = {
		[retrievalStatusModule.NotStarted] = function()
			-- upvalues: p1 (ref), roactModule (copy), loadingStatePageModule (copy)
			return if p1.props.renderOnEmpty then p1.props.renderOnEmpty() elseif p1.props.renderOnLoading then p1.props.renderOnLoading() else roactModule.createElement(loadingStatePageModule)
		end,
		[retrievalStatusModule.Fetching] = function()
			-- upvalues: p1 (ref), roactModule (copy), loadingStatePageModule (copy)
			return if p1.props.renderOnLoading then p1.props.renderOnLoading() else roactModule.createElement(loadingStatePageModule)
		end,
		[retrievalStatusModule.Failed] = function()
			-- upvalues: p1 (ref), roactModule (copy), failedStatePageModule (copy)
			return if p1.props.renderOnFailed then p1.props.renderOnFailed() else roactModule.createElement(failedStatePageModule, { onRetry = p1.props.onRetry })
		end,
		[retrievalStatusModule.Done] = function()
			-- upvalues: p1 (ref)
			return p1.props.renderOnLoaded()
		end
	}
end

function loadingStateContainer.render(p1)
	return p1.statePages[p1.props.dataStatus]()
end

return loadingStateContainer