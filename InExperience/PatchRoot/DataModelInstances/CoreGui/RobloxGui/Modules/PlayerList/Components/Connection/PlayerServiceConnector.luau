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

function playerServiceConnector.didMount(p0) --[[ line: 23 ]]
	-- upvalues: playersService (ref), fFlagBadgeVisibilitySettingEnabled (ref), robloxReplicatedStorageService (ref), deferPlayerInfoRequests (ref)
	for i, v in ipairs(playersService:GetPlayers()) do
		p0.props.addPlayer(v)
		p0.props.makePlayerInfoRequests(v)
	end
	if fFlagBadgeVisibilitySettingEnabled then
		spawn(function() --[[ line: 31 ]]
			-- upvalues: robloxReplicatedStorageService (copy), p0 (ref), playersService (copy), deferPlayerInfoRequests (copy)
			p0.sendPlayerProfileSettingsConnection = robloxReplicatedStorageService:WaitForChild("SendPlayerProfileSettings", 1e999).OnClientEvent:Connect(function(p1) --[[ line: 33 ]]
				-- upvalues: playersService (copy), deferPlayerInfoRequests (copy), p0 (copy)
				local var11 = playersService:GetPlayerByUserId(tonumber(p1))
				
				if var11 then
					if deferPlayerInfoRequests then
						task.defer(function() --[[ line: 38 ]]
							-- upvalues: p0 (copy), var11 (ref)
							p0.props.makePlayerInfoRequests(var11)
						end)
						
						return
					end
					p0.props.makePlayerInfoRequests(var11)
				end
			end)
		end)
	end
end

function playerServiceConnector.render(p2) --[[ line: 50 ]]
	-- upvalues: roactModule (ref), eventConnectionModule (ref), playersService (ref)
	return roactModule.createFragment({
		PlayerAddedConnection = roactModule.createElement(eventConnectionModule, {
			event = playersService.PlayerAdded,
			callback = function(p3) --[[ line: 54 ]]
				-- upvalues: p2 (ref)
				p2.props.addPlayer(p3)
				p2.props.makePlayerInfoRequests(p3)
			end
		}),
		PlayerRemovingConnection = roactModule.createElement(eventConnectionModule, {
			event = playersService.PlayerRemoving,
			callback = function(p4) --[[ line: 62 ]]
				-- upvalues: p2 (ref)
				p2.props.removePlayer(p4)
			end
		})
	})
end

function playerServiceConnector.willUnmount(p5) --[[ line: 69 ]]
	-- upvalues: playersService (ref), fFlagBadgeVisibilitySettingEnabled (ref)
	for i, v in ipairs(playersService:GetPlayers()) do
		p5.props.removePlayer(v)
	end
	if fFlagBadgeVisibilitySettingEnabled and p5.sendPlayerProfileSettingsConnection then
		p5.sendPlayerProfileSettingsConnection:Disconnect()
	end
end

return roactRoduxModule.connect(nil, function(p6) --[[ line: 80 | named "mapDispatchToProps" ]]
	-- upvalues: addPlayerModule (ref), makePlayerInfoRequestsModule (ref), fFlagReplacePlayerIconRoduxWithSignal (ref), playerIconInfoStore (ref), removePlayerModule (ref)
	return {
		addPlayer = function(p7) --[[ line: 82 ]]
			-- upvalues: p6 (ref), addPlayerModule (copy)
			return p6(addPlayerModule(p7))
		end,
		makePlayerInfoRequests = function(p8) --[[ line: 86 ]]
			-- upvalues: p6 (ref), makePlayerInfoRequestsModule (copy)
			return p6(makePlayerInfoRequestsModule(p8))
		end,
		removePlayer = function(p9) --[[ line: 90 ]]
			-- upvalues: fFlagReplacePlayerIconRoduxWithSignal (copy), playerIconInfoStore (copy), p6 (ref), removePlayerModule (copy)
			if fFlagReplacePlayerIconRoduxWithSignal then
				playerIconInfoStore.removePlayer(p9.UserId)
			end
			return p6(removePlayerModule(p9))
		end
	}
end)(playerServiceConnector)