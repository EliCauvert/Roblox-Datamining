local CryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local Parent = script.Parent.Parent
local Actions = Parent.Actions
local AddGameStatModule = require(Actions.AddGameStat)
local RemoveGameStatModule = require(Actions.RemoveGameStat)
local SetGameStatTextModule = require(Actions.SetGameStatText)
local SetGameStatAddIdModule = require(Actions.SetGameStatAddId)
local FFlagLeaderstatsWithASideOfClientModule = require(Parent.Flags.FFlagLeaderstatsWithASideOfClient)
local FormatStatStringModule = require(Parent.FormatStatString)

local function gameStatsComp(A, B) --[[ Line: 17 ]]
	-- upvalues: FFlagLeaderstatsWithASideOfClientModule (copy)
	if A.isPrimary ~= B.isPrimary then
		return A.isPrimary
	end
	if A.priority ~= B.priority then
		return B.priority < A.priority
	end
	if FFlagLeaderstatsWithASideOfClientModule then
		local ServerAddId = A.serverAddId
		local ServerAddId1 = B.serverAddId
		
		if ServerAddId and ServerAddId1 then
			return ServerAddId < ServerAddId1
		end
	end
	return A.addId < B.addId
end

local Count = 0

return function(p1, p2) --[[ Line: 35 | Named "GameStats" ]]
	-- upvalues: AddGameStatModule (copy), FormatStatStringModule (copy), FFlagLeaderstatsWithASideOfClientModule (copy), Count (ref), CryoModule (copy), gameStatsComp (copy), RemoveGameStatModule (copy), SetGameStatTextModule (copy), SetGameStatAddIdModule (copy)
	local P2 = p1 or {}
	
	if p2.type == AddGameStatModule.name then
		local AddId = nil
		local ServerAddId = nil
		local FormatStatStringModuleResult = FormatStatStringModule(nil)
		local List = {}
		
		for _, value in ipairs(P2) do
			if value.name == p2.statName then
				AddId = value.addId
				FormatStatStringModuleResult = value.text
				
				if FFlagLeaderstatsWithASideOfClientModule then
					ServerAddId = value.serverAddId
				end
			else
				table.insert(List, value)
			end
		end
		Count += 1
		local JoinResult = CryoModule.List.join(List, {
			{
				name = p2.statName,
				text = FormatStatStringModuleResult,
				addId = AddId or Count,
				isPrimary = p2.isPrimary,
				priority = p2.priority,
				serverAddId = ServerAddId
			}
		})
		table.sort(JoinResult, gameStatsComp)
		
		return JoinResult
	elseif p2.type == RemoveGameStatModule.name then
		return CryoModule.List.filter(P2, function(p3): boolean --[[ Line: 68 ]]
			-- upvalues: p2 (copy)
			return p3.name ~= p2.statName
		end)
	elseif p2.type == SetGameStatTextModule.name then
		return CryoModule.List.map(P2, function(p3) --[[ Line: 72 ]]
			-- upvalues: p2 (copy), CryoModule (upval)
			return p3.name == p2.statName and CryoModule.Dictionary.join(p3, { text = p2.text }) or p3
		end)
	elseif FFlagLeaderstatsWithASideOfClientModule and p2.type == SetGameStatAddIdModule.name then
		local MapResult = CryoModule.List.map(P2, function(p3) --[[ Line: 76 ]]
			-- upvalues: p2 (copy), CryoModule (upval)
			return p3.name == p2.statName and CryoModule.Dictionary.join(p3, { serverAddId = p2.serverAddId }) or p3
		end)
		table.sort(MapResult, gameStatsComp)
		
		return MapResult
	else
		return P2
	end
end