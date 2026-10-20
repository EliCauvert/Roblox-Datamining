local Parent = script:FindFirstAncestor("PeopleReactView").Parent
local SignalsReactModule = require(Parent.SignalsReact)
local AvatarBackgroundModule = require(Parent.DataHydration.AvatarBackground)
local Signal = require(Parent.Signals).createSignal(nil)

return function(p1: number)
	-- upvalues: AvatarBackgroundModule (copy), Signal (copy), SignalsReactModule (copy)
	local AvatarBackgroundStore = AvatarBackgroundModule.getAvatarBackgroundStore(false)
	local UseSignalStateResult = SignalsReactModule.useSignalState(if p1 > 0 then AvatarBackgroundStore.getAndFetchAvatarBackground(p1).data else Signal)
	local AssetId = UseSignalStateResult and UseSignalStateResult.assetId
	
	return if AssetId then AvatarBackgroundModule.getAvatarBackgroundImageUrl(AssetId) else nil
end