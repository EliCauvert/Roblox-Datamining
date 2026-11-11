local Modules = game:GetService("CoreGui").RobloxGui.Modules
local CorePackages = game:GetService("CorePackages")
local RoactModule = require(CorePackages.Packages.Roact)
local FitChildrenModule = require(Modules.LuaApp.FitChildren)
local WithStyleFunction = require(CorePackages.Packages.UIBlox).Style.withStyle
local _Vector2 = Vector2.new(375, 70)
local DevSubGameModule = require(Modules.LuaApp.Components.More.DevSubGame)
local DevSubGameList = RoactModule.PureComponent:extend("DevSubGameList")

local function sortedGames(Games, _)
	local List = {}
	local List1 = {}
	
	for _, _game in pairs(Games) do
		if _game.activeSubs > 0 then
			table.insert(List, _game)
		else
			table.insert(List1, _game)
		end
	end
	local List2 = {}
	
	for _, value in pairs(List) do
		table.insert(List2, value)
	end
	for _, value1 in pairs(List1) do
		table.insert(List2, value1)
	end
	return List2
end

function DevSubGameList.render(p1)
	-- upvalues: WithStyleFunction (copy), RoactModule (copy), sortedGames (copy), DevSubGameModule (copy), _Vector2 (copy), FitChildrenModule (copy)
	return WithStyleFunction(function(_)
		-- upvalues: p1 (copy), RoactModule (upval), sortedGames (upval), DevSubGameModule (upval), _Vector2 (upval), FitChildrenModule (upval)
		local Props = p1.props
		local SubsByGameId = Props.subsByGameId
		local OnGameActivatedFunction = Props.onGameActivated
		local config = {
			Layout = RoactModule.createElement("UIListLayout", {
				SortOrder = Enum.SortOrder.LayoutOrder,
				HorizontalAlignment = Enum.HorizontalAlignment.Center,
				Padding = UDim.new(0, 0)
			})
		}
		local SortedGamesResult = sortedGames(Props.games, SubsByGameId)
		
		for LayoutOrder, value in pairs(SortedGamesResult) do
			local SubNames = {}
			
			for _, value1 in pairs(SubsByGameId[value.id]) do
				table.insert(SubNames, value1.name)
			end
			table.insert(config, RoactModule.createElement(DevSubGameModule, {
				game = value,
				subNames = SubNames,
				activeSubs = value.activeSubs,
				active = value.activeSubs > 0,
				dividerDisabled = LayoutOrder == #SortedGamesResult,
				onActivated = function()
					-- upvalues: OnGameActivatedFunction (copy), value (copy)
					OnGameActivatedFunction(value)
				end,
				maxSize = _Vector2,
				layoutOrder = LayoutOrder
			}))
		end
		return RoactModule.createElement(FitChildrenModule.FitFrame, {
			BackgroundTransparency = 1,
			Size = UDim2.new(1, 0, 1, 0),
			fitFields = { Size = FitChildrenModule.FitAxis.Height }
		}, config)
	end)
end

return DevSubGameList