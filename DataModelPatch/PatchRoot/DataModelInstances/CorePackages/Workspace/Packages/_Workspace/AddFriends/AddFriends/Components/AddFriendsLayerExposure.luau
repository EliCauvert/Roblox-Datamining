local Parent = script:FindFirstAncestor("AddFriends").Parent
local _ = require(Parent.React)
local RoactAppExperimentModule = require(Parent.RoactAppExperiment)
local GetFStringSocialAddFriendsPageLayerFunction = require(Parent.SharedFlags).getFStringSocialAddFriendsPageLayer
local AddFriendsLayerExposure = require(Parent.Roact).PureComponent:extend("AddFriendsLayerExposure")

function AddFriendsLayerExposure.init(p1)
	p1.state = { layerExposedOnMount = false }
end

function AddFriendsLayerExposure.didMount(p1)
	p1:setState({ layerExposedOnMount = true })
end

function AddFriendsLayerExposure.render(p1)
	return if p1.state.layerExposedOnMount then p1.props.renderChild({}) else nil
end

return RoactAppExperimentModule.connectUserLayer({ GetFStringSocialAddFriendsPageLayerFunction() }, function(p1, _)
	-- upvalues: GetFStringSocialAddFriendsPageLayerFunction (copy)
	if p1[GetFStringSocialAddFriendsPageLayerFunction()] then
	end
	return {}
end)(AddFriendsLayerExposure)