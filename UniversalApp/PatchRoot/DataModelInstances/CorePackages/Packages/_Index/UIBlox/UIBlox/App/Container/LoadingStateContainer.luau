local Parent = script.Parent.Parent.Parent
local Parent1 = Parent.Parent
local RoactModule = require(Parent1.Roact)
local TModule = require(Parent1.t)
local RetrievalStatusModule = require(Parent.App.Loading.Enum.RetrievalStatus)
local LoadingStatePageModule = require(Parent.App.Container.LoadingStatePage)
local FailedStatePageModule = require(Parent.App.Container.FailedStatePage)
local LoadingStateContainer = RoactModule.PureComponent:extend("LoadingStateContainer")
LoadingStateContainer.validateProps = TModule.strictInterface({
	dataStatus = RetrievalStatusModule.isEnumValue,
	renderOnLoaded = TModule.callback,
	renderOnFailed = TModule.optional(TModule.callback),
	onRetry = TModule.optional(TModule.callback),
	renderOnLoading = TModule.optional(TModule.callback),
	renderOnEmpty = TModule.optional(TModule.callback)
})

function LoadingStateContainer.init(p1)
	-- upvalues: RetrievalStatusModule (copy), RoactModule (copy), LoadingStatePageModule (copy), FailedStatePageModule (copy)
	p1.statePages = {
		[RetrievalStatusModule.NotStarted] = function()
			-- upvalues: p1 (copy), RoactModule (upval), LoadingStatePageModule (upval)
			return if p1.props.renderOnEmpty then p1.props.renderOnEmpty() elseif p1.props.renderOnLoading then p1.props.renderOnLoading() else RoactModule.createElement(LoadingStatePageModule)
		end,
		[RetrievalStatusModule.Fetching] = function()
			-- upvalues: p1 (copy), RoactModule (upval), LoadingStatePageModule (upval)
			return if p1.props.renderOnLoading then p1.props.renderOnLoading() else RoactModule.createElement(LoadingStatePageModule)
		end,
		[RetrievalStatusModule.Failed] = function()
			-- upvalues: p1 (copy), RoactModule (upval), FailedStatePageModule (upval)
			return if p1.props.renderOnFailed then p1.props.renderOnFailed() else RoactModule.createElement(FailedStatePageModule, { onRetry = p1.props.onRetry })
		end,
		[RetrievalStatusModule.Done] = function()
			-- upvalues: p1 (copy)
			return p1.props.renderOnLoaded()
		end
	}
end

function LoadingStateContainer.render(p1)
	return p1.statePages[p1.props.dataStatus]()
end

return LoadingStateContainer