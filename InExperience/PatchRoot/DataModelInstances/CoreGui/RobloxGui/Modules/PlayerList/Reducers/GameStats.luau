local cryoModule = require(game:GetService("CorePackages").Packages.Cryo)
local parent = script.Parent.Parent
local actions = parent.Actions
local addGameStatModule = require(actions.AddGameStat)
local removeGameStatModule = require(actions.RemoveGameStat)
local setGameStatTextModule = require(actions.SetGameStatText)
local setGameStatAddIdModule = require(actions.SetGameStatAddId)
local fFlagLeaderstatsWithASideOfClientModule = require(parent.Flags.FFlagLeaderstatsWithASideOfClient)
local formatStatStringModule = require(parent.FormatStatString)

local function gameStatsComp(p0, p1)
	-- upvalues: fFlagLeaderstatsWithASideOfClientModule (ref)
	if p0.isPrimary ~= p1.isPrimary then
		return p0.isPrimary
	elseif p0.priority ~= p1.priority then
		return p1.priority < p0.priority
	elseif fFlagLeaderstatsWithASideOfClientModule then
		local serverAddId = p0.serverAddId
		local serverAddId_1 = p1.serverAddId
		
		return if serverAddId and serverAddId_1 then serverAddId < serverAddId_1 else p0.addId < p1.addId
	end
end

local var8 = 0

return function(p2, p3)
	-- upvalues: addGameStatModule (ref), formatStatStringModule (ref), fFlagLeaderstatsWithASideOfClientModule (ref), var8 (write), cryoModule (ref), gameStatsComp (ref), removeGameStatModule (ref), setGameStatTextModule (ref), setGameStatAddIdModule (ref)
	p2 = p2 or {}
	
	if p3.type == addGameStatModule.name then
		local addId = nil
		local serverAddId = nil
		local var10 = formatStatStringModule(nil)
		local t = {}
		
		for i, v in ipairs(p2) do
			if v.name == p3.statName then
				addId = v.addId
				var10 = v.text
				
				if fFlagLeaderstatsWithASideOfClientModule then
					serverAddId = v.serverAddId
				end
			else
				table.insert(t, v)
			end
		end
		var8 += 1
		t = cryoModule.List.join(t, {
			{
				name = p3.statName,
				text = var10,
				addId = addId or var8,
				isPrimary = p3.isPrimary,
				priority = p3.priority,
				serverAddId = serverAddId
			}
		})
		table.sort(t, gameStatsComp)
		
		return t
	elseif p3.type == removeGameStatModule.name then
		return cryoModule.List.filter(p2, function(p4)
			-- upvalues: p3 (ref)
			return p4.name ~= p3.statName
		end)
	elseif p3.type == setGameStatTextModule.name then
		return cryoModule.List.map(p2, function(p5)
			-- upvalues: p3 (ref), cryoModule (copy)
			return p5.name == p3.statName and cryoModule.Dictionary.join(p5, { text = p3.text }) or p5
		end)
	elseif fFlagLeaderstatsWithASideOfClientModule and p3.type == setGameStatAddIdModule.name then
		p2 = cryoModule.List.map(p2, function(p6)
			-- upvalues: p3 (ref), cryoModule (copy)
			return p6.name == p3.statName and cryoModule.Dictionary.join(p6, { serverAddId = p3.serverAddId }) or p6
		end)
		table.sort(p2, gameStatsComp)
		
		return p2
	end
	return p2
end