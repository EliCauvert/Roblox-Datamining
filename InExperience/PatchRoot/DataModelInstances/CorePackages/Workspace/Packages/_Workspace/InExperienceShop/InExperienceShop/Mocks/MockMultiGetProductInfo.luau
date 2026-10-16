local InExperienceShop = script:FindFirstAncestor("InExperienceShop")
local PromiseModule = require(InExperienceShop.Parent.Promise)
local _ = require(InExperienceShop.Types)
local _ = require(InExperienceShop.Api.multiGetProductInfo)
local list = {
	{
		id = "101",
		name = "product1",
		thumbnail = "rbxassetid://6789",
		price = 1,
		userBasePriceInRobux = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "test",
		updated = "2026-02-09T22:14:44.486Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "102",
		name = "product2",
		displayName = "Product Two",
		thumbnail = "rbxassetid://6789",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "This is the description",
		updated = "2026-02-09T22:25:41.802Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "103",
		name = "Dev2's` <3 Test",
		displayName = "Dev2's Love Test",
		thumbnail = "rbxassetid://6789",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-02-18T00:17:01.48Z",
		creator = { name = "MockCreator2", hasVerifiedBadge = false }
	},
	{
		id = "104",
		name = "Very Long Product1",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Test",
		updated = "2026-04-21T04:37:16.988Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "105",
		name = "Prod3",
		thumbnail = "rbxassetid://6789",
		price = 1,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-04-21T04:29:53.708Z",
		creator = { name = "MockCreator3", hasVerifiedBadge = false }
	},
	{
		id = "106",
		name = "Prod5",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "",
		updated = "2026-04-21T04:36:12.611Z",
		creator = { name = "MockCreator44", hasVerifiedBadge = false }
	},
	{
		id = "107",
		name = "Prod7",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Really long description that spans more than one line but could span multiple lines.",
		updated = "2026-04-21T04:36:37.726Z",
		creator = { name = "MockCreator5", hasVerifiedBadge = false }
	},
	{
		id = "108",
		name = "Prod8",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Test &nbsp; Description with special characters <>#$%^&*()_+-=[]{}|\\:;\"'<>,.?/~`!",
		updated = "2026-04-21T04:37:03.186Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "109",
		name = "Prod9",
		thumbnail = "rbxassetid://6789",
		price = 5,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-04-21T04:36:50.442Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "110",
		name = "Prod11",
		thumbnail = "rbxassetid://6789",
		price = 100,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-04-25T00:01:47.859Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "111",
		name = "Tire replacement (HARD)",
		displayName = "Hard Tire Replacement",
		thumbnail = "rbxassetid://6789",
		price = 45,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "",
		updated = "2025-12-15T22:53:13.711Z",
		creator = { name = "MockCreator2", hasVerifiedBadge = false }
	},
	{
		id = "112",
		name = "Tire replacement (SOFT)",
		thumbnail = "rbxassetid://6789",
		price = 45,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Replace your car tires to SOFT",
		updated = "2025-12-15T22:44:39.501Z",
		creator = { name = "MockCreator3", hasVerifiedBadge = false }
	},
	{
		id = "113",
		name = "Steering boost",
		thumbnail = "rbxassetid://6789",
		price = 135,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "More responsive steering",
		updated = "2025-12-15T23:01:33.255Z",
		creator = { name = "MockCreator4", hasVerifiedBadge = false }
	},
	{
		id = "114",
		name = "Breaking boost",
		thumbnail = "rbxassetid://6789",
		price = 90,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Faster breaking",
		updated = "2025-12-15T23:00:34.873Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "115",
		name = "Emoji Happy",
		displayName = "😊 Happy Emoji",
		thumbnail = "rbxassetid://6789",
		price = 10,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Dev product with happy emoji",
		updated = "2026-05-11T18:35:49.447Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	},
	{
		id = "116",
		name = "Nitro",
		thumbnail = "rbxassetid://6789",
		price = 68,
		isOwned = false,
		itemType = "Product",
		universeId = "12345",
		description = "Single-use very fast acceleration",
		updated = "2025-12-15T23:02:44.396Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	}
}
local list1 = {
	{
		id = "201",
		name = "pass5",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-04-21T04:39:24.953Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "202",
		name = "pass5",
		thumbnail = "rbxassetid://6789",
		price = 4,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-04-21T04:39:59.813Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "203",
		name = "Thanks's` <3",
		displayName = "Thanks ❤️",
		thumbnail = "rbxassetid://6789",
		price = 1,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Test Description...",
		updated = "2026-02-18T00:09:23.903Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "204",
		name = "Thanks’s <3 :heart::victory_hand:t2:",
		thumbnail = "rbxassetid://6789",
		price = 1,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Test",
		updated = "2026-02-18T00:05:06.047Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "205",
		name = "pass1",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "test",
		updated = "2026-04-21T04:38:16.87Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "206",
		name = "bear animal pass",
		thumbnail = "rbxassetid://6789",
		price = 7,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Bear animal pass description",
		updated = "2026-05-11T20:11:28.05Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "207",
		name = "Pass Coke",
		thumbnail = "rbxassetid://6789",
		price = 8,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "#########",
		updated = "2026-05-11T20:10:42.79Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "3456",
		name = "Smiley pass",
		thumbnail = "rbxassetid://6789",
		price = 2,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "root pass for other passes",
		updated = "2026-05-11T19:33:39.1Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "208",
		name = "Blue pass neutral",
		thumbnail = "rbxassetid://6789",
		price = 5,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Get this pass with blue power",
		updated = "2026-05-11T19:40:01.477Z",
		creator = { name = "MockCreatorK", hasVerifiedBadge = false }
	},
	{
		id = "4242",
		name = "Bonus Game Pass",
		thumbnail = "rbxassetid://6789",
		price = 99,
		isOwned = false,
		itemType = "GamePass",
		universeId = "12345",
		description = "Bonus item for Robux packages",
		updated = "2026-05-20T12:00:00.000Z",
		creator = { name = "MockCreator", hasVerifiedBadge = false }
	}
}
local v1 = (function() --[[ Line: 443 | Named "buildLookup" ]]
	-- upvalues: list (copy), list1 (copy)
	local t = {}
	
	for _, value in ipairs(list) do
		t["Product:" .. value.id] = value
	end
	for _, value1 in ipairs(list1) do
		t["GamePass:" .. value1.id] = value1
	end
	return t
end)()

local function _(Text: string): number --[[ Line: 457 | Named "parseIconImageAssetId" ]]
	return Text and tonumber((string.match(Text, "rbxassetid://(%d+)"))) or 0
end

local function shopItemToProductInfo(p1) --[[ Line: 465 ]]
	local Number: number = tonumber(p1.id) or 0
	local Creator = p1.creator or { name = "", hasVerifiedBadge = false }
	local Thumbnail: string = p1.thumbnail
	
	return {
		IsForSale = true,
		Name = p1.name,
		DisplayName = p1.displayName,
		Description = p1.description or "",
		PriceInRobux = p1.price or 0,
		UserBasePriceInRobux = p1.userBasePriceInRobux,
		ProductId = Number,
		AssetId = Number,
		Updated = p1.updated,
		IconImageAssetId = Thumbnail and tonumber((string.match(Thumbnail, "rbxassetid://(%d+)"))) or 0,
		Creator = {
			Name = Creator.name,
			HasVerifiedBadge = Creator.hasVerifiedBadge
		}
	}
end

local function resolveRequest(Request) --[[ Line: 487 ]]
	-- upvalues: v1 (copy), shopItemToProductInfo (copy)
	local v2 = v1[Request.infoType.Name .. ":" .. tostring(Request.id)]
	
	return if v2 == nil then {
		ok = false,
		request = Request,
		err = string.format("Mock product info not found for %s id %s", Request.infoType.Name, (tostring(Request.id)))
	} else {
		ok = true,
		request = Request,
		value = shopItemToProductInfo(v2)
	}
end

local _ = function(p1) --[[ Line: 509 | Named "resolveStreamDelaySeconds" ]]
	return if p1 == nil then math.random() * 0.5 elseif p1 == 0 then 0 else math.random() * p1
end

return {
	MOCK_PRODUCT_ITEMS_FOR_TESTING = list,
	MOCK_GAMEPASS_ITEMS_FOR_TESTING = list1,
	multiGetProductInfo = function(p1, p2) --[[ Line: 531 ]]
		-- upvalues: PromiseModule (copy), resolveRequest (copy)
		return PromiseModule.delay(if p2 == nil then 0.5 else p2):andThen(function() --[[ Line: 536 ]]
			-- upvalues: p1 (copy), resolveRequest (upval)
			local Buffer = table.create(#p1)
			
			for i, value in ipairs(p1) do
				Buffer[i] = resolveRequest(value)
			end
			return Buffer
		end)
	end,
	streamMultiGetProductInfo = function(p3, p4, p5) --[[ Line: 552 ]]
		-- upvalues: PromiseModule (copy), resolveRequest (copy)
		local CountP5 = #p3
		
		if CountP5 == 0 then
			return PromiseModule.resolve({})
		else
			local Buffer = table.create(CountP5)
			local Count = 0
			
			return PromiseModule.new(function(Callback) --[[ Line: 565 ]]
				-- upvalues: p3 (copy), PromiseModule (upval), p5 (copy), resolveRequest (upval), Buffer (copy), p4 (copy), Count (ref), CountP5 (copy)
				for i, value in ipairs(p3) do
					PromiseModule.delay(if p5 == nil then math.random() * 0.5 elseif p5 == 0 then 0 else math.random() * p5):andThen(function() --[[ Line: 567 ]]
						-- upvalues: resolveRequest (upval), value (copy), Buffer (upval), i (copy), p4 (upval), Count (upval), CountP5 (upval), Callback (copy)
						local ResolveRequestResult = resolveRequest(value)
						Buffer[i] = ResolveRequestResult
						p4.onResult(ResolveRequestResult)
						Count += 1
						
						if Count == CountP5 then
							Callback(Buffer)
						end
					end)
				end
			end)
		end
	end
}