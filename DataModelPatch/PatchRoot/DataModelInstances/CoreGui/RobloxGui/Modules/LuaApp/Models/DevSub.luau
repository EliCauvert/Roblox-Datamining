local Modules = game:GetService("CoreGui").RobloxGui.Modules
local DevSubTypesModule = require(Modules.LuaApp.Types.DevSubTypes)
local DevSubStatusModule = require(Modules.LuaApp.Enum.DevSubStatus)
local DevSubPlanStatusModule = require(Modules.LuaApp.Enum.DevSubPlanStatus)
local DevSubModule = {
	new = function()
		return {}
	end
}

function DevSubModule.mock()
	-- upvalues: DevSubStatusModule (copy), DevSubPlanStatusModule (copy), DevSubModule (copy)
	local list = { DevSubStatusModule.Active, DevSubStatusModule.Inactive }
	local list1 = {
		DevSubPlanStatusModule.Open,
		DevSubPlanStatusModule.Closed,
		DevSubPlanStatusModule.Archived
	}
	
	local function _(Text: string): string
		local RandomValue = math.random(1, #Text)
		
		return Text:sub(RandomValue, RandomValue)
	end
	
	local _ = function(): string
		local RandomValue = math.random(1, 6)
		local Segment: string = ("aeiouy"):sub(RandomValue, RandomValue)
		local RandomValue1 = math.random(1, 20)
		
		return Segment .. ("bcdfghjklmnpqrstvwxz"):sub(RandomValue1, RandomValue1)
	end
	
	local _ = function(): string
		local Text = ""
		
		for _ = 1, math.random(1, 4) do
			local RandomValue = math.random(1, 6)
			local Segment: string = ("aeiouy"):sub(RandomValue, RandomValue)
			local RandomValue1 = math.random(1, 20)
			Text ..= Segment .. ("bcdfghjklmnpqrstvwxz"):sub(RandomValue1, RandomValue1)
		end
		return Text
	end
	
	local function getSentence(): string
		local List = {}
		
		for _ = 1, math.random(1, 32) do
			local Text = ""
			
			for _ = 1, math.random(1, 4) do
				local RandomValue = math.random(1, 6)
				local Segment: string = ("aeiouy"):sub(RandomValue, RandomValue)
				local RandomValue1 = math.random(1, 20)
				Text ..= Segment .. ("bcdfghjklmnpqrstvwxz"):sub(RandomValue1, RandomValue1)
			end
			table.insert(List, Text)
		end
		return table.concat(List, " ")
	end
	
	local NewDevSub = DevSubModule.new()
	NewDevSub.id = math.random(1, 420)
	NewDevSub.status = list[math.random(1, #list)]
	local Name = ""
	
	for _ = 1, math.random(1, 4) do
		local RandomValue = math.random(1, 6)
		local Segment: string = ("aeiouy"):sub(RandomValue, RandomValue)
		local RandomValue1 = math.random(1, 20)
		Name ..= Segment .. ("bcdfghjklmnpqrstvwxz"):sub(RandomValue1, RandomValue1)
	end
	NewDevSub.name = Name
	NewDevSub.price = math.random(1, 420)
	NewDevSub.image = 0
	NewDevSub.planStatus = list1[math.random(1, #list1)]
	NewDevSub.description = getSentence()
	NewDevSub.gameId = 1515
	NewDevSub.isAutoRenewing = true
	NewDevSub.expirationDate = ""
	NewDevSub.gameData = {}
	
	return NewDevSub
end

function DevSubModule.fromJsonData(p1)
	-- upvalues: DevSubTypesModule (copy), DevSubModule (copy)
	if DevSubTypesModule.DevSubJsonCheck(p1) then
		local NewDevSub = DevSubModule.new()
		NewDevSub.id = p1.id
		NewDevSub.status = p1.status
		NewDevSub.isAutoRenewing = p1.isAutoRenewing
		NewDevSub.expirationDate = p1.expirationDate
		NewDevSub.name = p1.planData.name
		NewDevSub.price = p1.planData.priceInRobux
		NewDevSub.image = p1.planData.imageAssetId
		NewDevSub.planStatus = p1.planData.status
		NewDevSub.description = p1.planData.description
		NewDevSub.gameId = p1.planData.universeId
		NewDevSub.gameData = p1.gameData
		
		return NewDevSub
	else
		return nil
	end
end

return DevSubModule