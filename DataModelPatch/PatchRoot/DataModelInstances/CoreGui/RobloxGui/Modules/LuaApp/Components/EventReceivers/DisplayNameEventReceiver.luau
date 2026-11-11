local CorePackages = game:GetService("CorePackages")
local LocalStorageKey = require(CorePackages.Workspace.Packages.LocalStorage).Enums.LocalStorageKey
local EventNetworkingModule = require(script.Parent.EventNetworking)
local LuaSocialLibrariesDepsModule = require(CorePackages.Packages.LuaSocialLibrariesDeps)
local ConfigResult = LuaSocialLibrariesDepsModule.SocialLibraries.config({})
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Llama = LuaSocialLibrariesDepsModule.llama
local ReceivedDisplayNameFunction = require(CorePackages.Workspace.Packages.UserLib).Actions.ReceivedDisplayName
local DisplayNameEventReceiver = require(CorePackages.Packages.Roact).Component:extend("DisplayNameEventReceiver")
local t = {}
DisplayNameEventReceiver.defaultProps = { appStorageService = game:GetService("AppStorageService") }

function DisplayNameEventReceiver.init(p1)
	-- upvalues: LocalStorageKey (copy), Llama (copy)
	p1.tokens = {
		p1.props.RobloxEventReceiver:observeEvent("DisplayNameNotifications", function(Player)
			-- upvalues: p1 (copy), LocalStorageKey (upval), Llama (upval)
			local UserId = Player.UserId
			local NewDisplayName = Player.NewDisplayName
			p1.props.appStorageService:SetItem(LocalStorageKey.DisplayName, NewDisplayName)
			p1.props.appStorageService:Flush()
			p1.props.receivedDisplayName(UserId, NewDisplayName)
			local User = p1.props.users[tostring(UserId)]
			
			if User then
				p1.props.userUpdated(Llama.Dictionary.join(User, { displayName = NewDisplayName }))
			end
		end)
	}
end

function DisplayNameEventReceiver:render()
	return nil
end

function DisplayNameEventReceiver.willUnmount(p1)
	for _, token in pairs(p1.tokens) do
		token:disconnect()
	end
end

return RoactRoduxModule.connect(function(p2)
	-- upvalues: ConfigResult (copy), t (copy)
	return {
		localUserId = p2.LocalUserId,
		users = ConfigResult.Dictionary.getDeepValue(p2, "FriendsCarousel.Users.byUserId") or t
	}
end, function(Callback)
	-- upvalues: ReceivedDisplayNameFunction (copy), EventNetworkingModule (copy)
	return {
		receivedDisplayName = function(p2, p3)
			-- upvalues: Callback (copy), ReceivedDisplayNameFunction (upval)
			Callback(ReceivedDisplayNameFunction(p2, p3))
		end,
		userUpdated = function(p2)
			-- upvalues: Callback (copy), EventNetworkingModule (upval)
			return Callback(EventNetworkingModule.RoduxUsers.Actions.UserUpdated(p2))
		end
	}
end)(DisplayNameEventReceiver)