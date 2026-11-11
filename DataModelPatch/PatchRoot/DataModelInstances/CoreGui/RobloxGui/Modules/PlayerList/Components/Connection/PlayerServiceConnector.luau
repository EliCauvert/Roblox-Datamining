local CorePackages = game:GetService("CorePackages")
local Players = game:GetService("Players")
local RobloxReplicatedStorage = game:GetService("RobloxReplicatedStorage")
local RoactModule = require(CorePackages.Packages.Roact)
local RoactRoduxModule = require(CorePackages.Packages.RoactRodux)
local Parent = script.Parent.Parent.Parent
local AddPlayerModule = require(Parent.Actions.AddPlayer)
local RemovePlayerModule = require(Parent.Actions.RemovePlayer)
local MakePlayerInfoRequestsModule = require(Parent.Thunks.MakePlayerInfoRequests)
local EventConnectionModule = require(script.Parent.EventConnection)
local FFlagBadgeVisibilitySettingEnabled = require(CorePackages.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local FFlagReplacePlayerIconRoduxWithSignal = require(CorePackages.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local DeferPlayerInfoRequests = game:DefineFastFlag("DeferPlayerInfoRequests", false)
local PlayerIconInfoStore = require(CorePackages.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
local PlayerServiceConnector = RoactModule.PureComponent:extend("PlayerServiceConnector")

function PlayerServiceConnector.didMount(p1)
	-- upvalues: Players (copy), FFlagBadgeVisibilitySettingEnabled (copy), RobloxReplicatedStorage (copy), DeferPlayerInfoRequests (copy)
	for _, player in ipairs((Players:GetPlayers())) do
		p1.props.addPlayer(player)
		p1.props.makePlayerInfoRequests(player)
	end
	if FFlagBadgeVisibilitySettingEnabled then
		spawn(function()
			-- upvalues: RobloxReplicatedStorage (upval), p1 (copy), Players (upval), DeferPlayerInfoRequests (upval)
			p1.sendPlayerProfileSettingsConnection = RobloxReplicatedStorage:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p2)
				-- upvalues: Players (upval), DeferPlayerInfoRequests (upval), p1 (upval)
				local Player = Players:GetPlayerByUserId((tonumber(p2)))
				
				if Player then
					if DeferPlayerInfoRequests then
						task.defer(function()
							-- upvalues: p1 (upval), Player (copy)
							p1.props.makePlayerInfoRequests(Player)
						end)
						
						return
					end
					p1.props.makePlayerInfoRequests(Player)
				end
			end)
		end)
	end
end

function PlayerServiceConnector.render(p2)
	-- upvalues: RoactModule (copy), EventConnectionModule (copy), Players (copy)
	return RoactModule.createFragment({
		PlayerAddedConnection = RoactModule.createElement(EventConnectionModule, {
			event = Players.PlayerAdded,
			callback = function(p3)
				-- upvalues: p2 (copy)
				p2.props.addPlayer(p3)
				p2.props.makePlayerInfoRequests(p3)
			end
		}),
		PlayerRemovingConnection = RoactModule.createElement(EventConnectionModule, {
			event = Players.PlayerRemoving,
			callback = function(p3)
				-- upvalues: p2 (copy)
				p2.props.removePlayer(p3)
			end
		})
	})
end

function PlayerServiceConnector.willUnmount(p2)
	-- upvalues: Players (copy), FFlagBadgeVisibilitySettingEnabled (copy)
	for _, player in ipairs((Players:GetPlayers())) do
		p2.props.removePlayer(player)
	end
	if FFlagBadgeVisibilitySettingEnabled and p2.sendPlayerProfileSettingsConnection then
		p2.sendPlayerProfileSettingsConnection:Disconnect()
	end
end

return RoactRoduxModule.connect(nil, function(Callback)
	-- upvalues: AddPlayerModule (copy), MakePlayerInfoRequestsModule (copy), FFlagReplacePlayerIconRoduxWithSignal (copy), PlayerIconInfoStore (copy), RemovePlayerModule (copy)
	return {
		addPlayer = function(p3)
			-- upvalues: Callback (copy), AddPlayerModule (upval)
			return Callback(AddPlayerModule(p3))
		end,
		makePlayerInfoRequests = function(p3)
			-- upvalues: Callback (copy), MakePlayerInfoRequestsModule (upval)
			return Callback(MakePlayerInfoRequestsModule(p3))
		end,
		removePlayer = function(Player)
			-- upvalues: FFlagReplacePlayerIconRoduxWithSignal (upval), PlayerIconInfoStore (upval), Callback (copy), RemovePlayerModule (upval)
			if FFlagReplacePlayerIconRoduxWithSignal then
				PlayerIconInfoStore.removePlayer(Player.UserId)
			end
			return Callback(RemovePlayerModule(Player))
		end
	}
end)(PlayerServiceConnector)