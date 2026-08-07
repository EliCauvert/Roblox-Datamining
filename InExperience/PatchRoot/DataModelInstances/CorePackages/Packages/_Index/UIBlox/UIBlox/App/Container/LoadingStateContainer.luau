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

function loadingStateContainer.init(p0) --[[ line: 30 ]]
	-- upvalues: retrievalStatusModule (ref), roactModule (ref), loadingStatePageModule (ref), failedStatePageModule (ref)
	p0.statePages = {
		[retrievalStatusModule.NotStarted] = function() --[[ line: 32 ]]
			-- upvalues: p0 (ref), roactModule (copy), loadingStatePageModule (copy)
			return if p0.props.renderOnEmpty then p0.props.renderOnEmpty() elseif p0.props.renderOnLoading then p0.props.renderOnLoading() else roactModule.createElement(loadingStatePageModule)
		end,
		[retrievalStatusModule.Fetching] = function() --[[ line: 43 ]]
			-- upvalues: p0 (ref), roactModule (copy), loadingStatePageModule (copy)
			return if p0.props.renderOnLoading then p0.props.renderOnLoading() else roactModule.createElement(loadingStatePageModule)
		end,
		[retrievalStatusModule.Failed] = function() --[[ line: 50 ]]
			-- upvalues: p0 (ref), roactModule (copy), failedStatePageModule (copy)
			return if p0.props.renderOnFailed then p0.props.renderOnFailed() else roactModule.createElement(failedStatePageModule, { onRetry = p0.props.onRetry })
		end,
		[retrievalStatusModule.Done] = function() --[[ line: 59 ]]
			-- upvalues: p0 (ref)
			return p0.props.renderOnLoaded()
		end
	}
end

function loadingStateContainer.render(p1) --[[ line: 65 ]]
	return p1.statePages[p1.props.dataStatus]()
end

return loadingStateContainer