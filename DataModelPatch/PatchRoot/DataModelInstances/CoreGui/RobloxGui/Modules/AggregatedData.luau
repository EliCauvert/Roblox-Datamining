local AggregatedDataModule = {}
AggregatedDataModule.__index = AggregatedDataModule

function AggregatedDataModule.new()
	-- upvalues: AggregatedDataModule (copy)
	local t = {}
	setmetatable(t, AggregatedDataModule)
	
	return t
end

local function _(p1: string): number
	return p1:find("rbxassetid://")
end

function AggregatedDataModule:addPlay(Text: string, Playtime, Loopcount)
	if not Text:find("rbxassetid://") then return end
	local Segment: string = Text:sub(14)
	
	if self[Segment] == nil then
		self[Segment] = { playtime = Playtime, loopcount = Loopcount }
		
		return
	else
		local v1 = self[Segment]
		v1.playtime += Playtime
		local v2 = self[Segment]
		v2.loopcount += Loopcount
	end
end

return AggregatedDataModule