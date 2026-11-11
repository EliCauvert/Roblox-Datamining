local CorePackages = game:GetService("CorePackages")
local Modules = game:GetService("CoreGui").RobloxGui.Modules
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local RoactAnalyticsModule = require(Modules.LuaApp.Services.RoactAnalytics)
local RoactServices = require(CorePackages.Workspace.Packages.RoactServices).RoactServices
local RoactNetworkingModule = require(Modules.LuaApp.Services.RoactNetworking)
local SetConnectionStateModule = require(Modules.AvatarExperience.AvatarEditor.Actions.SetConnectionState)
local RevokeOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Actions.RevokeOutfit)
local GrantAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GrantAsset)
local RevokeAssetModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.RevokeAsset)
local GrantOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.GrantOutfit)
local UpdateOutfitModule = require(Modules.AvatarExperience.AvatarEditor.Thunks.UpdateOutfit)
local UpdateAssetModerationStatusModule = require(Modules.AvatarExperience.AvatarEditor.Actions.UpdateAssetModerationStatus)
local EventReceiver = require(CorePackages.Packages.Roact).PureComponent:extend("EventReceiver")
local config = {
	approved = Enum.ModerationStatus.ReviewedApproved,
	moderated = Enum.ModerationStatus.ReviewedRejected
}

function EventReceiver.init(p1)
	-- upvalues: config (copy)
	local RobloxEventReceiver = p1.props.RobloxEventReceiver
	local Networking = p1.props.networking
	local Analytics = p1.props.analytics
	local GrantAssetFunction = p1.props.grantAsset
	local RevokeAssetFunction = p1.props.revokeAsset
	local GrantOutfitFunction = p1.props.grantOutfit
	local RevokeCostumeFunction = p1.props.revokeCostume
	local UpdateOutfitFunction = p1.props.updateOutfit
	local UpdateAssetModerationStatusFunction = p1.props.updateAssetModerationStatus
	local SetConnectionStateFunction = p1.props.setConnectionState
	p1.tokens = {
		RobloxEventReceiver:observeEvent("AvatarAssetOwnershipNotifications", function(p2)
			-- upvalues: p1 (copy), GrantAssetFunction (copy), Networking (copy), Analytics (copy), RevokeAssetFunction (copy)
			if p2.Type == "Grant" then
				GrantAssetFunction(tostring(p2.AssetTypeId), tostring(p2.AssetId), Networking, Analytics, p1.props.opaquePage)
				
				return
			end
			if p2.Type == "Revoke" then
				RevokeAssetFunction(p2.AssetTypeId, p2.AssetId)
			end
		end),
		RobloxEventReceiver:observeEvent("signalR", function(p2)
			-- upvalues: SetConnectionStateFunction (copy)
			SetConnectionStateFunction(p2)
		end),
		RobloxEventReceiver:observeEvent("AvatarOutfitOwnershipNotifications", function(p2)
			-- upvalues: p1 (copy), GrantOutfitFunction (copy), RevokeCostumeFunction (copy), UpdateOutfitFunction (copy), Networking (copy)
			if p2.Type == "Grant" then
				GrantOutfitFunction(p2.UserOutfitId, p1.props.opaquePage)
				
				return
			end
			if p2.Type == "Revoke" then
				RevokeCostumeFunction(p2.UserOutfitId)
				
				return
			end
			if p2.Type == "Update" then
				UpdateOutfitFunction(p2.UserOutfitId, Networking)
			end
		end),
		RobloxEventReceiver:observeEvent("IecOutfitModerationStatus", function(p2)
			-- upvalues: UpdateOutfitFunction (copy), Networking (copy)
			if p2 and p2.UserOutfitId then
				UpdateOutfitFunction(p2.UserOutfitId, Networking)
			end
		end),
		RobloxEventReceiver:observeEvent("IecAssetModerationStatus", function(p2)
			-- upvalues: config (upval), UpdateAssetModerationStatusFunction (copy)
			if p2 and p2.TargetId and p2.ModerationStatus then
				local Entry = config[p2.ModerationStatus]
				
				if Entry then
					UpdateAssetModerationStatusFunction(p2.TargetId, Entry, p2.TargetName, p2.UniverseId)
				end
			end
		end)
	}
end

function EventReceiver:render() end

function EventReceiver.willUnmount(p1)
	for _, token in p1.tokens do
		token:disconnect()
	end
end

return RoactRoduxModule.connect(function(p2)
	local Opaque = p2.AvatarExperience.AvatarScene.AvatarRoute.opaque
	
	return { opaquePage = Opaque and Opaque.name or nil }
end, function(Callback)
	-- upvalues: GrantAssetModule (copy), RevokeAssetModule (copy), SetConnectionStateModule (copy), GrantOutfitModule (copy), RevokeOutfitModule (copy), UpdateOutfitModule (copy), UpdateAssetModerationStatusModule (copy)
	return {
		grantAsset = function(p2, p3, p4, p5, p6)
			-- upvalues: Callback (copy), GrantAssetModule (upval)
			return Callback(GrantAssetModule(p2, p3, p4, p5, p6))
		end,
		revokeAsset = function(p2, p3)
			-- upvalues: Callback (copy), RevokeAssetModule (upval)
			return Callback(RevokeAssetModule(p2, p3))
		end,
		setConnectionState = function(p2)
			-- upvalues: Callback (copy), SetConnectionStateModule (upval)
			return Callback(SetConnectionStateModule(p2))
		end,
		grantOutfit = function(p2, p3)
			-- upvalues: Callback (copy), GrantOutfitModule (upval)
			return Callback(GrantOutfitModule(tostring(p2), p3))
		end,
		revokeCostume = function(p2)
			-- upvalues: Callback (copy), RevokeOutfitModule (upval)
			return Callback(RevokeOutfitModule(p2))
		end,
		updateOutfit = function(p2, p3)
			-- upvalues: Callback (copy), UpdateOutfitModule (upval)
			return Callback(UpdateOutfitModule(tostring(p2), p3))
		end,
		updateAssetModerationStatus = function(p2, p3, p4, p5)
			-- upvalues: Callback (copy), UpdateAssetModerationStatusModule (upval)
			return Callback(UpdateAssetModerationStatusModule(tostring(p2), p3, p4, (tostring(p5))))
		end
	}
end)((RoactServices.connect({
	networking = RoactNetworkingModule,
	analytics = RoactAnalyticsModule
})(EventReceiver)))