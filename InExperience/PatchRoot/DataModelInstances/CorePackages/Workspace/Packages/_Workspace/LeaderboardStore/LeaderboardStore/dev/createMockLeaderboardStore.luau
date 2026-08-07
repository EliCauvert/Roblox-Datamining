local parent = script.Parent.Parent
local parent_1 = parent.Parent
local signalsModule = require(parent_1.Signals)
local createSignalMap = require(parent_1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(parent.LeaderboardStoreTypes)

return function() --[[ line: 19 | named "createMockLeaderboardStore" ]]
	-- upvalues: signalsModule (ref), createSignalMap (ref)
	return function() --[[ line: 20 ]]
		-- upvalues: signalsModule (copy), createSignalMap (copy)
		Instance.new("Team").Name = "Neutral"
		local team = Instance.new("Team")
		team.Name = "Team 1"
		local team_1 = Instance.new("Team")
		team_1.Name = "Team 2"
		local t = {
			Name = "player1",
			Team = team,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 100 }, stat2 = { Value = 200 } }
		}
		local t_1 = {
			order = signalsModule.createSignal(1),
			stats = createSignalMap()
		}
		t_1.stats.setData("stat1", signalsModule.createSignal(t.leaderstats.stat1.Value), false)
		t_1.stats.setData("stat2", signalsModule.createSignal(t.leaderstats.stat2.Value), false)
		local t_2 = {
			Name = "player2",
			Team = team,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 30 }, stat2 = { Value = 40 } }
		}
		local t_3 = {
			order = signalsModule.createSignal(2),
			stats = createSignalMap()
		}
		t_3.stats.setData("stat1", signalsModule.createSignal(t_2.leaderstats.stat1.Value), false)
		t_3.stats.setData("stat2", signalsModule.createSignal(t_2.leaderstats.stat2.Value), false)
		local t_4 = {
			Name = "player3",
			Team = team_1,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 500 }, stat2 = { Value = 600 } }
		}
		local t_5 = {
			order = signalsModule.createSignal(1),
			stats = createSignalMap()
		}
		t_5.stats.setData("stat1", signalsModule.createSignal(t_4.leaderstats.stat1.Value), false)
		t_5.stats.setData("stat2", signalsModule.createSignal(t_4.leaderstats.stat2.Value), false)
		local t_6 = {
			Name = "player4",
			Team = team_1,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 70 }, stat2 = { Value = 80 } }
		}
		local t_7 = {
			order = signalsModule.createSignal(2),
			stats = createSignalMap()
		}
		t_7.stats.setData("stat1", signalsModule.createSignal(t_6.leaderstats.stat1.Value), false)
		t_7.stats.setData("stat2", signalsModule.createSignal(t_6.leaderstats.stat2.Value), false)
		local t_8 = {
			Name = "player5",
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 90 }, stat2 = { Value = 100 } }
		}
		local t_9 = {
			order = signalsModule.createSignal(1),
			stats = createSignalMap()
		}
		t_9.stats.setData("stat1", signalsModule.createSignal(t_8.leaderstats.stat1.Value), false)
		t_9.stats.setData("stat2", signalsModule.createSignal(t_8.leaderstats.stat2.Value), false)
		local var13 = createSignalMap()
		var13.setData(t, t_1, false)
		var13.setData(t_2, t_3, false)
		var13.setData(t_4, t_5, false)
		var13.setData(t_6, t_7, false)
		var13.setData(t_8, t_9, false)
		local var14 = createSignalMap()
		local var15 = createSignalMap()
		var15.setData("Neutral", {
			name = signalsModule.createSignal("Neutral"),
			color = signalsModule.createSignal(Color3.fromRGB(0, 0, 0)),
			order = signalsModule.createSignal(1),
			stats = createSignalMap(),
			players = createSignalMap()
		}, false)
		local neutral = var15.getData("Neutral", false)
		neutral.players.setData(t_8, t_8.UserId, false)
		neutral.stats.setData("stat1", signalsModule.createSignal(t_8.leaderstats.stat1.Value), false)
		neutral.stats.setData("stat2", signalsModule.createSignal(t_8.leaderstats.stat2.Value), false)
		var15.setData(team, {
			name = signalsModule.createSignal("Team 1"),
			color = signalsModule.createSignal(Color3.fromRGB(255, 0, 0)),
			order = signalsModule.createSignal(2),
			stats = createSignalMap(),
			players = createSignalMap()
		}, false)
		local data = var15.getData(team, false)
		data.players.setData(t, t.UserId, false)
		data.players.setData(t_2, t_2.UserId, false)
		data.stats.setData("stat1", signalsModule.createSignal(t.leaderstats.stat1.Value + t_2.leaderstats.stat1.Value), false)
		data.stats.setData("stat2", signalsModule.createSignal(t.leaderstats.stat2.Value + t_2.leaderstats.stat2.Value), false)
		var15.setData(team_1, {
			name = signalsModule.createSignal("Team 2"),
			color = signalsModule.createSignal(Color3.fromRGB(0, 255, 0)),
			order = signalsModule.createSignal(3),
			stats = createSignalMap(),
			players = createSignalMap()
		}, false)
		local data_1 = var15.getData(team_1, false)
		data_1.players.setData(t_4, t_4.UserId, false)
		data_1.players.setData(t_6, t_6.UserId, false)
		data_1.stats.setData("stat1", signalsModule.createSignal(t_4.leaderstats.stat1.Value + t_6.leaderstats.stat1.Value), false)
		data_1.stats.setData("stat2", signalsModule.createSignal(t_4.leaderstats.stat2.Value + t_6.leaderstats.stat2.Value), false)
		local var19 = createSignalMap()
		var19.setData("Neutral", var15.getData("Neutral", false), false)
		var19.setData(team, var15.getData(team, false), false)
		var19.setData(team_1, var15.getData(team_1, false), false)
		
		return {
			getGameStatsList = function() --[[ line: 207 ]]
				-- upvalues: var14 (write)
				return var14
			end,
			getTeamList = function() --[[ line: 210 ]]
				-- upvalues: var19 (write)
				return var19
			end,
			getTeamPlayerList = function(p0, _) --[[ line: 213 ]]
				-- upvalues: var15 (write)
				return var15.getData(p0, false).players
			end,
			getPlayerEntry = function(p1) --[[ line: 217 ]]
				-- upvalues: var13 (write)
				return var13.getData(p1, false)
			end,
			cleanUp = function() --[[ line: 220 ]]
				-- upvalues: var14 (write), var19 (write), var15 (write), var13 (write)
				var14 = nil
				var19 = nil
				var15 = nil
				var13 = nil
			end
		}
	end
end