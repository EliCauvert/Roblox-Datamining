local corePackagesService = game:GetService("CorePackages")
local playersService = game:GetService("Players")
local robloxReplicatedStorageService = game:GetService("RobloxReplicatedStorage")
local roactModule = require(corePackagesService.Packages.Roact)
local roactRoduxModule = require(corePackagesService.Packages.RoactRodux)
local parent = script.Parent.Parent.Parent
local addPlayerModule = require(parent.Actions.AddPlayer)
local removePlayerModule = require(parent.Actions.RemovePlayer)
local makePlayerInfoRequestsModule = require(parent.Thunks.MakePlayerInfoRequests)
local eventConnectionModule = require(script.Parent.EventConnection)
local fFlagBadgeVisibilitySettingEnabled = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagBadgeVisibilitySettingEnabled
local fFlagReplacePlayerIconRoduxWithSignal = require(corePackagesService.Workspace.Packages.SharedFlags).FFlagReplacePlayerIconRoduxWithSignal
local deferPlayerInfoRequests = game:DefineFastFlag("DeferPlayerInfoRequests", false)
local playerIconInfoStore = require(corePackagesService.Workspace.Packages.PlayerIconInfoStore).PlayerIconInfoStore
local playerServiceConnector = roactModule.PureComponent:extend("PlayerServiceConnector")

function playerServiceConnector.didMount(p1)
	-- upvalues: playersService (ref), fFlagBadgeVisibilitySettingEnabled (ref), robloxReplicatedStorageService (ref), deferPlayerInfoRequests (ref)
	for i, v in ipairs(playersService:GetPlayers()) do
		p1.props.addPlayer(v)
		p1.props.makePlayerInfoRequests(v)
	end
	if fFlagBadgeVisibilitySettingEnabled then
		spawn(function()
			-- upvalues: robloxReplicatedStorageService (copy), p1 (ref), playersService (copy), deferPlayerInfoRequests (copy)
			p1.sendPlayerProfileSettingsConnection = robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p2)
				-- upvalues: playersService (copy), deferPlayerInfoRequests (copy), p1 (copy)
				local var1 = playersService:GetPlayerByUserId(tonumber(p2))
				
				if var1 then
					if deferPlayerInfoRequests then
						task.defer(function()
							-- upvalues: p1 (copy), var1 (ref)
							p1.props.makePlayerInfoRequests(var1)
						end)
						
						return
					end
					p1.props.makePlayerInfoRequests(var1)
				end
			end)
		end)
	end
end

function playerServiceConnector.render(p2)
	-- upvalues: roactModule (ref), eventConnectionModule (ref), playersService (ref)
	return roactModule.createFragment({
		PlayerAddedConnection = roactModule.createElement(eventConnectionModule, {
			event = playersService.PlayerAdded,
			callback = function(p3)
				-- upvalues: p2 (ref)
				p2.props.addPlayer(p3)
				p2.props.makePlayerInfoRequests(p3)
			end
		}),
		PlayerRemovingConnection = roactModule.createElement(eventConnectionModule, {
			event = playersService.PlayerRemoving,
			callback = function(p3)
				-- upvalues: p2 (ref)
				p2.props.removePlayer(p3)
			end
		})
	})
end

function playerServiceConnector.willUnmount(p2)
	-- upvalues: playersService (ref), fFlagBadgeVisibilitySettingEnabled (ref)
	for i, v in ipairs(playersService:GetPlayers()) do
		p2.props.removePlayer(v)
	end
	if fFlagBadgeVisibilitySettingEnabled and p2.sendPlayerProfileSettingsConnection then
		p2.sendPlayerProfileSettingsConnection:Disconnect()
	end
end

return roactRoduxModule.connect(nil, function(p3)
	-- upvalues: addPlayerModule (ref), makePlayerInfoRequestsModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), removePlayerModule (ref)
	return {
		addPlayer = function(p4)
			-- upvalues: p3 (ref), addPlayerModule (copy)
			return p3(addPlayerModule(p4))
		end,
		makePlayerInfoRequests = function(p4)
			-- upvalues: p3 (ref), makePlayerInfoRequestsModule (copy)
			return p3(makePlayerInfoRequestsModule(p4))
		end,
		removePlayer = function(p4)
			-- upvalues: fFlagReplacePlayerIconRoduxWithSignal (copy), playerIconInfoStore (copy), p3 (ref), removePlayerModule (copy)
			if fFlagReplacePlayerIconRoduxWithSignal then
				playerIconInfoStore.removePlayer(p4.UserId)
			end
			return p3(removePlayerModule(p4))
		end
	}
end)(playerServiceConnector)