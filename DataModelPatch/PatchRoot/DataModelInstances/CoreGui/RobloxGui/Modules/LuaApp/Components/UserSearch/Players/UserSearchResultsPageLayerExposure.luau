local CorePackages = game:GetService("CorePackages")
local _ = require(CorePackages.Packages.React)
local CryoModule = require(CorePackages.Packages.Cryo)
local RoactAppExperimentModule = require(CorePackages.Packages.RoactAppExperiment)
local GetFStringSocialUserSearchResultsPageLayerFunction = require(CorePackages.Workspace.Packages.SharedFlags).getFStringSocialUserSearchResultsPageLayer
local FFlagPlayerSearchEnableOnlineFrequents = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequents
local FFlagPlayerSearchEnableOnlineFrequentsForAll = require(CorePackages.Workspace.Packages.SharedFlags).FFlagPlayerSearchEnableOnlineFrequentsForAll
local UserSearchResultsPageLayerExposure = require(CorePackages.Packages.Roact).PureComponent:extend("UserSearchResultsPageLayerExposure")

function UserSearchResultsPageLayerExposure.init(p1)
	p1.state = { layerExposedOnMount = false }
end

function UserSearchResultsPageLayerExposure.didMount(p1)
	p1:setState({ layerExposedOnMount = true })
end

function UserSearchResultsPageLayerExposure.render(p1)
	-- upvalues: CryoModule (copy)
	return if p1.state.layerExposedOnMount then p1.props.renderChild(CryoModule.Dictionary.join(p1.props, { renderChild = CryoModule.None })) else nil
end

return RoactAppExperimentModule.connectUserLayer({ GetFStringSocialUserSearchResultsPageLayerFunction() }, function(p1, _)
	-- upvalues: GetFStringSocialUserSearchResultsPageLayerFunction (copy), FFlagPlayerSearchEnableOnlineFrequents (copy), FFlagPlayerSearchEnableOnlineFrequentsForAll (copy)
	local v1 = p1[GetFStringSocialUserSearchResultsPageLayerFunction()] or {}
	
	return {
		enablePresenceIndicator = v1.enable_presence_indicator,
		enableOnlineFrequents = if FFlagPlayerSearchEnableOnlineFrequents and not FFlagPlayerSearchEnableOnlineFrequentsForAll then v1.enableOnlineFrequents else nil
	}
end)(UserSearchResultsPageLayerExposure)