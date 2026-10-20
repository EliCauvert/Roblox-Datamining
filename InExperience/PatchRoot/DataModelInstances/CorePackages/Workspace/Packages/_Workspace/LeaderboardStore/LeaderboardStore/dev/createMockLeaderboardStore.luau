local Parent = script.Parent.Parent
local Parent1 = Parent.Parent
local SignalsModule = require(Parent1.Signals)
local CreateSignalMapFunction = require(Parent1.CoreScriptsRoactCommon).Utilities.createSignalMap
local _ = require(Parent.LeaderboardStoreTypes)

return function()
	-- upvalues: SignalsModule (copy), CreateSignalMapFunction (copy)
	return function()
		-- upvalues: SignalsModule (upval), CreateSignalMapFunction (upval)
		Instance.new("Team").Name = "Neutral"
		local Team = Instance.new("Team")
		Team.Name = "Team 1"
		local Team1 = Instance.new("Team")
		Team1.Name = "Team 2"
		local Player = {
			Name = "player1",
			Team = Team,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 100 }, stat2 = { Value = 200 } }
		}
		local config = {
			order = SignalsModule.createSignal(1),
			stats = CreateSignalMapFunction()
		}
		config.stats.setData("stat1", SignalsModule.createSignal(Player.leaderstats.stat1.Value), false)
		config.stats.setData("stat2", SignalsModule.createSignal(Player.leaderstats.stat2.Value), false)
		local Player1 = {
			Name = "player2",
			Team = Team,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 30 }, stat2 = { Value = 40 } }
		}
		local config1 = {
			order = SignalsModule.createSignal(2),
			stats = CreateSignalMapFunction()
		}
		config1.stats.setData("stat1", SignalsModule.createSignal(Player1.leaderstats.stat1.Value), false)
		config1.stats.setData("stat2", SignalsModule.createSignal(Player1.leaderstats.stat2.Value), false)
		local Player2 = {
			Name = "player3",
			Team = Team1,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 500 }, stat2 = { Value = 600 } }
		}
		local config2 = {
			order = SignalsModule.createSignal(1),
			stats = CreateSignalMapFunction()
		}
		config2.stats.setData("stat1", SignalsModule.createSignal(Player2.leaderstats.stat1.Value), false)
		config2.stats.setData("stat2", SignalsModule.createSignal(Player2.leaderstats.stat2.Value), false)
		local Player3 = {
			Name = "player4",
			Team = Team1,
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 70 }, stat2 = { Value = 80 } }
		}
		local config3 = {
			order = SignalsModule.createSignal(2),
			stats = CreateSignalMapFunction()
		}
		config3.stats.setData("stat1", SignalsModule.createSignal(Player3.leaderstats.stat1.Value), false)
		config3.stats.setData("stat2", SignalsModule.createSignal(Player3.leaderstats.stat2.Value), false)
		local Player4 = {
			Name = "player5",
			UserId = math.random(1, 1234567890),
			leaderstats = { stat1 = { Value = 90 }, stat2 = { Value = 100 } }
		}
		local config4 = {
			order = SignalsModule.createSignal(1),
			stats = CreateSignalMapFunction()
		}
		config4.stats.setData("stat1", SignalsModule.createSignal(Player4.leaderstats.stat1.Value), false)
		config4.stats.setData("stat2", SignalsModule.createSignal(Player4.leaderstats.stat2.Value), false)
		local SignalMap = CreateSignalMapFunction()
		SignalMap.setData(Player, config, false)
		SignalMap.setData(Player1, config1, false)
		SignalMap.setData(Player2, config2, false)
		SignalMap.setData(Player3, config3, false)
		SignalMap.setData(Player4, config4, false)
		local SignalMap1 = CreateSignalMapFunction()
		local SignalMap2 = CreateSignalMapFunction()
		SignalMap2.setData("Neutral", {
			name = SignalsModule.createSignal("Neutral"),
			color = SignalsModule.createSignal(Color3.fromRGB(0, 0, 0)),
			order = SignalsModule.createSignal(1),
			stats = CreateSignalMapFunction(),
			players = CreateSignalMapFunction()
		}, false)
		local NeutralData = SignalMap2.getData("Neutral", false)
		NeutralData.players.setData(Player4, Player4.UserId, false)
		NeutralData.stats.setData("stat1", SignalsModule.createSignal(Player4.leaderstats.stat1.Value), false)
		NeutralData.stats.setData("stat2", SignalsModule.createSignal(Player4.leaderstats.stat2.Value), false)
		SignalMap2.setData(Team, {
			name = SignalsModule.createSignal("Team 1"),
			color = SignalsModule.createSignal(Color3.fromRGB(255, 0, 0)),
			order = SignalsModule.createSignal(2),
			stats = CreateSignalMapFunction(),
			players = CreateSignalMapFunction()
		}, false)
		local Data = SignalMap2.getData(Team, false)
		Data.players.setData(Player, Player.UserId, false)
		Data.players.setData(Player1, Player1.UserId, false)
		Data.stats.setData("stat1", SignalsModule.createSignal(Player.leaderstats.stat1.Value + Player1.leaderstats.stat1.Value), false)
		Data.stats.setData("stat2", SignalsModule.createSignal(Player.leaderstats.stat2.Value + Player1.leaderstats.stat2.Value), false)
		SignalMap2.setData(Team1, {
			name = SignalsModule.createSignal("Team 2"),
			color = SignalsModule.createSignal(Color3.fromRGB(0, 255, 0)),
			order = SignalsModule.createSignal(3),
			stats = CreateSignalMapFunction(),
			players = CreateSignalMapFunction()
		}, false)
		local Data1 = SignalMap2.getData(Team1, false)
		Data1.players.setData(Player2, Player2.UserId, false)
		Data1.players.setData(Player3, Player3.UserId, false)
		Data1.stats.setData("stat1", SignalsModule.createSignal(Player2.leaderstats.stat1.Value + Player3.leaderstats.stat1.Value), false)
		Data1.stats.setData("stat2", SignalsModule.createSignal(Player2.leaderstats.stat2.Value + Player3.leaderstats.stat2.Value), false)
		local SignalMap3 = CreateSignalMapFunction()
		SignalMap3.setData("Neutral", SignalMap2.getData("Neutral", false), false)
		SignalMap3.setData(Team, SignalMap2.getData(Team, false), false)
		SignalMap3.setData(Team1, SignalMap2.getData(Team1, false), false)
		
		return {
			getGameStatsList = function()
				-- upvalues: SignalMap1 (ref)
				return SignalMap1
			end,
			getTeamList = function()
				-- upvalues: SignalMap3 (ref)
				return SignalMap3
			end,
			getTeamPlayerList = function(p1, _)
				-- upvalues: SignalMap2 (ref)
				return SignalMap2.getData(p1, false).players
			end,
			getPlayerEntry = function(p1)
				-- upvalues: SignalMap (ref)
				return (SignalMap.getData(p1, false))
			end,
			cleanUp = function()
				-- upvalues: SignalMap1 (ref), SignalMap3 (ref), SignalMap2 (ref), SignalMap (ref)
				SignalMap1 = nil
				SignalMap3 = nil
				SignalMap2 = nil
				SignalMap = nil
			end
		}
	end
end