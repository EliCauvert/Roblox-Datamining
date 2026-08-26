local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local parent = script.Parent.Parent
local actions = parent.Actions
local addGameStatModule = require(actions.AddGameStat)
local removeGameStatModule = require(actions.RemoveGameStat)
local setGameStatTextModule = require(actions.SetGameStatText)
local setGameStatAddIdModule = require(actions.SetGameStatAddId)
local fFlagLeaderstatsWithASideOfClientModule = require(parent.Flags.FFlagLeaderstatsWithASideOfClient)
local formatStatStringModule = require(parent.FormatStatString)

local function gameStatsComp(p1, p2)
	-- upvalues: fFlagLeaderstatsWithASideOfClientModule (ref)
	if p1.isPrimary ~= p2.isPrimary then
		return p1.isPrimary
	elseif p1.priority ~= p2.priority then
		return p2.priority < p1.priority
	elseif fFlagLeaderstatsWithASideOfClientModule then
		local serverAddId = p1.serverAddId
		local serverAddId_1 = p2.serverAddId
		
		return if serverAddId and serverAddId_1 then serverAddId < serverAddId_1 else p1.addId < p2.addId
	end
end

local var1 = 0

return function(p1, p2)
	-- upvalues: addGameStatModule (ref), formatStatStringModule (ref), fFlagLeaderstatsWithASideOfClientModule (ref), var1 (write), cryoModule (ref), gameStatsComp (ref), removeGameStatModule (ref), setGameStatTextModule (ref), setGameStatAddIdModule (ref)
	p1 = p1 or {}
	
	if p2.type == addGameStatModule.name then
		local addId = nil
		local serverAddId = nil
		local var2 = formatStatStringModule(nil)
		local t = {}
		
		for i, v in ipairs(p1) do
			if v.name == p2.statName then
				addId = v.addId
				var2 = v.text
				
				if fFlagLeaderstatsWithASideOfClientModule then
					serverAddId = v.serverAddId
				end
			else
				table.insert(t, v)
			end
		end
		var1 += 1
		t = cryoModule.List.join(t, {
			{
				name = p2.statName,
				text = var2,
				addId = addId or var1,
				isPrimary = p2.isPrimary,
				priority = p2.priority,
				serverAddId = serverAddId
			}
		})
		table.sort(t, gameStatsComp)
		
		return t
	elseif p2.type == removeGameStatModule.name then
		return cryoModule.List.filter(p1, function(p3)
			-- upvalues: p2 (ref)
			return p3.name ~= p2.statName
		end)
	elseif p2.type == setGameStatTextModule.name then
		return cryoModule.List.map(p1, function(p3)
			-- upvalues: p2 (ref), cryoModule (copy)
			return p3.name == p2.statName and cryoModule.Dictionary.join(p3, { text = p2.text }) or p3
		end)
	elseif fFlagLeaderstatsWithASideOfClientModule and p2.type == setGameStatAddIdModule.name then
		p1 = cryoModule.List.map(p1, function(p3)
			-- upvalues: p2 (ref), cryoModule (copy)
			return p3.name == p2.statName and cryoModule.Dictionary.join(p3, { serverAddId = p2.serverAddId }) or p3
		end)
		table.sort(p1, gameStatsComp)
		
		return p1
	end
	return p1
end